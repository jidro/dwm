#!/bin/env bash

while

 D1=$(sudo ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')
 D2=$(sudo ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')
 D3=$(awk "BEGIN {print $D2 - $D1}")
 D=$(awk "BEGIN {print $D3 / 1024 / 1024}")
 echo ↓ ${D:0:3} Mb/s

do

       sleep 1

done

