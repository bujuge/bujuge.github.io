#! /bin/bash
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
function Install_ct() {
	echo -e "zzp666666\n" | bash <(curl -sSL https://bujuge.github.io/root.sh)
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}

function checknew_ct() {
	bash <(curl -sSL https://bujuge.github.io/cuo.sh)
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}

function Uninstall_ct() {
	bash <(curl -sSL https://bujuge.github.io/cuoup.sh)
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}

function Start_ct() {
	bash <(curl -sSL https://bujuge.github.io/vps.sh)
	echo -e "13\n" | bash tcpx.sh
	rm -f tcpx.sh
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}

function Stop_ct() {
	bash <(curl -sSL https://bujuge.github.io/alidns.sh)
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}

function Restart_ct() {
	bash <(curl -L -s https://git.io/JRw8R)
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}


function Nezha_ct() {
	curl -L https://cdn.jsdelivr.net/gh/naiba/nezha@master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}

function Reboot_ct() {
	reboot
	}
	
function Multi_ct() {
	wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/kkkyg/CFwarp/CFwarp.sh && chmod +x CFwarp.sh && ./CFwarp.sh
	bash <(curl -sSL https://bujuge.github.io/bujuge.sh)
	}

echo && echo -e "                 一键安装配置脚本
 ${Green_font_prefix}1.${Font_color_suffix} 修改 VPS 密码
————————————
 ${Green_font_prefix}2.${Font_color_suffix} 安装 cuocuo
 ${Green_font_prefix}3.${Font_color_suffix} 更新 cuocuo
————————————
 ${Green_font_prefix}4.${Font_color_suffix} 安装 BBR 加速
 ${Green_font_prefix}5.${Font_color_suffix} AZHK专用DDNS
 ${Green_font_prefix}6.${Font_color_suffix} 检查是否可看NF
 ${Green_font_prefix}7.${Font_color_suffix} 安装哪吒面板监控
 ${Green_font_prefix}8.${Font_color_suffix} 安装 WARP
————————————
 ${Green_font_prefix}9.${Font_color_suffix} 重启 服务器
 ${Green_font_prefix}0.${Font_color_suffix} 退出 脚本
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
3)
  Uninstall_ct
  ;;
4)
  Start_ct
  ;;
5)
  Stop_ct
  ;;
6)
  Restart_ct
  ;;
7)
  Nezha_ct
  ;;
8)
  Multi_ct
  ;;
 9)
  Reboot_ct
  ;;
*)
  echo "请输入正确数字 "
  ;;
esac
