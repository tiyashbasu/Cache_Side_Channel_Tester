00400140 lw $16 0 $29 
00400148 lui $28 4097
00400150 addiu $28 $28 -32032
00400158 addiu $17 $29 4
00400160 addiu $3 $17 4
00400168 sll $2 $16 0x2
00400170 addu $3 $3 $2
00400178 addu $18 $0 $3
00400180 sw $18 -32604 $28 
00400188 addiu $29 $29 -24
00400190 addu $4 $0 $16
00400198 addu $5 $0 $17
004001a0 addu $6 $0 $18
004001a8 jal 00400380
004001b0 sw $0 -32608 $28 
004001b8 addu $4 $0 $16
004001c0 addu $5 $0 $17
004001c8 addu $6 $0 $18
004001d0 jal 004002f8
004001d8 addu $4 $0 $2
004001e0 jal 004003b0
004001e8 nop 
004001f0 addiu $29 $29 -8
004001f8 sw $30 0 $29 
00400200 addu $30 $0 $29
00400208 sw $0 -32584 $28 
00400210 addiu $2 $0 25
00400218 sw $2 -32588 $28 
00400220 sw $0 -32576 $28 
00400228 addiu $2 $0 24
00400230 sw $2 -32568 $28 
00400238 addiu $2 $0 6
00400240 sw $2 -32580 $28 
00400248 lw $2 -32568 $28 
00400250 ori $3 $2 128
00400258 sw $3 -32568 $28 
00400260 addu $29 $0 $30
00400268 lw $30 0 $29 
00400270 addiu $29 $29 8
00400278 jr $31
00400280 addiu $29 $29 -24
00400288 sw $31 20 $29 
00400290 sw $30 16 $29 
00400298 addu $30 $0 $29
004002a0 jal 004001f0
004002a8 lhu $2 -32764 $28 
004002b0 sh $2 -32592 $28 
004002b8 lhu $2 -32760 $28 
004002c0 sh $2 -32572 $28 
004002c8 sb $0 -32640 $28 
004002d0 addu $29 $0 $30
004002d8 lw $31 20 $29 
004002e0 lw $30 16 $29 
004002e8 addiu $29 $29 24
004002f0 jr $31
004002f8 addiu $29 $29 -280
00400300 sw $31 276 $29 
00400308 sw $30 272 $29 
00400310 addu $30 $0 $29
00400318 nop 
00400320 j 00400330
00400328 j 00400348
00400330 jal 00400280
00400338 j 00400348
00400340 j 00400320
00400348 addu $2 $0 $0
00400350 j 00400358
00400358 addu $29 $0 $30
00400360 lw $31 276 $29 
00400368 lw $30 272 $29 
00400370 addiu $29 $29 280
00400378 jr $31