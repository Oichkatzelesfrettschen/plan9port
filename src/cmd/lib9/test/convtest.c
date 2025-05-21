#include <u.h>
#include <libc.h>
#include <fcall.h>

extern uint convS2M_hdr(Fcall*, uchar*, uint);

void
main(void)
{
    Fcall f;
    uchar hdr[256];
    uchar full[256];
    char data[] = "abc";
    int n1, n2;

    memset(&f, 0, sizeof f);
    f.type = Rread;
    f.tag = 1;
    f.count = sizeof(data)-1;
    f.data = data;

    n1 = convS2M_hdr(&f, hdr, sizeof hdr);
    n2 = convS2M(&f, full, sizeof full);

    if(n1 != n2)
        sysfatal("size mismatch");
    print("ok\n");
}
