#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>

/*
 * Echo command rewritten using standard C17 libraries.
 * Behaves similarly to the original Plan 9 implementation.
 */
int
main(int argc, char *argv[])
{
        bool nflag = false;            /* suppress trailing newline? */
        int i;
        int len = 1;                   /* space for final newline/terminator */
        char *buf;
        char *p;

        if(argc > 1 && strcmp(argv[1], "-n") == 0)
                nflag = true;

        for(i = 1 + nflag; i < argc; i++)
                len += (int)strlen(argv[i]) + 1;

        buf = malloc((size_t)len);
        if(buf == NULL)
                return EXIT_FAILURE;
        p = buf;
        for(i = 1 + nflag; i < argc; i++){
                strcpy(p, argv[i]);
                p += strlen(p);
                if(i < argc - 1)
                        *p++ = ' ';
        }

        if(!nflag)
                *p++ = '\n';

        if(write(STDOUT_FILENO, buf, p - buf) < 0)
                perror("echo");

        free(buf);
        return EXIT_SUCCESS;
}
