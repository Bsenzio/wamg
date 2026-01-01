; lifeIdx = index 0..24
; OUT: A = live neighbors
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
    STA tempCol      ; col = A
    STX tempRow      ; row = X

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
