data segment
	xx		db 0dh,40h,20h,7ah,5ah
	numb	db 10 dup(?)
	capi	db 10 dup(?)
	lett	db 10 dup(?)
data ends
code segment
	assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
let0:
	mov ah,1
	int 21h
	cmp al,xx
	jz exit
	test al,xx+1
	jz let1
	test al,xx+2
	jz let2
	cmp al,xx+3
	ja exit
	mov lett[bx],al
	inc bx
	jmp let0
let2:
	cmp al,xx+4
	ja exit
	mov capi[si],al
	inc si
	jmp let0
let1:
	cmp al,'0'
	jb exit
	cmp al,'9'
	ja exit
	mov numb[di],al
	inc di
	jmp let0
exit:
	mov ah,4ch
	int 21h
code ends
end start








