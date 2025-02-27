enum GaragenData {
	giBesitzer[24],
	bool:giErstellt,
 	giPickup,
  	Text3D:giText,
	giPreis,
	giOrt,
	giLocked,
	giMietbar,
	giMiete,
	giFahrzeug[10],
	Float:giPos_X,
	Float:giPos_Y,
	Float:giPos_Z,
	Float:giOPos_X,
	Float:giOPos_Y,
	Float:giOPos_Z,
	Float:giOPos_A
}
new GaragenInfo[MAX_GARAGEN][GaragenData];