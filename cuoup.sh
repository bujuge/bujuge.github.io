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
OUT_ALERT "[提示] 停止cuocuo程序的运行"
systemctl stop cuocuo@one
systemctl stop cuocuo@azhk
OUT_ALERT "[提示] 停止成功"

OUT_ALERT "[提示] 从云端更新配置"
cd /etc/cuocuo
wget -O one.json https://bujuge.github.io/one.json
wget -O azhk.json https://bujuge.github.io/azhk.json
cd
OUT_ALERT "[提示] 更新成功"

OUT_ALERT "[提示] 重启cuocuo程序"
systemctl restart cuocuo@one
systemctl restart cuocuo@azhk
OUT_ALERT "[提示] 重启成功"

OUT_INFO "[信息] 部署完毕！"
exit 0
