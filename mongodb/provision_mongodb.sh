#!/bin/sh
#Script para automatizar vagrant boxe. Instalar o MongoDB 3.2.3
#alterar aqui

install_mongodb(){
	echo "Instalando o mongodb..." && \
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
	echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
	sudo apt-get update && \
	sudo apt-get install -y mongodb-org && \
	sudo apt-get install -y mongodb-org=3.2.3 mongodb-org-server=3.2.3 mongodb-org-shell=3.2.3 mongodb-org-mongos=3.2.3 mongodb-org-tools=3.2.3 && \
	echo "mongodb-org hold" | sudo dpkg --set-selections && \
	echo "mongodb-org-server hold" | sudo dpkg --set-selections && \
	echo "mongodb-org-shell hold" | sudo dpkg --set-selections && \
	echo "mongodb-org-mongos hold" | sudo dpkg --set-selections && \
	echo "mongodb-org-tools hold" | sudo dpkg --set-selections && \

	sudo service mongod start

	sudo sed "s/bindIp: 127.0.0.1/#bindIp: 127.0.0.1" /etc/mongod.conf

	sudo service mongod restart
}

echo ">>> Instalando o MongoDB 3.2.3"
install_mongodb
