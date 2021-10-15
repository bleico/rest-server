
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

export default (async function connection() {
    try {
        const data = await prisma.amd.findMany()
        console.log(data)

        data;
    } catch (e) {

    } finally {
        await prisma.$disconnect();
    }
})();

