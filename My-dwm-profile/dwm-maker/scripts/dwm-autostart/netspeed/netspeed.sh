while true
do
	U1=$(sudo ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
	D1=$(sudo ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')

	sleep 1
	clear

	U2=$(sudo ifconfig $1 |grep 'bytes' |grep 'RX' |awk '{print $5}')
	D2=$(sudo ifconfig $1 |grep 'bytes' |grep 'TX' |awk '{print $5}')

	U3=$(awk "BEGIN {print $U2 - $U1}")
	D3=$(awk "BEGIN {print $D2 - $D1}")

	U=$(awk "BEGIN {print $U3 / 1024 / 1024}")
	D=$(awk "BEGIN {print $D3 / 1024 / 1024}")

	echo ==================
	echo 上传速度: ${U:0:3} Mb/s
	echo 下载速度: ${D:0:3} Mb/s
	echo ==================
done
