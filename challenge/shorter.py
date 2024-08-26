from subprocess import Popen, PIPE
import ctypes
import re
import sys
libc = ctypes.CDLL(None)
c_ulong = ctypes.c_ulong
syscall = libc.syscall
syscall.argtypes = [c_ulong]
syscall.restype = c_ulong
void_func = ctypes.CFUNCTYPE(None)

PROT_READ = 0x1
PROT_WRITE = 0x2
PROT_EXEC = 0x4
MAP_SHARED = 0x01
MAP_PRIVATE = 0x02
MAP_ANONYMOUS = 0x20

mmap = libc.mmap
mmap.restype = c_ulong
read = libc.read
mprotect = libc.mprotect