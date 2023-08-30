;######################################################;
; Assembler Alphabet demo                              ;
; Author: Beomus                                       ;
; Date: 2023-08-29                                     ;
;######################################################;
; Description: Prints the alphabet using x86 assembly  ;
;#######################################################

; set ah to teletype mode
mov ah, 0x0e
; set al to 65 (ASCII 'A')
mov al, 65
; call BIOS interrupt to print character 
int 0x10

; defining label to loop through alphabet
alphbt:
  inc al                  ; increment al to next letter
  cmp al, 'Z' + 1         ; check if al is the character after 'Z'
  je exit                 ; if al is the character after 'Z' then jump to exit label
  int 0x10                ; call BIOS interrupt to print character
  jmp alphbt              ; jump to alphbt label to continue loop

exit:
jmp $
times 510-($-$$) db 0     ; Define 510 bytes of zeroes to fill boot sector
db 0x55, 0xaa             ; Define last two bytes of boot sector as '55,AA' to indicate this is bootable


