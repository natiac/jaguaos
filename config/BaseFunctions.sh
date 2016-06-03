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

	touchStatus ${register};

}

function readRegister
{
	register=${1};
	echo `cat ${mpDir}/${register}.reg`;
}


function writeMemoryPosition
{
	position=$1;
	value=$2;
	if [ "${value}" == "space" ] ; then
		value=" ";
	fi
	mem=`cat ${hardDir}/memory/content`;

	lengh=${#mem};

	first=${mem:0:$position};
	last=${mem:$((${position}+1)):${#mem}};

	echo "${first}${value}${last}" > ${hardDir}/memory/content;

}


# Read instruction from Memory
function readInstruction
{
	pos=${1};
	temp=`cat ${hardDir}/memory/content`;
	echo "${temp:${pos}:2}";
}


# Read instructionParameters From Memory
function readInstructionParameters
{
	pos=${1};
	lengh=${2};
	temp=`cat ${hardDir}/memory/content`;
	echo "${temp:${pos}:${lengh}}";
}



# Define Video Memory variables
function defineVideoMemory
{
	memoryContent=`cat ${memDir}/content`;
	totalMemory=${#memoryContent};
	startVideoMemory=$(( $totalMemory - 1600 ));
}


# Read the position of actual Row
function readActualRow
{
	echo `cat ${ttyDir}/actualRow`;
}


# Read the position of actual Col
function readActualCol
{
	echo `cat ${ttyDir}/actualCol`;
}


# Update Row & Col Data
function updateRowCol
{
	col=$(( ${col} +1 ));
	if [ ${col} -gt 79 ]; then 
		col=0;
		row=$(( ${row} + 1 ));
	fi
}


# Write the position of actual Row and Col
function writeRowCol
{
	echo ${row} > ${ttyDir}/actualRow;
	echo ${col} > ${ttyDir}/actualCol;	
}


# Create a stack Pointer
function writeSP
{
	SP=${1};
	hex=`printf '%04X' ${SP}`;
	echo ${hex} > ${mpDir}/SP;
}



