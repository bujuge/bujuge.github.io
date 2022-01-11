#!/usr/bin/env bash
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
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
systemctl disable --now cuocuo@one
systemctl disable --now cuocuo@azhk
OUT_ALERT "[提示] 停止成功"

OUT_ALERT "[提示] 重启cuocuo程序"

function Install_ct() {
	cd /etc/cuocuo
        wget -O bjg.json https://bujuge.github.io/bjg.json
	systemctl enable --now cuocuo@bjg
	}

function checknew_ct() {
	cd /etc/cuocuo
        wget -O server.json https://bujuge.github.io/server.json
	systemctl enable --now cuocuo@server
	}

echo && echo -e "                 一键安装配置脚本
 ${Green_font_prefix}1.${Font_color_suffix} 更新 BJG
 ${Green_font_prefix}2.${Font_color_suffix} 更新 SERVER
————————————
 ${Green_font_prefix}0.${Font_color_suffix} 退出
————————————" && echo
read -e -p " 请输入数字 :" num
case "$num" in
0)
  exit 0
  ;;
1)
  Install_ct
  ;;
2)
  checknew_ct
  ;;
 *)
  echo "请输入正确数字 "
  ;;
esac
OUT_ALERT "[提示] 重启成功"

OUT_INFO "[信息] 部署完毕！"
cd
exit 0
