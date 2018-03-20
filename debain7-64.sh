vim .ssh/authorized_keys 
vi .ssh/authorized_keys 
exit
MYIP=$(wget -qO- ipv4.icanhazip.com);
wget -O client.ovpn "https://docs.google.com/uc?export=download&id=1mEW2-EZgHp83oGmZkhiOiX5P_ZQP9oHv"
sed -i s/xxxxxxxx/$MYIP/g client.ovpn;
mv client.ovpn /var/www/
wget -O /var/www/client.php "https://docs.google.com/uc?export=download&id=17ZnlinX_rk3Ht94jCf87MGOCvVEYBbOw"
cd
wget -O ./webmin-debian7.sh "https://docs.google.com/uc?export=download&id=1N3602J0B2qXPYzxOAcHLodbIodef4mkz" && chmod +x webmin-debian7.sh && ./webmin-debian7.sh && rm webmin-debian7.sh
nano /var/www/client.ovpn
