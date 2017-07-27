#!/bin/sh
insmod /usr/local/alloc.ko apps="overload" qos_pair=8,1,1,1,1

#echo -e "overload\c" > /sys/module/alloc/parameters/apps 
#echo 1,1,1,1 > /sys/module/alloc/parameters/qos_pair

overload &

checker
