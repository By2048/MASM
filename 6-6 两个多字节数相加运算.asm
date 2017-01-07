data segment
    x   db  34h,56h,22h,33h,44h,11h,88h,54h
    y   db  31h,52h,64h,83h,47h,75h,99h,34h
    n   equ $-y
    z   db n dup(?)
data ends
code segment
    assume cs:code,ds:data
start: mov ax,data
    mov ds,ax
    mov cx,n
    mov bx,0
    clc
let1:
    mov al,x[bx]  
    adc al,y[bx]
    mov z[bx],al
    inc bx
    loop let1
    mov ah,4ch
    int 21h
code ends
    end start

