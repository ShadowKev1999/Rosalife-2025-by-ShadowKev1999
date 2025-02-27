#define UPDATE_INTERVAL (1000)
 
new Text:gTD_Location[MAX_PLAYERS];
new gLocationUpdateTimer[MAX_PLAYERS];
new bool:gPlayerSpawned[MAX_PLAYERS];