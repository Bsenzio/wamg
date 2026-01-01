; ============================================================
; ChangeTileFry1  (COLUMN 2: c12,c22,c32,c42,c52)
; ============================================================

    LDA fryLock2
    BNE +skipFry2
    JMP DoFry2

+skipFry2:
    RTS

DoFry2:
    LDA #$01
    STA fryLock2

ChangeTileFry1:

    LDA currentNametable
    AND #%00000001
    STA temp          ; nametable bit


    ; ----- c12 -----
    LDA c12
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$08, #$05, tempTile, #$00, temp
    JSR doWaitFrame
	;ChangeTileAtPosition #$08, #$06, tempTile, #$00, temp
	
    ; ----- c22 -----
    LDA c22
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$08, #$07, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c32 -----
    LDA c32
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$08, #$09, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c42 -----
    LDA c42
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$08, #$0B, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c52 -----
    LDA c52
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$08, #$0D, tempTile, #$00, temp
    JSR doWaitFrame

    RTS



