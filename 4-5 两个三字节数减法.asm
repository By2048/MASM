data segment
	x db 34h,0dh,22h
	y db 4ch,58h,14h
	z db ?,?,?
data ends
code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov al,x[0]
	sub al,y[0]
	mov ah,x[1]
	sbb ah,y[1]
	mov dl,x[2]
	sbb dl,y[2]
	mov z[0],al
	mov z[1],ah
	mov z[2],dl
	mov ah,4ch
	int 21h
code ends
	end start