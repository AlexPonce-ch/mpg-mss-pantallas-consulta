/****************************************************************************/
/*	Archivo:		    pa_mpg_cautorizaciones.sp                         */
/*	Motor de Base:		MYSQL                                               */
/*	Base de datos:		DB_TC_ODS_EMI                                       */
/*	Aplicacion:		    Migración CREDIMATIC                                */
/*	Servidor: 		    AWS                                                 */
/*	Stored procedure:	pa_mpg_cautorizaciones                            */
/*	Procesamiento:		BATCH                                               */
/*	Ult.ControlTarea:	GPR-5610                                            */
/*	Disenado por:		Iroute (A.Ponce)                                    */
/*	Fecha de escritura:	28/Ago/2025                                         */
/*	Ult.Referencia:		REF 1                                               */
/****************************************************************************/
/*			                  IMPORTANTE                                    */
/*	"Este programa es parte de los paquetes bancarios propiedad de          */
/*	BANCO BOLIVARIANO S.A.                                                  */
/*	Su uso no autorizado queda expresamente prohibido asi como              */
/*	cualquier alteracion o agregado hecho por alguno de sus                 */
/*	usuarios sin el debido consentimiento por escrito de la                 */
/*	Presidencia Ejecutiva de BANCO BOLIVARIANO o su representante."         */
/****************************************************************************/
/*	                          PROPOSITO:	                                */
/*                                                                          */
/****************************************************************************/
/*  MODIFICACIONES:                                                         */
/****************************************************************************/
/*  REF  FECHA        AUTOR                  RATIONAL                       */
/*  1    28/Ago/2025  Iroute (A.Ponce)        GPR-5610                      */
/*       Creación inicial del procedimiento                                 */
/****************************************************************************/

USE DB_TC_ODS_EMI;
DROP PROCEDURE IF EXISTS pa_mpg_cautorizaciones;

DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `pa_mpg_cautorizaciones`(
  IN e_fecha_desde DATE,
  IN e_fecha_hasta DATE,
  IN e_tipo_autorizacion VARCHAR(50),
  IN e_numero_autorizacion VARCHAR(50),
  IN e_tipo_franquicia VARCHAR(50),
  IN e_nombre_cadena VARCHAR(100),
  IN e_nombre_comercio VARCHAR(100),
  IN e_numero_tarjeta VARCHAR(22),
  IN e_cuenta VARCHAR(20),
  IN e_codigo_giro VARCHAR(10),
  IN e_codigo_marca VARCHAR(10),
  IN e_tipo_emisor VARCHAR(50),
  IN e_tipo_producto VARCHAR(100),
  IN e_tipo_diferido VARCHAR(10),
  IN e_numero_cuotas INT,
  IN e_tipo_mensaje VARCHAR(10),
  IN e_estado_autorizacion VARCHAR(20),
  IN e_page INT,
  IN e_page_size INT
)
BEGIN

  DECLARE v_offset INT;
  SELECT (e_page - 1) * e_page_size INTO v_offset;

  SELECT 
	vta.vi_fecha_proceso,                 -- fechaProceso
    vta.vi_fechahora,                     -- fechaHoraTransaccion
    mp.mp_cuenta,                         -- cuenta
    vta.vi_c2_tarjeta,                    -- numeroTarjeta (luego enmascaras)
    vta.vi_c14_exp_date,                  -- fechaExpiracion
    vta.vi_msgType,                       -- tipoMensaje
    vta.vi_c51_currency_code_cardbill,    -- monedaDestino
    vta.vi_c5_monto_settlement,           -- montoAutorizado
    vta.vi_c39_resp_code,                 -- respuestaIso.codigo
    vta.vi_c39_resp_desc,                 -- respuestaIso.descripcion
    vta.vi_c3_proccode, 
	-- vta.vi_c3_proccode_desc,
    vta.vi_c38_autorizacion,              -- numeroAutorizacion
    vta.vi_pos_entry_mode,                -- modoEntradaCaptura
    vta.vi_c42_card_acceptor_id,          -- codigoComercio
    vta.vi_nombre_comercio,               -- nombreComercio
    vta.vi_descadena,                     -- nombreCadena
    vta.vi_c18_merchant_type,             -- giro
    vta.vi_des_merchant_type,             -- descripcionGiro
    -- vta.vi_codigo_proceso_online,         -- codigoProcesoOnline (si no existe, eliminar)
    vta.vi_c43_card_acceptor_name_loc,    -- ciudad / pais (string combinado)
    vta.vi_ind_cvv,                       -- indicadorPresenciaCvv2
    vta.vi_tipoFranquicia,                -- tipoFranquicia
    vta.vi_c4_monto,                      -- montoOrigen
    vta.vi_cod_marca,                     -- productoMarca (si usas código de marca)
    vta.vi_c41_terminal_id,               -- tidTerminal
    vta.vi_codtipodiferido,               -- tipoDiferido
    vta.vi_cuotaspactadas,                -- numeroCuotasPactadas
    vta.vi_c32_acq_inst_id,               -- binAdquirente
    vta.vi_c33_forw_inst_id,              -- binEmisor (verifica si es el correcto)
    vta.vi_desc_bin_autoriza,             -- descripcionBinEmisor (si existe)
    vta.vi_codigo_respuesta,              -- respuestaInterna
    vta.vi_indicador_recurrente,          -- recurrente
    vta.vi_ECI,                           -- eci (ojo: no 'vi_ECI')
    vta.vi_c130_capacity_terminal,        -- termEntryCapab
    -- vta.vi_voucher,                       -- voucher (si existe)
    vta.vi_chipcondition_cod,             -- chipCondicionCode
    vta.vi_tipo_emisor,                   -- tipoEmisor
    vta.vi_tipofactura,                   -- tipoFactura
    -- vta.vi_estadoaut,                     -- procesado (o estado interno)
    vta.vi_tipo_producto,                 -- tipoProducto
    vta.vi_c11_audit_number,              -- numeroTransaccion
    vta.vi_c137_app_transac_counter,      -- atcActual
    -- vta.vi_atc_autorizacion,              -- atcAutorizacion (si existe)
    -- vta.vi_campo34,                       -- campo34 (si existe)
    vta.vi_c55_icc_system,                -- campo55
    vta.vi_c56_reserved_iso               -- campo56
  FROM vs_t_logs_autorizaciones vta
  LEFT JOIN emi_t_medio_pago_tarjeta mp 
	  ON vta.vi_c2_tarjeta = mp.mp_pan
  WHERE
    vta.vi_fecha_proceso BETWEEN e_fecha_desde AND e_fecha_hasta
    AND (e_tipo_autorizacion IS NULL OR vta.vi_tipo_autorizacion = e_tipo_autorizacion)
    AND (e_numero_autorizacion IS NULL OR vta.vi_c38_autorizacion = e_numero_autorizacion)
    AND (e_tipo_franquicia IS NULL OR vta.vi_tipoFranquicia = e_tipo_franquicia) 
    AND (e_nombre_cadena IS NULL OR vta.vi_descadena = e_nombre_cadena)
    AND (e_nombre_comercio IS NULL OR vta.vi_nombre_comercio = e_nombre_comercio)
    AND (e_numero_tarjeta IS NULL OR vta.vi_c2_tarjeta = e_numero_tarjeta)
    AND (e_cuenta IS NULL OR mp.mp_cuenta = e_cuenta)
    AND (e_codigo_giro IS NULL OR vta.vi_c18_merchant_type = e_codigo_giro)
    AND (e_codigo_marca IS NULL OR vta.vi_cod_marca = e_codigo_marca)
    AND (e_tipo_emisor IS NULL OR vta.vi_tipo_emisor = e_tipo_emisor)
    AND (e_tipo_producto IS NULL OR vta.vi_tipo_producto = e_tipo_producto)
    AND (e_tipo_diferido IS NULL OR vta.vi_codtipodiferido = e_tipo_diferido)
    AND (e_numero_cuotas IS NULL OR CAST(vta.vi_cuotaspactadas AS UNSIGNED) = e_numero_cuotas)
    AND (e_tipo_mensaje IS NULL OR vta.vi_msgType = e_tipo_mensaje)
    AND (e_estado_autorizacion IS NULL OR vta.vi_estadoaut = e_estado_autorizacion)
  ORDER BY vta.vi_fecha_proceso DESC
  LIMIT e_page_size OFFSET v_offset;

  
  SELECT COUNT(*) AS total_registros
  FROM vs_t_logs_autorizaciones vta
  LEFT JOIN emi_t_medio_pago_tarjeta mp 
	ON vta.vi_c2_tarjeta = mp.mp_pan
  WHERE 
    vta.vi_fecha_proceso BETWEEN e_fecha_desde AND e_fecha_hasta
    AND (e_tipo_autorizacion IS NULL OR vta.vi_tipo_autorizacion = e_tipo_autorizacion)
    AND (e_numero_autorizacion IS NULL OR vta.vi_c38_autorizacion = e_numero_autorizacion)
    AND (e_tipo_franquicia IS NULL OR vta.vi_tipoFranquicia = e_tipo_franquicia)
    AND (e_nombre_cadena IS NULL OR vta.vi_descadena = e_nombre_cadena)
    AND (e_nombre_comercio IS NULL OR vta.vi_nombre_comercio = e_nombre_comercio)
    AND (e_numero_tarjeta IS NULL OR vta.vi_c2_tarjeta = e_numero_tarjeta)
    AND (e_cuenta IS NULL OR mp.mp_cuenta = e_cuenta)
    AND (e_codigo_giro IS NULL OR vta.vi_c18_merchant_type = e_codigo_giro)
    AND (e_codigo_marca IS NULL OR vta.vi_cod_marca = e_codigo_marca)
    AND (e_tipo_emisor IS NULL OR vta.vi_tipo_emisor = e_tipo_emisor)
    AND (e_tipo_producto IS NULL OR vta.vi_tipo_producto = e_tipo_producto)
    AND (e_tipo_diferido IS NULL OR vta.vi_codtipodiferido = e_tipo_diferido)
    AND (e_numero_cuotas IS NULL OR CAST(vta.vi_cuotaspactadas AS UNSIGNED) = e_numero_cuotas)
    AND (e_tipo_mensaje IS NULL OR vta.vi_msgType = e_tipo_mensaje)
    AND (e_estado_autorizacion IS NULL OR vta.vi_estadoaut = e_estado_autorizacion);
    
END$$
DELIMITER ;

GRANT EXECUTE ON PROCEDURE DB_TC_ODS_EMI.pa_mpg_cautorizaciones TO 'admin'@'%';
