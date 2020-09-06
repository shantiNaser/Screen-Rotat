include inout.asm
.model small,c
.486
.stack 20h
.data
X dw 80 dup(0)
Y dw 1840 dup(0)
.code
rororot proc
uses ecx
locals
mov ecx ,9900000
@@0200:
nop
loop @@0200
ret
endp rororot

.startup
push 0b800h
pop es
; Vga buffer
xor di,di
mov cx,80*25
; the size of screen 
mov al," " 
mov ah,01ch
rep stosw
xor di,di
mov bx,25
mov di,160
mov al,"a"
mov ah,01bh
again:mov cx,80
rep stosw
inc al
dec bx
cmp bx,0
jne again
mov dx,70
next1:
;------------
xor di,di
add di ,160
mov cx,80
mov si,offset x
next:

mov ax,es:[di]
mov [si],ax
add si,2
add di,2
loop next

xor si,si
xor di,di
mov di,160*2
mov si,offset y
mov cx,23*80
nnu:
mov ax,es:[di]

mov [si],ax
add si,2
add di,2
loop nnu
;-----------
xor di,di
mov si, offset x
add di,160*24
mov cx,80
mov ax,[si]
add si,2
rep stosw
xor di,di
xor si,si
mov si, offset y
add di,160
mov cx,80*23
mn:mov ax,[si]
add si,2
 stosw
loop mn
dec dx
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
call rororot
cmp dx,0
jne next1


.exit
end

