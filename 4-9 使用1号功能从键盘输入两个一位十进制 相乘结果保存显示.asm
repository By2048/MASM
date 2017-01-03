.model small
.data
	x db ?,?
	infor db 'input:','$'
.stack 100h
.code
start:
	mov ax,@data
	mov ds,ax
	mov dx,offset infor
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	sub al,30h
	mov bl,al
	mov dl,2ah
	mov ah,2
	int 21h
	mov ah,1
	int 21h
	sub al,30h
	mov ah,0
	mul bl
	aam
	mov x,al
	mov x+1,ah
	add ax,3030h
	mov bx,ax
	mov ah,2
	mov dl,3dh
	int 21h
	mov dl,bh 
	int 21h
	mov dl,bl
	int 21h
	mov ah,4ch
	int 21h
end start