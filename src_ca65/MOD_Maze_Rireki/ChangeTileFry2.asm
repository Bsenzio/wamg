; ============================================================
; ChangeTileFry2
; ============================================================

    LDA fryLock3
    BEQ +
    RTS
+

    LDA #$01
    STA fryLock3

ChangeTileFry2:

    LDA currentNametable
    AND #%00000001
    STA temp



; ============================================================
; c13
; ============================================================

    LDA c13
    STA tempTile

    LDA #$0A
    STA tempA

    LDA #$05
    STA tempB

    JSR DrawVegCell



; ============================================================
; c23
; ============================================================

    LDA c23
    STA tempTile

    LDA #$0A
    STA tempA

    LDA #$07
    STA tempB

    JSR DrawVegCell



; ============================================================
; c33
; ============================================================

    LDA c33
    STA tempTile

    LDA #$0A
    STA tempA

    LDA #$09
    STA tempB

    JSR DrawVegCell



; ============================================================
; c43
; ============================================================

    LDA c43
    STA tempTile

    LDA #$0A
    STA tempA

    LDA #$0B
    STA tempB

    JSR DrawVegCell



; ============================================================
; c53
; ============================================================

    LDA c53
    STA tempTile

    LDA #$0A
    STA tempA

    LDA #$0D
    STA tempB

    JSR DrawVegCell

    RTS



