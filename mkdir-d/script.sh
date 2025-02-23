#!/bin/sh


if [ -d "/home/user/." ] 
then
	echo "/home/user/.は存在します。"
else
	echo "/home/user/.は存在しません。"
	mkdir -p /home/user
fi

