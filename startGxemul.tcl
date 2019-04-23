#!/usr/bin/expect

#uso el timeout -1 porque el def son 10 segundos y puede que tarde mas.
set timeout -1

#uso el codigo fuente de config.tcl para setear las variables.
source ./config.tcl


#Abro una shell para poder ejecutar comandos de bash
spawn bash

#Configuracion de ip lo:0
send "ifconfig lo:0 $guestToHostIp\r"

send "cd gxemul/\r"

send "service ssh start\r"

#Acceso a gxemul
send "./gxemul -e 3max -d netbsd-pmax.img\r"
expect "login:" { send "$guestUser\r" }
expect "Password:" { send "$guestUserPass\r" }
expect "root@:~#"


#Tunel SSH
send "ssh -R $hostPort:$hostToGuestIp:$guestPort $hostUser@$guestToHostIp\r"
send "rm /root/.ssh/known_hosts\r"
set timeout 10
expect "Are you sure you want to continue connecting (yes/no)?" { send "yes\r" }
expect "*?password:" { send "$hostUserPass\r" }

interact


