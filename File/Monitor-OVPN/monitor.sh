#!/bin/bash
#
# Kalau pakai Apache set ke directory Apache:-
# APACHE: /var/www/html/ or NGINX: /home/vps/public_html/
#
## Source Script From github.com
## G.O.A.T - STORE

### NGINX # Install Nginx macam biasa dan configuration Nginx/Apache mcm biasa.
wget -O /etc/nginx/conf.d/monitoring.conf "https://raw.githubusercontent.com/OpenVPN-Monitor/monitoring.conf/monitoring.conf"

### OpenVPN Monitor
apt-get install -y gcc libgeoip-dev python-virtualenv python-dev geoip-database-extra uwsgi uwsgi-plugin-python
wget -O /srv/openvpn-monitor.tar.gz "https://raw.githubusercontent.com/OpenVPN-Monitor/monitoring.conf/openvpn-monitor.tar.gz"
cd /srv
tar xf openvpn-monitor.tar.gz
cd openvpn-monitor
virtualenv .
. bin/activate
pip install -r requirements.txt
wget -O /etc/uwsgi/apps-available/openvpn-monitor.ini "https://raw.githubusercontent.com/OpenVPN-Monitor/monitoring.conf/openvpn-monitor.ini"
ln -s /etc/uwsgi/apps-available/openvpn-monitor.ini /etc/uwsgi/apps-enabled/

# GeoIP For OpenVPN Monitor
mkdir -p /var/lib/GeoIP
wget -O /var/lib/GeoIP/GeoLite2-City.mmdb.gz "https://raw.githubusercontent.com/OpenVPN-Monitor/monitoring.conf/GeoLite2-City.mmdb.gz"
gzip -d /var/lib/GeoIP/GeoLite2-City.mmdb.gz