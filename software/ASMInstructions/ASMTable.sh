# ASM Instructions Table


#ASM	Function 	Lenght	Comment	

_mv0;		A0;		3; 		Move Value to Register (RA, 0123 )

_mv1;		A1;		4; 		Move Register Contents to another Register (RA, RB )

_mv2; 		A2;		6;		Move The content of a Direction to a Register ( RA, [1234] )

_mv3;		A3;		6; 		Move Register Contents to Direction ( [123], RA )

_mv4;		X0; 	6;		Move a Direction to the Direction Register

_add;  		A4;		4;		Sum two registers storing the result in the Object register

_inc;		A5;		2;		Increment a Register (+1)

_dec;		A6;		2;      Decrement a Register (-1)

_int;		A7;		0;		Exec a interrupt

_end;		A8;		0;		Terminate a program

_jmp;		A9;		4;		Salta la ejecución para una posición de memoria

_loop;		AA;		4;		Makes a loop to an Memory Address

_nop;		AB;		0;		Makes nothing

_cmp;		AC; 	4;		Compare two registers and stores results in ACC

_push;		AD;		2;		Push data into Stack 

_pop; 		AE;		2;		Pop data from Stack 

_pushr;		AF;		0;		Push all registers in the Stack

_popr;		B0;		0; 		Pop all registers from stack

.RA;		C1;				Register RA

.RB;		C2;				Register RB

.RC;		C3;				Register RC

.RD;		C4;				Register RD

.DR;		C5;				Direction Register

.PC;		C6;				Register PC

.ACC;		C7;				Register ACC - Accumulator

.ZF;		C8;				Register ZF - Zero Flag

.SF;		C9;				Register SF - Signal Flag





