#define MAX_KIOSKS                          (10)

enum NewsKiosk
{
	SlotUsed,
	dbID,
	Float:nkX,
	Float:nkY,
	Float:nkZ,
	nkPickup,
	Text3D:nkLabel,
	ZeitungAmount,
	Ersteller,
}
new NewsPaperKiosk[MAX_KIOSKS][NewsKiosk];