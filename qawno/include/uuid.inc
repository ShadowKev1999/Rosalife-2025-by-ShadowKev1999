#if defined _inc_uuid
    #undef _inc_uuid
#endif

#if defined _uuid_included
	#endinput
#endif
#define _uuid_included

#define UUID_LEN 37

native UUID(dest[]);