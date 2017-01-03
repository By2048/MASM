;W=(X+3*Y-45)/Z
data segment
	x dw 48
	y dw -21
	z dw 14
	w dw ?,?
data ends
code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov ax,3
	imul y
	mov bx,ax
	mov cx,dx
	mov ax,x
	cwd	
	add ax,bx
	adc dx,cx
	sub ax,45
	sbb dx,0
	idiv z
	mov w,ax
	mov w+2,dx
	mov ah,4ch
	int 21h
code ends
	end start
	