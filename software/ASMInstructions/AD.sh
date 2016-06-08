#!/bin/bash 

# A0.sh
#
# Move Value to Register (RA, 01 )
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		June, 08 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


regCode=$1

register=`grep ".${regCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};

value=$( readRegister ${register});

SP=$( readSP );

writeMemoryPosition ${SP} ${value};

decreaseSP ${SP};


echo $register = $value
echo "SP= $SP"

exit 0;

echo ${value} > ${mpDir}/${register}.reg; 

touchStatus ${register};





