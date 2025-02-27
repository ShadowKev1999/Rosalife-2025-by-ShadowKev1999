#include <acuf>

#define INVALID_TUNING_ID -1
#define INVALID_TUNINGMENU_ID -1
#define TUNINGMENU_POSX 450.0
#define TUNINGMENU_POSY 150.0

//Reparaturpreis
#define PREIS_MOTOR 150
#define PREIS_FDOOR_R 150
#define PREIS_FDOOR_E 250
#define PREIS_HDOOR_R 150
#define PREIS_HDOOR_E 250
#define PREIS_HAUBE_R 150
#define PREIS_HAUBE_E 250
#define PREIS_KOFFER_R 150
#define PREIS_KOFFER_E 250
#define PREIS_FGLASS 150
#define PREIS_FBUMPER_R 150
#define PREIS_FBUMPER_E 150
#define PREIS_HBUMPER_R 150
#define PREIS_HBUMPER_E 150
#define PREIS_WHEEL 50
#define PREIS_LAMP 50

//Tuningpreis
#define PREIS_COLOR1 		150 //x
#define PREIS_COLOR2 		150 //x
#define PREIS_PAINT 		1000 //x
#define PREIS_HOOD 			800
#define PREIS_ROOF 			800
#define PREIS_SPOILER 		1100
#define PREIS_SIDESKIRT 	1000
#define PREIS_LAMPS     	300
#define PREIS_NITRO2     	500
#define PREIS_NITRO5     	1000
#define PREIS_NITRO10    	3000
#define PREIS_EXHAUST   	3000 //x
#define PREIS_WHEELS    	500
#define PREIS_STEREO    	600
#define PREIS_HYDRAULICS    1500
#define PREIS_FRONT_BUMPER  1500
#define PREIS_REAR_BUMPER   1500
#define PREIS_VENT_RIGHT    1500
#define PREIS_VENT_LEFT     1500

#define MenuKaufButton 	"~<~Kaufen~>~"
#define MenuKasseButton "~<~Bezahlen~>~"
#define MenuNextButton "Weiter"
#define MenuBackButton "Zurueck"
#define MenuWNextButton "~<~Weiter~>~"

#define MenuPreis 		"~r~~h~~h~~h~"
#define MenuGesPreis 	"~r~~h~"
enum TuningEnum
{
	Float:tPos[4],
	tName[32],
	tPlayerID,
	tVehicleID,
	tMenuID,
	tItemTo,
	tItemWhl,
	tColor[2],
	tColorPreis[2],
	tTuning[14],
	tTuningPreis[14],
	tReparatur[10],
	tPaintjob,
	tPaintjobPreis,
	tTor,
	Menu:tMenu
}

new TuningInfo[][TuningEnum] =
{
	{{2117.74292, -1734.44360, 12.92870, 0.00000},"  Auto Service",INVALID_PLAYER_ID,INVALID_VEHICLE_ID,INVALID_TUNINGMENU_ID},
	{{1384.47388, -1890.34192, 13.00040, 180.00000},"  Pimp MY Ride",INVALID_PLAYER_ID,INVALID_VEHICLE_ID,INVALID_TUNINGMENU_ID},
	{{214.13503, -1425.59680, 12.57110, 44.00000},"  CowCar",INVALID_PLAYER_ID,INVALID_VEHICLE_ID,INVALID_TUNINGMENU_ID},
	{{1213.43848, -1068.43860, 30.76697, 180.00000},"  Opa´s Tuning",INVALID_PLAYER_ID,INVALID_VEHICLE_ID,INVALID_TUNINGMENU_ID}
};

enum
{
	tkMenu,
	tkMenuRep,
	tkMenuLack,
	tkMenuLackSwitch1,
	tkMenuLackSwitch2,
	tkMenuLackSwitch3,
	tkMenuKaross,
	tkMenuKarossHood,
	tkMenuKarossRoof,
	tkMenuKarossSideskirt,
	tkMenuKarossLamps,
	tkMenuKarossFBumper,
	tkMenuKarossRBumper,
	tkMenuKarossRVent,
	tkMenuKarossLVent,
	tkMenuAuspuff,
	tkMenuSpoiler,
	tkMenuWheels,
	tkMenuHydraulik,
	tkMenuNitro
}