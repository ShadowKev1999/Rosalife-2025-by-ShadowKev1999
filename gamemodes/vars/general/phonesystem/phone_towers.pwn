#define MAX_MASTEN                      20
#define MAX_TMASTENPRICE				25000
#define MAX_TMASTENRANGE                600

enum E_FMASTEN_INFO
{
	ID,
	ObjectID,
	Float:sperreX,
	Float:sperreY,
	Float:sperreZ,
	Erstellt,
	EGmBhHp,
	EGmBhTstamp,
	EGmBhMastenZone,
	EGmBhRubbishObject
}

new FMastenInfo[MAX_MASTEN][E_FMASTEN_INFO];