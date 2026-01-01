    ; Tile base (top-left del metatile 16x16)
    LDA #$CA
    STA bgTileBaseID

    ; Coordenadas en base a tiles 16x16
    LDA #$03
    STA bgMetaX

    LDA #$04
    STA bgMetaY

    ; Llamar a la rutina genérica
    JSR ChangeMetaTile_NoCollision

; -----------------------------------------
; ChangeMetaTile_NoCollision
; Cambia un metatile de 16x16 en el fondo
; Entradas (en variables):
;   bgTileBaseID = tile base (top-left)
;                  los otros 3 se asumen consecutivos:
;                  TL = base
;                  TR = base+1
;                  BL = base+2
;                  BR = base+3
;   bgMetaX      = X en tiles de 16x16
;   bgMetaY      = Y en tiles de 16x16
; Usa:
;   bgCol,bgRow,bgOffLo,bgOffHi
; Llamada:
;   JSR ChangeMetaTile_NoCollision
; -----------------------------------------

ChangeMetaTile_NoCollision:



    ; Convertir coordenadas 16x16 a 8x8:
    ; col8 = metaX * 2
    ; row8 = metaY * 2

    LDA bgMetaX
    ASL A           ; *2
    STA bgCol       ; columna en 8x8

    LDA bgMetaY
    ASL A           ; *2
    STA bgRow       ; fila en 8x8

    ; ---- TOP LEFT (base) ----
    LDA bgTileBaseID
    TAX             ; A se va a usar luego, guardamos base en X temporalmente
    STX bgTileBaseID    ; (por si acaso, mantenemos base en variable)

    ; top-left: (col, row) con tile base
    LDA bgTileBaseID
    LDX bgCol
    LDY bgRow
    JSR SetBGTileAt

    ; ---- TOP RIGHT (base+1) ----
    LDA bgCol
    CLC
    ADC #1
    TAX                     ; col + 1
    LDY bgRow                ; misma fila
    LDA bgTileBaseID
    CLC
    ADC #1                   ; base+1
    JSR SetBGTileAt

    ; ---- BOTTOM LEFT (base+2) ----
    LDA bgCol
    TAX                     ; misma col
    LDA bgRow
    CLC
    ADC #1
    TAY                   ; row + 1
    LDA bgTileBaseID
    CLC
    ADC #2                  ; base+2
    JSR SetBGTileAt

    ; ---- BOTTOM RIGHT (base+3) ----
    LDA bgCol
    CLC
    ADC #1
    TAX                     ; col + 1
    LDA bgRow
    CLC
    ADC #1
    TAY                   ; row + 1
    LDA bgTileBaseID
    CLC
    ADC #3                  ; base+3
    JSR SetBGTileAt

    RTS




; =========================================
; SetBGTileAt
;  Input:
;    A = tile ID
;    X = column (0–31) in 8x8
;    Y = row    (0–29) in 8x8
;  Uses:
;    bgTileID, bgCol, bgRow, bgOffLo, bgOffHi
;  Escribe directamente en $2000 + (row*32 + col)
; =========================================

SetBGTileAt:

    ; Guardar entradas
    STA bgTileID
    STX bgCol
    STY bgRow

    ; offset = 0
    LDA #$00
    STA bgOffLo
    STA bgOffHi

RowLoop:
    LDA bgRow
    BEQ RowsDone

    ; offset += 32
    CLC
    LDA bgOffLo
    ADC #32
    STA bgOffLo

    LDA bgOffHi
    ADC #0
    STA bgOffHi

    DEC bgRow
    JMP RowLoop

RowsDone:
    ; offset += col
    CLC
    LDA bgOffLo
    ADC bgCol
    STA bgOffLo
    ; bgOffHi se mantiene

    ; VRAM address = $2000 + offset
    CLC
    LDA bgOffHi
    ADC #$20
    STA bgOffHi

    ; Escribir en PPU
    LDA bgOffHi
    STA $2006
    LDA bgOffLo
    STA $2006

    LDA bgTileID
    STA $2007

    RTS
