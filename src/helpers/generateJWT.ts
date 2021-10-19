/* eslint-disable @typescript-eslint/no-non-null-assertion */
import * as jwt from "jsonwebtoken";


export const generateJWT = (uid = '') => {
    return new Promise((resolve, reject) => {
        const payload = { uid };
        const secret = process.env.SECRETORPRIVATEKEY!;

        jwt.sign(
            payload,
            secret,
            {
                expiresIn: "24h",
            },
            (err, token) => {
                if (err) {
                    console.log(err);
                    reject("No se pudo generar el token");
                } else {
                    resolve(token);
                }
            }
        )
    })
}