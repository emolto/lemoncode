# MODULO 2 -> RETO 4
## Iniciar los contenedores definidos
```
> docker-compose up -d
[+] up 4/4
 ✔ Network lemoncode-net Created                                                                                                                                                        0.4s
 ✔ Container mongodb     Started                                                                                                                                                        1.0s
 ✔ Container backend     Started                                                                                                                                                        1.2s
 ✔ Container frontend    Started                                                                                                                                                        1.3s
```

## Instancias iniciadas
```
> docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                                             NAMES
1f6ea215ca14   frontend:prod   "docker-entrypoint.s…"   11 seconds ago   Up 9 seconds    0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp       frontend
eaad2ec8e936   backend:prod    "docker-entrypoint.s…"   11 seconds ago   Up 9 seconds    0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp       backend
4de1ae510a64   mongo:latest    "docker-entrypoint.s…"   11 seconds ago   Up 10 seconds   0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongodb
```

## Log de backend tras el inicio
```
> docker logs eaad2ec8e936

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
⏰ Hora: 1/10/2026, 22:10:45
══════════════════════════════════════════════════════════════════════
```

## Log de frontend tras el inicio
```
> docker logs 1f6ea215ca14

> lemoncode-frontend@1.0.0 start
> node server.js

[dotenv@17.2.3] injecting env (0) from .env -- tip: ⚙️  override existing env vars with { override: true }

======================================================================
🍋 LEMONCODE CALENDAR - FRONTEND SERVER
======================================================================
🚀 Servidor iniciado correctamente
📱 Web: http://localhost:3000
🔗 API: http://backend:5000/api/classes
⏰ Hora: 1/10/2026, 22:10:45
======================================================================
```

## Log de frontend tras acceder a la url con el navegador
```
> docker logs 1f6ea215ca14

> lemoncode-frontend@1.0.0 start
> node server.js

[dotenv@17.2.3] injecting env (0) from .env -- tip: ⚙️  override existing env vars with { override: true }

======================================================================
🍋 LEMONCODE CALENDAR - FRONTEND SERVER
======================================================================
🚀 Servidor iniciado correctamente
📱 Web: http://localhost:3000
🔗 API: http://backend:5000/api/classes
⏰ Hora: 1/10/2026, 22:10:45
======================================================================

📍 [22:13:44] GET /
🔄 Conectando a la API: http://backend:5000/api/classes
✅ 3 clases cargadas correctamente
```

## Log del backend tras acceder al frontend
```
> docker logs eaad2ec8e936

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
⏰ Hora: 1/10/2026, 22:10:45
══════════════════════════════════════════════════════════════════════

📍 [22:13:44] GET /api/classes
✅ Se obtuvieron 3 clases
```
