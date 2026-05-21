; ============================================================
; ChangeTileFry3
; ============================================================

    LDA fryLock4
    BEQ +
    RTS
+

    LDA #$01
    STA fryLock4

ChangeTileFry3:

    LDA currentNametable
    AND #%00000001
    STA temp



; ============================================================
; c14
; ============================================================

    LDA c14
    STA tempTile

    LDA #$0C
    STA tempA

    LDA #$05
    STA tempB

    JSR DrawVegCell



; ============================================================
; c24
; ============================================================

    LDA c24
    STA tempTile

    LDA #$0C
    STA tempA

    LDA #$07
    STA tempB

    JSR DrawVegCell



; ============================================================
; c34
; ============================================================

    LDA c34
    STA tempTile

    LDA #$0C
    STA tempA

    LDA #$09
    STA tempB

    JSR DrawVegCell



; ============================================================
; c44
; ============================================================

    LDA c44
    STA tempTile

    LDA #$0C
    STA tempA

    LDA #$0B
    STA tempB

    JSR DrawVegCell



; ============================================================
; c54
; ============================================================

    LDA c54
    STA tempTile

    LDA #$0C
    STA tempA

    LDA #$0D
    STA tempB

    JSR DrawVegCell

    RTS



