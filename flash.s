.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.equ PIN0, 0	// wipi pin 0 - bcm 17
.equ PIN1, 1	// wipi pin 1 - bcm 18
.equ PIN2, 2	// wipi pin 2 - bcm 27
.equ PIN3, 3	// wipi pin 3 - bcm 22
.equ PIN4, 4	// wipi pin 4 - bcm 23
.equ PIN5, 5	// wipi pin 5 - bcm 24
.equ PIN6, 6	// wipi pin 6 - bcm 25
.equ PIN7, 7	// wipi pin 7 - bcm 4

.global light
light:
	push {lr}
	bl wiringPiSetup

	pop {r0}
	mov r1, #OUTPUT
	bl pinMode

	pop {r0}
	mov r1, #OUTPUT
	bl pinMode

	pop {r0}
	mov r1, #OUTPUT
	bl pinMode

	pop {r0}
	mov r1, #OUTPUT
	bl pinMode

	pop {r0}
	mov r1, #OUTPUT
	bl pinMode

	pop {r0}
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #255
	bl digitalWriteByte

	pop {pc}