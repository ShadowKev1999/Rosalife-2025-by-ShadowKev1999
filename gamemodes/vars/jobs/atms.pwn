#define MAX_ATMS			(50)
#define ATM_OBJECT_MODEL	(19324)
#define ATM_DEFAULT_MONEY	(10000)

enum ATMData
{
	bool:atmCreated,
	Float:atmPos_X,
	Float:atmPos_Y,
	Float:atmPos_Z,
	Float:atmRPos_X,
	Float:atmRPos_Y,
	Float:atmRPos_Z,
	atmGeld,
	atmKaputt,
	atmRauch,
	atmObj,
	Text3D:atmLabel,
	bool:atmInterior
};

new ATMInfo[MAX_ATMS][ATMData],
	playerAtmDialogHelper[MAX_PLAYERS][MAX_ATMS],
	EditingATMID[MAX_PLAYERS] = {-1, ...};