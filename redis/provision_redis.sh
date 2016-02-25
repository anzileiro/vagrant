#!/bin/sh
#Script para automatizar vagrant boxe. Instalar o Redis

install_redis(){
	sudo wget http://download.redis.io/redis-stable.tar.gz && \
	sudo tar xvzf redis-stable.tar.gz && \
	cd redis-stable && \
	sudo make install
}

echo ">>> Instalando o Redis"
install_redis
