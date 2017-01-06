data segment
	x	db -6
	y 	dw ?
	cc 	db 0ah,0dh,'Y=$'
data ends
code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov al,5
	imul x
	sub ax,18
	jns let0
	neg ax
let0:	
	mov y,ax
	mov cx,0
	mov bx,10
let1:
	mov dx,0
	inc cx
	idiv bx
	push dx
	cmp ax,0
	jnz let1
	mov dx,offset cc
	mov ah,9
	int 21h
let2:
	pop ax
	add ax,0030h
	mov dl,al
	mov ah,2
	int 21h
	dec cx
	cmp cx,0
	jnz let2
	mov ah,4ch
	int 21h		
code ends
end start