#! /bin/bash

OUT_ALERT "[提示] 安装软件并配置服务"
apt install wget && wget https://bujuge.github.io/ddns.sh && chmod +x ddns.sh && echo -e "2\ndnsone.icu\nazhk\n1\nLTAIUfEYCb5NEMTx\nZ1qdAWllM9yP1zgWJRP9O09jgM0fLl\n" | bash ddns.sh

OUT_ALERT "[提示] 首次运行并检测状态"
wget https://bujuge.github.io/dns.sh && chmod +x dns.sh && bash dns.sh

OUT_ALERT "[提示] 配置开机启动并持续检测"
echo -e "* * * * * /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 2; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 4; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 6; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 8; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 10; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 12; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 14; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 16; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 18; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 20; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 22; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 24; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 26; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 28; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 30; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 32; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 34; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 36; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 38; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 40; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 42; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 44; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 46; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 48; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 50; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 52; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 54; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 56; /bin/bash -x /root/dns.sh >/dev/null 2>&1
* * * * * sleep 58; /bin/bash -x /root/dns.sh >/dev/null 2>&1" > /var/spool/cron/crontabs/root

OUT_ALERT "[提示] 清除残余文件"
rm -f alidns.sh
