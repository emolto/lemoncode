# MODULO 2 -> RETO 2
## generación de la imagen para el backend
```
> docker build -t backend:prod bootcamp-devops-lemoncode-master\01-contenedores\lemoncode-challenge\node-stack\backend -f modulo2-docker\reto2\backend\Dockerfile
[+] Building 16.0s (10/10) FINISHED                                                                                                                                                                             docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                                                            0.0s
 => => transferring dockerfile: 832B                                                                                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/node:26-alpine3.23                                                                                                                                                           0.3s
 => [internal] load .dockerignore                                                                                                                                                                                               0.0s
 => => transferring context: 2B                                                                                                                                                                                                 0.0s
 => [1/5] FROM docker.io/library/node:26-alpine3.23@sha256:c3c6e314fd42e41962360b2482fc18d150beb47976c3aa7b8b9689d7ef42a5c2                                                                                                     5.0s
 => => resolve docker.io/library/node:26-alpine3.23@sha256:c3c6e314fd42e41962360b2482fc18d150beb47976c3aa7b8b9689d7ef42a5c2                                                                                                     0.0s
 => => sha256:d0c1d894c237d8192cbcd37e435031ad4eddec173299568a5a05869c2e40dfa3 3.85MB / 3.85MB                                                                                                                                  0.5s
 => => sha256:84e786116bfe5d69d25c9a90e13a6cd649d0679eaf512f12c239cf36362928f1 450B / 450B                                                                                                                                      0.5s
 => => sha256:02a12a914fbdf252847310d28a844f7021a8402ba2f670fdc2477ac5ea3647ed 63.08MB / 63.08MB                                                                                                                               15.3s
 => => extracting sha256:d0c1d894c237d8192cbcd37e435031ad4eddec173299568a5a05869c2e40dfa3                                                                                                                                       0.3s
 => => extracting sha256:02a12a914fbdf252847310d28a844f7021a8402ba2f670fdc2477ac5ea3647ed                                                                                                                                       1.5s
 => => extracting sha256:84e786116bfe5d69d25c9a90e13a6cd649d0679eaf512f12c239cf36362928f1                                                                                                                                       0.0s
 => [internal] load build context                                                                                                                                                                                               0.7s
 => => transferring context: 10.20MB                                                                                                                                                                                            0.6s
 => [2/5] WORKDIR /app/node                                                                                                                                                                                                     3.4s
 => [3/5] COPY [package.json, package-lock.json*, npm-shrinkwrap.json*, ./]                                                                                                                                                     0.5s
 => [4/5] RUN npm install                                                                                                                                                                                                       3.4s
 => [5/5] COPY . .                                                                                                                                                                                                              1.1s
 => exporting to image                                                                                                                                                                                                          2.0s
 => => exporting layers                                                                                                                                                                                                         0.9s
 => => exporting manifest sha256:5d06c713511ad7884898b30a17ab41a9723b01c67f7cc17954ee57560d443662                                                                                                                               0.0s
 => => exporting config sha256:8a1a1b1f214f89a42f6101a62d6c37498f730b9bebae63294a06527026606527                                                                                                                                 0.0s
 => => exporting attestation manifest sha256:ab64ec2fb0fb4fe5295b2abbca3668e5d79b752e108579dff61b40e3cd436643                                                                                                                   0.0s
 => => exporting manifest list sha256:f4d520176bf379b4c485fe642efc84d7150742afb4160253a6d9fae0df35c66c                                                                                                                          0.0s
 => => naming to docker.io/library/backend:prod                                                                                                                                                                                 0.0s
 => => unpacking to docker.io/library/backend:prod                                                                                                                                                                              0.9s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/wf9fzzxpp4d6la5dtbx086d1q
```

## imagen generada
```
> docker images
                                                                                                                                                                                                                 i Info →   U  In Use
IMAGE          ID             DISK USAGE   CONTENT SIZE   EXTRA
backend:prod   27d3e98fdbdd        302MB         74.6MB
mongo:latest   5d7043a4ffe0       1.15GB          303MB    U
```

## iniciar contenedor backend en la misma red que el contenedor de mongodb
```
> docker run -d --name backend -p 5000:5000 --network lemoncode-net backend:prod

> docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                             NAMES
6d49bf0ee4a5   backend:prod   "docker-entrypoint.s…"   2 minutes ago    Up 2 minutes    0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp       backend
96f75d85d797   mongo:latest   "docker-entrypoint.s…"   48 minutes ago   Up 48 minutes   0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongodb
```


## output del contenedor de backend con las pruebas desde Postman
```
> docker logs 6d49bf0ee4a5

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
⏰ Hora: 30/9/2026, 22:26:09
══════════════════════════════════════════════════════════════════════

📍 [22:26:46] GET /api/classes
✅ Se obtuvieron 0 clases
📍 [22:26:58] POST /api/classes
📝 Creando clase: Contenedores II
✅ Clase creada: Contenedores II
📍 [22:27:27] POST /api/classes
📝 Creando clase: Contenedores I
✅ Clase creada: Contenedores I
```
