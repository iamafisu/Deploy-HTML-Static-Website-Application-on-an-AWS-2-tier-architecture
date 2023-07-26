#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
#wget https://github.com/iamafisu/mole/archive/refs/heads/main.zip
wget https://github.com/iamafisu/xmen-webfiles/archive/refs/heads/main.zip
unzip main.zip
cp -r xmen-webfiles-main/xmen-main/* /var/www/html/
rm -rf xmen-webfiles-main main.zip
systemctl enable httpd
systemctl start httpd