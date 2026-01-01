; ============================================================
; ChangeTileFry  (COLUMN 2: c11,c21,c31,c41,c51)
; ============================================================

    LDA fryLock1
    BNE +skipShort     ; SHORT JUMP (some bytes)
    JMP DoFry1         ; Large jump for big body

+skipShort:
    RTS                ; if fryLock1 != 0, nothing is done

DoFry1:
    ; marked that column was executed
    LDA #$01
    STA fryLock1

ChangeTileFry:

    LDA currentNametable
    AND #%00000001
    STA temp          ; nametable bit

    ; ---------- CELL c11 ----------
	LDA c11          ; index 0..4
	JSR GetTileForCellIndex
	STA tempTile
	ChangeTileAtPosition #$06, #$05, tempTile, #$00, temp
	
	JSR doWaitFrame
	
    ; ---------- CELL c21 ----------
    LDA c21
	JSR GetTileForCellIndex
	STA tempTile
    ChangeTileAtPosition #$06, #$07, tempTile, #$00, temp
	JSR doWaitFrame
	ChangeTileAtPosition #$06, #$08, tempTile, #$00, temp
    ; ---------- CELL c31 ----------
    LDA c31
	JSR GetTileForCellIndex
	STA tempTile
    ChangeTileAtPosition #$06, #$09, tempTile, #$00, temp
	JSR doWaitFrame
    ; ---------- CELL c41 ----------
    LDA c41
	JSR GetTileForCellIndex
	STA tempTile
    ChangeTileAtPosition #$06, #$0B, tempTile, #$00, temp
	JSR doWaitFrame
    ; ---------- CELL c51 ----------
    LDA c51
	JSR GetTileForCellIndex
	STA tempTile
    ChangeTileAtPosition #$06, #$0D, tempTile, #$00, temp
	JSR doWaitFrame

    RTS
