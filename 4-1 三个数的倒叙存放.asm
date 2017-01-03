data segment
	x dw 12,34,56
	y dw 3 dup(?)
data ends
code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	push x
	push x+2
	push x+4
	pop y
	pop y+2
	pop y+4
	mov ah,4ch
	int 21h
code ends
end start