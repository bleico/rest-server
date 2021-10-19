"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const morgan_1 = __importDefault(require("morgan"));
const usuario_routes_1 = __importDefault(require("../routes/usuario.routes"));
class Server {
    constructor() {
        this.apiPaths = {
            login: '/api/login'
        };
        this.app = (0, express_1.default)();
        this.port = process.env.PORT || '3000';
        // Metodos iniciales
        // this.dbConnection();
        this.middlewares();
        this.routes();
    }
    middlewares() {
        this.app.use((0, morgan_1.default)("dev"));
        // Cors
        this.app.use((0, cors_1.default)({
            methods: ['GET', 'POST', 'DELETE', 'UPDATE', 'PUT', 'PATCH']
        }));
        // Lectura del body
        this.app.use(express_1.default.json());
        // Carpeta publica
        this.app.use(express_1.default.static('public'));
    }
    routes() {
        this.app.use(this.apiPaths.login, usuario_routes_1.default);
    }
    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en el puerto', this.port);
        });
    }
}
exports.default = Server;
//# sourceMappingURL=server.js.map