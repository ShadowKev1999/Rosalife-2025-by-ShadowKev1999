// built-in include guard removal
// just in case the user has a local dependency with the same file name
#if defined _inc_tick_difference
    #undef _inc_tick_difference
#endif
// custom include-guard to ensure we don't duplicate
#if defined _tick_difference_included
	#endinput
#endif
#define _tick_difference_included

stock GetTickCountDifference(newtick, oldtick) {
	if (oldtick < 0 && newtick >= 0) {
		return newtick - oldtick;
	} else if (oldtick >= 0 && newtick < 0 || oldtick > newtick) {
		return (cellmax - oldtick + 1) - (cellmin - newtick);
	}

	return newtick - oldtick;
}