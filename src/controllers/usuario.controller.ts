import { Request, Response } from "express";
import connection from "../database/connection";

export const getUsuarios = async (req: Request, res: Response) => {

    const user = await connection;

    return res.json({ msg: user })
}