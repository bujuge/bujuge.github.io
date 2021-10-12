#! /bin/bash
apt-get update\
 && apt-get install sudo\
 && sudo dpkg --configure -a\
 && apt-get update\
 && apt-get install wget -y\
 && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone\
 && apt-get -y install ca-certificates\
 && apt --fix-broken install\
 && wget -N --no-check-certificate "https://github.000060000.xyz/tcpx.sh"\
 && chmod +x tcpx.sh\
 && apt-get update\
 && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone\
 && apt --fix-broken install -y\
 && apt-get install curl -y\
 && docker version > /dev/null || curl -fsSL get.docker.com | bash\
 && service docker restart\
 && apt-get remove vim-common -y\
 && apt-get install vim -y\
 && systemctl start docker\
 && systemctl enable docker\
 && echo -e "1\n" | bash tcpx.sh
