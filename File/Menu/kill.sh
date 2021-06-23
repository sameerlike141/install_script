#!/bin/bash
#Script by xiihaiqal
        cat /etc/openvpn/tcp_stats.log /etc/openvpn/udp_stats.log > /etc/openvpn/openvpn-status.log
clear
if [ -f "/etc/openvpn/openvpn-status.log" ]; then
		lockedby='Openvpn Multilogin'
        line=`cat /etc/openvpn/openvpn-status.log | wc -l`
        a=$((3+((line-8)/2)))
        b=$(((line-8)/2))
        cat /etc/openvpn/openvpn-status.log | head -n $a | tail -n $b | cut -d, -f1 | sed -e 's/,/   /g' > /tmp/vpn-login-db.txt
        sort /tmp/vpn-login-db.txt | uniq -d > /etc/openvpn/double_login.txt
        sed  -i 's/UNDEF//g' /etc/openvpn/double_login.txt
        filename='/etc/openvpn/double_login.txt'
          while read line; do
            if [ -z "$line" ]
            then
              echo "close"			  
            else
			  sed  -i 's/$line//g' /home/vps/public_html/new_lockuser.txt
              cat /etc/openvpn/double_login.txt >> /etc/lock
              date >>  /etc/lock
              passwd -l $line
  	      printf "%-4s %-15s %-10s %-3s\n" "   " "$line" "$lockedby" >> /home/vps/public_html/new_lockuser.txt
            fi
          done < $filename
fi