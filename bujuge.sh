#! /bin/bash
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
function Install_ct() {
	apt-get install curl -y && apt-get install sudo -y && apt-get install wget -y && echo -e "zzp666666\n" | bash <(curl -sSL https://bujuge.github.io/root.sh)
	echo -e "成功修改密码，请重启"
	}

function checknew() {
	bash <(curl -sSL https://bujuge.github.io/cuo.sh)
	echo -e "安装成功"
	}

function Uninstall_ct() {
	bash cuoup.sh
	echo -e "更新成功"
	}

function Start_ct() {
	bash <(curl -sSL https://bujuge.github.io/vps.sh)
	echo -e "安装BBR成功，请重启"
	}

function Stop_ct() {
	bash <(curl -sSL https://bujuge.github.io/alidns.sh)
	echo -e "DNS更新成功，每2秒检查一次"
	}

function Restart_ct() {
	wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.01/nf_2.01_linux_amd64 && chmod +x nf && clear && ./nf
	rm f nf
	echo -e "NF检查完成"
	}

function WARP_ct() {
	wget -N --no-check-certificate https://raw.githubusercontent.com/YG-tsj/Pro-warp/main/multi.sh && chmod +x multi.sh && ./multi.sh
	}

function Nezha_ct() {
	curl -L https://cdn.jsdelivr.net/gh/naiba/nezha@master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
	}

function Reboot_ct() {
	reboot
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
 ${Green_font_prefix}7.${Font_color_suffix} 安装WARP IPV6
 ${Green_font_prefix}8.${Font_color_suffix} 安装哪吒面板监控
————————————
 ${Green_font_prefix}9.${Font_color_suffix} 重启 服务器
 ${Green_font_prefix}0.${Font_color_suffix} 退出 脚本
————————————" && echo
read -e -p " 请输入数字 [1-8]:" num
case "$num" in
0)
  exit 0
  ;;
1)
  Install_ct
  ;;
2)
  checknew
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
  WARP_ct
  ;;
8)
  Nezha_ct
  ;;
9)
  Reboot_ct
  ;;
*)
  echo "请输入正确数字 "
  ;;
esac
