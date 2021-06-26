#while xsetroot -name " MEM: $(free -h |grep -- 1 |awk '{print $7}')|Time: $(date '+%H:%M'' %a')|UP: $(uptime | sed 's/.*,//') "
#do
#	sleep
#done &

exec dwm

