import { PrismaClient } from '@prisma/client';
import { Request, Response } from "express";
import { compareSync } from "bcryptjs"
import { generateJWT } from "../helpers/generateJWT"


const prisma = new PrismaClient();


export const auth = async (req: Request, res: Response) => {


    try {
        const { body } = req;
        const user = body.username;
        const pass = body.password;
        const users = await prisma.users.findMany({
            where: {
                username: user,
                password: pass
            }
        });

        const userDB = users.find(i => i.password === pass);
        const passwordDB = typeof userDB?.password === 'string' ? userDB.password : '';
        const userId = typeof userDB?.users_id === 'number' ? userDB.users_id : null;

        if (users.length === 0) {
            return res.status(401).json({
                msg: "Usuario / Password no son correctos - usuario"
            })
        }

        // const validarPassword = compareSync(pass, passwordDB!);
        const validarPassword = (pass === passwordDB ? true : false);
        if (!validarPassword) {
            return res.status(400).json({
                msg: "Usuario / Password no son correctos - password",
            });
        }

        const token = await generateJWT(userId?.toString());


        return res.status(200).json({ users, token });
    } catch (e) {
        console.log('❌ Ha ocurrido un error', e)
        return res.status(500).json({ msg: 'Ha ocurrido un error' })
    } finally {
        await prisma.$disconnect();
    }

}