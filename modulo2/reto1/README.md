# MODULO 2 -> RETO 1
## Creación de red
```
> docker network create -d bridge lemoncode-net

> docker network ls
NETWORK ID     NAME            DRIVER    SCOPE
f4139927aa8b   bridge          bridge    local
42308df12164   host            host      local
8ffce96a4295   lemoncode-net   bridge    local
6433556288de   none            null      local
```
## inicio de contendor mongodb con la red acabada de crear y con un volumen para persistir los datos
```
> docker run -d --name mongodb -p 27017:27017 -v mongo-data:/data/db --network lemoncode-net mongo:latest
```

## contenedor mongo en ejecución
```
> docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                             NAMES
3e335fcbf2ed   mongo:latest   "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes   0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongodb
```

## volúmenes de docker
```
> docker volume ls
DRIVER    VOLUME NAME
local     7fdb5f610e8740e13918f2b0638d2d8c6e41af33f89d509bd144a03dcbebc748
local     mongo-data
```

## información del contenedor iniciado
```
> docker inspect c30620ffe479
[
    {
        "Id": "c30620ffe479c4df6502fe8a3962d9fc0ca2a9293a918095b4a910bb8d57a90a",
        "Created": "2026-09-30T21:17:10.148338663Z",
        "Path": "docker-entrypoint.sh",
        "Args": [
            "mongod"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 1296,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2026-09-30T21:17:10.30650717Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:5d7043a4ffe02b9ed1b6e0bab057546981af5ca0a79107e9c461e49bc44c0a7b",
        "ResolvConfPath": "/var/lib/docker/containers/c30620ffe479c4df6502fe8a3962d9fc0ca2a9293a918095b4a910bb8d57a90a/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/c30620ffe479c4df6502fe8a3962d9fc0ca2a9293a918095b4a910bb8d57a90a/hostname",
        "HostsPath": "/var/lib/docker/containers/c30620ffe479c4df6502fe8a3962d9fc0ca2a9293a918095b4a910bb8d57a90a/hosts",
        "LogPath": "/var/lib/docker/containers/c30620ffe479c4df6502fe8a3962d9fc0ca2a9293a918095b4a910bb8d57a90a/c30620ffe479c4df6502fe8a3962d9fc0ca2a9293a918095b4a910bb8d57a90a-json.log",
        "Name": "/mongodb",
        "RestartCount": 0,
        "Driver": "overlayfs",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": [
                "mongo-data:/data/db"
            ],
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "lemoncode-net",
            "PortBindings": {
                "27017/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "27017"
                    }
                ]
            },
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                38,
                229
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": null,
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/acpi",
                "/proc/asound",
                "/proc/interrupts",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/sys/devices/virtual/powercap",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "Storage": {
            "RootFS": {
                "Snapshot": {
                    "Name": "overlayfs"
                }
            }
        },
        "Mounts": [
            {
                "Type": "volume",
                "Name": "4337f5f360548939c8f138e624fdc64f4d952e5875c23815610840cc732c6591",
                "Source": "/var/lib/docker/volumes/4337f5f360548939c8f138e624fdc64f4d952e5875c23815610840cc732c6591/_data",
                "Destination": "/data/configdb",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            },
            {
                "Type": "volume",
                "Name": "mongo-data",
                "Source": "/var/lib/docker/volumes/mongo-data/_data",
                "Destination": "/data/db",
                "Driver": "local",
                "Mode": "z",
                "RW": true,
                "Propagation": ""
            }
        ],
        "Config": {
            "Hostname": "c30620ffe479",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "27017/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "GOSU_VERSION=1.19",
                "JSYAML_VERSION=3.13.1",
                "JSYAML_CHECKSUM=662e32319bdd378e91f67578e56a34954b0a2e33aca11d70ab9f4826af24b941",
                "MONGO_PACKAGE=mongodb-org",
                "MONGO_REPO=repo.mongodb.org",
                "MONGO_MAJOR=8.3",
                "MONGO_VERSION=8.3.11",
                "HOME=/data/db",
                "GLIBC_TUNABLES=glibc.pthread.rseq=0"
            ],
            "Cmd": [
                "mongod"
            ],
            "Image": "mongo:latest",
            "Volumes": {
                "/data/configdb": {},
                "/data/db": {}
            },
            "WorkingDir": "",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "Labels": {
                "org.opencontainers.image.version": "24.04"
            }
        },
        "NetworkSettings": {
            "SandboxID": "40b3c5554c7faf8c460cb551c10fe07db828713fe23e03361f82260a3b9f65e8",
            "SandboxKey": "/var/run/docker/netns/40b3c5554c7f",
            "Ports": {
                "27017/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "27017"
                    },
                    {
                        "HostIp": "::",
                        "HostPort": "27017"
                    }
                ]
            },
            "Networks": {
                "lemoncode-net": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "DriverOpts": null,
                    "GwPriority": 0,
                    "NetworkID": "8ffce96a4295c7b1fe141eb5a28be7f8f963c66b7188ec5fe9dcad9d2a5ac327",
                    "EndpointID": "133b41501331fb50f1a17acdf5cb94eae8e214a08284c54748a358c330c7bf3e",
                    "Gateway": "172.18.0.1",
                    "IPAddress": "172.18.0.2",
                    "MacAddress": "7a:a5:dc:9e:5b:2e",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": [
                        "mongodb",
                        "c30620ffe479"
                    ]
                }
            }
        },
        "ImageManifestDescriptor": {
            "mediaType": "application/vnd.oci.image.manifest.v1+json",
            "digest": "sha256:949d53a1e0f0f26c8545a9c589474b0ba3be4ca9209c89713c684078665d78d6",
            "size": 2476,
            "annotations": {
                "com.docker.official-images.bashbrew.arch": "amd64",
                "org.opencontainers.image.base.digest": "sha256:496754492fb28b4d3049432f2ca787449331e23fb14f0dd3fffea86bf5a93eb4",
                "org.opencontainers.image.base.name": "ubuntu:noble",
                "org.opencontainers.image.created": "2026-09-16T03:25:48Z",
                "org.opencontainers.image.revision": "0a29f3374c7fa7c38cfe280363b754f898e0a5eb",
                "org.opencontainers.image.source": "https://github.com/docker-library/mongo.git#0a29f3374c7fa7c38cfe280363b754f898e0a5eb:8.3",
                "org.opencontainers.image.url": "https://hub.docker.com/_/mongo",
                "org.opencontainers.image.version": "8.3.11-noble"
            },
            "platform": {
                "architecture": "amd64",
                "os": "linux"
            }
        }
    }
]
```

## Inicio de la aplicación nodejs con las pruebas de obtener datos, insertar datos y eliminar datos
## Las pruebas se han realizado mediante Postman y basándome en el archivo client.http
```
>  npm start  

> lemoncode-backend@1.0.0 start
> node app.js


══════════════════════════════════════════════════════════════════════
🍋 LEMONCODE CALENDAR - BACKEND (Node.js + Express)
══════════════════════════════════════════════════════════════════════
🔄 Conectando a MongoDB...
✅ Conexión a MongoDB exitosa
📚 Colección Classes cargada
🚀 Servidor ejecutándose en: http://localhost:5000
📚 API: http://localhost:5000/api/classes
⏰ Hora: 30/9/2026, 20:10:58
══════════════════════════════════════════════════════════════════════

📍 [23:30:11] GET /api/classes
✅ Se obtuvieron 0 clases
📍 [23:30:21] POST /api/classes
📝 Creando clase: Contenedores VI
✅ Clase creada: Contenedores VI
📍 [23:30:52] POST /api/classes
📝 Creando clase: Contenedores I
✅ Clase creada: Contenedores I
📍 [23:31:03] GET /api/classes
✅ Se obtuvieron 2 clases
📍 [23:34:42] POST /api/classes
📝 Creando clase: Contenedores II
✅ Clase creada: Contenedores II
📍 [23:34:51] GET /api/classes
✅ Se obtuvieron 3 clases
📍 [23:35:36] DELETE /api/classes/6abd7f6d7259da91c2b2f2b7
🗑️  Eliminando clase 6abd7f6d7259da91c2b2f2b7
✅ Clase 6abd7f6d7259da91c2b2f2b7 eliminada
📍 [23:35:45] GET /api/classes
✅ Se obtuvieron 2 clases
```

## reiniciamos contenerdor y nodejs app para ver la persistencia de datos
```
> docker stop 6078b3ffffb9
6078b3ffffb9
> docker rm 6078b3ffffb9
6078b3ffffb9
PS C:\Users\enric> docker run -d --name mongodb -p 27017:27017 -v mongo-data:/data/db --network lemoncode-net mongo:latest
96f75d85d7972e39cafe56c64a4ad1ac2fa2b9968577c820fdbd52ca85270a93

> npm start

> lemoncode-backend@1.0.0 start
> node app.js


══════════════════════════════════════════════════════════════════════
🍋 LEMONCODE CALENDAR - BACKEND (Node.js + Express)
══════════════════════════════════════════════════════════════════════
🔄 Conectando a MongoDB...
✅ Conexión a MongoDB exitosa
📚 Colección Classes cargada
🚀 Servidor ejecutándose en: http://localhost:5000
📚 API: http://localhost:5000/api/classes
⏰ Hora: 30/9/2026, 23:38:44
══════════════════════════════════════════════════════════════════════

📍 [23:39:05] GET /api/classes
✅ Se obtuvieron 2 clases
📍 [23:39:15] GET /api/classes/6abd7f8c7259da91c2b2f2b8
✅ Clase 6abd7f8c7259da91c2b2f2b8 obtenida
```
