#!/bin/bash

clear
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo -e "\e[36m※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※
※                                                   ※
※\e[0m       [WELCOME MY SYSTEM KINGKONGVPN VPS]         \e[36m※
※                                                   ※
※\e[0m        \e[32mWhatsApp\e[0m    \e[33m:\e[0m \e[34m+60178760080\e[0m                 \e[36m※
※\e[0m        \e[32mTelegram\e[0m    \e[33m:\e[0m \e[34m@xiihaiqal\e[0m                   \e[36m※
※                                                   ※
※\e[0m      Copyright \e[31m©\e[0m KingKongVPN OFFICIAL™ 2021 \e[31m®\e[0m     \e[36m※
※                                                   ※
※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※\e[0m
"
echo -e " ${color1}-----=[ V2ray Menu ]=-----${color3}"
	echo -e " 1) Install V2ray "
	echo -e " 2) Add V2ray User "
	echo -e " 3) Delete V2ray User "
	echo -e " 4) Show V2ray User "
    echo -e " 5) Back To Main Menu "
echo -e ""
read -p "$(echo -e "Select from options (1-5): ")" Accounts
echo -e "\n\n"
case $Accounts in
		1)
		clear
		service nginx stop
		echo -e "\e[32mPlease Enter Your Domain Name,For Example \e[31mkingkongvpn.xyz \e[0m"
                rm -f v2ray.sh* && wget -q https://raw.githubusercontent.com/xiihaiqal/AutoScriptVPS/master/Files/V2ray/v2ray.sh && chmod +x v2ray.sh && ./v2ray.sh
				rm  v2ray.sh
				service nginx restart
				exit
		;;
		2)
		clear
		addv2ray
		exit
		;;
		3)
		clear
		delv2ray
		exit
		;;
		4)
		clear
		cat /etc/v2ray/akun.conf
		exit
		;;
		5)
		clear
                menu
		exit
		;;
	esac