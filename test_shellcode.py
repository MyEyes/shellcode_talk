#!/bin/env python
from shorter import *

s = 4096
p = mmap(0, s, PROT_WRITE|PROT_READ|PROT_EXEC, MAP_SHARED|MAP_ANONYMOUS, -1, 0)
read(0, c_ulong(p), s)
c = ctypes.cast(p, ctypes.POINTER(ctypes.c_char))

#mprotect(c_ulong(p), s, PROT_EXEC)
void_func(p)()
