; ============================================================
; ChangeTileFry2  (COLUMN 3: c13,c23,c33,c43,c53)
; ============================================================

    LDA fryLock3
    BNE +skipFry3
    JMP DoFry3

+skipFry3:
    RTS

DoFry3:
    LDA #$01
    STA fryLock3

ChangeTileFry2:

    LDA currentNametable
    AND #%00000001
    STA temp          ; nametable bit

    ; ----- c13 -----
    LDA c13
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0A, #$05, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c23 -----
    LDA c23
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0A, #$07, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c33 -----
    LDA c33
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0A, #$09, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c43 -----
    LDA c43
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0A, #$0B, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c53 -----
    LDA c53
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0A, #$0D, tempTile, #$00, temp
    JSR doWaitFrame

    RTS
