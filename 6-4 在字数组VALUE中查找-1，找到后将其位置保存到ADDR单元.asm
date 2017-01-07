extra segment
	value 	dw  1,2,0,3,5,-1,10
	addr 	dw  ?
extra ends
code segment
	assume cs:code,es:extra
start:
	mov ax,extra
	mov es,ax
	mov ax,-1
	lea di,value
	cld
	mov cx,7
	repnz scasw
	sub di,2
	mov addr,di
	mov ah,4ch
	int 21h
code ends
	end start


