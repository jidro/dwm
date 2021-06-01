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

print_netup(){
	netup1=$(sudo ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
	netup2=$(sudo ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
	netup3=$(awk "BEGIN {print $U2 - $U1}")
	netup=$(awk "BEGIN {print $U3 / 1024 / 1024}")
	echo ↑ ${netup:0:3}
}

print_netdown(){
	netdown1=$(sudo ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')
	netdown2=$(sudo ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')
	netdown3=$(awk "BEGIN {print $D2 - $D1}")
	netdown=$(awk "BEGIN {print $D3 / 1024 / 1024}")
	echo ↓ ${netdown:0:3}
}

xsetroot -name " CPU:$(print_cpu)% MEM:$(print_mem) $(print_date) $(print_uptime)"
