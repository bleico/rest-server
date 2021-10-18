# API Proyecto Ubicame

API que comunica en tiempo real para permita determinar la ubicación actual, el trayecto y el destino de un paramédico al realizar un servicio de asistencia médica domiciliaria con el objetivo de monitorear estos datos en el módulo administrativo.

## Comenzando 🚀

_API REST construido en Nodejs - Express - Typescript - Socket.IO - Postgress - Prisma_

### Instalación 🔧

_Para descargar las librerias necesarias ejecutar_
```bash
npm install
```

_Si la BD esta ya esta creada en Postgress, ejecutar el siguiente comando_

```bash
npx prisma db pull
```

### Configurancion

_Para conectar la api con prisma, debe configurar lo siguiente en las variables de entorno, ni no tiene el archivo .env, agregarlo_
DATABASE_URL="postgresql://{usuario}:{password}@localhost:{puerto}/{BD}?schema=public"

_Por ejemplo_

DATABASE_URL="postgresql://postgres:admin@localhost:5432/ubicame?schema=public"


_Cada vez que agreguemos o modifiquemos alguna tabla en nuestra base de datos, debemos ejecutar nuevamente los siguientes comandos para actualizar nuestro modelo de datos de prisma asi como nuestro Prisma Client_
```bash
$ npx prisma instrospect
$ npx prisma generate 
```


