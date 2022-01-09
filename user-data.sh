#!/bin/bash
yum update -y

echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
echo "LANG=en_US.utf-8" >> /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment

service sshd restart

yum install httpd php git -y
git clone https://github.com/Ismailpb/support.git
cp -r support*/* /var/www/html/
systemctl enable httpd
systemctl start httpd
