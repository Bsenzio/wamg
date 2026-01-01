; -----------------------------------------
; SetBGTileAt
;  Input:
;    A = tile ID
;    X = column (0–31)
;    Y = row    (0–29)
;  Uses:
;    bgTileID, bgCol, bgRow, bgOffLo, bgOffHi
;  Writes directly to nametable at $2000 + (row*32 + col)
; -----------------------------------------

SetBGTileAt:

    ; Save inputs
    STA bgTileID
    STX bgCol
    STY bgRow

    ; offset = 0
    LDA #$00
    STA bgOffLo
    STA bgOffHi

; ---- compute offset = row * 32 + col ----
; do: while (row > 0) { offset += 32; row-- }

@RowLoop:
    LDA bgRow
    BEQ @RowsDone

    ; offset += 32
    CLC
    LDA bgOffLo
    ADC #32
    STA bgOffLo

    LDA bgOffHi
    ADC #0
    STA bgOffHi

    DEC bgRow
    JMP @RowLoop

@RowsDone:
    ; offset += col
    CLC
    LDA bgOffLo
    ADC bgCol
    STA bgOffLo
    ; bgOffHi unchanged

    ; now VRAM address = $2000 + offset
    ; add $2000 to high byte
    CLC
    LDA bgOffHi
    ADC #$20
    STA bgOffHi
    ; bgOffLo is already correct

    ; ---- write to PPU ----
    LDA bgOffHi
    STA $2006
    LDA bgOffLo
    STA $2006

    LDA bgTileID
    STA $2007

    RTS