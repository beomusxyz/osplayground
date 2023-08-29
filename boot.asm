;######################################################;
; Assembler Alphabet demo                              ;
; Author: Beomus                                       ;
; Date: 2023-08-29                                     ;
;######################################################;
; Description: Prints the alphabet using x86 assembly  ;
;#######################################################

; set ah to teletype mode
mov ah, 0x0e
; set al to 0x41 (ASCII 'A')
mov al, 0x41
; call BIOS interrupt to print character 
int 0x10

; defining label to loop through alphabet
alphbt:
  ; increment al to next letter
  inc al
  ; check if al is the character after 'Z'
  cmp al, 0x5b
  ; if al is the character after 'Z' then jump to exit label
  je exit
  ; call BIOS interrupt to print character
  int 0x10
  ; jump to alphbt label to continue loop
  jmp alphbt

exit:
jmp $
; Define 510 bytes of zeroes to fill boot sector
times 510-($-$$) db 0
; Define last two bytes of boot sector as '55,AA' to indicate this is bootable
db 0x55, 0xaa


