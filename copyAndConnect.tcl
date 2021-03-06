#!/usr/bin/expect

source ./config.tcl

spawn bash

send "scp -P $hostPort -r ./$hostCodeFolder/*.S ./$hostCodeFolder/*.h ./$hostCodeFolder/*.c ./$hostCodeFolder/**/*.txt $guestUser@$hostToGuestIp:$guestCodeFolder\r"

#Password tarda mucho en aparecer por eso se necesita el timeout -1
set timeout -1

expect "Password:" { send "$guestUserPass\r" }

expect ":/usr/src#"

send "ssh -p $hostPort $guestUser@$hostToGuestIp\r"

expect "Password:" { send "$guestUserPass\r" }

expect "root@:~#" { send "cd code/\r" }

interact