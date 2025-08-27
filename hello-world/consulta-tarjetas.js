"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
exports.__esModule = true;
exports.lambdaHandler = void 0;
var db_connection_1 = require("./db_connection");
var lambdaHandler = function (event, context) { return __awaiter(void 0, void 0, void 0, function () {
    var spConsultaTarjetas, spTarjetasPorNumtar, spTarjetasPorIdenti, spTarjetasPorNomCliente, spTarjetasPorCuenta, spTarjetasPorCalpart, result, body, criterioBusqueda, filtrosAdicionales, tipo, valor, calpart, connection, rows, rows, rows, rows, rows, rows, error_1;
    var _a, _b;
    return __generator(this, function (_c) {
        switch (_c.label) {
            case 0:
                // ✅ Manejo de CORS para preflight
                if (event.httpMethod === 'OPTIONS') {
                    return [2 /*return*/, {
                            statusCode: 200,
                            headers: {
                                'Access-Control-Allow-Origin': '*',
                                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                                'Access-Control-Allow-Headers': 'Content-Type'
                            },
                            body: ''
                        }];
                }
                spConsultaTarjetas = "CALL SP_CONSULTA_TARJETAS(?)";
                spTarjetasPorNumtar = "CALL SP_TARJETAS_POR_NUMTAR(?, ?)";
                spTarjetasPorIdenti = "CALL SP_TARJETAS_POR_IDENTIFICACION(?, ?)";
                spTarjetasPorNomCliente = "CALL SP_TARJETAS_POR_NOMBRE_CLIENTE(?, ?)";
                spTarjetasPorCuenta = "CALL SP_TARJETAS_POR_CUENTA(?, ?)";
                spTarjetasPorCalpart = "CALL SP_TARJETAS_POR_CALPART(?)";
                _c.label = 1;
            case 1:
                _c.trys.push([1, 15, , 16]);
                body = event.body ? JSON.parse(event.body) : {};
                criterioBusqueda = body.criterioBusqueda || {};
                filtrosAdicionales = body.filtrosAdicionales || {};
                tipo = (_a = criterioBusqueda.tipoTransaccion) === null || _a === void 0 ? void 0 : _a.toUpperCase();
                valor = criterioBusqueda.valorBusqueda;
                calpart = (_b = filtrosAdicionales.soloTarjetasPrincipales) !== null && _b !== void 0 ? _b : null;
                return [4 /*yield*/, (0, db_connection_1.getConnection)()];
            case 2:
                connection = _c.sent();
                if (!(tipo === 'TARJETA' && (valor === null || valor === void 0 ? void 0 : valor.trim()))) return [3 /*break*/, 4];
                return [4 /*yield*/, connection.execute(spTarjetasPorNumtar, [valor, calpart])];
            case 3:
                rows = (_c.sent())[0];
                result = rows[0];
                return [3 /*break*/, 14];
            case 4:
                if (!(tipo === 'IDENTIFICACION_CLIENTE' && (valor === null || valor === void 0 ? void 0 : valor.trim()))) return [3 /*break*/, 6];
                return [4 /*yield*/, connection.execute(spTarjetasPorIdenti, [valor, calpart])];
            case 5:
                rows = (_c.sent())[0];
                result = rows[0];
                return [3 /*break*/, 14];
            case 6:
                if (!(tipo === 'NOMBRE_CLIENTE' && (valor === null || valor === void 0 ? void 0 : valor.trim()))) return [3 /*break*/, 8];
                return [4 /*yield*/, connection.execute(spTarjetasPorNomCliente, [valor, calpart])];
            case 7:
                rows = (_c.sent())[0];
                result = rows[0];
                return [3 /*break*/, 14];
            case 8:
                if (!(tipo === 'CUENTA' && (valor === null || valor === void 0 ? void 0 : valor.trim()))) return [3 /*break*/, 10];
                return [4 /*yield*/, connection.execute(spTarjetasPorCuenta, [valor, calpart])];
            case 9:
                rows = (_c.sent())[0];
                result = rows[0];
                return [3 /*break*/, 14];
            case 10:
                if (!(tipo === 'CALPART' && (calpart === null || calpart === void 0 ? void 0 : calpart.trim()))) return [3 /*break*/, 12];
                return [4 /*yield*/, connection.execute(spTarjetasPorCalpart, [calpart])];
            case 11:
                rows = (_c.sent())[0];
                result = rows[0];
                return [3 /*break*/, 14];
            case 12: return [4 /*yield*/, connection.execute(spConsultaTarjetas, [calpart])];
            case 13:
                rows = (_c.sent())[0];
                result = rows[0];
                _c.label = 14;
            case 14:
                if (!result || result.length === 0) {
                    return [2 /*return*/, {
                            statusCode: 404,
                            headers: {
                                'Access-Control-Allow-Origin': '*',
                                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                                'Access-Control-Allow-Headers': 'Content-Type'
                            },
                            body: JSON.stringify({
                                estado: "SIN_RESULTADOS",
                                codigoRespuesta: "404",
                                mensaje: "No se encontraron resultados",
                                data: { resultados: [], totalResultados: 0 }
                            })
                        }];
                }
                return [2 /*return*/, {
                        statusCode: 200,
                        headers: {
                            'Access-Control-Allow-Origin': '*',
                            'Access-Control-Allow-Methods': 'POST, OPTIONS',
                            'Access-Control-Allow-Headers': 'Content-Type'
                        },
                        body: JSON.stringify({
                            estado: "EXITO",
                            codigoRespuesta: "000",
                            mensaje: "Consulta realizada exitosamente.",
                            data: {
                                resultados: result,
                                totalResultados: result.length
                            }
                        })
                    }];
            case 15:
                error_1 = _c.sent();
                console.error('Error en lambdaHandler:', error_1);
                return [2 /*return*/, {
                        statusCode: 500,
                        headers: {
                            'Access-Control-Allow-Origin': '*',
                            'Access-Control-Allow-Methods': 'POST, OPTIONS',
                            'Access-Control-Allow-Headers': 'Content-Type'
                        },
                        body: JSON.stringify({ error: error_1 instanceof Error ? error_1.message : 'Unknown error' })
                    }];
            case 16: return [2 /*return*/];
        }
    });
}); };
exports.lambdaHandler = lambdaHandler;
