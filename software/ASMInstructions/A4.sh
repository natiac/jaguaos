#!/bin/bash 

# A0.sh
#
# Sum two registers storing the result in the Object register
# @author	Ẁilliam Martinez
# @date		May, 18 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMFunctions.sh
. ${baseDir}/jaguaOs/config/BaseFunctions.sh

parameters=$1

regCode1=${parameters:2:4};

regCode2=${parameters:0:2};

register1=`grep ".${regCode1};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register1=${register1/.};
registerValue1=`cat ${mpDir}/${register1}.reg`

register2=`grep ".${regCode2};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register2=${register2/.};
registerValue2=`cat ${mpDir}/${register2}.reg`

testIfRegister ${register1};
if [[ "$isRegister" == "1" ]]; then

	echo `expr ${registerValue1} + ${registerValue2}` > ${mpDir}/${register2}.reg

else

	echo `expr ${regCode1} + ${registerValue2}` > ${mpDir}/${register2}.reg

fi