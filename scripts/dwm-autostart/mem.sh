#!/bin/sh
echo $(( 100 - `df -h |grep '/$' |awk '{print $5}' |sed 's/.$//'` ))
