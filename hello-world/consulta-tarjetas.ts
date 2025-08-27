import { APIGatewayEvent, Context } from 'aws-lambda';
import { getConnection } from './db_connection';

export const lambdaHandler = async (event: APIGatewayEvent, context: Context) => {
    // ✅ Manejo de CORS para preflight
    if (event.httpMethod === 'OPTIONS') {
        return {
            statusCode: 200,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type',
            },
            body: '',
        };
    }

    const spConsultaTarjetas = "CALL SP_CONSULTA_TARJETAS(?)";
    const spTarjetasPorNumtar = "CALL SP_TARJETAS_POR_NUMTAR(?, ?)";
    const spTarjetasPorIdenti = "CALL SP_TARJETAS_POR_IDENTIFICACION(?, ?)";
    const spTarjetasPorNomCliente = "CALL SP_TARJETAS_POR_NOMBRE_CLIENTE(?, ?)";
    const spTarjetasPorCuenta = "CALL SP_TARJETAS_POR_CUENTA(?, ?)";
    const spTarjetasPorCalpart = "CALL SP_TARJETAS_POR_CALPART(?)";

    let result: any;

    try {
        const body = event.body ? JSON.parse(event.body) : {};
        const criterioBusqueda = body.criterioBusqueda || {};
        const filtrosAdicionales = body.filtrosAdicionales || {};

        const tipo = criterioBusqueda.tipoTransaccion?.toUpperCase();
        const valor = criterioBusqueda.valorBusqueda;
        const calpart = filtrosAdicionales.soloTarjetasPrincipales ?? null;

        const connection = await getConnection();

        if (tipo === 'TARJETA' && valor?.trim()) {
            const [rows]: any = await connection.execute(spTarjetasPorNumtar, [valor, calpart]);
            result = rows[0];
        } else if (tipo === 'IDENTIFICACION_CLIENTE' && valor?.trim()) {
            const [rows]: any = await connection.execute(spTarjetasPorIdenti, [valor, calpart]);
            result = rows[0];
        } else if (tipo === 'NOMBRE_CLIENTE' && valor?.trim()) {
            const [rows]: any = await connection.execute(spTarjetasPorNomCliente, [valor, calpart]);
            result = rows[0];
        } else if (tipo === 'CUENTA' && valor?.trim()) {
            const [rows]: any = await connection.execute(spTarjetasPorCuenta, [valor, calpart]);
            result = rows[0];
        } else if (tipo === 'CALPART' && calpart?.trim()) {
            const [rows]: any = await connection.execute(spTarjetasPorCalpart, [calpart]);
            result = rows[0];
        } else {
            const [rows]: any = await connection.execute(spConsultaTarjetas, [calpart]);
            result = rows[0];
        }

        if (!result || result.length === 0) {
            return {
                statusCode: 404,
                headers: {
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Methods': 'POST, OPTIONS',
                    'Access-Control-Allow-Headers': 'Content-Type',
                },
                body: JSON.stringify({
                    estado: "SIN_RESULTADOS",
                    codigoRespuesta: "404",
                    mensaje: "No se encontraron resultados",
                    data: { resultados: [], totalResultados: 0 }
                }),
            };
        }

        return {
            statusCode: 200,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type',
            },
            body: JSON.stringify({
                estado: "EXITO",
                codigoRespuesta: "000",
                mensaje: "Consulta realizada exitosamente.",
                data: {
                    resultados: result,
                    totalResultados: result.length
                }
            }),
        };
    } catch (error) {
        console.error('Error en lambdaHandler:', error);
        return {
            statusCode: 500,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type',
            },
            body: JSON.stringify({ error: error instanceof Error ? error.message : 'Unknown error' }),
        };
    }
};
