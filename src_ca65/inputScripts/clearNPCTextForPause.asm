; NPC box trigge reconfiguration after pause
; Necessary to ensure proper game execution for boxes
LDA npcTrigger
BEQ +exitNPCClear

LDA #$00
STA npcTrigger
RTS

+exitNPCClear:
RTS