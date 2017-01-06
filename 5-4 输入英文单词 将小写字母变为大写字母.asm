data segment
	mess1	db 0ah,0dh,'input : $'
	mess2	db 0ah,0dh,'output : $'
	buff	db 10,?,10 dup(?)
data ends
code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
prog1:
	mov dx,offset mess1
	mov ah,9
	int 21h
	mov dx,offset buff
	mov ah,10
	int 21h
	mov cl,buff+1
	mov bx,2
	mov dx,offset mess2
	mov ah,9
	int 21h
let1:
	and buff[bx],0dfh
	mov dl,buff[bx]
	mov ah,2
	int 21h
	inc bx
	dec cl
	jnz let1
	mov ah,4ch
	int 21h
code ends
end start
	