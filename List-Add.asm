; List Add
data segment
    list dw 1,1,2,2,3,3,4,4,5,5    
    sum dw ?
data ends
code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    mov cx,10 	 ; ѭ������
    lea bx,list  ; ��ȡlist��ƫ�Ƶ�ַ
    mov ax,0  	 ; �ۼӺ�
lop:
    add ax,ds[bx]  ; ax=ax+list[i]
    add bx,2      
    loop lop	   ; cx=cx-1
    mov sum,ax
    mov ah,4ch
    int 21h
code ends
end start
