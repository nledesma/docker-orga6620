# Entorno dockerizado para ejecutar gxemul en OSX o Windows

### Dependencias

- Docker y docker-compose. En OSX basta con tener instalado Docker.App.

### Gxemul

La carpeta gxemul debe tener los archivos necesarios para poder ejecutar gxemul, de acuerdo a la siguiente jerarquía de carpetas:

```
/
├─ code/ # Carpeta de código vacía
├─ gxemul/
│   ├─ gxemul # Ejecutable de gxemul   
│   ├─ MD5SUMS
│   └─ netbsd-pmax.img # Imagen de NetBSD
├─ config.tcl
├─ docker-compose.yml
├─ orgaConpus.Dockerfile
├─ Readme.md
├─ startAll.sh
└─ startGxemul.tcl

```

### Instrucciones

1. Ejecutar el siguiente comando:
```
# 1. Construye la imagen de ubuntu con las dependencias necesarias si no existe.
# 2. Corre el container con la imagen de ubuntu, con el directorio raiz montado como volumen.
# 3. Luego de dejar el container corriendo, inicializa gxemul y abre el túnel ssh.
$ ./startAll.sh
```

2. En una nueva terminal, conectarse al container

```
$ docker exec -it gxemulHost bash
```

3. Una vez conectado al container, se puede ejecutar el siguiente script:

```
$ ./copyAndConnect.tcl
```

Este comando copia todos los archivos `.S` contenidos en la carpeta code a gxemul, y se conecta a gxemul.
Una vez ejecutado el script, basta moverse al directorio code, y ya se puede compilar el assembly.

4.
```
$ cd code
```