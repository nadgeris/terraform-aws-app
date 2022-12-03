#!/bin/bash

set -eux
hostnamectl set-hostname ${hostname}


yum update -y
yum install git -y
pip3 install flask
pip3 install flask-ext
pip3 install flask-MySQL

#clone the code
cd /opt/
git clone https://github.com/nadgeris/flask-app.git
cd /opt/flask-app/
sed -i "s/password/${rds_password}/g;s/localhost/${rds_endpoint}/g" db.py
nohup python3 rest.py &