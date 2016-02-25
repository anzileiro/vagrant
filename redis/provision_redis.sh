#!/bin/sh
#Script para automatizar vagrant boxe. Instalar o Redis

install_redis(){
	sudo wget http://download.redis.io/redis-stable.tar.gz && \
	sudo tar xvzf redis-stable.tar.gz && \
	cd redis-stable && \
	sudo make install

	sudo cp /vagrant/redis.upstart.conf /etc/init/redis.conf && \
	sudo cp /vagrant/redis.conf /etc/redis.conf && \
	sudo service redis start && \

	sudo cp /vagrant/redis-sentinel.upstart.conf /etc/init/redis-sentinel.conf && \
	sudo cp /vagrant/redis-sentinel.conf /etc/redis-sentinel.conf && \
	sudo service redis-sentinel start
}

echo ">>> Instalando o Redis"
install_redis
