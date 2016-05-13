#!/bin/bash 

# BaseFunctins.sh
#
# Base Functions
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 03 of 2016
#
####################################################

function header
{
	echo ""
	echo "		  ${1}"
	echo -n "                  "
	for (( i=0; i<${#1}; i++ )); do
  		echo -n "="
	done
	echo ""
	echo ""	
}

function parameterIsHexa
{
	temp=${1/[};
	temp=${temp/]};
	dec=`echo $((16#$temp))`;
	hex=`printf '%04X' $dec`;
	if [ "${temp}" == "${hex}" ] ; then
		isHexa=1;
	else
		isHexa=0;
	fi
}

function readMemoryPosition
{
	# returns value in ${char} variable

	position=$1;
	temp=`cat ${hardDir}/memory/content`;
	char=${temp:${position}:1};
}


function writeToRegister
{
	register=$1;
	value=$2;
	echo ${value} > ${mpDir}/${register}.reg
}



function writeMemoryPosition
{
	position=$1;
	value=$2;

	mem=`cat ${hardDir}/memory/content`;

	lengh=${#mem};

	first=${mem:0:$position};
	last=${mem:$((${position}+1)):${#mem}};

	echo "${first}${value}${last}" > ${hardDir}/memory/content;

}




