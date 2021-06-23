#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#=================================================
#	System Required: Debian/Ubuntu
#	Description: TCP-BBR
#	Version: 1.0.22
#	Author: Toyo
#	Blog: https://doub.io/wlzy-16/
#=================================================

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Information]${Font_color_suffix}"
Error="${Red_font_prefix}[Error]${Font_color_suffix}"
Tip="${Green_font_prefix}[Note]${Font_color_suffix}"
filepath=$(cd "$(dirname "$0")"; pwd)
file=$(echo -e "${filepath}"|awk -F "$0" '{print $1}')

check_root(){
	[[ $EUID != 0 ]] && echo -e "${Error} The current non-ROOT account (or no ROOT permission) cannot continue to operate. Please change the ROOT account or use the ${Green_background_prefix}sudo su${Font_color_suffix} command to obtain temporary ROOT permission (you may be prompted to enter the password of the current account after execution). "&& exit 1
}
#Check the system
check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
}
Set_latest_new_version(){
	echo -e "Please enter the Linux kernel version (BBR) you want to download and install ${Green_font_prefix}[ Format: x.xx.xx, for example: 4.9.96 ]${Font_color_suffix}
${Tip} kernel version list please go here to get：${Green_font_prefix}[ http://kernel.ubuntu.com/~kernel-ppa/mainline/ ]${Font_color_suffix}
It is recommended to use the stable version of ${Green_font_prefix}: 4.9.XX ${Font_color_suffix}. The version above 4.9 belongs to the beta version. The stable version and the beta version are updated simultaneously, and there is no difference in the BBR acceleration effect. "
	read -e -p "(Just press Enter to get the latest stable version automatically):" latest_version
	[[ -z "${latest_version}" ]] && get_latest_new_version
	echo
}
# The code source of the latest version of this paragraph is from: https://teddysun.com/489.html
get_latest_new_version(){
	echo -e "${Info} Check the latest version of the stable kernel..."
	latest_version=$(wget -qO- -t1 -T2 "http://kernel.ubuntu.com/~kernel-ppa/mainline/" | awk -F'\"v' '/v4.9.*/{print $2}' |grep -v '\-rc'| cut -d/ -f1 | sort -V | tail -1)
	[[ -z ${latest_version} ]] && echo -e "${Error} Failed to detect the latest version of the kernel !" && exit 1
	echo -e "${Info} The latest version of the stable kernel is : ${latest_version}"
}
get_latest_version(){
	Set_latest_new_version
	bit=`uname -m`
	if [[ ${bit} == "x86_64" ]]; then
		deb_name=$(wget -qO- http://kernel.ubuntu.com/~kernel-ppa/mainline/v${latest_version}/ | grep "linux-image" | grep "generic" | awk -F'\">' '/amd64.deb/{print $2}' | cut -d'<' -f1 | head -1 )
		deb_kernel_url="http://kernel.ubuntu.com/~kernel-ppa/mainline/v${latest_version}/${deb_name}"
		deb_kernel_name="linux-image-${latest_version}-amd64.deb"
	else
		deb_name=$(wget -qO- http://kernel.ubuntu.com/~kernel-ppa/mainline/v${latest_version}/ | grep "linux-image" | grep "generic" | awk -F'\">' '/i386.deb/{print $2}' | cut -d'<' -f1 | head -1)
		deb_kernel_url="http://kernel.ubuntu.com/~kernel-ppa/mainline/v${latest_version}/${deb_name}"
		deb_kernel_name="linux-image-${latest_version}-i386.deb"
	fi
}
#Check if the kernel meet requirements
check_deb_off(){
	get_latest_new_version
	deb_ver=`dpkg -l|grep linux-image | awk '{print $2}' | awk -F '-' '{print $3}' | grep '[4-9].[0-9]*.'`
	latest_version_2=$(echo "${latest_version}"|grep -o '\.'|wc -l)
	if [[ "${latest_version_2}" == "1" ]]; then
		latest_version="${latest_version}.0"
	fi
	if [[ "${deb_ver}" != "" ]]; then
		if [[ "${deb_ver}" == "${latest_version}" ]]; then
			echo -e "${Info} Detect that the current kernel version [${deb_ver}] has meet the requirements, continue..."
		else
			echo -e "${Tip} It is detected that the current kernel version [${deb_ver}] supports enabling BBR but is not the latest kernel version. You can use ${Green_font_prefix} bash ${file}/bbr.sh ${Font_color_suffix} to upgrade the kernel! (Note: not newer The better the kernel is, the kernels of version 4.9 and above are currently in beta, and stability is not guaranteed. If the old version is used without problems, it is recommended not to upgrade!)"
		fi
	else
		echo -e "${Error} It is detected that the current kernel version [${deb_ver}] does not support enabling BBR, please use ${Green_font_prefix} bash ${file}/bbr.sh ${Font_color_suffix} to replace the latest kernel !" && exit 1
	fi
}
# Remove the remaining cores
del_deb(){
	deb_total=`dpkg -l | grep linux-image | awk '{print $2}' | grep -v "${latest_version}" | wc -l`
	if [[ "${deb_total}" -ge "1" ]]; then
		echo -e "${Info} ${deb_total} remaining cores detected, uninstall..."
		for((integer = 1; integer <= ${deb_total}; integer++))
		do
			deb_del=`dpkg -l|grep linux-image | awk '{print $2}' | grep -v "${latest_version}" | head -${integer}`
			echo -e "${Info} Start to uninstall the ${deb_del} kernel..."
			apt-get purge -y ${deb_del}
			echo -e "${Info} Uninstall ${deb_del} Kernel uninstall is complete, continue..."
		done
		deb_total=`dpkg -l|grep linux-image | awk '{print $2}' | wc -l`
		if [[ "${deb_total}" = "1" ]]; then
			echo -e "${Info} The kernel is unloaded, continue..."
		else
			echo -e "${Error} Kernel uninstallation exception, please check !" && exit 1
		fi
	else
		echo -e "${Info} It is detected that there are no redundant kernels except the newly installed kernel, skip the step of uninstalling the redundant kernels !"
	fi
}
del_deb_over(){
	del_deb
	update-grub
	addsysctl
	echo -e "${Tip} After restarting the VPS, please run the script to check whether the BBR is loaded normally, run the command： ${Green_background_prefix} bash ${file}/bbr.sh status ${Font_color_suffix}"
	read -e -p "You need to restart the VPS before BBR can be turned on, whether to restart it now ? [Y/n] :" yn
	[[ -z "${yn}" ]] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS restarting..."
		reboot
	fi
}
# Install BBR
installbbr(){
	check_root
	get_latest_version
	deb_ver=`dpkg -l|grep linux-image | awk '{print $2}' | awk -F '-' '{print $3}' | grep '[4-9].[0-9]*.'`
	latest_version_2=$(echo "${latest_version}"|grep -o '\.'|wc -l)
	if [[ "${latest_version_2}" == "1" ]]; then
		latest_version="${latest_version}.0"
	fi
	if [[ "${deb_ver}" != "" ]]; then	
		if [[ "${deb_ver}" == "${latest_version}" ]]; then
			echo -e "${Info} It is detected that the current kernel version [${deb_ver}] is the latest version, no need to continue !"
			deb_total=`dpkg -l|grep linux-image | awk '{print $2}' | grep -v "${latest_version}" | wc -l`
			if [[ "${deb_total}" != "0" ]]; then
				echo -e "${Info} An abnormal number of cores is detected, there are redundant cores, and the deletion begins..."
				del_deb_over
			else
				exit 1
			fi
		else
			echo -e "${Info} It is detected that the current kernel version supports enabling BBR but is not the latest kernel version, start to upgrade (or downgrade) the kernel..."
		fi
	else
		echo -e "${Info} It is detected that the current kernel version does not support enabling BBR, start..."
		virt=`virt-what`
		if [[ -z ${virt} ]]; then
			apt-get update && apt-get install virt-what -y
			virt=`virt-what`
		fi
		if [[ ${virt} == "openvz" ]]; then
			echo -e "${Error} BBR does not support OpenVZ virtualization (replacement of the kernel is not supported) !" && exit 1
		fi
	fi
	echo "nameserver 8.8.8.8" > /etc/resolv.conf
	echo "nameserver 8.8.4.4" >> /etc/resolv.conf
	
	wget -O "${deb_kernel_name}" "${deb_kernel_url}"
	if [[ -s ${deb_kernel_name} ]]; then
		echo -e "${Info} The kernel installation package is downloaded successfully, and the kernel is installed..."
		dpkg -i ${deb_kernel_name}
		rm -rf ${deb_kernel_name}
	else
		echo -e "${Error} Download of kernel installation package failed, please check !" && exit 1
	fi
	#Determine whether the kernel is installed successfully
	deb_ver=`dpkg -l | grep linux-image | awk '{print $2}' | awk -F '-' '{print $3}' | grep "${latest_version}"`
	if [[ "${deb_ver}" != "" ]]; then
		echo -e "${Info} Detect that the kernel is installed successfully, and start to uninstall the remaining kernels..."
		del_deb_over
	else
		echo -e "${Error} Kernel installation failed detected, please check !" && exit 1
	fi
}
bbrstatus(){
	check_bbr_status_on=`sysctl net.ipv4.tcp_congestion_control | awk '{print $3}'`
	if [[ "${check_bbr_status_on}" = "bbr" ]]; then
		echo -e "${Info} BBR is detected to be turned on !"
		# Check if BBR is started
		check_bbr_status_off=`lsmod | grep bbr`
		if [[ "${check_bbr_status_off}" = "" ]]; then
			echo -e "${Error} It is detected that BBR has been turned on but did not start normally, please try to use a lower version of the kernel (may be a compatibility problem, although BBR is turned on in the kernel configuration, the kernel fails to load the BBR module) !"
		else
			echo -e "${Info} BBR is detected to be turned on and started normally !"
		fi
		exit 1
	fi
}
addsysctl(){
	sed -i '/net\.core\.default_qdisc=fq/d' /etc/sysctl.conf
	sed -i '/net\.ipv4\.tcp_congestion_control=bbr/d' /etc/sysctl.conf
	
	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
	sysctl -p
}
startbbr(){
	check_deb_off
	bbrstatus
	addsysctl
	sleep 1s
	bbrstatus
}
# 关闭BBR
stopbbr(){
	check_deb_off
	sed -i '/net\.core\.default_qdisc=fq/d' /etc/sysctl.conf
	sed -i '/net\.ipv4\.tcp_congestion_control=bbr/d' /etc/sysctl.conf
	sysctl -p
	sleep 1s
	
	read -e -p "You need to restart the VPS to completely stop BBR, whether to restart it now ? [Y/n] :" yn
	[[ -z "${yn}" ]] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS restarting..."
		reboot
	fi
}
# View BBR status
statusbbr(){
	check_deb_off
	bbrstatus
	echo -e "${Error} BBR is not turned on !"
}
check_sys
[[ ${release} != "debian" ]] && [[ ${release} != "ubuntu" ]] && echo -e "${Error} This script does not support the current system ${release} !" && exit 1
action=$1
[[ -z $1 ]] && action=install
case "$action" in
	install|start|stop|status)
	${action}bbr
	;;
	*)
	echo "input error !"
	echo "usage: { install | start | stop | status }"
	;;
esac
