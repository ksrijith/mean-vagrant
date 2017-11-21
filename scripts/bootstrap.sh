#!/bin/bash
apt-get update
apt-get install -y git
apt-get install -y nodejs
apt-get install -y npm
npm install -g nodemon
ln -s /usr/bin/nodejs /usr/bin/node

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

su - vagrant -c "mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"
cat > /home/vagrant/.vimrc <<- 'EOF'
execute pathogen#infect()
syntax on
filetype plugin indent on
EOF

chown vagrant /home/vagrant/.vimrc 
chgrp vagrant /home/vagrant/.vimrc 

su - vagrant -c "mkdir -p ~/.vim/bundle/node"
su - vagrant -c "git clone https://github.com/moll/vim-node.git ~/.vim/bundle/node"
su - vagrant -c "git clone https://github.com/jelera/vim-javascript-syntax.git ~/.vim/bundle/vim-javascript-syntax"
su - vagrant -c "git clone https://github.com/vim-scripts/JavaScript-Indent.git ~/.vim/bundle/vJavaScript-Indent"
su - vagrant -c "echo \"au BufNewFile,BufRead *.ejs set filetype=html\" >> ~/.vimrc "

echo "export PORT=3000" >>/etc/environment
