import { validarCampos } from '../middlewares/validar-campos';

import { auth } from '../controllers/auth.controller';
import { check } from 'express-validator'
import { Router } from "express"

const router = Router();

router.get('/login', [
    check("username", "El username es obligatorio").not().isEmpty(),
    check("password", "El password es obligatorio").not().isEmpty(),
    validarCampos
], auth);

export default router;