; ============================================================
; ChangeTileFry4  (COLUMN 5: c15,c25,c35,c45,c55)
; ============================================================

    LDA fryLock5
    BNE +skipFry5
    JMP DoFry5

+skipFry5:
    RTS

DoFry5:
    LDA #$01
    STA fryLock5

ChangeTileFry4:

    LDA currentNametable
    AND #%00000001
    STA temp          ; nametable bit

    ; ----- c15 -----
    LDA c15
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0E, #$05, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c25 -----
    LDA c25
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0E, #$07, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c35 -----
    LDA c35
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0E, #$09, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c45 -----
    LDA c45
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0E, #$0B, tempTile, #$00, temp
    JSR doWaitFrame

    ; ----- c55 -----
    LDA c55
    JSR GetTileForCellIndex
    STA tempTile
    ChangeTileAtPosition #$0E, #$0D, tempTile, #$00, temp
    JSR doWaitFrame


    RTS
