data segment	
	x 		dw 0
	mess1 	db 0dh,0ah,'input dec=$'
	mess2 	db 0dh,0ah,'out hex=$'
	hex 	db '0123456789ABCDEF'
data ends

code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax

let0 proc far
	mov x,0
	mov dx,offset mess1
	mov ah,9
	int 21h
	call let1
	call let2
	jmp let0

let1 proc near
	mov ah,1
	int 21h
	cmp al,27
	jz out1
	sub al,30h
	jl exit
	cmp al,9
	jg exit
	mov ah,0
	xchg ax,x
	mov cx,10
	mul cx
	add x,ax
	jmp let1
	exit:ret
let1 endp

let2 proc near
	mov dx,offset mess2
	mov ah,9
	int 21h
	mov bx,x
	mov ch,4
	mov cl,4
 rept1:
	rol bx,cl
	mov ax,bx
	and ax,000fh
	mov si,ax
	mov dl,hex[si]
	mov ah,2
	int 21h
	dec ch
	jnz rept1
	ret
let2 endp

out1:
	mov ah,4ch
	int 21h
	
let0 endp
code ends
	end start
