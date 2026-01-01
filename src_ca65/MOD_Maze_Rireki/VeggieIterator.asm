    ; --- Random number between 0 y 7 ---
    JSR doGetRandomNumber
    AND #%00000111      ; 0..7
    TAY                 ; Y = random


    ; --- SWITCH (Y) ---
    CPY #$00
    BNE +c1
        JMP Case0

+c1:
    CPY #$01
    BNE +c2
        JMP Case1

+c2:
    CPY #$02
    BNE +c3
        JMP Case2

+c3:
    CPY #$03
    BNE +c4
        JMP Case3

+c4:
    CPY #$04
    BNE +c5
        JMP Case4

+c5:
    CPY #$05
    BNE +c6
        JMP Case5

+c6:
    CPY #$06
    BNE +default
        JMP Case6

+default:
    ; If not 0..6 then 7
    JMP Case7



; =========================================================
; -------- CASE 0 --------  C4
Case0:
    LDA #$C4
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS


; -------- CASE 1 --------  C8
Case1:
    LDA #$C8
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS


; -------- CASE 2 --------  CA
Case2:
    LDA #$CA
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS


; -------- CASE 3 --------  CC
Case3:
    LDA #$CC
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS


; -------- CASE 4 --------  88
Case4:
    LDA #$88
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS


; -------- CASE 5 --------  88
Case5:
    LDA #$88
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS


; -------- CASE 6 --------  88
Case6:
    LDA #$88
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS


; -------- CASE 7 --------  88
Case7:
    LDA #$88
    STA tempA
    ChangeTileAtCollision tempA, #$08
    RTS
