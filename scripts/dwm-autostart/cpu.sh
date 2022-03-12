#!/bin/env bash

while echo $(( 100 - `vmstat |grep -- 3 |awk '{print $15}'` ))
do
       sleep 1
done &

