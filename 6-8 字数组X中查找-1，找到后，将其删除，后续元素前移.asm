data segment
	x dw 2,-4,-1,3,5,6,-8
	n dw $-x
data ends
code segment
	assume cs:code,ds:data,es:data
start: mov ax,data
	mov ds,ax
	mov es,ax
	mov cx,n		
	shr cx,1	
	mov ax,-1
	mov di,offset x
	cld
	repne scasw		
	je dele	
	jmp out1
dele:
	jcxz let1		
rept1:				
	mov ax,x[di]
	mov x[di-2],ax
	add di,2
	loop rept1
let1: 
	sub n,2    
out1:
	mov ah,4ch
	int 21h
code ends
	end start

