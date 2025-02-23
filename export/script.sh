#!/usr/bin/sh

echo $USER

if [ $USER = "root" ]
then
	echo "root です。"
else
	echo "no root"
fi

