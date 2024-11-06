.thumb
// long jump thumb macro
.macro jmpt,reg,dest
    ldr reg, =(org(dest)+1)
    bx reg
    .pool
.endmacro