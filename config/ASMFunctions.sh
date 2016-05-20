#!/bin/bash 

# ASMFunctions.sh
#
# Assembler Functions to jaguaOs
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 03 of 2016
#
####################################################

function defineASMParameters
{
	P1=$1;
	P2=`echo $2 | sed s/,//`;		# Removes a "," in the parameter 
	P3=$3;
	P4=$4;


	# Redefine "mov" if needed
	if [ "$P1" == "mov" ] ; then
		redefineMov;
	fi

	# Test if function exist
	functionExist $P1;
	if [ "$exist" == "0" ] ; then
		echo "Instruction ${P1} not recognized!";
		exit 0;
	fi

	# Define Code Function
	defineCodeFunction $P1;

}


function testIfRegister
{
	if [ -f "${mpDir}/${1}.reg" ] ; then
		isRegister=1;
	else
		isRegister=0;
	fi
}



function redefineMov
{

	testIfRegister ${P2};
	if [ "${isRegister}" == "1" ] ; then
		if [ "${P2}" == "DR" ] ; then
			name="mv4";
		else	
			testIfRegister ${P3};
			if [ "${isRegister}" == "1" ] ; then
				name="mv1";
			else
				temp=${P3/[};
				temp=${temp/]};
				if [ “${P3}” == “${temp}” ] ; then	
					name="mv0";
				else
					name="mv2";
				fi	
			fi
		fi	
	else
		name="mv3"
	fi
	P1=${name};
}


function functionExist
{
	exist=0;
	grep "_${P1}" ${ASMInstDir}/ASMTable.sh >/dev/null && exist=1;
	return $exist;
}

function defineCodeFunction
{
	codeFunction=`grep "_${P1}" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 2 | tr -d '[[:space:]]'`;
}

function checkIfParameterIsRegister
{
	exist=0;
	temp=${1/[};
	temp=${temp/]};
	if [ "${#1}" == "1" ] ; then
		exist=0;
		return $exist;
	fi
	grep ".${temp};" ${ASMInstDir}/ASMTable.sh >/dev/null && exist=1;
	return $exist;
}


function defineCodePar1
{
	exist=0;
	checkIfParameterIsRegister ${P2};
	if [ "${exist}" == "1" ] ; then
		codePar1=`grep ".${P2};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 2 | tr -d '[[:space:]]'`;
	else
		codePar1=${P2/[};
		codePar1=${codePar1/]};
	fi
}

function defineCodePar2
{
	exist=0;
	checkIfParameterIsRegister ${P3};
	if [ "${exist}" == "1" ] ; then
		codePar2=`grep ".${P3};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 2 | tr -d '[[:space:]]'`;
	else
		codePar2=${P3/[};
		codePar2=${codePar2/]};
	fi
}
