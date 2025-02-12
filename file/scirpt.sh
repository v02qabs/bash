#!/usr/bin/bash

mkdir=/home/user/Movie

if [ -d "$mkdir" ]
then
	echo "ok."
else
	echo "ng."
fi

