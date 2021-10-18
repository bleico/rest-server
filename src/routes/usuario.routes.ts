
import { auth } from '../controllers/auth.controller';

import { Router } from "express"

const router = Router();

router.get('/', auth);

export default router;