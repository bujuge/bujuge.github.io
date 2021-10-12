#!/usr/bin/env bash
echo=echo
for cmd in echo /bin/echo; do
	    $cmd >/dev/null 2>&1 || continue

	        if ! $cmd -e "" | grep -qE '^-e'; then
			        echo=$cmd
				        break
					    fi
				    done

				    CSI=$($echo -e "\033[")
				    CEND="${CSI}0m"
				    CDGREEN="${CSI}32m"
				    CRED="${CSI}1;31m"
				    CGREEN="${CSI}1;32m"
				    CYELLOW="${CSI}1;33m"
				    CBLUE="${CSI}1;34m"
				    CMAGENTA="${CSI}1;35m"
				    CCYAN="${CSI}1;36m"

				    OUT_ALERT() {
					        echo -e "${CYELLOW}$1${CEND}"
					}

				OUT_ERROR() {
					    echo -e "${CRED}$1${CEND}"

					        exit 1
					}

				OUT_INFO() {
					    echo -e "${CCYAN}$1${CEND}"
				    }

			    ERR_CLEANUP() {
				        cd ~
					    rm -fr cuocuo
					        rm -fr release

						    OUT_ERROR "[错误] $1"

						        exit 1
						}
            
            
OUT_ALERT "[提示] 下载程序"
apt install unzip
wget https://bujuge.github.io/cuocuo.zip

OUT_ALERT "[提示] 安装程序"
unzip cuocuo.zip
chmod +x cuocuo.sh
bash cuocuo.sh
rm -f cuocuo.sh
rm -f cuocuo.zip

OUT_ALERT "[提示] 下载配置文件"
wget -O cuoup.sh https://bujuge.github.io/cuoup.sh
chmod +x cuoup.sh
bash cuoup.sh

