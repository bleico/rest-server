import { PrismaClient } from '@prisma/client';
import { json, Request, Response } from "express";

const prisma = new PrismaClient();


export const auth = async (req: Request, res: Response) => {


    try {
        const { body } = req;
        const username = body.username;
        const password = body.password;
        const userExists = await prisma.users.findMany({
            where: {
                username: username,
                password
            }
        });

        if (!userExists) {
            return res.status(401).json({
                msg: "❌EL usuario no existe"
            })
        }
        return res.status(200).json({ data: userExists });
    } catch (e) {
        console.log('❌ Ha ocurrido un error', e)
        return res.status(500).json({ msg: 'Ha ocurrido un error' })
    } finally {
        await prisma.$disconnect();
    }

}