#!/bin/sh
if [ ! -f /conf/aria2.conf ]; then
	cp /conf-copy/aria2.conf /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
	if [ $USER ]; then
		echo "rpc-user=${USER}" >> /conf/aria2.conf
	fi
	if [ $PASSWORD ]; then
		echo "rpc-passwd=${PASSWORD}" >> /conf/aria2.conf
	fi
fi
if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-copy/on-complete.sh /conf/on-complete.sh
fi

chmod +x /conf/on-complete.sh
touch /conf/aria2.session

darkhttpd /aria2-webui --port 80 &
aria2c --conf-path=/conf/aria2.conf
