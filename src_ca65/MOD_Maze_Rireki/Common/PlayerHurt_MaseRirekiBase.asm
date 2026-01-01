
	TXA
	PHA
	LDA gameHandler
	AND #%10000000
	BEQ +canHurtPlayer
		JMP +skipHurt
+canHurtPlayer:

	TXA
	STA temp
	GetActionStep temp
	CMP #$07
	BNE +canHurtPlayer
		JMP +skipHurt
	+canHurtPlayer
	
	DEC myLives
	
	UpdateHudElement #$02
	
	LDA #$00
    STA myScore
	STA vegCount
    UpdateHudElement #$03
	
	LDA myLives
	BEQ +nozerohp
	PlaySound #sfx_dead
	+nozerohp
	
	BNE +notZeroLives
		;;;zero lives
		;PlaySound #sfx_dead
		;JMP RESET
		; --- Jump to (0,1) instead of RESET ---
		StopSound
        WarpToScreen warpToMap, #$01, #$00
		
	+notZeroLives
		ChangeActionStep player1_object, #$07
			;; recoil
			LDA #$00
			STA Object_h_speed_hi,x
			STA Object_h_speed_lo,x
			STA Object_v_speed_hi,x
			STA Object_v_speed_lo,x
			; LDA xPrev
			; STA Object_x_hi,x
			; LDA yPrev
			; STA Object_y_hi,x
	
	
+skipHurt
	PLA
	TAX