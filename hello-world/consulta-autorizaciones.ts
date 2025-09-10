import { APIGatewayProxyEvent, APIGatewayProxyResult } from 'aws-lambda';
import mysql from 'mysql2/promise';
import { RowDataPacket } from 'mysql2';
import { RequestBody, Filtros, Autorizacion } from '../hello-world/interfaces/index';
import { generarExcelAutorizaciones } from './utils/generar-excel';
import { S3Client, GetObjectCommand, PutObjectCommand } from "@aws-sdk/client-s3";
import fs from "fs";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";



export const consultarAutorizacionesHandler = async (
  event: APIGatewayProxyEvent
): Promise<APIGatewayProxyResult> => {
  try {
    const body: RequestBody = typeof event.body === 'string' ? JSON.parse(event.body) : event.body;
    const filtros: Partial<Filtros> = body?.filtros || {};
    const usuarioId = Number(body.rolUsuario);
    const numeroPagina = Number(body?.paginacion?.numeroPagina ?? 1);
    const tamanioPagina = Number(body?.paginacion?.tamanioPagina ?? 20);
    const nombreArchivo = `autorizaciones_${Date.now()}.xlsx`;


    if (!filtros.fechaDesde || !filtros.fechaHasta || !filtros.numeroTarjeta ||!usuarioId || Number.isNaN(usuarioId)) {
      return response(400, {
        estado: 'ERROR',
        codigoRespuesta: '400',
        mensaje: 'Parámetros de entrada inválidos. Verifique las fechas o filtros proporcionados.',
        data: null
      });
    }

    const connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      port: parseInt(process.env.DB_PORT || '3306'),
      user: process.env.DB_USER,
      password: process.env.DB_PASS,
      database: process.env.DB_NAME,
      multipleStatements: true,
    });

    // Consulta paginada para el response
    const [rows] = await connection.query(
      'CALL pa_mpg_cautorizaciones(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        filtros.fechaDesde,
        filtros.fechaHasta,
        filtros.tipoAutorizacion,
        filtros.numeroAutorizacion,
        filtros.tipoFranquicia,
        filtros.nombreCadena,
        filtros.nombreComercio,
        filtros.numeroTarjeta,
        filtros.cuenta,
        filtros.codigoGiro,
        filtros.codigoMarca,
        filtros.tipoEmisor,
        filtros.tipoProducto,
        filtros.tipoDiferido,
        filtros.numeroCuotas,
        filtros.tipoMensaje,
        filtros.estadoAutorizacion,
        numeroPagina,
        tamanioPagina
      ]
    );

    const resultSets = rows as RowDataPacket[][];
    const registrosPagina = resultSets[0];

    if (!Array.isArray(resultSets[1]) || resultSets[1].length === 0) {
      throw new Error('No se pudo obtener el total de registros desde el SP');
    }

    const totalRegistros = resultSets[1][0]?.total_registros ?? 0;
    const totalPaginas = Math.ceil(totalRegistros / tamanioPagina);

    if (numeroPagina > totalPaginas || numeroPagina < 1) {
      return response(400, {
        estado: 'ERROR',
        codigoRespuesta: '400',
        mensaje: `Número de página inválido. Solo existen ${totalPaginas} páginas para los filtros actuales.`,
        data: null
      });
    }

    if (!registrosPagina || registrosPagina.length === 0) {
      return response(404, {
        estado: 'ERROR',
        codigoRespuesta: '404',
        mensaje: 'No se encontraron autorizaciones para los criterios de búsqueda especificados.',
        data: null
      });
    }

    /* Actualizacion  */ 
    
    const autorizacionesPagina: Autorizacion[] = await Promise.all(
      registrosPagina.map(async row => {
        const panEnmascarado = await aplicarEnmascaramientoDesdeSP(row.vi_c2_tarjeta, usuarioId, connection);
        return mapearAutorizacion(row, panEnmascarado);
      })
    );

    // Segunda llamada al SP para el Excel (sin paginación)
    const [excelRows] = await connection.query(
      'CALL pa_mpg_cautorizaciones(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        filtros.fechaDesde,
        filtros.fechaHasta,
        filtros.tipoAutorizacion,
        filtros.numeroAutorizacion,
        filtros.tipoFranquicia,
        filtros.nombreCadena,
        filtros.nombreComercio,
        filtros.numeroTarjeta,
        filtros.cuenta,
        filtros.codigoGiro,
        filtros.codigoMarca,
        filtros.tipoEmisor,
        filtros.tipoProducto,
        filtros.tipoDiferido,
        filtros.numeroCuotas,
        filtros.tipoMensaje,
        filtros.estadoAutorizacion,
        1,
        10000
      ]
    );

    const excelResultSets = excelRows as RowDataPacket[][];
    const registrosParaExcel = excelResultSets[0];

    const todasLasAutorizaciones = await Promise.all(
      registrosParaExcel.map(async row => {
        const panEnmascarado = await aplicarEnmascaramientoDesdeSP(row.vi_c2_tarjeta, usuarioId, connection);
        return mapearAutorizacion(row, panEnmascarado);
      })
    );

    const rutaExcel = await generarExcelAutorizaciones(todasLasAutorizaciones, nombreArchivo);
    const s3Url = await uploadFileToS3(rutaExcel, 'bb-emisormdp-datasource', nombreArchivo);
    console.log('Excel generado en:', s3Url);

    await connection.end();

    return {
      statusCode: 200,
      body: JSON.stringify({
        estado: "EXITO",
        codigoRespuesta: "000",
        mensaje: "Consulta de autorizaciones realizada exitosamente.",
        totalRegistros,
        totalPagina: totalPaginas,
        paginaActual: numeroPagina,
        tamanioPagina,
        data: {
          autorizaciones: autorizacionesPagina,
          archivoExcelUrl: s3Url
        }
      })
    };
  } catch (error: any) {
    console.error('Error:', error);
    return response(503, {
      estado: 'ERROR',
      codigoRespuesta: '503',
      mensaje: "El servicio del Procesador de Tarjeta de Crédito no está disponible. Por favor, intente más tarde.",
      data: null
    });
  }
};

function response(statusCode: number, body: any): APIGatewayProxyResult {
  return {
    statusCode,
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body)
  };
}

function mapearAutorizacion(row: any, pan: string): Autorizacion {
  return {
    fechaProceso: row.vi_fecha_proceso,
    fechaHoraTransaccion: row.vi_fechahora,
    cuenta: row.mp_cuenta,
    numeroTarjeta: pan,
    fechaExpiracion: row.vi_c14_exp_date,
    tipoMensaje: row.vi_msgType,
    monedaDestino: row.vi_c51_currency_code_cardbill,
    montoAutorizado: row.vi_c5_monto_settlement,
    respuestaIso: {
      codigo: row.vi_c39_resp_code,
      descripcion: row.vi_c39_res
    },
    tipoTransaccion: {
      codigo: row.vi_c3_proccode,
      descripcion: row.vi_c39_resp_desc
    },
    numeroAutorizacion: row.vi_c38_autorizacion,
    modoEntradaCaptura: row.vi_pos_entry_mode,
    codigoComercio: row.vi_c42_card_acceptor_id,
    nombreComercio: row.vi_nombre_comercio,
    nombreCadena: row.vi_descadena,
    giro: row.vi_c18_merchant_type,
    descripcionGiro: row.vi_des_merchant_type,
    codigoProcesoOnline: "",
    ciudad: row.vi_c43_card_acceptor_name_loc,
    pais: row.vi_c43_card_acceptor_name_loc,
    indicadorPresenciaCvv2: row.vi_ind_cvv,
    tipoFranquicia: row.vi_tipoFranquicia,
    montoOrigen: row.vi_c4_monto,
    productoMarca: row.vi_cod_marca,
    tidTerminal: row.vi_c41_terminal_id,
    tipoDiferido: row.vi_codtipodiferido,
    numeroCuotasPactadas: row.vi_cuotaspactadas,
    binAdquirente: row.vi_c32_acq_inst_id,
    binEmisor: row.vi_c33_forw_inst_id,
    descripcionBinEmisor: row.vi_desc_bin_autoriza,
    respuestaInterna: row.vi_codigo_respuesta,
    recurrente: row.vi_indicador_recurrente,
    eci: row.vi_ECI,
    termEntryCapab: row.vi_c130_capacity_terminal,
    voucher: "",
    chipCondicionCode: row.vi_chipcondition_cod,
    tipoEmisor: row.vi_tipo_emisor,
    tipoFactura: row.vi_tipofactura,
    procesado: "",
    tipoProducto: row.vi_tipo_producto,
    numeroTransaccion: row.vi_c11_audit_number,
    atcActual: row.vi_c137_app_transac_counter,
    atcAutorizacion: "",
    campo34: "",
    campo55: row.vi_c55_icc_system,
    campo56: row.vi_c56_reserved_iso
  };
}

async function aplicarEnmascaramientoDesdeSP(
  pan: string,
  usuarioId: number,
  connection: mysql.Connection
): Promise<string> {
  try {
    const sql = "CALL pa_mpg_cenmascarar_pan(?, ?, @out_pan); SELECT @out_pan AS pan;";
    const [results] = await connection.query(sql, [usuarioId, pan]);
    const panEnmascarado = (results as any[])[1]?.[0]?.pan;
    return panEnmascarado || pan;
  } catch (err: any) {
      console.error("Error en aplicarEnmascaramientoDesdeSP:", err.message);
      throw new Error(err.message || "ERROR_ENMASCARAMIENTO");
  }
}

export async function uploadFileToS3(filePath: string, bucket: string, key: string): Promise<string> {
  const s3 = new S3Client({ region: 'us-east-1' });
  try {
    const fileStream = fs.createReadStream(filePath);
    const uploadParams = {
      Bucket: bucket,
      Key: key,
      Body: fileStream,
    };
    await s3.send(new PutObjectCommand(uploadParams));
    const getCommand = new GetObjectCommand({ Bucket: bucket, Key: key });
    const url = await getSignedUrl(s3, getCommand, { expiresIn: 36000 });
    return url;
  } catch (error) {
    console.error('Error al subir archivo a S3:', error);
    throw new Error('No se pudo subir el archivo a S3');
  }
}
