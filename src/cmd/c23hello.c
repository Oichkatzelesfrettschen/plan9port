#include <stdio.h>
#include <stdint.h>

int main(void) {
    static_assert(sizeof(int) == 4, "int must be 4 bytes on x86");
    puts("hello from C23");
    return 0;
}
