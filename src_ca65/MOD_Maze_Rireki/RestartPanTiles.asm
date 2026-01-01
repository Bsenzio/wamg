;LDA #$00
;STA fryLock1
;LDA #$00
;STA fryLock2
;LDA #$00
;STA fryLock3
;LDA #$00
;STA fryLock4
;LDA #$00
;STA myScore
;WarpToScreen warpToMap, warpToScreen, #$01
;ChangeTileAtCollision #$CC, #$00
	
	LDA currentNametable
	AND #%00000001
	STA temp
ChangeTileAtPosition #$00, #$00, #$CE, #$00, temp


JSR GoL_Iterate
; ============================================
; GoL_Iterate
; ============================================
GoL_Iterate:

    LDX #0
IterLoop:
    STX lifeIdx        ; lifeIdx = índice 0..24
    JSR CountNeighborsForCell
    STA neighborCnt

    LDX lifeIdx
    JSR GetCellByIndex ; A = estado actual (0..4)

    CMP #LIFE_EMPTY_INDEX
    BEQ CellWasDead

; ---- Celda estaba viva ----
CellWasAlive:
    LDA neighborCnt
    CMP #2
    BEQ StayAlive
    CMP #3
    BEQ StayAlive

    ; muere
    LDA #LIFE_EMPTY_INDEX
    JSR SetNextCellByIndex
    JMP NextStepCell

StayAlive:
    ; sigue viva con el mismo índice
    LDX lifeIdx
    JSR GetCellByIndex
    JSR SetNextCellByIndex
    JMP NextStepCell


; ---- Celda estaba muerta ----
CellWasDead:
    LDA neighborCnt
    CMP #3
    BNE StayDead

    ; nace → índice vivo random 0..3
    JSR doGetRandomNumber
    AND #%00000011
    JSR SetNextCellByIndex
    JMP NextStepCell

StayDead:
    LDA #LIFE_EMPTY_INDEX
    JSR SetNextCellByIndex

NextStepCell:
    LDX lifeIdx
    INX
    CPX #LIFE_CELL_COUNT
    BNE IterLoop

    ; Copiar nXY → cXY
    JSR CopyNextToCurrent

    RTS


; ============================================
; CountNeighborsForCell
;  IN:  lifeIdx = índice 0..24
;  OUT: A = vecinos vivos
;  USA: tmp, tempRow, tempCol, neighborCnt
; ============================================
CountNeighborsForCell:

    LDX lifeIdx
    STX tmp          ; tmp = idx

    ; row = idx / 5, col = idx % 5
    LDA tmp
    LDX #0
RowDivLoop:
    CMP #5
    BCC RowDivDone
    SEC
    SBC #5
    INX
    JMP RowDivLoop
RowDivDone:
    STA tempCol      ; col = A (0..4)
    STX tempRow      ; row = X (0..4)

    LDA #0
    STA neighborCnt

    ; (-1,-1)
    LDA tempRow
    BEQ skipUL
    LDA tempCol
    BEQ skipUL
    LDA tmp
    SEC
    SBC #6
    TAX
    JSR CheckNeighborAlive
skipUL:

    ; (0,-1)
    LDA tempRow
    BEQ skipU
    LDA tmp
    SEC
    SBC #5
    TAX
    JSR CheckNeighborAlive
skipU:

    ; (+1,-1)
    LDA tempRow
    BEQ skipUR
    LDA tempCol
    CMP #4
    BEQ skipUR
    LDA tmp
    SEC
    SBC #4
    TAX
    JSR CheckNeighborAlive
skipUR:

    ; (-1,0)
    LDA tempCol
    BEQ skipL
    LDA tmp
    SEC
    SBC #1
    TAX
    JSR CheckNeighborAlive
skipL:

    ; (+1,0)
    LDA tempCol
    CMP #4
    BEQ skipR
    LDA tmp
    CLC
    ADC #1
    TAX
    JSR CheckNeighborAlive
skipR:

    ; (-1,+1)
    LDA tempRow
    CMP #4
    BEQ skipDL
    LDA tempCol
    BEQ skipDL
    LDA tmp
    CLC
    ADC #4
    TAX
    JSR CheckNeighborAlive
skipDL:

    ; (0,+1)
    LDA tempRow
    CMP #4
    BEQ skipD
    LDA tmp
    CLC
    ADC #5
    TAX
    JSR CheckNeighborAlive
skipD:

    ; (+1,+1)
    LDA tempRow
    CMP #4
    BEQ skipDR
    LDA tempCol
    CMP #4
    BEQ skipDR
    LDA tmp
    CLC
    ADC #6
    TAX
    JSR CheckNeighborAlive
skipDR:

    LDA neighborCnt
    RTS


; ============================================
; CheckNeighborAlive
;  IN:  X = índice 0..24 del vecino
;  MOD: neighborCnt si está vivo
; ============================================
CheckNeighborAlive:
    JSR GetCellByIndex      ; A = valor de la celda cXY correspondiente

    CMP #LIFE_EMPTY_INDEX
    BEQ NeighborDead

    INC neighborCnt

NeighborDead:
    RTS


; ============================================
; CopyNextToCurrent
;  Copia nXY → cXY
; ============================================
CopyNextToCurrent:
    LDA n11 
    STA c11
    LDA n12 
    STA c12
    LDA n13 
    STA c13
    LDA n14 
    STA c14
    LDA n15 
    STA c15

    LDA n21 
    STA c21
    LDA n22 
    STA c22
    LDA n23 
    STA c23
    LDA n24 
    STA c24
    LDA n25 
    STA c25

    LDA n31 
    STA c31
    LDA n32 
    STA c32
    LDA n33 
    STA c33
    LDA n34 
    STA c34
    LDA n35 
    STA c35

    LDA n41 
    STA c41
    LDA n42 
    STA c42
    LDA n43 
    STA c43
    LDA n44 
    STA c44
    LDA n45 
    STA c45

    LDA n51 
    STA c51
    LDA n52 
    STA c52
    LDA n53 
    STA c53
    LDA n54 
    STA c54
    LDA n55 
    STA c55

    RTS


; ============================================
; SetNextCellByIndex
;  IN:  lifeIdx = índice 0..24
;       A = valor para siguiente generación
; ============================================
SetNextCellByIndex:
    STA tmp
    LDX lifeIdx

    TXA
    CMP #0
    BEQ rn11
    CMP #1
    BEQ rn12
    CMP #2
    BEQ rn13
    CMP #3
    BEQ rn14
    CMP #4
    BEQ rn15

    CMP #5
    BEQ rn21
    CMP #6
    BEQ rn22
    CMP #7
    BEQ rn23
    CMP #8
    BEQ rn24
    CMP #9
    BEQ rn25

    CMP #10
    BEQ rn31
    CMP #11
    BEQ rn32
    CMP #12
    BEQ rn33
    CMP #13
    BEQ rn34
    CMP #14
    BEQ rn35

    CMP #15
    BEQ rn41
    CMP #16
    BEQ rn42
    CMP #17
    BEQ rn43
    CMP #18
    BEQ rn44
    CMP #19
    BEQ rn45

    CMP #20
    BEQ rn51
    CMP #21
    BEQ rn52
    CMP #22
    BEQ rn53
    CMP #23
    BEQ rn54
    ; resto = 24
rn55:
    LDA tmp
    STA n55
    RTS

rn11: 
    LDA tmp  
    STA n11 
    RTS
rn12: 
    LDA tmp 
    STA n12 
    RTS
rn13: 
    LDA tmp  
    STA n13 
    RTS
rn14: 
    LDA tmp 
    STA n14 
    RTS
rn15: 
    LDA tmp 
    STA n15 
    RTS

rn21: 
    LDA tmp 
    STA n21 
    RTS
rn22: 
    LDA tmp 
    STA n22 
    RTS
rn23: 
    LDA tmp 
    STA n23 
    RTS
rn24: 
    LDA tmp 
    STA n24 
    RTS
rn25: 
    LDA tmp 
    STA n25 
    RTS

rn31: 
    LDA tmp 
    STA n31 
    RTS
rn32: 
    LDA tmp 
    STA n32 
    RTS
rn33: 
    LDA tmp 
    STA n33 
    RTS
rn34: 
    LDA tmp 
    STA n34 
    RTS
rn35: 
    LDA tmp 
    STA n35 
    RTS

rn41: 
    LDA tmp
    STA n41 
    RTS
rn42: 
    LDA tmp  
    STA n42 
    RTS
rn43: 
    LDA tmp 
    STA n43
    RTS
rn44: 
    LDA tmp 
    STA n44 
    RTS
rn45: 
    LDA tmp 
    STA n45 
    RTS

rn51: 
    LDA tmp 
    STA n51 
    RTS
rn52: 
    LDA tmp  
    STA n52 
    RTS
rn53: 
    LDA tmp  
    STA n53  
    RTS
rn54: 
    LDA tmp  
    STA n54  
    RTS
