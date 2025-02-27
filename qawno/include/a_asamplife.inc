/*  Samplife Selfmade Script Functions
 *
 *  (c) Copyright GangstaSunny
 *
 */

// --------------------------------------------------
// Natives
// --------------------------------------------------

#if defined _samplife_included
  #endinput
#endif

#define _samplife_included

native sl_ShowFrakVerwaltung(playerid);
native sl_IsPlayerConnectedEx(playerid);
native sl_KickTimer(playerid);
native sl_AntiCheatName(code);
native sl_AdminColor(playerid);
native sl_SetPlayerCheckpointEx(playerid, Float:x, Float:y, Float:z, Float:size);
native sl_GivePlayerMoneyEx(playerid, amount);
native sl_ResetPlayerMoneyEx(playerid);
native sl_GetPlayerMoneyEx(playerid);
native sl_SetPlayerHealthEx(playerid);
native sl_DeletePlayerJobFahrzeug(playerid);
native sl_SaveAccount(playerid);
native sl_LoadAccount(playerid);
native sl_SavePlayerWeapons(playerid);
native sl_SavePrivatCarVehicle(playerid);
native sl_SavePrivatCar(playerid);
native sl_LoadPrivatCar(playerid);
native sl_DeleteVehicle(vehicleid);
native sl_DestroyVehicleEx(vehicleid);
native sl_ShowStats(playerid, targetid);
native sl_ShowAchivement(playerid, const name[], const string[]);
native sl_DestroyVars(playerid);
native sl_SpawnPlayerEx(playerid);
native sl_SetPlayerWantedLevelEx(playerid, wantedlevel);
native sl_GetPlayerWantedLevelEx(playerid);
native sl_GivePlayerEXP(playerid, amount);
native sl_IsAFahrrad(vehicleid);
native sl_IsAMotorrad(vehicleid);
native sl_IsABoot(vehicleid);
native sl_IsAHelikopter(vehicleid);
native sl_IsAFlugzeug(vehicleid);
native sl_IsALKW(vehicleid);
native sl_BanPlayer(playerid, const admin[], const reason[]);
native sl_TBanPlayer(playerid, minutes, const admin[], const reason[]);
native sl_CreateServerLogEntry(const logfile[], const string[]);
native sl_SendCopMessage(color, const string[]);
native sl_SendICPMessage(const string[]);
native sl_SendAdminMessage(color, const string[]);
native sl_WaffenName(weaponid);
native sl_AdminName(playerid);
native sl_JobName(jobid);
native sl_RangName(playerid);
native sl_FrakName(factionid);
native sl_JaNein(variable);

