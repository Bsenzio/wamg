GoLCompute:

    LDA ScreenFlags01
    AND #%00000001          ; User Flag 15
    BEQ +noCompute
	
	JSR GoL_IterateAll		

	;WarpToScreen warpToMap, warpToScreen, #$01
	
    RTS
		
+noCompute:
	RTS
	
; ============================================
; GoL_IterateAll
;   Goes over ALL 25 cells (0..24):
;   - Uses lifeIdx
;   - Call GoL_UpdateCell for each
;   - Finally copies nXY -> cXY with CopyNextToCurrent
; ============================================
GoL_IterateAll:

    LDX #0                ; X = 0 (index 0..24)

GoL_LoopAll:
    STX lifeIdx           ; lifeIdx = X (current cell)
    JSR GoL_UpdateCell    ; calculates next cell status

    INX
    CPX #LIFE_CELL_COUNT  ; ¿X < 25?
    BCC GoL_LoopAll       ; yes -> next cell

    ; after finishing all cells, copy nXY -> cXY
    JSR CopyNextToCurrent

    RTS


; ============================================
; GoL_UpdateCell
;   Uses:
;     lifeIdx  (0..24)
;   Does:
;     - Counts Neighbors (CountNeighborsForCell)
;     - Reads Current Status (GetCellByIndex)
;     - Aplica reglas GoL:
;         * live + 2 o 3 neighbors-> keeps alive (same index)
;         * live + other number   -> dies (empty)
;         * dead + 3 neighbors   -> borns (random index 0..3)
;         * dead + other        -> keeps empty
;     - Writes nXY with SetNextCellByIndex
; ============================================
GoL_UpdateCell:

    ; --- count neighbors on this cell ---
    JSR CountNeighborsForCell   ; lifeIdx already has index
    STA neighborCnt             ; save #neighbors

    ; --- read current cell status ---
    LDX lifeIdx
    JSR GetCellByIndex          ; A = currrent status (0..4)

    CMP #LIFE_EMPTY_INDEX
    BEQ GCell_WasDead           ; if it was empty -> "dead" branch

; -------- Cell was alive --------
GCell_WasAlive:
    LDA neighborCnt
    CMP #2
    BEQ GCell_StayAlive
    CMP #3
    BEQ GCell_StayAlive

    ; dies -> empty
    LDA #LIFE_EMPTY_INDEX
    JSR SetNextCellByIndex      ; nXY = empty
    RTS

GCell_StayAlive:
    ; stays with SAME index
    LDX lifeIdx
    JSR GetCellByIndex          ; A = same state again
    JSR SetNextCellByIndex      ; nXY = same value
    RTS


; -------- Cell was dead --------
GCell_WasDead:
    LDA neighborCnt
    CMP #3
    BNE GCell_StayDead

    ; borns -> random index 0..3 (veggie)
    JSR doGetRandomNumber
    AND #%00000011              ; 0..3
    JSR SetNextCellByIndex      ; nXY = new live index
    RTS

GCell_StayDead:
    ; stays empty
    LDA #LIFE_EMPTY_INDEX
    JSR SetNextCellByIndex
    RTS
	
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
    ; else = 24

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


; ============================================
; CountNeighborsForCell
;  IN:  lifeIdx = index 0..24 from current cell
;  OUT: A = counts live neighbors (0..8)
;  USA: tmp, tempRow, tempCol, neighborCnt
; ============================================
CountNeighborsForCell:

    ; tmp = lifeIdx
    LDX lifeIdx
    STX tmp

    ; --------------------------------
    ; row = idx / 5, col = idx % 5
    ; --------------------------------
    LDA tmp
    LDX #0
CF_RowDivLoop:
    CMP #5
    BCC CF_RowDivDone
    SEC
    SBC #5
    INX
    JMP CF_RowDivLoop

CF_RowDivDone:
    STA tempCol      ; col = A (0..4)
    STX tempRow      ; row = X (0..4)

    ; counter = 0
    LDA #0
    STA neighborCnt

    ; ==================================================
    ; (-1,-1) → idx - 6
    ; ==================================================
    LDA tempRow
    BEQ CF_skipUL       ; if row == 0, no up
    LDA tempCol
    BEQ CF_skipUL       ; if col == 0, no left

    LDA tmp
    SEC
    SBC #6              ; idx - 6
    TAX
    JSR CheckNeighborAlive
CF_skipUL:

    ; ==================================================
    ; (0,-1) → idx - 5
    ; ==================================================
    LDA tempRow
    BEQ CF_skipU        ; row == 0 → no up

    LDA tmp
    SEC
    SBC #5              ; idx - 5
    TAX
    JSR CheckNeighborAlive
CF_skipU:

    ; ==================================================
    ; (+1,-1) → idx - 4
    ; ==================================================
    LDA tempRow
    BEQ CF_skipUR       ; row == 0 → no up
    LDA tempCol
    CMP #4
    BEQ CF_skipUR       ; col == 4 → no right

    LDA tmp
    SEC
    SBC #4              ; idx - 4
    TAX
    JSR CheckNeighborAlive
CF_skipUR:

    ; ==================================================
    ; (-1,0) → idx - 1
    ; ==================================================
    LDA tempCol
    BEQ CF_skipL        ; col == 0 → no left

    LDA tmp
    SEC
    SBC #1              ; idx - 1
    TAX
    JSR CheckNeighborAlive
CF_skipL:

    ; ==================================================
    ; (+1,0) → idx + 1
    ; ==================================================
    LDA tempCol
    CMP #4
    BEQ CF_skipR        ; col == 4 → no right

    LDA tmp
    CLC
    ADC #1              ; idx + 1
    TAX
    JSR CheckNeighborAlive
CF_skipR:

    ; ==================================================
    ; (-1,+1) → idx + 4
    ; ==================================================
    LDA tempRow
    CMP #4
    BEQ CF_skipDL       ; row == 4 → no down
    LDA tempCol
    BEQ CF_skipDL       ; col == 0 → no left

    LDA tmp
    CLC
    ADC #4              ; idx + 4
    TAX
    JSR CheckNeighborAlive
CF_skipDL:

    ; ==================================================
    ; (0,+1) → idx + 5
    ; ==================================================
    LDA tempRow
    CMP #4
    BEQ CF_skipD        ; row == 4 → no down

    LDA tmp
    CLC
    ADC #5              ; idx + 5
    TAX
    JSR CheckNeighborAlive
CF_skipD:

    ; ==================================================
    ; (+1,+1) → idx + 6
    ; ==================================================
    LDA tempRow
    CMP #4
    BEQ CF_skipDR       ; row == 4 → no down
    LDA tempCol
    CMP #4
    BEQ CF_skipDR       ; col == 4 → no right

    LDA tmp
    CLC
    ADC #6              ; idx + 6
    TAX
    JSR CheckNeighborAlive
CF_skipDR:

    ; return counter to A
    LDA neighborCnt
    RTS


; ============================================
; CheckNeighborAlive
;  IN:  X = neighbor index 0..24 
;  MOD: neighborCnt if alive
; ============================================
CheckNeighborAlive:
    JSR GetCellByIndex      ; A = corresponding cXY cell status

    CMP #LIFE_EMPTY_INDEX
    BEQ CNA_Dead

    INC neighborCnt

CNA_Dead:
    RTS
	


; ============================================
; GetCellByIndex
;  IN:  X = index 0..24
;  OUT: A = corresponding cXY value
; ============================================
GetCellByIndex:

    TXA
    CMP #0
    BEQ rc11
    CMP #1
    BEQ rc12
    CMP #2
    BEQ rc13
    CMP #3
    BEQ rc14
    CMP #4
    BEQ rc15

    CMP #5
    BEQ rc21
    CMP #6
    BEQ rc22
    CMP #7
    BEQ rc23
    CMP #8
    BEQ rc24
    CMP #9
    BEQ rc25

    CMP #10
    BEQ rc31
    CMP #11
    BEQ rc32
    CMP #12
    BEQ rc33
    CMP #13
    BEQ rc34
    CMP #14
    BEQ rc35

    CMP #15
    BEQ rc41
    CMP #16
    BEQ rc42
    CMP #17
    BEQ rc43
    CMP #18
    BEQ rc44
    CMP #19
    BEQ rc45

    CMP #20
    BEQ rc51
    CMP #21
    BEQ rc52
    CMP #22
    BEQ rc53
    CMP #23
    BEQ rc54
    ; resto = 24
	
rc55:
    LDA c55
    RTS

rc11: 
	LDA c11
	RTS
rc12: 
LDA c12 
 RTS
rc13: 
LDA c13 
RTS
rc14: 
LDA c14 
 RTS
rc15: 
LDA c15 
 RTS

rc21: 
LDA c21 
 RTS
rc22: 
LDA c22 
 RTS
rc23: 
LDA c23 
 RTS
rc24: 
LDA c24 
 RTS
rc25: 
LDA c25 
 RTS

rc31: 
LDA c31 
 RTS
rc32: 
LDA c32 
 RTS
rc33: 
LDA c33 
 RTS
rc34: 
LDA c34 
 RTS
rc35: 
LDA c35 
 RTS

rc41: 
LDA c41 
 RTS
rc42: 
LDA c42 
 RTS
rc43: 
LDA c43 
 RTS
rc44: 
LDA c44 
 RTS
rc45: 
LDA c45 
 RTS

rc51: 
LDA c51 
 RTS
rc52: 
LDA c52 
 RTS
rc53: 
LDA c53 
 RTS
rc54: 
LDA c54 
 RTS

; ============================================
; SetCellByIndex
;  IN:  X = index 0..24
;       A = value to write
; ============================================
SetCellByIndex:

    STA tmp   ; value to write

    TXA
    CMP #0
    BEQ sc11
    CMP #1
    BEQ sc12
    CMP #2
    BEQ sc13
    CMP #3
    BEQ sc14
    CMP #4
    BEQ sc15

    CMP #5
    BEQ sc21
    CMP #6
    BEQ sc22
    CMP #7
    BEQ sc23
    CMP #8
    BEQ sc24
    CMP #9
    BEQ sc25

    CMP #10
    BEQ sc31
    CMP #11
    BEQ sc32
    CMP #12
    BEQ sc33
    CMP #13
    BEQ sc34
    CMP #14
    BEQ sc35

    CMP #15
    BEQ sc41
    CMP #16
    BEQ sc42
    CMP #17
    BEQ sc43
    CMP #18
    BEQ sc44
    CMP #19
    BEQ sc45

    CMP #20
    BEQ sc51
    CMP #21
    BEQ sc52
    CMP #22
    BEQ sc53
    CMP #23
    BEQ sc54
    ; resto = 24
sc55:
    LDA tmp
    STA c55
    RTS

sc11: 
LDA tmp 
 STA c11 
 RTS
sc12: 
LDA tmp 
 STA c12 
 RTS
sc13: 
LDA tmp 
 STA c13 
 RTS
sc14: 
LDA tmp 
 STA c14 
 RTS
sc15: 
LDA tmp 
 STA c15 
 RTS

sc21: 
LDA tmp 
 STA c21 
 RTS
sc22: 
LDA tmp 
 STA c22 
 RTS
sc23: 
LDA tmp 
 STA c23 
 RTS
sc24: 
LDA tmp 
 STA c24 
 RTS
sc25: 
LDA tmp 
 STA c25 
 RTS

sc31: 
LDA tmp 
 STA c31 
 RTS
sc32: 
LDA tmp 
 STA c32 
 RTS
sc33: 
LDA tmp 
 STA c33 
 RTS
sc34: 
LDA tmp 
 STA c34 
 RTS
sc35: 
LDA tmp 
 STA c35 
 RTS

sc41: 
LDA tmp 
 STA c41 
 RTS
sc42: 
LDA tmp 
 STA c42 
 RTS
sc43: 
LDA tmp 
 STA c43 
 RTS
sc44: 
LDA tmp 
 STA c44 
 RTS
sc45: 
LDA tmp 
 STA c45 
 RTS

sc51: 
LDA tmp 
 STA c51 
 RTS
sc52: 
LDA tmp 
 STA c52 
 RTS
sc53: 
LDA tmp 
 STA c53 
 RTS
sc54: 
LDA tmp 
 STA c54 
 RTS

; --------------------------------------------
; PlaceOneVeggieRandom
; --------------------------------------------
PlaceOneVeggieRandom:

RandomTry:


    JSR doGetRandomNumber
    AND #%00011111       ; 0..31
    CMP #LIFE_CELL_COUNT
    BCS RandomTry        ; si >=25, try again

    STA randIdx          ; randIdx = index 0..24

    ; Obtain actual contend for randIdx cell
    LDX randIdx
    JSR GetCellByIndex   ; A = cXY value at randIdx index
    CMP #LIFE_EMPTY_INDEX
    BNE RandomTry        ; if not empty, try another cell

    ; If it is empty here → put a live random veggie 0..3
    JSR doGetRandomNumber
    AND #%00000011       ; 0..3
    TAX                  ; X = veggie index
    STX tmp              ; tmp = cell index to write

    LDX randIdx
    LDA tmp
    JSR SetCellByIndex   ; cXY = tmp


    RTS
	

; ============================================
; GetTileForCellIndex
;  IN:  A = index 0..4
;  OUT: A = corresponding tile
;         0 → $CC
;         1 → $CA
;         2 → $C8
;         3 → $C4
;         4 → $CE  (empty)
; ============================================
GetTileForCellIndex:


    CMP #0
    BNE +c1
        LDA #$CC
        RTS

+c1:
    CMP #1
    BNE +c2
        LDA #$CA
        RTS

+c2:
    CMP #2
    BNE +c3
        LDA #$C8
        RTS

+c3:
    CMP #3
    BNE +empty
        LDA #$C4
        RTS

+empty:
    LDA #$CE      ; empty
    RTS