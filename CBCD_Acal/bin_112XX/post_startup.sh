#!/bin/sh
#

###############################################################################
#
# 
TEMP=/mnt/rwfs/complete_fd.flag

if [ -f ${TEMP} ]; then
	/usr/www/uapi-cgi/param.cgi "action=update&group=network.eth0.dhcp&enable=yes"
	/usr/www/uapi-cgi/param.cgi "action=update&group=user.root.name&user=root&user=root&pwd=udpvca"	#move here that changing pwd from dbmaker.c
	/usr/www/uapi-cgi/param.cgi "action=add&group=user.admin.name&user=admin&pwd=admin" #root can't be changed. so add admin user
fi
