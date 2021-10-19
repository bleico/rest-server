"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const validar_campos_1 = require("./../middlewares/validar-campos");
const auth_controller_1 = require("../controllers/auth.controller");
const express_validator_1 = require("express-validator");
const express_1 = require("express");
const router = (0, express_1.Router)();
router.get('/login', [
    (0, express_validator_1.check)("username", "El username es obligatorio").not().isEmpty(),
    (0, express_validator_1.check)("password", "El password es obligatorio").not().isEmpty(),
    validar_campos_1.validarCampos
], auth_controller_1.auth);
exports.default = router;
//# sourceMappingURL=usuario.routes.js.map