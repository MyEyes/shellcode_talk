BITS 64
DEFAULT REL
dummy:
mov rax, 59
lea rdi, [sh]
mov [ad], rdi
lea rsi, [ad]
lea rdx, [ad+8]
syscall
ad:
dq 0
dq 0
sh:
db "/bin/sh",0