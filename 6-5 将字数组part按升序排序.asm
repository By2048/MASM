data segment
	part 	dw 15,32,6,-27,8
	sign  	dw  ?
data ends
code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov cx,sign-part		
	shr cx,1			
	dec cx
loop1:push cx			
	mov bx,0
loop2:mov ax,part[bx]
	cmp ax,part[bx+2]
	jle next			
	xchg ax,part[bx+2]		
	mov part[bx],ax
next:add bx,2
	loop loop2
	pop cx		
	loop loop1
	mov ah,4ch
	int 21h
code ends
	end start


