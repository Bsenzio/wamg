ManualPlacement_Start:

CPX player1_object
BEQ +
RTS
+

LDA vegCount
BNE +
RTS
+

LDA currentNametable
AND #%00000001
STA temp



; =====================================================
; ROW 1
; =====================================================

LDA Object_y_hi,x

CMP #$45
BCS +
JMP MP_checkRow2
+

CMP #$4B
BCC +
JMP MP_checkRow2
+



LDA Object_x_hi,x

CMP #$5B
BCS +
JMP MP_row1x2
+

CMP #$67
BCC +
JMP MP_row1x2
+

LDA #$06
STA tempA

LDA #$05
STA tempB

LDA #$01
STA c11

JMP MP_DoTile



MP_row1x2:

LDA Object_x_hi,x

CMP #$7A
BCS +
JMP MP_row1x3
+

CMP #$81
BCC +
JMP MP_row1x3
+

LDA #$08
STA tempA

LDA #$05
STA tempB

LDA #$01
STA c12

JMP MP_DoTile



MP_row1x3:

LDA Object_x_hi,x

CMP #$A0
BCS +
JMP MP_row1x4
+

CMP #$A5
BCC +
JMP MP_row1x4
+

LDA #$0A
STA tempA

LDA #$05
STA tempB

LDA #$01
STA c13

JMP MP_DoTile



MP_row1x4:

LDA Object_x_hi,x

CMP #$BF
BCS +
JMP MP_row1x5
+

CMP #$C6
BCC +
JMP MP_row1x5
+

LDA #$0C
STA tempA

LDA #$05
STA tempB

LDA #$01
STA c14

JMP MP_DoTile



MP_row1x5:

LDA Object_x_hi,x

CMP #$DA
BCS +
JMP MP_checkRow2
+

CMP #$E4
BCC +
JMP MP_checkRow2
+

LDA #$0E
STA tempA

LDA #$05
STA tempB

LDA #$01
STA c15

JMP MP_DoTile



; =====================================================
; ROW 2
; =====================================================

MP_checkRow2:

LDA Object_y_hi,x

CMP #$6A
BCS +
JMP MP_checkRow3
+

CMP #$73
BCC +
JMP MP_checkRow3
+



LDA Object_x_hi,x

CMP #$5B
BCS +
JMP MP_row2x2
+

CMP #$67
BCC +
JMP MP_row2x2
+

LDA #$06
STA tempA

LDA #$07
STA tempB

LDA #$01
STA c21

JMP MP_DoTile



MP_row2x2:

LDA Object_x_hi,x

CMP #$7A
BCS +
JMP MP_row2x3
+

CMP #$81
BCC +
JMP MP_row2x3
+

LDA #$08
STA tempA

LDA #$07
STA tempB

LDA #$01
STA c22

JMP MP_DoTile



MP_row2x3:

LDA Object_x_hi,x

CMP #$A0
BCS +
JMP MP_row2x4
+

CMP #$A5
BCC +
JMP MP_row2x4
+

LDA #$0A
STA tempA

LDA #$07
STA tempB

LDA #$01
STA c23

JMP MP_DoTile



MP_row2x4:

LDA Object_x_hi,x

CMP #$BF
BCS +
JMP MP_row2x5
+

CMP #$C6
BCC +
JMP MP_row2x5
+

LDA #$0C
STA tempA

LDA #$07
STA tempB

LDA #$01
STA c24

JMP MP_DoTile



MP_row2x5:

LDA Object_x_hi,x

CMP #$DA
BCS +
JMP MP_checkRow3
+

CMP #$E4
BCC +
JMP MP_checkRow3
+

LDA #$0E
STA tempA

LDA #$07
STA tempB

LDA #$01
STA c25

JMP MP_DoTile



; =====================================================
; ROW 3
; =====================================================

MP_checkRow3:

LDA Object_y_hi,x

CMP #$85
BCS +
JMP MP_checkRow4
+

CMP #$8B
BCC +
JMP MP_checkRow4
+



LDA Object_x_hi,x

CMP #$5B
BCS +
JMP MP_row3x2
+

CMP #$67
BCC +
JMP MP_row3x2
+

LDA #$06
STA tempA

LDA #$09
STA tempB

LDA #$01
STA c31

JMP MP_DoTile



MP_row3x2:

LDA Object_x_hi,x

CMP #$7A
BCS +
JMP MP_row3x3
+

CMP #$81
BCC +
JMP MP_row3x3
+

LDA #$08
STA tempA

LDA #$09
STA tempB

LDA #$01
STA c32

JMP MP_DoTile



MP_row3x3:

LDA Object_x_hi,x

CMP #$A0
BCS +
JMP MP_row3x4
+

CMP #$A5
BCC +
JMP MP_row3x4
+

LDA #$0A
STA tempA

LDA #$09
STA tempB

LDA #$01
STA c33

JMP MP_DoTile



MP_row3x4:

LDA Object_x_hi,x

CMP #$BF
BCS +
JMP MP_row3x5
+

CMP #$C6
BCC +
JMP MP_row3x5
+

LDA #$0C
STA tempA

LDA #$09
STA tempB

LDA #$01
STA c34

JMP MP_DoTile



MP_row3x5:

LDA Object_x_hi,x

CMP #$DA
BCS +
JMP MP_checkRow4
+

CMP #$E4
BCC +
JMP MP_checkRow4
+

LDA #$0E
STA tempA

LDA #$09
STA tempB

LDA #$01
STA c35

JMP MP_DoTile



; =====================================================
; ROW 4
; =====================================================

MP_checkRow4:

LDA Object_y_hi,x

CMP #$A5
BCS +
JMP MP_checkRow5
+

CMP #$AB
BCC +
JMP MP_checkRow5
+



LDA Object_x_hi,x

CMP #$5B
BCS +
JMP MP_row4x2
+

CMP #$67
BCC +
JMP MP_row4x2
+

LDA #$06
STA tempA

LDA #$0B
STA tempB

LDA #$01
STA c41

JMP MP_DoTile



MP_row4x2:

LDA Object_x_hi,x

CMP #$7A
BCS +
JMP MP_row4x3
+

CMP #$81
BCC +
JMP MP_row4x3
+

LDA #$08
STA tempA

LDA #$0B
STA tempB

LDA #$01
STA c42

JMP MP_DoTile



MP_row4x3:

LDA Object_x_hi,x

CMP #$A0
BCS +
JMP MP_row4x4
+

CMP #$A5
BCC +
JMP MP_row4x4
+

LDA #$0A
STA tempA

LDA #$0B
STA tempB

LDA #$01
STA c43

JMP MP_DoTile



MP_row4x4:

LDA Object_x_hi,x

CMP #$BF
BCS +
JMP MP_row4x5
+

CMP #$C6
BCC +
JMP MP_row4x5
+

LDA #$0C
STA tempA

LDA #$0B
STA tempB

LDA #$01
STA c44

JMP MP_DoTile



MP_row4x5:

LDA Object_x_hi,x

CMP #$DA
BCS +
JMP MP_checkRow5
+

CMP #$E4
BCC +
JMP MP_checkRow5
+

LDA #$0E
STA tempA

LDA #$0B
STA tempB

LDA #$01
STA c45

JMP MP_DoTile



; =====================================================
; ROW 5
; =====================================================

MP_checkRow5:

LDA Object_y_hi,x

CMP #$C5
BCS +
RTS
+

CMP #$CB
BCC +
RTS
+



LDA Object_x_hi,x

CMP #$5B
BCS +
JMP MP_row5x2
+

CMP #$67
BCC +
JMP MP_row5x2
+

LDA #$06
STA tempA

LDA #$0D
STA tempB

LDA #$01
STA c51

JMP MP_DoTile



MP_row5x2:

LDA Object_x_hi,x

CMP #$7A
BCS +
JMP MP_row5x3
+

CMP #$81
BCC +
JMP MP_row5x3
+

LDA #$08
STA tempA

LDA #$0D
STA tempB

LDA #$01
STA c52

JMP MP_DoTile



MP_row5x3:

LDA Object_x_hi,x

CMP #$A0
BCS +
JMP MP_row5x4
+

CMP #$A5
BCC +
JMP MP_row5x4
+

LDA #$0A
STA tempA

LDA #$0D
STA tempB

LDA #$01
STA c53

JMP MP_DoTile



MP_row5x4:

LDA Object_x_hi,x

CMP #$BF
BCS +
JMP MP_row5x5
+

CMP #$C6
BCC +
JMP MP_row5x5
+

LDA #$0C
STA tempA

LDA #$0D
STA tempB

LDA #$01
STA c54

JMP MP_DoTile



MP_row5x5:

LDA Object_x_hi,x

CMP #$DA
BCS +
RTS
+

CMP #$E4
BCC +
RTS
+

LDA #$0E
STA tempA

LDA #$0D
STA tempB

LDA #$01
STA c55

JMP MP_DoTile



MP_DoTile:

DEC vegCount

ChangeTileAtPosition tempA,tempB,#$C4,#$00,temp

RTS