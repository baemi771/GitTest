#!/bin/sh
#

###############################################################################
#
# 
# 
. /etc/sysconfig/common.conf
PRODUCT_ID=`/usr/sbin/hwinfoparam --get productid`

TOPNAME="CAMERA"

S_NAME="none"
F_NAME="none"
T_NAME="none"

function getOEMName {
	case $1 in
	#IPN_brand
        "B01E" ) S_NAME="IPN1302SV"	#IPN1302SV-7211
		        F_NAME="IPN1302SV" ;; 

        "B014" ) S_NAME="IPN1402HD"	#IPN1402HD-6117
		        F_NAME="IPN1402HD";;

        "B012" ) S_NAME="IPN8102HD-W"	#IPN8102HD-6111W
		        F_NAME="IPN8102HD-W";;

        "B00F" ) S_NAME="IPN8102HD-T"	#IPN8102HD-6111T
		        F_NAME="IPN8102HD-T";;

        "D102" ) S_NAME="IPN302HD"	#IPN302HD-5117
		        F_NAME="IPN302HD";;

        "D103" ) S_NAME="IPN302SV"	#IPN302SV-7117
		        F_NAME="IPN302SV";;

        "B015" ) S_NAME="IPN362HD"	#IPN362HD-6211IR
		        F_NAME="IPN362HD";;

        "B107" ) S_NAME="IPN3402HD"	#IPN3402HD-6311IR
		        F_NAME="IPN3402HD" ;; 

        "C002" ) S_NAME="IPX3702HD "	#IPX3702HD-5314
		        F_NAME="IPX3702HD" ;;

        "B103" ) S_NAME="IPN6802HD"	#IPN6802HD-6211
		        F_NAME="IPN6802HD";;

        "B109" ) S_NAME="IPN6702HD"	#IPN6702HD-6311Z
		        F_NAME="IPN6702HD";;

        "B10E" ) S_NAME="IPN6702SV"	#IPN6702SV-7311-H
		        F_NAME="IPN6702SV" ;; 

        "B111" ) S_NAME="IPN6702SV-722"	#IPN6702SV-7311-V722-H
		        F_NAME="IPN6702SV-722";;

        "B018" ) S_NAME="IPN3512HD"	#IPN3512HD-6311IR
		        F_NAME="IPN3512HD";;

        "B01A" ) S_NAME="IPN3502SV"	#IPN3502SV-7311
		        F_NAME="IPN3502SV";;

        "B019" ) S_NAME="IPN3502SV-IR"	#IPN3502SV-7311IR
		        F_NAME="IPN3502SV-IR";;

        "C00D" ) S_NAME="IPX4602SV"	#IPX4602SV-7416A-30
		        F_NAME="IPX4602SV";;

#        "B018" ) S_NAME="IPM95A16"	#IPM95A16
#		        F_NAME="IPM95A16";;

        "E002" ) S_NAME="NVN4100"	#NVN4100
		        F_NAME="NVN4100";;

        "E001" ) S_NAME="NVN1100"	#NVN1100
		        F_NAME="NVN1100";;

        "E006" ) S_NAME="NVN4100-R12"	#NVN4100-R12
		        F_NAME="NVN4100-R12";;

        "E003" ) S_NAME="NVN4100-R40"	#NVN4100-R40
		        F_NAME="NVN4100-R40";;
		        
        "2021" ) S_NAME="IPT2500MR"	#IPT2500MR
		        F_NAME="IPT2500MR";;		        

	#ITC_ITS
        "Z004" ) S_NAME="ITS651LD-A36"	#ITS651LD-A36
			T_NAME="ITS651LD-A36"
		        F_NAME="ITS651LD-A36";;

	* ) S_NAME="none"
	     F_NAME="none" ;;
	esac
}

getOEMName $PRODUCT_ID

cp -rf /mnt/userfs/brand/logo.png /usr/www/images/
if [ "${S_NAME}" != "none" ];
then
	if [ "${S_NAME}" = "ITS651LD-A36" ];
	then
		LENS="`$XML sel -t -v \"/brand/information/videoin/lens\" $BRAND_FILE`"
		#ITS651LD-A36
		if [ "${LENS}" = "SEEK-THERMAL-STANDARD-RANGE" ];
		then
			S_NAME="ITS651LD-A36"
			T_NAME="ITS651LD-A36"
			F_NAME="ITS651LD-A36"
		fi
		#ITS651LD-A20
		if [ "${LENS}" = "SEEK-THERMAL-STANDARD-RANGE-A20" ];
		then
			S_NAME="ITS651LD-A20"
			T_NAME="ITS651LD-A20"
			F_NAME="ITS651LD-A20"
		fi
	fi

	if [ "${T_NAME}" != "none" ];
	then
		/usr/bin/xml ed -L -u "/environment/web/topname" -v "${T_NAME}" /mnt/userfs/brand/environment.xml
	else
		/usr/bin/xml ed -L -u "/environment/web/topname" -v "${S_NAME}" /mnt/userfs/brand/environment.xml
	fi
	/usr/bin/xml ed -L -u "/brand/product/fullname" -v "${F_NAME}" /var/info/sys/brand.xml
	/usr/bin/xml ed -L -u "/brand/product/shortname" -v "${S_NAME}" /var/info/sys/brand.xml
	/usr/bin/xml ed -L -u "/brand/product/manufacturer" -v "VCA Technology" /var/info/sys/brand.xml

	#echo $F_NAME;
	#echo $S_NAME;
fi
