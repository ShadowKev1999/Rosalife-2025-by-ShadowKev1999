#define MAX_PLAYER_BAR_ACTOR    (5)

new
    playroomBarActors[MAX_PLAYER_BAR_ACTOR],
    Float:playroomBarCoords[MAX_PLAYER_BAR_ACTOR][4] = {
        {326.2812,-1889.5773,2.7164,356.3433}, //buehne
        {323.3096,-1874.1361,2.6180,178.6581}, //lay
        {332.1505,-1874.1218,2.6489,181.1649}, //lay
        {335.1718,-1873.9769,2.6543,181.1649}, //lay
        {331.6605,-1819.2548,4.2303,330.6029} //schreier
    },
    playroomBeachSkins[] = {
        18, 45, 92, 97, 138, 139, 140, 145,
        146, 154, 251
    },
    Float:playroomRectangle[4] = {302.2971, -1816.4586, 359.9398, -1924.9418},
    playroomArea,
    Text3D:playroomLabel,
    playroomMessages[3][128] = {
        {"{FFFFFF}Herzlich Willkommen an der Los Santos Beachbar {0066FF}Playroom{FFFFFF}!"},
        {"{FFFFFF}Entspann dich bei einem Kaltgetränk und lausche der Musik."},
        {"{FFFFFF}Hol dir doch ein HotDog und leg dich in die erste Reihe?"}
    };

new playerRadioBeachList[MAX_PLAYERS][MAX_RADIOS];
new playerRadioBeachMax[MAX_PLAYERS] = 0;
new BeachRadioUrl[128],
    BeachRadioBlocker,
    BeachRadioId;