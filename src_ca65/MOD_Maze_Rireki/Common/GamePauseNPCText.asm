    ; ==========================
    ; GAME PAUSE
    ; ==========================

    LDA isPaused
    BNE +unpausegame

        ; --- Do not pause if game active ---
        LDA npcTrigger     ; <<< New
        BNE +thePauseEnd   ; <<< New

        LDA gameStatusByte
        ORA #%00000001     ; this will skip object handling.
        STA gameStatusByte
        LDA #$01
        STA isPaused
        
        ;; we play the pause sfx:
        PlaySound #sfx_woot
        
        ;; we make the screen dark:
        LDA soft2001
        ORA #%11100000
        STA soft2001
        JMP +thePauseEnd

+unpausegame:
        LDA gameStatusByte
        AND #%11111110 
        STA gameStatusByte
        LDA #$00
        STA isPaused
        
        ;; we play the unpause sfx:
        PlaySound #sfx_thump
        
        ;; we make the screen back normal:
        LDA soft2001
        AND #%00011111
        STA soft2001

+thePauseEnd:
    ;; IF Main Game and Paused... then draw P A U S E
    LDA gameState
    CMP #$00
    BEQ +
    JMP +isNotPaused
+
    LDA isPaused
    BNE +
    JMP +isNotPaused
+
    ;; LETTRE "P":
    LDA #$50
    STA tempA
    DrawSpriteHud #$80, #$80, tempA, #$01, tempA, #$01, #$00
    ;; LETTRE "A":
    ;LDA #$71
    ;STA tempA
    ;DrawSpriteHud #$76, #$78, tempA, #$01, tempA, #$01, #$00
    ;; LETTRE "U":
    ;LDA #$72
    ;STA tempA
    ;DrawSpriteHud #$80, #$78, tempA, #$01, tempA, #$01, #$00
    ;; LETTRE "S":
    ;LDA #$73
    ;STA tempA
    ;DrawSpriteHud #$8A, #$78, tempA, #$01, tempA, #$01, #$00
    ;; LETTRE "E":
    ;LDA #$74
    ;STA tempA
    ;DrawSpriteHud #$94, #$78, tempA, #$01, tempA, #$01, #$00

+isNotPaused:
    RTS
