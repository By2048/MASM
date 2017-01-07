data segment
    x    db 12,4,55,32,26
    max  db 0
data ends
code segment
    assume cs:code,ds:data
start: mov ax,data
    mov ds,ax
  	mov cx,max-x
  	mov bx,0
let1:
    mov al,x[bx]
    cmp al,max
    jle let2
    mov max,al
let2:
    inc bx
    loop let1
    mov ah,4ch
    int 21h
code ends
     end start

