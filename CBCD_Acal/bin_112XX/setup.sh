#!/bin/sh

. /etc/sysconfig/common.conf

USRFS_DIR="/mnt/userfs"
USRFS_LIST="
  brand
  database
  tools
  www
  themes
  language
  web
  etc
"
PREUSRFS_BOOT="pre_startup.sh"
POSTUSRFS_BOOT="post_startup.sh"
USRFS_OVRWR=".overwrite"
USRFS_BIN_BRAND="brand.bin"
USRFS_XML_BRAND="brand.xml"
FIRMWARE_INFO_FILE=`$XMLPARAM -f $STATUS_FILE -get files.firmware`
USRFS_VER="userfs.ver"
USRFS_REV="revision"
BRAND_OEM="brand_oem.sh"

BRANDPACK_DIR="./pack/brand"
BRAND_TBL="./brand.tbl"
PRODUCT_ID=`/usr/sbin/hwinfoparam --get productid`

BRAND_FILE=`cat ${BRAND_TBL} | grep -v "#" | grep -i ${PRODUCT_ID} | awk '{print $3}'`
if [ "${BRAND_FILE}" != "" ]; then
  cp -dpR ${BRANDPACK_DIR}/${BRAND_FILE} ./brand/${USRFS_BIN_BRAND}
fi

TOTAL=0
for LIST in ${USRFS_LIST}
do
  [ -d ./${LIST} ] || continue;
  [ -e ./${LIST}/${USRFS_OVRWR} ] || rm -rf ${USRFS_DIR}/${LIST}
  TOTAL=$((TOTAL+1))
done
${XMLPARAM} -f $FIRMWARE_INFO_FILE -set total="$TOTAL"

CURRENT=0
for LIST in ${USRFS_LIST}
do
  [ -d ./${LIST} ] || continue;
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set state="USERFS($LIST)"
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set message="Start updating for USERFS($LIST)"
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set updated="`date`"
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set images.$TYPE.state="start"

  cp -dpR ./${LIST} ${USRFS_DIR}/${LIST}
  rm -rf ${USRFS_DIR}/${LIST}/${USRFS_OVRWR}  
  
  CURRENT=$((CURRENT+1))
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set message="Success updating USERFS($LIST)"
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set updated="`date`"
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set images.$TYPE.state="complete"
  $XMLPARAM -f $FIRMWARE_INFO_FILE -set current="$CURRENT"
done

[ -e ${USRFS_DIR}/${PREUSRFS_BOOT} ] && rm -rf ${USRFS_DIR}/${PREUSRFS_BOOT}
[ -e ${USRFS_DIR}/${POSTUSRFS_BOOT} ] && rm -rf ${USRFS_DIR}/${POSTUSRFS_BOOT}
[ -e ${USRFS_DIR}/${USRFS_VER} ] && rm -rf ${USRFS_DIR}/${USRFS_VER}
[ -e ${USRFS_DIR}/${USRFS_REV} ] && rm -rf ${USRFS_DIR}/${USRFS_REV}
[ -e ${USRFS_DIR}/${BRAND_OEM} ] && rm -rf ${USRFS_DIR}/${BRAND_OEM}

[ -e ./${PREUSRFS_BOOT} ] && cp -dpR ./${PREUSRFS_BOOT} ${USRFS_DIR}/${PREUSRFS_BOOT}
[ -e ./${POSTUSRFS_BOOT} ] && cp -dpR ./${POSTUSRFS_BOOT} ${USRFS_DIR}/${POSTUSRFS_BOOT}
[ -e ./${USRFS_VER} ] && cp -dpR ./${USRFS_VER} ${USRFS_DIR}/${USRFS_VER}
[ -e ./${USRFS_REV} ] && cp -dpR ./${USRFS_REV} ${USRFS_DIR}/${USRFS_REV}
[ -e ./${BRAND_OEM} ] && cp -dpR ./${BRAND_OEM} ${USRFS_DIR}/${BRAND_OEM}

if [ -e /mnt/userfs/database/dbfs.bin ]
then
  echo "DB_IMAGE=/mnt/userfs/database/dbfs.bin" > /var/config/database.conf
fi
#/usr/sbin/fsreset                          # soft factorydefault
/usr/sbin/bootparam -set factorydefault 1   # hard factorydefault


$XMLPARAM -f $FIRMWARE_INFO_FILE -set state="reboot"
$XMLPARAM -f $FIRMWARE_INFO_FILE -set message="After reboot, Firmware upgrade will be complete"
$XMLPARAM -f $FIRMWARE_INFO_FILE -set updated="`date`"
$XMLPARAM -f $FIRMWARE_INFO_FILE -set percent="80"

sleep 1

/sbin/reboot

exit 0

