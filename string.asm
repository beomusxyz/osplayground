[org 0x7c00]                      ; Offset memory value to 7x00 
mov ah, 0x0e                      ; :set ah to teletype mode
mov bx, string                    ; set the value of al to the data in the label "stringlabel" 


printstring:
mov al, [bx]                      ; move value from bx (string character from pointer) to al (teletype)
cmp al, 0                         ; check if character is 0
je exit                           ; print character
int 0x10                          ; interrupt to print character
inc bx                            ; increment to next character
jmp printstring                   ; jump to beginning of loop

exit:
jmp $

string:
  db "Hello, World!", 0           ; define bytes in al to the string "Hello, World!" and null terminate

times 510-($-$$) db 0
dw 0xaa55
