.equ MOD, 9

.global main
.text
main:
	push {lr}			//push link register onto the stack
	mov r0, #0			//clear register 0 for oncoming function
	bl time				//load time into register 0
	mov r1, r0, ROR #4	//rotate bits to the right to the right, placing first 4 bits to the front 
	lsr r1, r1, #24		//shift registers to the right 24 bits, clearing most of the register
	mov r4, r1
	
prep:
	mov r5, #7		//load prime number 1
	mov r6, #13		//load prime number 2
	mov r8, #0
	
loop:
	cmp r8, #5
	bgt end
	mul r4, r4, r5
	add r4, r4, r6
	add r8, #1
	
mod:
	mov r0, r4
	mov r1, #MOD
	bl div_mod
	
display:
	push {r0}
	mov r1, r0
	ldr r0, =string
	bl printf
	bal loop
	
end:
	bl light
	pop {pc}

.data
string:	.asciz "%d\n"

.global div_mod
.global time