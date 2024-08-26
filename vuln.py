#!/bin/env python
from shorter import *



print("Disassemble what?")

s = 42
p = syscall(9, 0, s, 2, 33, -1, 0)
syscall(0, 0, c_ulong(p), s)
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
syscall(10, c_ulong(p), s, 4)
void_func(p)()
