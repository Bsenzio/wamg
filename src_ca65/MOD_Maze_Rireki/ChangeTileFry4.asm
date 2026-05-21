; ============================================================
; ChangeTileFry4
; ============================================================

    LDA fryLock5
    BEQ +
    RTS
+

    LDA #$01
    STA fryLock5

ChangeTileFry4:

    LDA currentNametable
    AND #%00000001
    STA temp



; ============================================================
; c15
; ============================================================

    LDA c15
    STA tempTile

    LDA #$0E
    STA tempA

    LDA #$05
    STA tempB

    JSR DrawVegCell



; ============================================================
; c25
; ============================================================

    LDA c25
    STA tempTile

    LDA #$0E
    STA tempA

    LDA #$07
    STA tempB

    JSR DrawVegCell



; ============================================================
; c35
; ============================================================

    LDA c35
    STA tempTile

    LDA #$0E
    STA tempA

    LDA #$09
    STA tempB

    JSR DrawVegCell



; ============================================================
; c45
; ============================================================

    LDA c45
    STA tempTile

    LDA #$0E
    STA tempA

    LDA #$0B
    STA tempB

    JSR DrawVegCell



; ============================================================
; c55
; ============================================================

    LDA c55
    STA tempTile

    LDA #$0E
    STA tempA

    LDA #$0D
    STA tempB

    JSR DrawVegCell

    RTS



