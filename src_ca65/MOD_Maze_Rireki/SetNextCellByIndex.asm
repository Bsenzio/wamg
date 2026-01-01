; IN: lifeIdx = índice 0..24
;     A = valor para siguiente generación
SetNextCellByIndex:
    STA tmp
    LDX lifeIdx

    TXA
    CMP #0
    BEQ .n11
    CMP #1
    BEQ .n12
    CMP #2
    BEQ .n13
    CMP #3
    BEQ .n14
    CMP #4
    BEQ .n15

    CMP #5
    BEQ .n21
    CMP #6
    BEQ .n22
    CMP #7
    BEQ .n23
    CMP #8
    BEQ .n24
    CMP #9
    BEQ .n25

    CMP #10
    BEQ .n31
    CMP #11
    BEQ .n32
    CMP #12
    BEQ .n33
    CMP #13
    BEQ .n34
    CMP #14
    BEQ .n35

    CMP #15
    BEQ .n41
    CMP #16
    BEQ .n42
    CMP #17
    BEQ .n43
    CMP #18
    BEQ .n44
    CMP #19
    BEQ .n45

    CMP #20
    BEQ .n51
    CMP #21
    BEQ .n52
    CMP #22
    BEQ .n53
    CMP #23
    BEQ .n54
    ; resto = 24
.n55:
    LDA tmp
    STA n55
    RTS

.n11: LDA tmp : STA n11 : RTS
.n12: LDA tmp : STA n12 : RTS
.n13: LDA tmp : STA n13 : RTS
.n14: LDA tmp : STA n14 : RTS
.n15: LDA tmp : STA n15 : RTS

.n21: LDA tmp : STA n21 : RTS
.n22: LDA tmp : STA n22 : RTS
.n23: LDA tmp : STA n23 : RTS
.n24: LDA tmp : STA n24 : RTS
.n25: LDA tmp : STA n25 : RTS

.n31: LDA tmp : STA n31 : RTS
.n32: LDA tmp : STA n32 : RTS
.n33: LDA tmp : STA n33 : RTS
.n34: LDA tmp : STA n34 : RTS
.n35: LDA tmp : STA n35 : RTS

.n41: LDA tmp : STA n41 : RTS
.n42: LDA tmp : STA n42 : RTS
.n43: LDA tmp : STA n43 : RTS
.n44: LDA tmp : STA n44 : RTS
.n45: LDA tmp : STA n45 : RTS

.n51: LDA tmp : STA n51 : RTS
.n52: LDA tmp : STA n52 : RTS
.n53: LDA tmp : STA n53 : RTS
.n54: LDA tmp : STA n54 : RTS
