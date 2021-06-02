#!/bin/env bash
if [ `upower -i $(upower -e |grep BAT) |grep state |awk '{print $2}'` = discharging ];then
 echo "🔋"
elif [ `upower -i $(upower -e |grep BAT) |grep state |awk '{print $2}'` = charging ];then
 echo "⚡"
 else
 exit 0
fi
