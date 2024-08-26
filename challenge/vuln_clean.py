#!/bin/env python3
from shorter import *



print("Disassemble what?")

s = 42
p = mmap(0, s, PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0)
read(0, c_ulong(p), s)
c = ctypes.cast(p, ctypes.POINTER(ctypes.c_char))

proc = Popen(args=['ndisasm', '-b64', '-'], stdin=PIPE, stdout=PIPE, stderr=PIPE)
out,err = proc.communicate(c[:s])
lines = out.split(b"\n")
for line in lines:
    print(line.decode())
    if re.findall(b"syscall|sysenter|int|0x3b", line):
        print("no hax pls")
        sys.exit(-1)


print("Looks safe.")
mprotect(c_ulong(p), s, PROT_EXEC)
void_func(p)()
