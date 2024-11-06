// ExpandIds expands the available character IDs.

; Make bomb use bit 0x80 instead of 0x08
.org 0x0805B012 :: .byte 0x80
.org 0x0803CEBC :: .byte 0x80
.org 0x0803CF42 :: .byte 0x80
.org 0x0803C75A :: .byte 0x80
.org 0x0803D220 :: .byte 0x80
.org 0x080413F2 :: .byte 0x80
.org 0x0804114C :: .byte 0x80
.org 0x0804E840 :: .byte 0x80
.org 0x0804E866 :: .byte 0x80
.org 0x0803F4D6 :: .byte 0x80
.org 0x0803F9A6 :: .byte 0x80
.org 0x0803E9BA :: .byte 0x80
.org 0x08043748 :: .byte 0x80
.org 0x080435DC :: .byte 0x80

; Check character and with 0x3f instead of 0x07
;.org 0x0803C1D8 :: .byte 0x3F ; Top speed? Some handing stuff.
;.org 0x0803C20A :: .byte 0x3F ; Acceleration? 
;.org 0x0803C254 :: .byte 0x3F ; Friction? Kart is slidey without
.org 0x0803C2B8 :: .byte 0x3F ; Something with turning. Maybe turn radius?
.org 0x08049166 :: mov r3, #0x3f :: mov r8, r3 ; idk why this works but it does so I won't complain
.org 0x080491B6 :: .byte 0x3F
.org 0x08049294 :: .byte 0x3F
.org 0x0804932C :: .byte 0x3F
.org 0x0804951C :: .byte 0x3F
.org 0x0803C930 :: .byte 0x3F
.org 0x0803CF52 :: .byte 0x3F
.org 0x080507F8 :: .byte 0x3F
.org 0x0803817E :: .byte 0x3F
.org 0x080388B0 :: .byte 0x3F
.org 0x0804149A :: .byte 0x3F
.org 0x080414F2 :: .byte 0x3F
.org 0x08041520 :: .byte 0x3F
.org 0x08041614 :: .byte 0x3F
.org 0x08041466 :: .byte 0x3F
.org 0x08040DA8 :: .byte 0x3F
.org 0x080431D4 :: .byte 0x3F
.org 0x0803BD80 :: .byte 0x3F
.org 0x08041278 :: .byte 0x3F
.org 0x08001C3C :: .byte 0x3F
.org 0x0803AB98 :: .byte 0x3F
.org 0x0805AA34 :: .byte 0x3F
.org 0x0805A934 :: .byte 0x3F
.org 0x0801D312 :: .byte 0x3F
.org 0x0801E9E0 :: .byte 0x3F
.org 0x0801DD7E :: .byte 0x3F
.org 0x0801EDB6 :: .byte 0x3F
.org 0x0801E0FE :: .byte 0x3F
.org 0x0805CDC2 :: .byte 0x3F
.org 0x08001CCA :: .byte 0x3F
.org 0x0804157E :: .byte 0x3F
.org 0x0803E3B8 :: .byte 0x3F
.org 0x0803A2EC :: .byte 0x3F
.org 0x0802790C :: .byte 0x3F
.org 0x08027A36 :: .byte 0x3F
.org 0x08028BD8 :: .byte 0x3F
.org 0x08028BE0 :: .byte 0x3F