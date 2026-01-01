; ============================================
; SetCellByIndex
;  IN:  X = índice 0..24
;       A = valor a escribir
; ============================================
SetCellByIndex:

    STA tmp   ; valor a escribir

    TXA
    CMP #0
    BEQ .c11
    CMP #1
    BEQ .c12
    CMP #2
    BEQ .c13
    CMP #3
    BEQ .c14
    CMP #4
    BEQ .c15

    CMP #5
    BEQ .c21
    CMP #6
    BEQ .c22
    CMP #7
    BEQ .c23
    CMP #8
    BEQ .c24
    CMP #9
    BEQ .c25

    CMP #10
    BEQ .c31
    CMP #11
    BEQ .c32
    CMP #12
    BEQ .c33
    CMP #13
    BEQ .c34
    CMP #14
    BEQ .c35

    CMP #15
    BEQ .c41
    CMP #16
    BEQ .c42
    CMP #17
    BEQ .c43
    CMP #18
    BEQ .c44
    CMP #19
    BEQ .c45

    CMP #20
    BEQ .c51
    CMP #21
    BEQ .c52
    CMP #22
    BEQ .c53
    CMP #23
    BEQ .c54
    ; resto = 24
.c55:
    LDA tmp
    STA c55
    RTS

.c11: LDA tmp : STA c11 : RTS
.c12: LDA tmp : STA c12 : RTS
.c13: LDA tmp : STA c13 : RTS
.c14: LDA tmp : STA c14 : RTS
.c15: LDA tmp : STA c15 : RTS

.c21: LDA tmp : STA c21 : RTS
.c22: LDA tmp : STA c22 : RTS
.c23: LDA tmp : STA c23 : RTS
.c24: LDA tmp : STA c24 : RTS
.c25: LDA tmp : STA c25 : RTS

.c31: LDA tmp : STA c31 : RTS
.c32: LDA tmp : STA c32 : RTS
.c33: LDA tmp : STA c33 : RTS
.c34: LDA tmp : STA c34 : RTS
.c35: LDA tmp : STA c35 : RTS

.c41: LDA tmp : STA c41 : RTS
.c42: LDA tmp : STA c42 : RTS
.c43: LDA tmp : STA c43 : RTS
.c44: LDA tmp : STA c44 : RTS
.c45: LDA tmp : STA c45 : RTS

.c51: LDA tmp : STA c51 : RTS
.c52: LDA tmp : STA c52 : RTS
.c53: LDA tmp : STA c53 : RTS
.c54: LDA tmp : STA c54 : RTS
