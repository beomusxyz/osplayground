;######################################################;
; Assembler Alphabet Altcaps demo                      ;
; Author: Beomus                                       ;
; Date: 2023-08-29                                     ;
;######################################################;
; Description: Prints the alphabet using x86 assembly  ;
;#######################################################

mov ah, 0x0e              ; set ah to teletype mode
mov al, 65                ; set al to 65 (ASCII 'A')
int 0x10                  ; call BIOS interrupt to print character 

alphbt:
inc al                    ; increment al
cmp al, 'z' + 1           ; check if al is the character after 'z'
je exit                   ; if so, jumpt ot exit label
XOR al, 32                ; XOR 32 al
int 0x10                  ; Call BIOS interrupt to print character
jmp alphbt                ; jump to alphbt label to continue loop 

exit:
jmp $
times 510-($-$$) db  0    ; Define 510 bytes of zeroes to fill boot sector
db 0x55, 0xaa             ; Define last two bytes of boot sector as '55,AA' to indicate this is bootable
