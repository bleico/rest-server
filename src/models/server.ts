import express, { Application } from "express"
import cors from "cors"
import morgan from "morgan";

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

    middlewares() {

        this.app.use(morgan("dev"));
        // Cors
        this.app.use(cors({
            methods: ['GET', 'POST', 'DELETE', 'UPDATE', 'PUT', 'PATCH']
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