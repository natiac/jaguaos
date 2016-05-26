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
	# Define position to read
	position=$(readRegister "PC");
	position=`echo $((16#${position}))`;

	# Read Instruction from memory
	codeInstruction=$(readInstruction ${position});
	instructionLenght=`grep "${codeInstruction};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 3 | tr -d '[[:space:]]'`;
	
	# Read Instruction Parameters
	position=$(( ${position} + 2 ));
	parameters=$(readInstructionParameters ${position} ${instructionLenght});
	
	#Update Instruction Interpreter Register
	echo "${codeInstruction}${parameters}" > ${mpDir}/RI.ii;

	# Increment the PC
	position=$(( ${position} + ${instructionLenght} ));
	writeToRegister "PC" `printf '%04X' ${position}`;
}


# Execute Cycle
function execute
{
	# Execute Instruction
	${ASMInstDir}/${codeInstruction}.sh ${parameters};
	
	echo ${codeInstruction} ${parameters};
}



while true
do 
	fetch;
	execute;

	# Check if instruction is end
	if [ -f ${ASMInstDir}/endProgram ]; then
		rm ${ASMInstDir}/endProgram;
		exit 0;
	fi	

done
