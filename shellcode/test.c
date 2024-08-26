#include <sys/mman.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <syscall.h>
#include <fcntl.h>
#include <unistd.h>

#define PAGE_SIZE 4096
#define perror_out(s) do{perror(s); exit(-1);}while(0)

int main(int argc, char *argv[])
{
    char* mapped = mmap(0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
    int fd = open(argv[1], O_RDONLY);
    if(fd<0)
        perror_out("open");
    if(read(fd, mapped, PAGE_SIZE)<0)
        perror_out("read");
    ((void (*)())mapped)();
}
