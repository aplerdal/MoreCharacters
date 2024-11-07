.gba

.open "mksc.gba", "MoreCharacters.gba", 0x08000000
.include "macro.s"

; Define Free region
.defineregion 0x08400000, 0x400000, 0x00

.include "expandIDs.s"

.include "replaceChar.s"

.include "data.s"

.close