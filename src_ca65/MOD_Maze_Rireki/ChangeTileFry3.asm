; ============================================================
; ChangeTileFry3  (COLUMN 4: c14,c24,c34,c44,c54)
; ============================================================

    LDA fryLock4
    BNE +skipFry4
    JMP DoFry4

+skipFry4:
    RTS

DoFry4:
    LDA #$01
    STA fryLock4

ChangeTileFry3:

    LDA currentNametable
    AND #%00000001
    STA temp          ; nametable bit

    ; ----- c14 -----
    LDA c14
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0C, #$05, tempTile, #$00, temp
    JSR doWaitFrame
	;ChangeTileAtPosition #$0C, #$06, tempTile, #$00, temp

    ; ----- c24 -----
    LDA c24
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0C, #$07, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c34 -----
    LDA c34
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0C, #$09, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c44 -----
    LDA c44
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0C, #$0B, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c54 -----
    LDA c54
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0C, #$0D, tempTile, #$00, temp
    JSR doWaitFrame

    ; --- Regla GoL columna 4 ---
    ;JSR GoL_IterateCol4

    RTS
