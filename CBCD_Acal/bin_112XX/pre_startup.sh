#!/bin/sh
#

###############################################################################
#
#  

USERS=/mnt/userfs/web/users.js
VCACOUNT=/mnt/userfs/web/vcacounterreport.css
cp -rf $USERS /usr/www/js/config/
cp -rf $VCACOUNT /usr/www/css/config/

GET_LOGO=$(grep -i 'logo.jpg' /mnt/userfs/brand/environment.xml)

if [ ${#GET_LOGO} -gt 0 ]; then
	mount -o remount rw /;
		sed -i "s/logo.jpg/logo.png/g" /mnt/userfs/brand/environment.xml
		echo "change logo file...";
	mount -o remount ro /;
else
	echo "Dose not change logo";
fi
