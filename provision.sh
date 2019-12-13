#!/bin/bash
set -e
#provision.sh
 #sudo apt-get update
 
 sudo hostname new-jenkins-server
 cd /etc
 sudo sed -i "s/localhost/$(hostname)/g" hosts
 cat hosts
 sudo apt-get update
 echo "apt-get update done."
 cd ..
 cd home/ubuntu/
 wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
 touch jenkins.list
 echo "deb http://pkg.jenkins.io/debian-stable binary/" >> jenkins.list
 cat jenkins.list
 sudo mv jenkins.list /etc/apt/sources.list.d/
 sudo apt-get update
 sudo apt install openjdk-8-jre -y
 sudo apt-get update
 sudo apt-get install jenkins -y
 sudo systemctl enable jenkins.service
#  sudo apt-get install chkconfig -y
#  sudo chkconfig --add jenkins
 
 #sudo apt-get update
 #sudo service jenkins start
 #sudo ufw allow 8080
 #sudo iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
 #sudo apt-get -y upgrade
 #sudo apt-get install -y python-dev python-pip
 #sudo pip install ansible
 #sudo timedatectl set-timezone Europe/Istanbul
 #sudo localectl set-locale LANG=en_US.utf8
 #sudo wget ‘https://s3.amazonaws.com/packeramidemo/i_playbook.yml'
 #echo "Running build."
 #sudo ansible-playbook i_playbook.yml