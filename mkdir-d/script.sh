#!/bin/sh

MYHOME=/usr/bin

if [ -d "$MYHOME" ] 
then
	echo "$MYHOMEは存在します。"
else
	echo "$MYHOME存在しません。"
	mkdir -p $MYHOME
fi

