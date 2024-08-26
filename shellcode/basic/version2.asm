BITS 64
DEFAULT REL
dummy:
mov rax, 59
lea rdi, [sh]
push 0
mov rdx, rsp
push rdi
mov rsi, rsp
syscall
sh:
db "/bin/sh",0