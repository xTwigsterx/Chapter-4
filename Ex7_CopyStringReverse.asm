; Exercise 2: Copy a String in Reverse Order

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
source  BYTE  "This is the source string",0
target  BYTE  SIZEOF source DUP('#')

.code
main PROC
; Point ESI to the last character in the source string:

; Point EDI to the beginning of the target string:
; We do not copy the null terminator byte.

	mov	esi,SIZEOF source	;index register
	mov	ecx,SIZEOF source	;loop counter
L1:
	mov	a1,source[esi]		;get a character from source
	mov	target[esi],a1		;store it in the target
	dec	esi				;goes backwards to next character
	loop	L1				;repeat loop for entire string

	mov	BYTE PTR [edi],0			; add a null byte to the target

	Invoke ExitProcess,0
main ENDP
END main
