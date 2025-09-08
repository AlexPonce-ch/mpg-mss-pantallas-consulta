/****************************************************************************/
/*	Archivo:		pa_mpg_cenmascarar_pan.sp                           */
/*	Motor de Base:		MYSQL                                               */
/*	Base de datos:		DB_TC_ODS_EMI                                       */
/*	Aplicacion:		Migración CREDIMATIC                                */
/*	Servidor: 		AWS                                                 */
/*	Stored procedure:	pa_mpg_cenmascarar_pan                              */
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
DROP PROCEDURE IF EXISTS pa_mpg_cenmascarar_pan;

DELIMITER ;;                                 
CREATE DEFINER=`user_permisos`@`%` PROCEDURE `pa_mpg_cenmascarar_pan`(
    IN e_usuario_id INT,
    IN e_pan VARCHAR(25),
    OUT s_pan VARCHAR(25)
)
BEGIN
    -- Declaracion de variables
    DECLARE v_num_mascara INT;
    DECLARE v_num_bin INT;
    DECLARE v_si_enmask INT;
    DECLARE v_char_mascara CHAR;

    -- Parametros de enmascaramiento
    SELECT pa_valor 
	  INTO v_char_mascara
    FROM adq_tc_m_parametros
    WHERE pa_nombre = 'CHARMASK'
     LIMIT 1;

    SELECT CAST(pa_valor AS UNSIGNED)
	  INTO v_num_mascara
    FROM adq_tc_m_parametros
    WHERE pa_nombre = 'NUMMASK'
     LIMIT 1;

    SELECT CAST(pa_valor AS UNSIGNED)
	  INTO v_num_bin
    FROM adq_tc_m_parametros
    WHERE pa_nombre = 'NUMBIN'
     LIMIT 1;

    -- Permiso de usuario para su rol si es 0 no enmascara y si es 1 enmascara
    SELECT COUNT(1) 
	INTO v_si_enmask
    FROM adq_m_seg_usuario us
    INNER JOIN adq_m_seg_rol_usuario ru 
		ON us.us_id = ru.ru_idusuario
    INNER JOIN adq_m_seg_rol ro 
		ON ru.ru_idrol = ro.ro_id
    WHERE us.us_id = e_usuario_id
      AND ro.ro_enmascarar = 0
      AND ru.ru_estado = 'A'
      AND us.us_estado = 'A';

    -- Enmascara la tarjeta
    SELECT fn_enmascarar(v_si_enmask, v_char_mascara, v_num_mascara, v_num_bin, e_pan)
    INTO s_pan;

END ;;
DELIMITER ;

GRANT EXECUTE ON PROCEDURE DB_TC_ODS_EMI.pa_mpg_cenmascarar_pan TO 'user_permisos'@'%';
