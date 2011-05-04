#!/bin/sh

case "$1" in
    toggle)
	/bin/lsmod | /bin/grep -q ath5k
	if [ $? -eq 0 ] ; then
	    sudo /sbin/ifconfig wlan0 down
	    sudo /sbin/rmmod ath5k
            /usr/bin/notify-send -t 2000  --icon=/usr/share/icons/oxygen/32x32/devices/network-wireless.png "Networking" "Wireless module is off"
	else
	    sudo /sbin/modprobe ath5k
	    sudo /sbin/ifconfig wlan0 up
            /usr/bin/notify-send -t 2000  --icon=/usr/share/icons/oxygen/32x32/devices/network-wireless.png "Networking" "Wireless module is on"
	fi
	;;
    on)
	sudo /sbin/modprobe ath5k
	sudo /sbin/ifconfig wlan0 up
        /usr/bin/notify-send -t 2000  --icon=/usr/share/icons/oxygen/32x32/devices/network-wireless.png "Networking" "Wireless module is on"
	;;
    off)
	sudo /sbin/ifconfig wlan0 down
	sudo /sbin/rmmod ath5k
        /usr/bin/notify-send -t 2000  --icon=/usr/share/icons/oxygen/32x32/devices/network-wireless.png "Networking" "Wireless module is off"
	;;
esac
