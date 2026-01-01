MACRO ChangeTileAtPosition arg0, arg1
	; arg0 = metatile to change into
	; arg1 = Y/X
	LDA arg0 
	STA arg0_hold 
	LDA arg1 
	STA arg1_hold 
	jsr doChangeTileAtPosition
	
	ENDM