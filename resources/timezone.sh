case $1 in
	ubuntu )
		echo "Asia/Seoul" > /etc/timezone
		rm /etc/localtime
		dpkg-reconfigure -f noninteractive tzdata
		;;
	redhat )
		echo 'ZONE="America/Los_Angeles"' > /etc/sysconfig/clock
		cp -p /usr/share/zoneinfo/Asia/Seoul /etc/localtime

		date
		;;
	alpine )
		apk update
		apk add tzdata
		cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime
		echo "Asia/Seoul" > /etc/timezone

		date
		;;
esac