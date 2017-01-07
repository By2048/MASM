data segment
	bunch1  db  'student'
	bunch2  db  'studEnt'
data ends
code segment
	assume cs:code,ds:data,es:data
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	lea si,bunch1
	lea di,bunch2
	cld
	mov cx,7
	repe cmpsb 
	jz let1
	mov dl,'N'
	jmp print
let1:
	mov dl,'Y'
print:
	mov ah,2h
	int 21h
	mov ah,4ch
	int 21h
code ends
	end start


