# Use xsetroot to add system information to the bar of dwn.
#while xsetroot -name " MEM: $(free -h |grep -- 1 |awk '{print $7}')|Time: $(date '+%H:%M'' %a')|UP: $(uptime | sed 's/.*,//') "
#do
#	sleep
#done &

# Start using dwm as the default desktop environment.
exec dwm

