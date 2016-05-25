#!/bin/bash 

# shell.sh
#
# Shell to a jaguaOs System
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 20 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


# exec Instruction
function execInstruction
{
	command=${1}
	case ${command} in
		"dir")
			ls ${dir};
			;;
		"*")
			echo "Unrecognized Command";
			;;
	esac
}






# Variable definitions
command="";
prompt="> ";
dir=${diskDir};

header "jaguaOs - Academic Emulation of Operational System in Bash";



while true
do 
	echo ""
	echo -n "$prompt";
	read command;
	execInstruction ${command};
done
