#!/bin/env bash

print_date(){
        date '+%Y-%m-%d %H:%M'
#	date '+%H:%M'' %a'
}

print_uptime(){
	uptime | sed 's/.*,//'
}

print_mem(){
	free -h |grep -- 2 |awk '{print $7}'
}

print_mem%(){
	echo $(( 100 - `df -h |grep '/$' |awk '{print $5}' |sed 's/.$//'` ))
}

print_cpu(){
	echo $(( 100 - `vmstat |grep -- 3 |awk '{print $15}'` ))
}

print_bcapacity(){
	upower -i $(upower -e |grep BAT) |grep --color=never -E 'state |to\ full |to\ empty |percentage' |awk '{print $2}'
}

print_bstatus(){
	if [ `upower -i $(upower -e |grep BAT) |grep state |awk '{print $2}'` = discharging ];then
	 echo "〢"
	elif [ `upower -i $(upower -e |grep BAT) |grep state |awk '{print $2}'` = charging ];then
	 echo "⚡"
	elif [ `upower -i $(upower -e |grep BAT) |grep state |awk '{print $2}'` = fully-charged ];then
	 echo "▇"
	 else
	 exit 0
	fi
}

print_netdown(){
eth0=$1

while true
do
 RX_pre=$(cat /proc/net/dev | grep `ip addr | awk '/state UP/ {print $2}' | sed 's/.$//'` | sed 's/:/ /g' | awk '{print $2}')
 sleep 1
 RX_next=$(cat /proc/net/dev | grep `ip addr | awk '/state UP/ {print $2}' | sed 's/.$//'` | sed 's/:/ /g' | awk '{print $2}')

 clear

 RX=$((${RX_next}-${RX_pre}))

 if [[ $RX -lt 1024 ]];then
 RX="${RX}B/s"
 elif [[ $RX -gt 1048576 ]];then
 RX=$(echo $RX | awk '{print $1/1048576 "MB/s"}')
 else
 RX=$(echo $RX | awk '{print $1/1024 "KB/s"}')
 fi

 echo -e "$RX"

done
}

#. "$DIR/netspeed/netdown.sh"
#. "$DIR/netspeed/netup.sh"

xsetroot -name "$(print_bstatus)$(print_bcapacity) CPU:$(print_cpu)% MEM:$(print_mem%)% $(print_date)$(print_uptime)"
