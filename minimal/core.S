/**
* Reference for assembler instructions: https://sourceware.org/binutils/docs/as/index.html
*/

// Set the instructions syntax type
.syntax unified
// Select the target processor
.cpu cortex-m4
// Generate software commands for floating-point calculations, since Cortex-M4
.fpu softvfp
// Enable thumb (ARM Cortex) instructions
.thumb

// Global memory locations. Visible to .ld file
.global my_object
.global default_handler

// my_object variable is a data object type. As explained in:
// https://sourceware.org/binutils/docs/as/Type.html#Type (ELF version)
.type my_object, %object
my_object:
	.word _estack // Add a 4/8 byte value in the program (size depends on target system)
	.word default_handler // Set Reset_Handler address
// Tell the assembler how much space my_object points to
.size my_object, .-my_object // Calculates the total size of my_object and exclude it if it's not used in the program

// MAIN PROGRAM
.type default_handler, %function // Create default_handler of type function
default_handler:
	LDR	sp, =_estack // Set stack pointer to end of stack
	MOV	r1, #0 // Sets #0 to the r0 register
	LDR	r2, =0x000AFFFF // Set 4 bytes to r1
	main_loop:
		ADDS	r1, r1, #1 // Add 1 to r0. If overflow it will go to #0 again
		B	main_loop // Branch (jump) to main loop tag
.size default_handler, .-default_handler
