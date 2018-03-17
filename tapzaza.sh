#!/bin/bash 
# # Original script by fornesia, rzengineer and fawzya 
# Mod by kguza wullop onuamit
# ==================================================
# go to root
cd 
# Install Command 
apt-get -y install ufw 
apt-get -y install sudo

# set repo 
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/gmchoke/D/master/sources.list.debian8"
wget "https://raw.githubusercontent.com/gmchoke/D/master/dotdeb.gpg"
wget "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/jcameron-key.asc"
cat dotdeb.gpg| apt-key add -;rm dotdeb.gpg 
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc 
# update
apt-get update 

# install webserver 
apt-get -y install nginx 

# install essential package
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar 

# install neofetch 
echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray"-o Release-neofetch.key&&sudo apt-key add Release-neofetch.key&&rm Release-neofetch.key 
apt-get update
apt-get install neofetch 
echo "clear" >> .bashrc 
echo 'echo -e "Selamat datang di server $HOSTNAME"' >> .bashrc
echo 'echo -e "Script mod by GM CHOKE"' >> .bashrc
echo 'echo -e "Ketik menu untuk menampilkan daftar perintah"' >> .bashrc
echo 'echo -e ""' >> .bashrc

# install webserver 
cd 
rm /etc/nginx/sites-enabled/default 
rm /etc/nginx/sites-available/default 
wget -O /etc/nginx/nginx.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/nginx.conf" 
mkdir -p /home/vps/public_html 
echo "" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/vps.conf" 
service nginx restart 

# install openvpn 
wget -O /etc/openvpn/openvpn.tar "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/openvpn-debian.tar" 
cd /etc/openvpn/ 
tar xf openvpn.tar 
wget -O /etc/openvpn/1194.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/1194.conf"
service openvpn restart 
sysctl -w net.ipv4.ip_forward=1 
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf 
iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE 
iptables-save > /etc/iptables_yg_baru_dibikin.conf 
wget -O /etc/network/if-up.d/iptables "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/iptables" 
chmod +x /etc/network/if-up.d/iptables 
service openvpn restart 

# konfigurasi openvpn 
cd /etc/openvpn/ 
wget -O /etc/openvpn/True-Dtac.ovpn  "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/client-1194.conf" 
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`; 
sed -i s/xxxxxxxxx/$MYIP/g /etc/openvpn/True-Dtac.ovpn; cp True-Dtac.ovpn /home/vps/public_html/ 

# install badvpn 
cd 
wget -O /usr/bin/badvpn-udpgw "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/badvpn-udpgw" 
if [ "$OS" == "x86_64" ]; then 
wget -O /usr/bin/badvpn-udpgw "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/badvpn-udpgw64" 
fi 
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local 
chmod +x /usr/bin/badvpn-udpgw 
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 

# setting port ssh 
cd 
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config 
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config 
service ssh restart 

# install dropbear 
apt-get -y install dropbear 
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear 
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear 
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 443 -p 80"/g' /etc/default/dropbear 
echo "/bin/false" >> /etc/shells 
echo "/usr/sbin/nologin" >> /etc/shells 
service ssh restart 
service dropbear restart

# Install Squid 
apt-get -y install squid3 
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.orig 
wget -O /etc/squid3/squid.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/squid3.conf" 
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`; 
sed -i s/xxxxxxxxx/$MYIP/g /etc/squid3/squid.conf; 
service squid3 restart 

# install webmin 
cd 
wget -O webmin-current.deb "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/webmin-current.deb" 
dpkg -i --force-all webmin-current.deb; 
apt-get -y -f install; 
rm /root/webmin-current.deb 
service webmin restart 

# download script
cd /usr/bin
wget -O 1 "https://raw.githubusercontent.com/gmchoke/A/master/menu.sh"
wget -O 2 "https://raw.githubusercontent.com/gmchoke/A/master/usernew.sh"
wget -O 3 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/test.sh"
wget -O 4 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/delet.sh"
wget -O 5 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/deletuserxp.sh"
wget -O 6 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/viewuser.sh"
wget -O 7 "http://vira.cf/user-list.sh"
wget -O 8 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/lock.sh"
wget -O 9 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/unlock.sh"
wget -O 10 "http://vira.cf/resvis.sh"
wget -O 11 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/TimeReboot.sh"
wget -O 12 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/speedtest.py"
wget -O 13 "http://vira.cf/info.sh"
wget -O 14 "https://raw.githubusercontent.com/gmchoke/GMCHOKE1/master/rename.sh"
wget -O 15 "https://raw.githubusercontent.com/gmchoke/A/master/bandwidth.sh"

echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot

chmod +x 1
chmod +x 2
chmod +x 3
chmod +x 4
chmod +x 5
chmod +x 6
chmod +x 7
chmod +x 8
chmod +x 9
chmod +x 10
chmod +x 11
chmod +x 12
chmod +x 13
chmod +x 14
chmod +x 15

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
service nginx start
service openvpn restart
service cron restart
service ssh restart
service dropbear restart
service squid3 restart
service webmin restart
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# info
clear
echo "Autoscript Include:" | tee log-install.txt
echo "===========================================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Service"  | tee -a log-install.txt
echo "-------"  | tee -a log-install.txt
echo "OpenSSH  : 22, 143"  | tee -a log-install.txt
echo "Dropbear : 80, 443"  | tee -a log-install.txt
echo "Squid3   : 8080, 3128 (limit to IP SSH)"  | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP:81/client.ovpn)"  | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300"  | tee -a log-install.txt
echo "nginx    : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Script"  | tee -a log-install.txt
echo "------"  | tee -a log-install.txt
echo "1     (รายการมีดังนี้นะครับพี่ๆ)"  | tee -a log-install.txt
echo "2     (สร้างบัญชีใช้งาน SSH & OPEN VPN)"  | tee -a log-install.txt
echo "3     (สร้างบัญชีทดลอง SSH & OPEN VPN)"  | tee -a log-install.txt
echo "4     (ลบชื่อผู้ใช้งาน SSH & OPEN VPM)"  | tee -a log-install.txt
echo "5     (ลบรายชื่ออัติโนมัติ)"  | tee -a log-install.txt
echo "6     (แสดงรายชื่อออนไลน์ทั้งหมด)"  | tee -a log-install.txt
echo "7     (แสดงรายชื่อทั้งหมด)"  | tee -a log-install.txt
echo "8     (แบนรายชื่อ )"  | tee -a log-install.txt
echo "9     (ปลดแบนรายชื่อ)"  | tee -a log-install.txt
echo "10    (รีบูททั้งหมด)"  | tee -a log-install.txt
echo "11    (ตั้งเวลารีบูท vps) "  | tee -a log-install.txt
echo "12    (ทดสอบสปีด)" | tee -a log-install.txt
echo "13    (ดูการใช้ Ram เซิร์ฟเวอร์)"| tee -a log-install.txt
echo "14    (แก้ไขชื่อและรหัสผ่าน)"| tee -a log-install.txt
echo "15    (เช็ค bandwidth ที่ใช้ไป)" | tee -a log-install.txt
echo "about (ดูรายละเอียดการติดตั้งของระบบ)" | tee -a log-install.txt
echo "exit  (ออกจากการใช้งาน)"  | tee -a log-install.txt
echo "Fitur lain"  | tee -a log-install.txt
echo "----------"  | tee -a log-install.txt
echo "Webmin   : http://$MYIP:10000/"  | tee -a log-install.txt
echo "Timezone : Asia/Thailand (GMT +7)"  | tee -a log-install.txt
echo "IPv6     : [ปิด]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Original Script by GM, GM & CHOKE"  | tee -a log-install.txt
echo "สร้างโดย GM CHOKE"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Log Instalasi --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "VPS AUTO REBOOT TIAP JAM 12 MALAM"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
cd
rm -f /root/debian7.sh
