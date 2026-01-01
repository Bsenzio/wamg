; ============================================
; GetCellByIndex
;  IN:  X = índice 0..24
;  OUT: A = valor en cXY correspondiente
; ============================================
GetCellByIndex:

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
    LDA c55
    RTS

.c11: LDA c11 : RTS
.c12: LDA c12 : RTS
.c13: LDA c13 : RTS
.c14: LDA c14 : RTS
.c15: LDA c15 : RTS

.c21: LDA c21 : RTS
.c22: LDA c22 : RTS
.c23: LDA c23 : RTS
.c24: LDA c24 : RTS
.c25: LDA c25 : RTS

.c31: LDA c31 : RTS
.c32: LDA c32 : RTS
.c33: LDA c33 : RTS
.c34: LDA c34 : RTS
.c35: LDA c35 : RTS

.c41: LDA c41 : RTS
.c42: LDA c42 : RTS
.c43: LDA c43 : RTS
.c44: LDA c44 : RTS
.c45: LDA c45 : RTS

.c51: LDA c51 : RTS
.c52: LDA c52 : RTS
.c53: LDA c53 : RTS
.c54: LDA c54 : RTS
