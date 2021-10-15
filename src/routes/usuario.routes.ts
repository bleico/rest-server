
import { getUsuarios } from '../controllers/usuario.controller';

import { Router } from "express"

const router = Router();

router.get('/', getUsuarios);

export default router;