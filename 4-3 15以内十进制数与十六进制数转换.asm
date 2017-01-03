data segment
	table	db 30h,31h,32h,33h,34h,35h,36h,37h
			db 38h,39h,41h,42h,43h,44h,45h,46h
	x		db 13
	ascii	db ?
data ends
code segment
	assume cs:code,ds:data
begin:
	mov ax,data
	mov ds,ax
	mov bl,x
	mov bh,0
	mov al,table[bx]
	mov ascii,al
	mov dl,al
	mov ah,02h
	int 21h
	mov ah,4ch
	int 21h
code ends
	end begin