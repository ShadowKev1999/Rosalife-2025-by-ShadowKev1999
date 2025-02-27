#define HOLDING(%0)                         ((newkeys & (%0)) == (%0))
#define PRESSED(%0)                         (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0)                        (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#define RandomEx(%1,%2)				        (random(%2-%1)+%1)
#define fRandomEx(%1,%2)			        (floatrandomEx(%2-%1)+%1)

#define KEY_AIM                             (128)

#define SendUsage(%0,%1)                    (SendClientMessage(%0,-1,"{FFAF00}[NUTZE]{FFFFFF} " # %1))
#define SendError(%0,%1) 			        (SendClientMessage(%0,-1,"{F81414}[ERROR]{FFFFFF} " # %1))
#define SendServerMessage(%0,%1)            (SendClientMessage(%0,-1,"{C0C0C0}[SERVER]{FFFFFF} " # %1))

#define cash_format(%0) \
    (number_format(%0, .prefix = '$'))

#define sprintf(%1)                         (format(g_szSprintfBuffer, sizeof(g_szSprintfBuffer), %1), g_szSprintfBuffer)

stock g_szSprintfBuffer[ 1024 ];

#define INFO_STRING "* Benutze: {00CC00}"
#define NoRights "Du besitzt nicht die benötigten Rechte."
#define ERROR_ADMIN					"[{F70D0D}FEHLER{FFFFFF}] {EE600F}Du besitzt nicht die nötigen Berechtigungen für diesen Befehl!"

//Schnell Defines - redv-reallife.de Reloaded
#define NichtBerechtigt SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist dazu {CD262F}nicht{FFFFFF} berechtigt.");
#define KeinPerso SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du benötigst einen Personalausweis.");
#define AdminDienst SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist {CD262F}nicht{FFFFFF} im Admin-Dienst.");
#define NichtOnline SendClientMessage(playerid,COLOR_RED,"{FFFFFF}Der angegebene Spieler ist {CD262F}nicht{FFFFFF} online.");
#define KeineFunktion ShowPlayerDialog(playerid,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Error 404","Diese Funktion wurde noch nicht fertiggestellt.\nSie wird in späteren Updates verfügbar sein.","Weiter","");
#define NichtNahe SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist {CD262F}nicht{FFFFFF} nah genug.");
#define IstBot SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die angegebene ID ist einem {CD262F}Bot{FFFFFF} zugewiesen.");
#define KeinRang SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst diesen Befehl mit deinem Rang {CD262F}nicht{FFFFFF} nutzen.");
#define abs(%1) (((%1) < 0) ? (-(%1)) : ((%1)))
#define Holding(%0) ((newkeys & (%0)) == (%0))