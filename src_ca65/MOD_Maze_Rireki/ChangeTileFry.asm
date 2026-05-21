; ============================================================
; ChangeTileFry
; ============================================================

    LDA fryLock1
    BEQ +
    RTS
+

    LDA #$01
    STA fryLock1

ChangeTileFry:

    LDA currentNametable
    AND #%00000001
    STA temp



; ============================================================
; c11
; ============================================================

    LDA c11
    STA tempTile

    LDA #$06
    STA tempA

    LDA #$05
    STA tempB

    JSR DrawVegCell



; ============================================================
; c21
; ============================================================

    LDA c21
    STA tempTile

    LDA #$06
    STA tempA

    LDA #$07
    STA tempB

    JSR DrawVegCell



; ============================================================
; c31
; ============================================================

    LDA c31
    STA tempTile

    LDA #$06
    STA tempA

    LDA #$09
    STA tempB

    JSR DrawVegCell



; ============================================================
; c41
; ============================================================

    LDA c41
    STA tempTile

    LDA #$06
    STA tempA

    LDA #$0B
    STA tempB

    JSR DrawVegCell



; ============================================================
; c51
; ============================================================

    LDA c51
    STA tempTile

    LDA #$06
    STA tempA

    LDA #$0D
    STA tempB

    JSR DrawVegCell

    RTS



; ============================================================
; DrawVegCell
; ============================================================

DrawVegCell:

    LDA tempTile
    JSR GetTileForCellIndex
    STA tempTile

    ChangeTileAtPosition tempA,tempB,tempTile,#$00,temp

    JSR doWaitFrame

    RTS