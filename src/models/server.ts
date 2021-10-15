import express, { Application } from "express"
import cors from "cors"
import connection from "../database/connection";

import userRoutes from "../routes/usuario.routes";


class Server {

    private app: Application;
    private port: string;
    private apiPaths = {
        login: '/api/login'
    }

    constructor() {
        this.app = express();
        this.port = process.env.PORT || '3000';

        // Metodos iniciales
        // this.dbConnection();
        this.middlewares();
        this.routes();
    }
    async dbConnection() {
        await connection
    }
    middlewares() {
        // Cors
        this.app.use(cors({

        }));
        // Lectura del body
        this.app.use(express.json());
        // Carpeta publica
        this.app.use(express.static('public'));
    }
    routes() {
        this.app.use(this.apiPaths.login, userRoutes)
    }

    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en el puerto', this.port)
        })
    }
}

export default Server;