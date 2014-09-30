;Prog20 Keypad to Display
;Use Update Freq. =1
;Use KeyPad no formato "Radio"

		CLR	P3.3
		CLR	P3.4
LOOP:	MOV	P0,	#0F7h
		CALL	LER
		CALL	DISP
		MOV	P0,	#0FBh
		CALL	LER
		CALL	DISP
		MOV	P0,	#0FDh
		CALL	LER
		CALL	DISP
		MOV	P0,	#0FEh
		CALL	LER
		CALL	DISP
		SJMP	LOOP

LER:	MOV	R7,	#00h
		MOV	DPTR,	#TAB2
TAB:	MOV	A,	R7
		MOVC	A,	@A+DPTR
		CJNE	A,	P0,	PROX
		RET
PROX:	INC	R7
		CJNE	R7,	#0Ah,	TAB
		RET
TAB2:	DB	0DEh			;0
		DB	0B7h			;1
		DB	0D7h			;2
		DB	0E7h			;3
		DB	0BBh			;4
		DB	0DBh			;5
		DB	0EBh			;6
		DB	0BDh			;7
		DB	0DDh			;8
		DB	0EDh			;9

DISP:	MOV	DPTR,	#TAB1
		MOV	A,	R7
		MOVC	A,	@A+DPTR
		CJNE A, #0ffh, FIQ
		RET
FIQ:	MOV	P1,	A
		RET
TAB1:	DB	0C0h			;0
		DB	0F9h			;1
		DB	0A4h			;2
		DB	0B0h			;3
		DB	099h			;4
		DB	092h			;5
		DB	082h			;6
		DB	0F8h			;7
		DB	080h			;8
		DB	090h			;9
		DB	0FFh			;A
		END
