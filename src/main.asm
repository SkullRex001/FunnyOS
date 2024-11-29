ORG 0x7C00			;tells the assembler to calc adress relative0x7C00 for the BIOS to find the data
BITS 16				;for backward compatibility we must start is16 bit mode



main:
	HLT 			;pause the cpu from doing anything, we want to pause the CPU until the special type of interrupt occurs on the system

halt:
	JMP halt		;if somehow halt get bypassed,CPU will be stuck in INFINIT loop

				;we are assuming that every block of data from the device which we are booting from is 512mb, to mimic a floopy drive

				;we need to get to the last to bytes of the first block  and place the boot signature,so our device can be bootable

TIMES 510-($-$$) DB 0 		;TIMES instruction does the given instruction that many times
				;($-$$) it give the amount of bytes our code has taken till now
				;510-($-$$) gives the amount of bytes we want to skip to get to the last to bite to write the boot signature
				;We don't actually skip those bytes, we write 0 in those bytes to get to the last two bytes


DW 0xAA55			;it write the boot signature to the last word 
