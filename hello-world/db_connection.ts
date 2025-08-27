import * as dotenv from 'dotenv';
dotenv.config();  // Carga las variables del archivo .env

import * as mysql from 'mysql2/promise';

export const getConnection = async () => {
    try {
        const connection = await mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASS,
            database: process.env.DB_NAME,
            port: parseInt(process.env.DB_PORT || '3306'),
        });
        return connection;
    } catch (error) {
        console.error('Error de conexión a la base de datos:', error);
        throw new Error('No se pudo conectar a la base de datos.');
    }
};
