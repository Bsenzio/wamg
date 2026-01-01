RowTiles:
    .byte $C0, $CA, $C8, $C4, $CE

; ============================================
; InitLifeGrid
; ============================================
InitLifeGrid:
;PlaySound #sfx_kerchunk
; ---------------------------------
; Lock: if already ran, no execution
; ---------------------------------
LDA initLock
BNE +startShort     ; Short jump (some bytes)
JMP startGrid         ; jumpover big body

+startShort:
    RTS                ; if fryLock1 != 0, nothing is done

startGrid:

	LDA #1
	STA initLock

    LDA lifeInitialized
    BNE InitDone      ; if initialized, exit

    ; Clamp vegCount max 25
    LDA vegCount
    CMP #LIFE_CELL_COUNT
    BCC +okVeg
        LDA #LIFE_CELL_COUNT
        STA vegCount
+okVeg:

    ; lifeIdx = 0 -> placed veggie counter
    LDA #$00
    STA lifeIdx

PlaceVeggiesLoop:
    LDA lifeIdx
    CMP vegCount
    BEQ +placedAll      ; all veggies are set

    JSR PlaceOneVeggieRandom

    INC lifeIdx
    JMP PlaceVeggiesLoop

+placedAll:
    LDA #$01
    STA lifeInitialized

InitDone:
    RTS
 
 