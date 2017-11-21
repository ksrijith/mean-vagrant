#!/bin/bash
apt-get update
apt-get install -y git
apt-get install -y nodejs
apt-get install -y npm

#Install Mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
apt-get update
apt-get install -y mongodb-org
systemctl enable mongod
cat > /etc/motd <<- "EOF"
=======================================================
MongoDB log file: /var/log/mongodb/mongod.log
MongoDB Port: 27017
=======================================================
EOF