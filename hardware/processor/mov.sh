#!/bin/bash

# author

#############


P1="$1.reg"
P2="$2.reg"

if [ ! -f ${P1} ] ; then
	echo "Invalid ${P1}";
	exit 1;
fi 



# mov P1, P2

cat ${P2} > ${P1};




