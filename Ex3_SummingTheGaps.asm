; Exercise 1: Summing the gaps between array elements

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
dwarray dword  0,2,5,9,10
count EQU (LENGTHOF dwarray)
total dword 0
.code
main proc
	
	mov,esi OFFSET dwarray
	
	mov	ecx,count

L1:
	mov	eax,[esi]		; move to eax 
	inc	esi			; increment
	mov	ebx,[esi]		; move to ebx
	sub	ebx,eax		; difference
	add	total,ebx		; adds the two values
	Loop L1
	
	invoke ExitProcess,0
main endp
end main
