data segment
	strg1  db  '1234567890'
data ends
extra segment
	strg2 db 10 dup(?)
extra ends
code segment
	assume cs:code,ds:data,es:extra
start:
	mov ax,data
	mov ds,ax
	mov ax,extra
	mov es,ax
	lea si,strg1
	lea di,strg2
	cld
	mov cx,10
	rep movsb 
	mov ah,4ch
	int 21h
code ends
	end start


