#!/bin/env bash

while

 U1=$(sudo ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
 U2=$(sudo ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
 U3=$(awk "BEGIN {print $U2 - $U1}")
 U=$(awk "BEGIN {print $U3 / 1024 / 1024}")
 echo ↑ ${U:0:3} Mb/s

do

       sleep 1

done

