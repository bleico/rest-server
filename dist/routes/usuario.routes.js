"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const usuario_controller_1 = require("../controllers/usuario.controller");
const express_1 = require("express");
const router = (0, express_1.Router)();
router.get('/', usuario_controller_1.getUsuarios);
exports.default = router;
//# sourceMappingURL=usuario.routes.js.map