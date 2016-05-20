#!/bin/bash 

# A7.sh
#
# Execute an interrupt
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 20 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


function interrupt
{
	function=$(readRegister RA);
	case $function in
		"00")
			;;

		"01") # Print a string started in a DR address

			address=$(readRegister DR);
			address=`echo $((16#${address}))`;
			char="";
			escape=0;
			backslash="\\";
			while [ "${char}" != "$" ];
			do
				readMemoryPosition ${address};
				if [ "${char}" == "${backslash}" ] ; then
					escape=1;
				else
					if [ "${escape}" == "1" ] ; then
						escape=0;
						case ${char} in 
							"t")
								echo -n "        ";
								;;
							"n")
								echo
								;;
						esac
					else
						if [ "${char}" != "$" ] ; then
							echo -n $char;
						fi
					fi
				fi 
				address=$(( ${address} + 1 ));
			done
			;;

	esac
}

interrupt;
