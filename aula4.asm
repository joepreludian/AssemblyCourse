	X	EQU	1	;Seta X como 1
	Y	EQU	2	;Seta Y como 2
	Z	EQU	3	;Seta Z como 3 (Soma)
	M	EQU	4	;Seta M como 4 (Prod)

	JMP	IN		;Faz um salto para IN

	ORG	0030h	;Seta Memoria de prog

IN:	MOV	A,	#X	;Coloca 1 no Acumul.
	ADD	A,	#Y	;Soma #Y com Acumul.
	MOV	Z,	A	;Guarda Acumul em end Z
	MOV B,	#Y	;Guarda em Regist. Ext.
	MUL	AB		;Multiplica; Joga em "A"
	MOV	A,	M	;Joga Acumul. em end de M.
	JMP	$		;Jampeia pro inferno;
	END