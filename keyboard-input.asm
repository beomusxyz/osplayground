;##################################################;
; Admission of great shame:                        ;     
; This is broken, it gets stuck in an infinite loop;
; but only on some characters, i think it might be ;
; beause of something with odd ASCII decimal values;
; bit in truth i have no idea why it does this.    ;
; if you can can fix it, send a pull request and   ;
; end my suffering.                                ;
;###################################################;



[org 0x7c00]                    ; Offset memory value to 7x00 

char db 0                      ; define a byte variable with value 0
mov ah, 0                      ; set ah to 0 to wait for key press
int 0x16                       ; call 0x16 BIOS interrupt (take keyboard input)

mov [char], al                  ; move the value of char into al        
jmp print                      ; jump to print

print:    
mov ah, 0x0e                    ; set ah to 0x0e to print the character in al
int 0x10                        ; call 0x10 BIOS interrupt (print character in al)
jmp char                        ; jump to char

times 510-($-$$) db 0
db 0x55, 0xaa
