#include <u.h>
#include <libc.h>
#include <stdint.h>

/*
 * /adm/users is
 *	id:user/group:head member:other members
 *
 * /etc/{passwd,group}
 *	name:x:nn:other stuff
 */

static int isnumber(char *s);

/*
 * Placeholder sniff implementation to satisfy the compiler.
 * Real parsing is not provided in this environment.
 */
static int sniff(Biobuf *b)
{
       USED(b);
       return 0;
}


int
isnumber(char *s)
{
	char *q;

	strtol(s, &q, 10);
	return *q == '\0';
}

/* EOF */
