#!/bin/env bash

print_date(){
        date '+%Y-%m-%d %H:%M'
#	date '+%H:%M'' %a'
}

print_uptime(){
	uptime | sed 's/.*,//'
}

print_mem(){
	free -h |grep '^Mem' |awk '{print $7}'
}

print_cpu(){
	echo $(( 100 - `vmstat |grep -- 3 |awk '{print $15}'` ))
}

print_netdown(){
	D1=$(ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')
	D2=$(ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')
	D3=$(awk "BEGIN {print $D2 - $D1}")
	D=$(awk "BEGIN {print $D3 / 1024 / 1024}")
	echo "${D}"
}

print_netup(){
	U1=$(ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
	U2=$(ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
	U3=$(awk "BEGIN {print $U2 - $U1}")
	U=$(awk "BEGIN {print $U3 / 1024 / 1024}")
	echo "${U}"
}

print_bcapacity(){
	upower -i $(upower -e |grep BAT) |grep --color=never -E 'state |to\ full |to\ empty |percentage' |awk '{print $2}'
}

print_bstatus(){
	if [ `upower -i $(upower -e |grep BAT) |grep state |awk '{print $2}'` = discharging ];then
	 echo "🔋"
	elif [ `upower -i $(upower -e |grep BAT) |grep state |awk '{print $2}'` = charging ];then
	 echo "⚡"
	 else
	 exit 0
	fi
}

xsetroot -name "$(print_bstatus)$(print_bcapacity) CPU:$(print_cpu)% MEM:$(print_mem) $(print_date) $(print_uptime)"
