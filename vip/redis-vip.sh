#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ETH='eth1'
VIP="XXXXXXXX"
NAME=`hostname -s`
PASS=`grep masterauth /etc/redis.conf | awk '{ print $2 }'`
TMP=`date +%s`
cat << EOF > /tmp/$TMP
auth $PASS
info replication
EOF
ret=`/usr/local/bin/redis-cli < /tmp/$TMP 2> /dev/null | grep role`
rm /tmp/$TMP
if [ `echo $ret |grep master |wc -l` -eq 1 ]; then
	ifconfig $ETH:0 $VIP netmask 255.255.255.255
else
	ifconfig $ETH:0 down
fi

exit 0

