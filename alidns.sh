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
apt install wget
wget -O ddns.sh https://bujuge.github.io/ddns.sh

OUT_ALERT "[提示] 写入配置"
chmod +x ddns.sh
echo -e "2\ndnsone.icu\nazhk\n1\nLTAIUfEYCb5NEMTx\nZ1qdAWllM9yP1zgWJRP9O09jgM0fLl\n" | bash ddns.sh


OUT_ALERT "[提示] 首次运行"
wget -O dns.sh https://bujuge.github.io/dns.sh && chmod +x dns.sh && bash dns.sh


OUT_ALERT "[提示] 添加定时任务"
echo -e "*/1 * * * * /root/dns.sh" >> /var/spool/cron/crontabs/root


OUT_INFO "[信息] 部署完毕！"
rm -f alidns.sh
exit 0
