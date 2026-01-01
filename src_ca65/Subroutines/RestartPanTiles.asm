;Restarting Grid Condition
LDA #0
STA fryLock1
STA fryLock2
STA fryLock3
STA fryLock4
STA fryLock5

WarpToScreen warpToMap, warpToScreen, #$01

	