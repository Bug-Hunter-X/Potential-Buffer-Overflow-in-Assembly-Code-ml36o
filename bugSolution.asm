mov ecx, [buffer_size]
; Check if ecx is zero to prevent division by zero
cmp ecx, 0
je zero_size_handler
mov edx, 0
mov eax, ecx ;store size in eax
idiv DWORD PTR 4 ;Check if buffer_size is dividable by 4
;If not there is an error
cmp edx, 0
jne error_handler
mov eax, [ebx+ecx*4]
jmp after_check
zero_size_handler:
;Handle the case if the buffer size is 0
jmp after_check
error_handler:
;Handle the case if the buffer size is not dividable by 4
jmp after_check
after_check: