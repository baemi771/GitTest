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
        "D102" ) S_NAME="VCA302"	#IPN302HD-5117
		        F_NAME="VCA302 Network camera" ;; 

        "B015" ) S_NAME="VCA362IR"	#IPN362HD-6211IR
		        F_NAME="VCA362IR Network camera";;

        "B013" ) S_NAME="VCA352IR"	#IPN352HDIR
		        F_NAME="VCA352IR Network camera";;

        "B014" ) S_NAME="VCA1402"	#IPN1402HD-6117
		        F_NAME="VCA1402 Network camera";;

        "B011" ) S_NAME="VCA2103"	#IPN2103HD-6611
		        F_NAME="VCA2103 Network camera";;

        "B107" ) S_NAME="VCA3402IR"	#IPN3402HD-6311IR
		        F_NAME="VCA3402IR Network camera";;

        "B00A" ) S_NAME="VCA3502IR"	#IPN3502HD-5311IR
		        F_NAME="VCA3502IR Network camera" ;; 

        "B00C" ) S_NAME="VCA3502 "	#IPN3502HD-6311
		        F_NAME="VCA3502 Network camera" ;;

        "B109" ) S_NAME="VCA6702"	#IPN6702HD-6311Z
		        F_NAME="VCA6702 Network camera";;

        "B012" ) S_NAME="VCA8102"	#IPN8102HD-6111W
		        F_NAME="VCA8102 Network camera";;

        "C002" ) S_NAME="VCA3702"	#IPX3702HD-5314
		        F_NAME="VCA3702 Network camera" ;; 

        "C00A" ) S_NAME="VCA4602PTZ"	#IPX4602HD-6416-30
		        F_NAME="VCA4602PTZ Network camera";;

        "E002" ) S_NAME="VCA4100EN"	#NVN4100
		        F_NAME="VCA4100EN Network encoder";;

        "E001" ) S_NAME="VCA1100EN"	#NVN1100
		        F_NAME="VCA1100EN Network encoder";;

        "C00B" ) S_NAME="VCA5502PTZ "	#IPX5502HD-6415-05
		        F_NAME="VCA5502PTZ  Network camera";;

        "B017" ) S_NAME="VCA3512 "	#IPN3512HD-6311
		        F_NAME="VCA3512 Network camera";;

        "B018" ) S_NAME="VCA3512IR "	#IPN3512HD-6311IR
		        F_NAME="VCA3512IR Network camera";;

        "B003" ) S_NAME="VCA6602 "	#IPN6602HD-5311
		        F_NAME="VCA6602 Network camera";;

        "B102" ) S_NAME="VCA6802 "	#IPN6802HD-6211
		        F_NAME="VCA6802 Network camera";;

        "D001" ) S_NAME="VCA100 "	#IPN100HD-5110PIR
		        F_NAME="VCA100 Network camera";;

        "B01B" ) S_NAME="VCA2103U "	#IPN2103HD-6511U
		        F_NAME="VCA2103U Network camera";;

        "B01A" ) S_NAME="VCA3502SV "	#IPN3502SV-7311
		        F_NAME="VCA3502SV Network camera";;

        "B019" ) S_NAME="VCA3502SVIR "	#IPN3502SV-7311IR
		        F_NAME="VCA3502SVIR Network camera";;

        "B10E" ) S_NAME="VCA6702SV "	#IPN6702SV-7311-H
		        F_NAME="VCA6702SV Network camera";;

        "C00D" ) S_NAME="VCA4602SVPTZ "	#IPX4602SV-7416A-30
		        F_NAME="VCA4602SVPTZ Network camera";;

        "Z003" ) S_NAME="VCA1020PT"	#IPT1000MR
		        F_NAME="VCA1020PT Network camera";;

        "B111" ) S_NAME="VCA6702SV-722 "	#IPN6702SV-7311-V722-H
		        F_NAME="VCA6702SV-722 Network camera";;

        "Z020" ) S_NAME="VCA2510PT"	#IPT2500SR
		        F_NAME="VCA2510PT Network camera";;

        "Z021" ) S_NAME="VCA2520PT "	#IPT2500MR
		        F_NAME="VCA2520PT Network camera";;


	#ITC_ITS
        "Z004" ) S_NAME="VCA651LD-36"	#ITS651LD-A36
			T_NAME="VCA651LD"
		        F_NAME="VCA651LD-36 Network camera";;

        "Z008" ) S_NAME="VCA6500TCQD-9A09"	#ITC6500QD-9A09
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-9A09 Network camera";;

        "Z00A" ) S_NAME="VCA6500TCQD-9A16"	#ITC6500QD-9A16
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-9A16 Network camera";;

        "Z00C" ) S_NAME="VCA6500TCQD-9A42"	#ITC6500QD-9A42
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-9A42 Network camera";;

        "Z007" ) S_NAME="VCA6500TCQD-30A09"	#ITC6500QD-30A09
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-30A09 Network camera";;

        "Z009" ) S_NAME="VCA6500TCQD-30A16"	#ITC6500QD-30A16
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-30A16 Network camera";;

        "Z00B" ) S_NAME="VCA6500TCQD-30A42"	#ITC6500QD-30A42
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-30A42 Network camera";;

        "Z00E" ) S_NAME="VCA6500TCVD-9A12"	#ITC6500VD-9A12
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-9A12 Network camera";;

        "Z010" ) S_NAME="VCA6500TCVD-9A18"	#ITC6500VD-9A18
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-9A18 Network camera";;

        "Z00D" ) S_NAME="VCA6500TCVD-30A12"	#ITC6500VD-30A12
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-30A12 Network camera";;

        "Z00F" ) S_NAME="VCA6500TCVD-30A18"	#ITC6500VD-30A18
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-30A18 Network camera";;

        "Z011" ) S_NAME="VCA6500TCVD-30A44"	#ITC6500VD-30A44
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-30A44 Network camera";;

        "Z01C" ) S_NAME="VCA6500TCQD-30A60"	#ITC6500QD-30A60
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-30A60 Network camera";;

        "Z01A" ) S_NAME="VCA6500TCQD-30A06"	#ITC6500QD-30A06
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-30A06 Network camera";;

        "Z018" ) S_NAME="VCA6500TCQD-30A24"	#ITC6500QD-30A24
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-30A24 Network camera";;

        "Z01B" ) S_NAME="VCA6500TCQD-9A06"	#ITC6500QD-9A06
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-9A06 Network camera";;

        "Z019" ) S_NAME="VCA6500TCQD-9A24"	#ITC6500QD-9A24
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-9A24 Network camera";;

        "Z01D" ) S_NAME="VCA6500TCQD-9A60"	#ITC6500QD-9A60
			T_NAME="VCA6500TCQD"
		        F_NAME="VCA6500TCQD-9A60 Network camera";;

        "Z014" ) S_NAME="VCA6500TCVD-30A25"	#ITC6500VD-30A25
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-30A25 Network camera";;

        "Z016" ) S_NAME="VCA6500TCVD-30A37"	#ITC6500VD-30A37
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-30A37 Network camera";;

        "Z01E" ) S_NAME="VCA6500TCVD-30A50"	#ITC6500VD-30A50
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-30A50 Network camera";;

        "Z015" ) S_NAME="VCA6500TCVD-9A25"	#ITC6500VD-9A25
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-9A25 Network camera";;

        "Z017" ) S_NAME="VCA6500TCVD-9A37"	#ITC6500VD-9A37
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-9A37 Network camera";;

        "Z01F" ) S_NAME="VCA6500TCVD-9A50"	#ITC6500VD-9A50
			T_NAME="VCA6500TCVD"
		        F_NAME="VCA6500TCVD-9A50 Network camera";;

	* ) S_NAME="none"
	     F_NAME="none" ;;
	esac
}

getOEMName $PRODUCT_ID

cp -rf /mnt/userfs/brand/logo.png /usr/www/images/
if [ "${S_NAME}" != "none" ];
then
	if [ "${S_NAME}" = "VCA651LD-36" ];
	then
		LENS="`$XML sel -t -v \"/brand/information/videoin/lens\" $BRAND_FILE`"
		#ITS651LD-A20
		if [ "${LENS}" = "SEEK-THERMAL-STANDARD-RANGE-A20" ];
		then
			S_NAME="VCA651LD-20"
			T_NAME="VCA651LD"
			F_NAME="VCA651LD-20 Network camera"
		fi
		#ITS651LD-A60
		if [ "${LENS}" = "SEEK-THERMAL-STANDARD-RANGE-A60" ];
		then
			S_NAME="VCA651LD-A60"
			T_NAME="VCA651LD"
			F_NAME="VCA651LD-60 Network camera"
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
