#!/bin/bash

val=`sudo setpci -s 00:02.1 F4.B`

val= expr $((0x$val)) $1 $2

sudo setpci -s 00:02.1 F4.B=`printf "%X" $val`
