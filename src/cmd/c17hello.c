#include <assert.h>
#include <stdint.h>
#include <stdio.h>

/*
 * Minimal program used to verify that the toolchain
 * supports the C17 standard.
 */
int main(void)
{
    static_assert(sizeof(int) == 4, "int must be 4 bytes on x86");
    puts("hello from C17");
    return 0;
}
