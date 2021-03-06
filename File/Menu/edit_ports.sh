#!/bin/bash

color1='\e[031;1m'
color2='\e[36m'
color3='\e[0m'

opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
stunnel4port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
privoxyport="$(netstat -nlpt | grep -i privoxy | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
openvpntcp="$(cat /etc/openvpn/server_tcp.conf | grep -i port | awk '{print $2}')"
openvpnudp="$(cat /etc/openvpn/server_udp.conf | grep -i port | awk '{print $2}')"
squidport="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}')"
v2rayport=444

function edit-dropbear-port() {
rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpntcp
rm -f /root/openvpnudp
rm -f /root/squidport
rm -f /root/v2rayport
rm -f /root/privoxyport

echo $privoxyport > /root/privoxyport
cat > /root/privoxyport <<-END
$privoxyport
END
echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $v2rayport > /root/v2rayport
cat > /root/v2rayport <<-END
$v2rayport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $openvpntcp > /root/openvpntcp
cat > /root/openvpntcp <<-END
$openvpntcp
END
echo $openvpnudp > /root/openvpnudp
cat > /root/openvpnudp <<-END
$openvpnudp
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[0m                                                   "
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m             Dropbear  Ports               \e[36m※"
echo -e "\e[36m   ※      \e[32m           "$dropbearport "                  \e[36m※"
echo -e "\e[36m   ※                                           ※      "
read -p $'\e[0m         Which Port Should Be Changed? : ' Port       
egrep "^$Port" /root/dropbearport >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenSSH Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/stunnel4port; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Stunnel Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/privoxyport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Privoxy Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/v2rayport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            V2ray Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpntcp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN TCP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpnudp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN UDP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"		
        exit
	fi
	if grep -Fxq $Port_New /root/squidport; then
	clear
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Squid Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/default/dropbear
	sed -i $Port_Change /etc/stunnel/stunnel.conf

	service dropbear restart > /dev/null
	rm -f /root/dropbear
	dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m             Dropbear  Ports               \e[36m※"
echo -e "\e[36m   ※      \e[32m           "$dropbearport "                  \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"

else
	clear  
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port $Port Does Not Exist         \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
fi

}

function edit-openssh-port() {

rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpntcp
rm -f /root/openvpnudp
rm -f /root/squidport
rm -f /root/v2rayport
rm -f /root/privoxyport

echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $privoxyport > /root/privoxyport
cat > /root/privoxyport <<-END
$privoxyport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $v2rayport > /root/v2rayport
cat > /root/v2rayport <<-END
$v2rayport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $openvpntcp > /root/openvpntcp
cat > /root/openvpntcp <<-END
$openvpntcp
END
echo $openvpnudp > /root/openvpnudp
cat > /root/openvpnudp <<-END
$openvpnudp
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m               OpenSSH Ports               \e[36m※"
echo -e "\e[36m   ※      \e[32m              "$opensshport "                    \e[36m※"
echo -e "\e[36m   ※                                           ※      "
read -p $'\e[0m         Which Port Should Be Changed? : ' Port
egrep "^$Port" /root/opensshport >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/dropbearport; then
	clear
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Dropbear Port Conflict         \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/stunnel4port; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Stunnel Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpntcp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN TCP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/v2rayport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            V2ray Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/privoxyport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Privoxy Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpnudp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN UDP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/squidport; then
	clear
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Squid Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/ssh/sshd_config
	service ssh restart > /dev/null
	rm -f /root/opensshport
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m               OpenSSH Ports               \e[36m※"
echo -e "\e[36m   ※      \e[32m               "$opensshport "                   \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"

else
	clear  
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port $Port Does Not Exist          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
fi


}

function edit-stunnel-port() {

rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpntcp
rm -f /root/openvpnudp
rm -f /root/squidport
rm -f /root/v2rayport
rm -f /root/privoxyport

echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $privoxyport > /root/privoxyport
cat > /root/privoxyport <<-END
$privoxyport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $v2rayport > /root/v2rayport
cat > /root/v2rayport <<-END
$v2rayport
END
echo $openvpntcp > /root/openvpntcp
cat > /root/openvpntcp <<-END
$openvpntcp
END
echo $openvpnudp > /root/openvpnudp
cat > /root/openvpnudp <<-END
$openvpnudp
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m              Stunnel Ports                \e[36m※"
echo -e "\e[36m   ※      \e[32m           "$stunnel4port "                  \e[36m※"
echo -e "\e[36m   ※                                           ※      "
read -p $'\e[0m         Which Port Should Be Changed? : ' Port
egrep "^$Port" /root/stunnel4port >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenSSH Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/dropbearport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              Dropbear Port Conflict              "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpntcp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN TCP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/privoxyport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Privoxy Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/v2rayport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            V2ray Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpnudp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN UDP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
		exit
	fi
	if grep -Fxq $Port_New /root/squidport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m               Squid3 Port Conflict               "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/stunnel/stunnel.conf
	service stunnel4 restart > /dev/null
	rm -f /root/stunnel4port
	stunnel4port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m                Stunnel Ports              \e[36m※"
echo -e "\e[36m   ※         \e[32m          "$stunnel4port "                \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"

else
	clear  
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port $Port Does Not Exist         \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
fi
}

function edit-privoxy-port() {

rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpntcp
rm -f /root/openvpnudp
rm -f /root/squidport
rm -f /root/v2rayport
rm -f /root/privoxyport

echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $privoxyport > /root/privoxyport
cat > /root/privoxyport <<-END
$privoxyport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $v2rayport > /root/v2rayport
cat > /root/v2rayport <<-END
$v2rayport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $openvpntcp > /root/openvpntcp
cat > /root/openvpntcp <<-END
$openvpntcp
END
echo $openvpnudp > /root/openvpnudp
cat > /root/openvpnudp <<-END
$openvpnudp
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[0m                                                   "
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m             Privoxy Ports                 \e[36m※"
echo -e "\e[36m   ※      \e[32m         "$privoxyport "                  \e[36m※"
echo -e "\e[36m   ※                                           ※      "
read -p $'\e[0m         Which Port Should Be Changed? : ' Port
egrep "^$Port" /root/privoxyport >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenSSH Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/dropbearport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              Dropbear Port Conflict              "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/v2rayport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            V2ray Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/stunnel4port; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Stunnel Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpntcp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN TCP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpnudp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN UDP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/privoxy/config
	service privoxy restart > /dev/null
	rm -f /root/privoxy-port
	privoxyport="$(netstat -nlpt | grep -i privoxy | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m               Privoxy Ports               \e[36m※"
echo -e "\e[36m   ※      \e[32m           "$privoxyport "                \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"

else
	clear  
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port $Port Does Not Exist        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
fi

}

function edit-squid-port() {

rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpntcp
rm -f /root/openvpnudp
rm -f /root/squidport
rm -f /root/v2rayport
rm -f /root/privoxyport

echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $privoxyport > /root/privoxyport
cat > /root/privoxyport <<-END
$privoxyport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $v2rayport > /root/v2rayport
cat > /root/v2rayport <<-END
$v2rayport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $openvpntcp > /root/openvpntcp
cat > /root/openvpntcp <<-END
$openvpntcp
END
echo $openvpnudp > /root/openvpnudp
cat > /root/openvpnudp <<-END
$openvpnudp
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[0m                                                   "
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m               Squid Ports                 \e[36m※"
echo -e "\e[36m   ※      \e[32m       "$squidport "               \e[36m※"
echo -e "\e[36m   ※                                           ※      "
read -p $'\e[0m         Which Port Should Be Changed? : ' Port
egrep "^$Port" /root/squidport >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenSSH Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/dropbearport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              Dropbear Port Conflict              "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/v2rayport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            V2ray Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/privoxyport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Privoxy Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/stunnel4port; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Stunnel Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpntcp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN TCP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpnudp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN UDP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/squid/squid.conf
	service squid3 restart > /dev/null
	rm -f /root/squidport
	squidport="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}')"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m               Squid Ports                 \e[36m※"
echo -e "\e[36m   ※      \e[32m        "$squidport "              \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"

else
	clear  
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port $Port Does Not Exist        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
fi

}

function edit-openvpntcp-port() {

rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpntcp
rm -f /root/openvpnudp
rm -f /root/squidport
rm -f /root/v2rayport
rm -f /root/privoxyport

echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $privoxyport > /root/privoxyport
cat > /root/privoxyport <<-END
$privoxyport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $v2rayport > /root/v2rayport
cat > /root/v2rayport <<-END
$v2rayport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $openvpntcp > /root/openvpntcp
cat > /root/openvpntcp <<-END
$openvpntcp
END
echo $openvpnudp > /root/openvpnudp
cat > /root/openvpnudp <<-END
$openvpnudp
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[0m                                                   "
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m             OpenVPN TCP Ports             \e[36m※"
echo -e "\e[36m   ※      \e[32m             "$openvpntcp "                    \e[36m※"
echo -e "\e[36m   ※                                           ※      "
read -p $'\e[0m         Which Port Should Be Changed? : ' Port
egrep "^$Port" /root/openvpntcp >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenSSH Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/dropbearport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              Dropbear Port Conflict              "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/v2rayport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            V2ray Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/privoxyport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Privoxy Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/stunnel4port; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Stunnel Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
		fi
	if grep -Fxq $Port_New /root/openvpnudp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN UDP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/squidport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m               Squid3 Port Conflict               "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/openvpn/server_tcp.conf
	sed -i $Port_Change /home/vps/public_html/client-tcp.ovpn
	sed -i $Port_Change /root/openvpntcp
	openvpntcp="$(cat /etc/openvpn/server_tcp.conf | grep -i port | awk '{print $2}')"
	echo $openvpntcp > /root/openvpntcp
	cat > /root/openvpntcp <<-END
	$openvpntcp
	END
	service openvpn restart
	openvpntcp="$(cat /etc/openvpn/server_tcp.conf | grep -i port | awk '{print $2}')"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m             OpenVPN TCP Ports             \e[36m※"
echo -e "\e[36m   ※      \e[32m               "$openvpntcp "                  \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"

else
	clear  
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port $Port Does Not Exist         \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
fi

}

function edit-openvpnudp-port() {

rm -f /root/opensshport
rm -f /root/dropbearport
rm -f /root/stunnel4port
rm -f /root/openvpntcp
rm -f /root/openvpnudp
rm -f /root/squidport
rm -f /root/v2rayport
rm -f /root/privoxyport

echo $opensshport > /root/opensshport
cat > /root/opensshport <<-END
$opensshport
END
echo $privoxyport > /root/privoxyport
cat > /root/privoxyport <<-END
$privoxyport
END
echo $dropbearport > /root/dropbearport
cat > /root/dropbearport <<-END
$dropbearport
END
echo $stunnel4port > /root/stunnel4port
cat > /root/stunnel4port <<-END
$stunnel4port
END
echo $v2rayport > /root/v2rayport
cat > /root/v2rayport <<-END
$v2rayport
END
echo $openvpntcp > /root/openvpntcp
cat > /root/openvpntcp <<-END
$openvpntcp
END
echo $openvpnudp > /root/openvpnudp
cat > /root/openvpnudp <<-END
$openvpnudp
END
echo $squidport > /root/squidport
cat > /root/squidport <<-END
$squidport
END

cd
clear
echo -e "\e[0m                                                   "
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m             OpenVPN UDP Ports             \e[36m※"
echo -e "\e[36m   ※      \e[32m           "$openvpnudp "                    \e[36m※"
echo -e "\e[36m   ※                                           ※      "
read -p $'\e[0m         Which Port Should Be Changed? : ' Port
egrep "^$Port" /root/openvpnudp >/dev/null
if [ $? -eq 0 ]; then
	read -p "            From Port $Port -> Port " Port_New
	if grep -Fxq $Port_New /root/opensshport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenSSH Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/dropbearport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m              Dropbear Port Conflict              "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/stunnel4port; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Stunnel Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/v2rayport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            V2ray Port Conflict            \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/privoxyport; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            Privoxy Port Conflict          \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/openvpntcp; then
	clear
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m            OpenVPN TCP Conflict           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port Is Already In Use          \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
		exit
	fi
	if grep -Fxq $Port_New /root/squidport; then
		echo -e "\e[0m                                                   "
		echo -e "\e[91m               Squid3 Port Conflict               "
		echo -e "\e[91m              Port Is Already In Use              "
		echo -e "\e[0m                                                   "
		echo -e "\e[36m[][][]※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※[][][]\e[0m"
		exit
	fi
	Port_Change="s/$Port/$Port_New/g";
	sed -i $Port_Change /etc/openvpn/server_udp.conf
	sed -i $Port_Change /home/vps/public_html/client-udp.ovpn
	sed -i $Port_Change /root/openvpnudp
	openvpnudp="$(cat /etc/openvpn/server_udp.conf | grep -i port | awk '{print $2}')"
	echo $openvpnudp > /root/openvpnudp
	cat > /root/openvpnudp <<-END
	$openvpnudp
	END
	service openvpn restart
	openvpnudp="$(cat /etc/openvpn/server_udp.conf | grep -i port | awk '{print $2}')"
	clear
	echo -e "\e[0m                                                   "
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m             OpenVPN UDP Ports             \e[36m※"
echo -e "\e[36m   ※      \e[32m           "$openvpnudp "                    \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"

else
	clear  
	echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[32m       AutoScriptVPS by KingKongVPN        \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m                                           \e[36m※"
echo -e "\e[36m   ※\e[031;1m           Port $Port Does Not Exist       \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※                                           \e[36m※"
echo -e "\e[36m   ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ \e[0m"
fi

}

clear
clear
echo -e "\e[36m ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[36m ※                                             ※      "
echo -e "\e[0m \e[36m※       \e[32mAutoScriptVPS By KingKongVPN          \e[36m※     "
echo -e "\e[36m ※                                             ※      "
echo -e " \e[36m※    \e[0mPort OpenSSH     :  $opensshport                   \e[36m※"
echo -e " \e[36m※    \e[0mPort Dropbear    :  "$dropbearport        "             \e[36m※"
echo -e " \e[36m※    \e[0mPort Stunnel     :  "$stunnel4port        "             \e[36m※"
echo -e " \e[36m※    \e[0mPort Privoxy     :  "$privoxyport        "           \e[36m※"
echo -e " \e[36m※    \e[0mPort Squid       :  "$squidport        "      \e[36m※"
echo -e " \e[36m※    \e[0mPort OpenVPN TCP :  $openvpntcp                  \e[36m※"
echo -e " \e[36m※    \e[0mPort OpenVPN UDP :  $openvpnudp                \e[36m※"
echo -e "\e[36m ※                                             ※      "
echo -e "\e[36m ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※"
echo -e "\e[0m                                                   "
echo -e " ${color1}-----=[ Edit Port Menu ]=-----${color3}"
	echo -e " 1) Edit Dropbear Port "
	echo -e " 2) Edit OpenSSH Port "
	echo -e " 3) Edit Stunnel Port "
	echo -e " 4) Edit Privoxy Port "
	echo -e " 5) Edit Squid Port "
	echo -e " 6) Edit OpenVPN TCP Port "
	echo -e " 7) Edit OpenVPN UDP Port "
    echo -e " 8) Back To Main Menu "
echo -e ""
read -p "$(echo -e "Select from options (1-8): ")" Edit
echo -e "\n\n"
case $Edit in
		1)
		clear
		edit-dropbear-port
		rm -f /root/opensshport
        rm -f /root/dropbearport
        rm -f /root/stunnel4port
        rm -f /root/openvpntcp
        rm -f /root/openvpnudp
        rm -f /root/squidport 
        rm -f /root/v2rayport
        rm -f /root/privoxyport
		exit
		;;
		2)
		clear
		edit-openssh-port
		rm -f /root/opensshport
        rm -f /root/dropbearport
        rm -f /root/stunnel4port
        rm -f /root/openvpntcp
        rm -f /root/openvpnudp
        rm -f /root/squidport 
        rm -f /root/v2rayport
        rm -f /root/privoxyport
		exit
		;;
		3)
		clear
		edit-stunnel-port
		rm -f /root/opensshport
        rm -f /root/dropbearport
        rm -f /root/stunnel4port
        rm -f /root/openvpntcp
        rm -f /root/openvpnudp
        rm -f /root/squidport 
        rm -f /root/v2rayport
        rm -f /root/privoxyport
		exit
		;;
		4)
		clear
		edit-privoxy-port
		rm -f /root/opensshport
        rm -f /root/dropbearport
        rm -f /root/stunnel4port
        rm -f /root/openvpntcp
        rm -f /root/openvpnudp
        rm -f /root/squidport 
        rm -f /root/v2rayport
        rm -f /root/privoxyport
		exit
		;;
		5)
		clear
		edit-squid-port
		rm -f /root/opensshport
        rm -f /root/dropbearport
        rm -f /root/stunnel4port
        rm -f /root/openvpntcp
        rm -f /root/openvpnudp
        rm -f /root/squidport 
        rm -f /root/v2rayport
        rm -f /root/privoxyport
		exit
		;;
		6)
		clear
		edit-openvpntcp-port
		rm -f /root/opensshport
        rm -f /root/dropbearport
        rm -f /root/stunnel4port
        rm -f /root/openvpntcp
        rm -f /root/openvpnudp
        rm -f /root/squidport 
        rm -f /root/v2rayport
        rm -f /root/privoxyport
		exit
		;;
		7)
		clear
		edit-openvpnudp-port
		rm -f /root/opensshport
        rm -f /root/dropbearport
        rm -f /root/stunnel4port
        rm -f /root/openvpntcp
        rm -f /root/openvpnudp
        rm -f /root/squidport 
        rm -f /root/v2rayport
        rm -f /root/privoxyport
		exit
		;;
		8)
		clear
        menu
		exit
		;;
	esac