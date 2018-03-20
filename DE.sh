#!/bin/bash # # Original script by fornesia, rzengineer and fawzya # Mod by kguza wullop onuamit # ================================================== # go to root cd # Install Command apt-get -y install ufw apt-get -y install sudo # set repo wget -O /etc/apt/sources.list "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/sources.list.debian8" wget "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/dotdeb.gpg" wget "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/jcameron-key.asc" cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc # update apt-get update # install webserver apt-get -y install nginx # install essential package apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar # install neofetch echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key apt-get update apt-get install neofetch echo "clear" >> .bashrc echo 'echo -e " ================================="' >> .bashrc echo 'echo -e " Wallcom to server Debian7-8"' >> .bashrc echo 'echo -e " Script mod by kguza wullop onuamit"' >> .bashrc echo 'echo -e " «««««««««««««««««»»»»»»»»»»»»»»»»"' >> .bashrc echo 'echo -e " prin { menu } Show menu items"' >> .bashrc echo 'echo -e " «««««««««««««««»»»»»»»»»»»»»»"' >> .bashrc echo 'echo -e ""' >> .bashrc # install webserver cd rm /etc/nginx/sites-enabled/default rm /etc/nginx/sites-available/default wget -O /etc/nginx/nginx.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/nginx.conf" mkdir -p /home/vps/public_html echo "
A p p O p e n V P N - P R O
-
        
ดาวโหลดแอพSUPERVPN» คลิก «

สนใจติดต่อสอบถาม » คลิก «

การใช้งานแอพเน็ตฟรี» คลิก «

บริการเช่า VPN

บริการเช่า VPN

บริการเช่าVPN ระบบ VPS

ใช้ได้ทั้ง ssh เเละ openvpn

ราคาเพียง 20บาท/เดือน

บริการรันScripVPS

บริการรันScripVPS

debain 7 - 8

ubuntu 14

ค่าบริการ50฿/1เซิฟเวอร์

ขายขาด350

รองรับทุกเวบ-เวบ z.com ก็รันผ่านโดยใช้เวลาเพียง2-3นาที

รีวิวคำสั่ง{menu}.........รายชื่อเมนู

{addkguza} .เพิ่มผู้ใช้

{2} สร้างผู้ใช้ชั่วคราว1ชั่วโมง{ให้ลูกค้าทดสอบไฟล์

{3} เปลี่ยนชื่อผู้ใช้

{4} ตั้งค่าอุปกรณ์และเปลี่ยนรหัสผ่านและเปลี่ยนวันหมดอายุ

{5} ลบผู้ใช้

{6} ลบผู้ใช้โดยอัตโนมัติ ที่หมดอายุ

{7} ดูผู้ใช้ทั้งหมด

{8} เริ่มต้นบริการ dropbear,squid3, OpenVPN และ SSH

{9} speedtest VPS

{10} ดูผู้ใช้ออนไลน์

{11} การเข้าสู่ระบบของผู้ใช้

{12} เกี่ยวกับระบบนี้

{13} เกี่ยวกับการติดตั้งสคริปต์อัตโนมัติ

{reboot} บูต VPS ใหม่

{exit} ปิด Putty / Connecbot / JuiceSSH

ขอบ คุณ ที่ สนับ สนุน บริ การ ของ เรา !!!!@KGUZA!!!!
" > /home/vps/public_html/index.html wget -O /etc/nginx/conf.d/vps.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/vps.conf" service nginx restart # install openvpn wget -O /etc/openvpn/openvpn.tar "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/openvpn-debian.tar" cd /etc/openvpn/ tar xf openvpn.tar wget -O /etc/openvpn/1194.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/1194.conf" service openvpn restart sysctl -w net.ipv4.ip_forward=1 sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE iptables-save > /etc/iptables_yg_baru_dibikin.conf wget -O /etc/network/if-up.d/iptables "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/iptables" chmod +x /etc/network/if-up.d/iptables service openvpn restart # konfigurasi openvpn cd /etc/openvpn/ wget -O /etc/openvpn/True-Dtac.ovpn "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/client-1194.conf" MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`; sed -i s/xxxxxxxxx/$MYIP/g /etc/openvpn/True-Dtac.ovpn; cp True-Dtac.ovpn /home/vps/public_html/ # install badvpn cd wget -O /usr/bin/badvpn-udpgw "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/badvpn-udpgw" if [ "$OS" == "x86_64" ]; then wget -O /usr/bin/badvpn-udpgw "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/badvpn-udpgw64" fi sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local chmod +x /usr/bin/badvpn-udpgw screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 # setting port ssh cd sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config service ssh restart # install dropbear apt-get -y install dropbear sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 443 -p 80"/g' /etc/default/dropbear echo "/bin/false" >> /etc/shells echo "/usr/sbin/nologin" >> /etc/shells service ssh restart service dropbear restart # Install Squid apt-get -y install squid3 cp /etc/squid3/squid.conf /etc/squid3/squid.conf.orig wget -O /etc/squid3/squid.conf "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/squid3.conf" MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`; sed -i s/xxxxxxxxx/$MYIP/g /etc/squid3/squid.conf; service squid3 restart # install webmin cd wget -O webmin-current.deb "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/webmin-current.deb" dpkg -i --force-all webmin-current.deb; apt-get -y -f install; rm /root/webmin-current.deb service webmin restart # download script cd /usr/bin wget -O menu "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/menu.sh" wget -O a "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/adduser.sh" wget -O b "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/testuser.sh" wget -O c "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/rename.sh" wget -O d "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/repass.sh" wget -O e "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/delet.sh" wget -O f "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/deletuserxp.sh" wget -O g "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/viewuser.sh" wget -O h "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/restart.sh" wget -O i "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/speedtest.py" wget -O j "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/online.sh" wget -O k "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/viewlogin.sh" wget -O l "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/aboutsystem.sh" wget -O m "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/lock.sh" wget -O n "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/unlock.sh" wget -O o "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/logscrip.sh" wget -O p "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/aboutscrip.sh" wget -O q "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/httpcredit.sh" wget -O r "https://scripkguza.000webhostapp.com/KGUZA-ALL-SCRIP/TimeReboot.sh" echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot # ตั้งค่าเขตเวลา, โลคอล ssh รีสตาร์ท บริการ ssh ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config service ssh restart chmod +x menu chmod +x a chmod +x b chmod +x c chmod +x d chmod +x e chmod +x f chmod +x g chmod +x h chmod +x i chmod +x j chmod +x k chmod +x l chmod +x m chmod +x n chmod +x o chmod +x p chmod +x q chmod +x r # finishing cd chown -R www-data:www-data /home/vps/public_html service nginx start service openvpn restart service cron restart service ssh restart service dropbear restart service squid3 restart service webmin restart rm -rf ~/.bash_history && history -c echo "unset HISTFILE" >> /etc/profile # info clear echo " ============= Kguza figther ============= Service --------------------------------------------- OpenSSH : 22, 143 Dropbear : 80, 443 Squid3 : 8080, 3128 (limit to IP SSH) ===========Detail OpenVPN Account =========== Download App http://$MYIP:81 ********************************************* Config OpenVPN (TCP 1194) Download File http://$MYIP:81/True-Dtac.ovpn ============================================= badvpn : badvpn-udpgw port 7300 nginx : 81 Webmin : http://$MYIP:10000/ Timezone : Asia/Thailand (GMT +7) IPv6 : [off] ============================================= credit. : Dev By Kguza Facebook : https://m.facebook.com/?_rdr Line : http://line.me/ti/p/Dh6o2a5Ar9 =============================================" echo " VPS AUTO REBOOT 00.00" echo " «««««««««««««««»»»»»»»»»»»»»»»» " echo " prin { menu } show list on menu " echo " «««««««««««««««»»»»»»»»»»»»»»»» " cd echo "Auto Scrip Setup By Kguza" > admin
