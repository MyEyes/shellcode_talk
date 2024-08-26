#include <unistd.h>

int main(int argc, char *argv[])
{
    execve("/bin/sh", (char*[]){"/bin/sh", NULL}, (char*[]){NULL});
}

