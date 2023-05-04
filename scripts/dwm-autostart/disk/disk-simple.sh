#!/bin/sh
#echo ⛁ `df -h |grep ' /$' |awk '{print $4}'`/`df -h |grep ' /$' |awk '{print $2}' `$(( 100 - `df -h |grep ' /$' |awk '{print $5}' |sed 's/.$//'` ))%

DISK_USE=`df -h |grep ' /$' |awk '{print $4}'`
DISK_ALL=`df -h |grep ' /$' |awk '{print $2}'`
DISK_PERCENTAGE=$(( 100 - `df -h |grep ' /$' |awk '{print $5}' |sed 's/.$//'` ))%

#echo ⛁ $DISK_USE/$DISK_ALL - \($DISK_PERCENTAGE\)
echo ⛁ $DISK_USE/$DISK_ALL \($DISK_PERCENTAGE\)
