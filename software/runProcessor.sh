#!/bin/bash 

# runProcessor.sh
#
# Execute a program in the microprocessor
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 20 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh



# Fetch Cycle
function fetch
{
	echo
}


# Execute Cycle
function execute
{
	echo
}



while true
do 
	fetch;
	execute;
done
