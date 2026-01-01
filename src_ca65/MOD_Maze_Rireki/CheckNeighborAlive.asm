; X = neighbor index
CheckNeighborAlive:
    LDA LifeCellsArray,X
    CMP #LIFE_EMPTY_INDEX
    BEQ NeighborDead

    INC neighborCnt

NeighborDead:
    RTS
; Array for CountNeighborsForCell
LifeCellsArray:
    .byte c11, c12, c13, c14, c15
    .byte c21, c22, c23, c24, c25
    .byte c31, c32, c33, c34, c35
    .byte c41, c42, c43, c44, c45
    .byte c51, c52, c53, c54, c55
