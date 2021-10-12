#! /bin/bash

ping -w 3 azhk.dnsone.icu -c 1 >/dev/null 2>&1 #执行一次会生成一个以errtmp开头的文件，可用/dev/null代替，不生成任何文件
if [ $? = 0 ] ; then
echo "AZHK is GOOD!"
else
echo -e "3\n" | bash ddns.sh
fi
