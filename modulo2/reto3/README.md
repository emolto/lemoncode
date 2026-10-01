# MODULO 2 -> RETO 3
## generación de la imagen para el frontend
```
> docker build -t frontend:prod bootcamp-devops-lemoncode-master\01-contenedores\lemoncode-challenge\node-stack\frontend -f modulo2-docker\reto3\frontend\Dockerfile
[+] Building 12.5s (10/10) FINISHED                                                                                                                                    docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                   0.0s
 => => transferring dockerfile: 867B                                                                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/node:26-alpine3.23                                                                                                                  0.6s
 => [internal] load .dockerignore                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                        0.0s
 => [1/5] FROM docker.io/library/node:26-alpine3.23@sha256:c3c6e314fd42e41962360b2482fc18d150beb47976c3aa7b8b9689d7ef42a5c2                                                            0.0s
 => => resolve docker.io/library/node:26-alpine3.23@sha256:c3c6e314fd42e41962360b2482fc18d150beb47976c3aa7b8b9689d7ef42a5c2                                                            0.0s
 => [internal] load build context                                                                                                                                                      0.1s
 => => transferring context: 187.69kB                                                                                                                                                  0.0s
 => CACHED [2/5] WORKDIR /app/node                                                                                                                                                     0.0s
 => [3/5] COPY [package.json, package-lock.json*, npm-shrinkwrap.json*, ./]                                                                                                            0.4s
 => [4/5] RUN npm install                                                                                                                                                              8.8s
 => [5/5] COPY . .                                                                                                                                                                     0.5s
 => exporting to image                                                                                                                                                                 1.8s
 => => exporting layers                                                                                                                                                                1.1s
 => => exporting manifest sha256:0188fbb63e34f8a851798895c9bbe7818985829064d28d9bd41bc7a706e5ce97                                                                                      0.0s
 => => exporting config sha256:d5c8c10ba62bfe7fffa6a0fe029eb19349d729ef8008d48bdf8bd47c80ae61a5                                                                                        0.0s
 => => exporting attestation manifest sha256:64e973e5e051090c0d631e50167efaf9681f9d611973b533e119a7f6e1aaf827                                                                          0.0s
 => => exporting manifest list sha256:6ca9710f0d110d24f859108591d0940a85b9e2761be31454b471653cbefca86f                                                                                 0.0s
 => => naming to docker.io/library/frontend:prod                                                                                                                                       0.0s
 => => unpacking to docker.io/library/frontend:prod                                                                                                                                    0.5s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/qy6nrcatentfio03hg2d30f93
```

## Iniciar contenedor mongodb
```
> docker run -d --name mongodb -p 27017:27017 -v mongo-data:/data/db --network lemoncode-net mongo:latest
04997176e51c5efd8d649aab5d21410cfe990f3fd9e41453bf7671659df74382
```

## Iniciar contenedor backend
```
> docker run -d --name backend -p 5000:5000 --network lemoncode-net backend:prod
1df19b880ae46c74a9c047380d9167867e42acf3dec52a60e86ac17e3cdc3f88
```

## Contenedores iniciados
```
> docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                                             NAMES
1df19b880ae4   backend:prod   "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp       backend
04997176e51c   mongo:latest   "docker-entrypoint.s…"   2 minutes ago        Up 2 minutes        0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongodb
```

## Log contenedor backend
```
> docker logs 1df19b880ae4

> lemoncode-backend@1.0.0 start
> node app.js


══════════════════════════════════════════════════════════════════════
🍋 LEMONCODE CALENDAR - BACKEND (Node.js + Express)
══════════════════════════════════════════════════════════════════════
🔄 Conectando a MongoDB...
✅ Conexión a MongoDB exitosa
📚 Colección Classes cargada
🚀 Servidor ejecutándose en: http://backend:5000
📚 API: http://backend:5000/api/classes
⏰ Hora: 1/10/2026, 21:06:32
══════════════════════════════════════════════════════════════════════

📍 [21:07:05] GET /api/classes
✅ Se obtuvieron 2 clases
```

## Iniciar contenedor frontend
```
> docker run -d --name frontend -p 3000:3000 --network lemoncode-net frontend:prod
32dee5ba59ccbb0f5c1c51227cbee3a1c02e9965789e3f895e883db0e8a02554
```

## Instancias iniciadas
```
> docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS         PORTS                                             NAMES
a147fb478aaa   frontend:prod   "docker-entrypoint.s…"   8 seconds ago   Up 5 seconds   0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp       frontend
1df19b880ae4   backend:prod    "docker-entrypoint.s…"   8 minutes ago   Up 8 minutes   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp       backend
04997176e51c   mongo:latest    "docker-entrypoint.s…"   9 minutes ago   Up 8 minutes   0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongodb
```

## Log de inicio de frontend
```
> docker logs a147fb478aaa

> lemoncode-frontend@1.0.0 start
> node server.js

[dotenv@17.2.3] injecting env (0) from .env -- tip: 🗂️ backup and recover secrets: https://dotenvx.com/ops

======================================================================
🍋 LEMONCODE CALENDAR - FRONTEND SERVER
======================================================================
🚀 Servidor iniciado correctamente
📱 Web: http://localhost:3000
🔗 API: http://backend:5000/api/classes
⏰ Hora: 1/10/2026, 21:29:31
======================================================================
```

## Log del frontend tras acceder a la aplicación mediante el navegador
```
> docker logs dd7045a41d1a

> lemoncode-frontend@1.0.0 start
> node server.js

[dotenv@17.2.3] injecting env (0) from .env -- tip: 🛠️  run anywhere with `dotenvx run -- yourcommand`

======================================================================
🍋 LEMONCODE CALENDAR - FRONTEND SERVER
======================================================================
🚀 Servidor iniciado correctamente
📱 Web: http://localhost:3000
🔗 API: http://backend:5000/api/classes
⏰ Hora: 1/10/2026, 21:29:31
======================================================================

📍 [21:31:58] GET /
🔄 Conectando a la API: http://backend:5000/api/classes
✅ 2 clases cargadas correctamente
```

## Log del frontend tras añadir un curso y refrescar el navegador
```
> docker logs dd7045a41d1a

> lemoncode-frontend@1.0.0 start
> node server.js

[dotenv@17.2.3] injecting env (0) from .env -- tip: 🛠️  run anywhere with `dotenvx run -- yourcommand`

======================================================================
🍋 LEMONCODE CALENDAR - FRONTEND SERVER
======================================================================
🚀 Servidor iniciado correctamente
📱 Web: http://localhost:3000
🔗 API: http://backend:5000/api/classes
⏰ Hora: 1/10/2026, 21:29:31
======================================================================

📍 [21:31:58] GET /
🔄 Conectando a la API: http://backend:5000/api/classes
✅ 2 clases cargadas correctamente
📍 [21:37:11] GET /
🔄 Conectando a la API: http://backend:5000/api/classes
✅ 3 clases cargadas correctamente
```
