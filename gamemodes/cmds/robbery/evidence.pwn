CMD:asservatenkammer(playerid,params[])
{
	new string[144];
	if(isACop(playerid) && GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du kannst als Polizist kein Raub begehen!");
	if(!IsPlayerInRangeOfPoint(playerid,2,1821.2428,-1941.9307,1592.9390)) return SendClientMessage(playerid,COLOR_ERRORTEXT,"Du bist nicht an der Asservatenkammer.");
	if(!CountOnlineCops()) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Für den Asservatenkammerrob in Los Santos muss mindestens 1 Polizist Online sein.");
	if(SpielerInfo[playerid][sFraktion] >= 9 && SpielerInfo[playerid][sFraktion] != 19 && SpielerInfo[playerid][sFraktion] != 20)//Gangreturn SendErrorMessage(playerid, "Du bist in keiner Gang/Mafia um die Asservatenkammer auszurauben.");
	if(LSAsservatenkammerSperre) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du musst noch %d Minuten warten bis die Asservatenkammer wieder ausgeraubt werden kann.",LSAsservatenkammerSperre);
	LSAsservatenkammerTimer = 5;
	MoveObject(AsservatenkammerBombe, 307.12, -1489.05, 25.50, 10);
	format(string, sizeof(string), "HQ: %s hat eine Ladung Dynamit am der Asservatenkammer in Los Santos angebracht.",SpielerInfo[playerid][sName]);
	SendCopMessage(COLOR_BLUE,string);
	format(string, sizeof(string), "ACHTUNG: %s raubt grade die Asservatenkammer in Los Santos aus!",SpielerInfo[playerid][sName]);
	SendClientMessageToAll(COLOR_YELLOW, string);
	LSAsservatenkammerSperre = 60;
	SetPlayerWantedLevelEx(playerid, GetPlayerWantedLevelEx(playerid) +10);
	format(string,128,"Asservatenkammer Kamera hat dich erkannt du bekommst 10 Wanteds. Grund: Asservatenkammer-Raub");
	SendClientMessage(playerid,COLOR_SORRY,string);
	//TresorrobStatus = 1;
	return 1;
}


CMD:akdefuse(playerid,params[])
{
    if(IsPlayerConnected(playerid))
    {
        if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
        {
            if(IsPlayerInAnyVehicle(playerid))
            {
                SendClientMessage(playerid,COLOR_ERRORTEXT,"Du kannst nicht aus einem Fahrzeug herraus entschärfen.");
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid,2,1821.2428,-1941.9307,1592.9390))
            {
                if(LSAsservatenkammerTimer <= 5)
                {
                    if(LSAsservatenkammerDefuser == -1)
                    {
                        GameTextForPlayer(playerid,"~b~Noch ~r~20 ~b~Sekunden", 3000, 3);
                        LSAsservatenkammerDefuseTime = 20;
                        LSAsservatenkammerDefuser = playerid;
                        SendClientMessage(playerid,COLOR_GREEN,"Warte 20 Sekunden hier damit an der Asservatenkammer entschärft wird");

                    }
                    else
                    {
                        SendClientMessage(playerid,COLOR_ERRORTEXT,"Es entschärfst schon jemand das Dynamit.");
                    }
                }
                else
                {
                    SendClientMessage(playerid,COLOR_ERRORTEXT,"Es wurde kein Dynamit an der Asservatenkammer angebracht.");
                }
            }
            else
            {
                SendClientMessage(playerid,COLOR_ERRORTEXT,"Du bist nicht an der Asservatenkammer.");
            }
        }
        else
        {
            SendClientMessage(playerid,COLOR_ERRORTEXT,"Du bist kein Polizist oder nicht im Dienst.");
        }
    }
    return 1;
}