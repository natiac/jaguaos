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
	par1=${2};
	case ${command} in
		"dir")
			ls ${dir};
			;;

		"prompt")
			prompt=${par1};
			;;

		"exit")
			echo;
			echo "Thanks for try our jaguaOs!!!";
			echo;
			exit 0;
			;;

		"history")
			cat .history;
			echo;
			if [ "${par1}" == "clear" ] ; then
				echo "" > .history;
				echo "History cleaned.";
				echo;
			fi
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
	echo ${command} >> ".history";
	execInstruction ${command};
done
