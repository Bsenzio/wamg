; ============================================
; GoL_Iterate
; ============================================
GoL_Iterate:

    LDX #0
IterLoop:
    STX lifeIdx        ; lifeIdx = index 0..24
    JSR CountNeighborsForCell
    STA neighborCnt

    LDX lifeIdx
    JSR GetCellByIndex ; A = current state (0..4)

    CMP #LIFE_EMPTY_INDEX
    BEQ CellWasDead

; ---- Cell was alive ----
CellWasAlive:
    LDA neighborCnt
    CMP #2
    BEQ StayAlive
    CMP #3
    BEQ StayAlive

    ; dies
    LDA #LIFE_EMPTY_INDEX
    JSR SetNextCellByIndex
    JMP NextStepCell

StayAlive:
    ; stays alive with same index
    LDX lifeIdx
    JSR GetCellByIndex
    JSR SetNextCellByIndex
    JMP NextStepCell


; ---- Cell was dead ----
CellWasDead:
    LDA neighborCnt
    CMP #3
    BNE StayDead

    ; Borns → random live index 0..3
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
