# Entorno dockerizado para ejecutar gxemul en OSX o Windows

### Dependencias

- Docker y docker-compose. En OSX basta con tener instalado Docker.App.

### Gxemul

La carpeta gxemul debe tener los archivos necesarios para poder ejecutar gxemul, de acuerdo a la siguiente jerarquía de carpetas:

```
|_gxemul
| |_ gxemul # Ejecutable de gxemul   
| |_ MD5SUMS
| |_ netbsd-pmax.img # Imagen de NetBSD
|
|_ config.tcl
|_ docker-compose.yml
|_ orgaConpus.Dockerfile
|_ Readme.md
|_ startAll.sh
|_ startGxemul.tcl

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

3. Una vez conectado al container, conectarse por el túnel ssh abierto:

```
$ ssh -p 2222 root@127.0.0.1
```

Mientras está el container andando, se pueden crear o pegar archivos `.c` o de cualquier tipo en el directorio raíz, y automáticamente van a estar disponibles en el Ubuntu virtual que funciona como host. 

Basta con utilizar comandos como `scp` para llevar esos archivos a gxemul, de la misma manera que se abre la conexión ssh en los pasos **2** y **3**. 
