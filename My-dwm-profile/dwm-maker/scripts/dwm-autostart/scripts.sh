#!/bin/env bash

print_date(){
        date '+%Y-%m-%d %H:%M'
#	date '+%H:%M'' %a'
}

print_uptime(){
	uptime | sed 's/.*,//'
}

print_mem(){
	free -h |grep -- 1 |awk '{print $7}'
}

print_cpu(){
	echo $(( 100 - `vmstat |grep -- 3 |awk '{print $15}'` ))
}

xsetroot -name " CPU:$(print_cpu)% MEM:$(print_mem) $(print_date) $(print_uptime) "
