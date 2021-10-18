# API Proyecto Ubicame 📌

API que comunica en tiempo real para permita determinar la ubicación actual, el trayecto y el destino de un paramédico al realizar un servicio de asistencia médica domiciliaria con el objetivo de monitorear estos datos en el módulo administrativo(Ambulancia, Motos, Carros...etc).

## Comenzando 🚀

_Construido en Nodejs - Express - Typescript - Socket.IO - Postgress - Prisma._

### Instalación 🔧

_Para descargar las librerias necesarias ejecutar._
```bash
npm install
```

Si la BD esta ya esta creada en Postgress, ejecutar el siguiente comando.

```bash
npx prisma db pull
```

Cree migraciones desde su esquema Prisma, aplíquelas a la base de datos y genere artefactos.

```bash
 prisma migrate dev
```

### Configurancion ⚙

Para conectar la api con prisma, debe agregar en las variables de entorno la siguiente linea (si no tiene el archivo .env, agregarlo)

```
DATABASE_URL="postgresql://{usuario}:{password}@localhost:{puerto}/{BD}?schema=public"
```

_Por ejemplo_
```
DATABASE_URL="postgresql://postgres:admin@localhost:5432/ubicame?schema=public"
```

_Cada vez que agreguemos o modifiquemos alguna tabla en nuestra base de datos, debemos ejecutar nuevamente los siguientes comandos para actualizar nuestro modelo de datos de prisma asi como nuestro Prisma Client_
```bash
npx prisma instrospect
```

```bash
npx prisma generate 
```
### Para compilar el proyecto, debe ejecutar los siguientes comandos ✔

Compilar archivo typescript
```bash
tsc -w
```

Compilar y levantar servidor
```bash
npm run dev
```
