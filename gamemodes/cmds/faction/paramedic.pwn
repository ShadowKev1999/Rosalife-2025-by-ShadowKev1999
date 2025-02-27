CMD:heal(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 5)return NichtBerechtigt
	if(GetPVarInt(playerid,"MedicDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	new pID, Preis, string[144], Float:Health;
	if(sscanf(params,"ud",pID,Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/heal [SpielerID] [Preis]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dich nicht selber heilen.");
	if(GetDistanceBetweenPlayersEx(playerid, pID) > 12)return NichtNahe
	if(Preis < 0 || Preis > 500)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/heal [SpielerID] [Preis(1-500$]");
	GetPlayerHealth(pID,Health);
	if(Health > 93)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler benötigt keine Heilung.");
	format(string,sizeof(string),"Du bietest %s eine Heilung in Höhe von %d$ an.",SpielerInfo[pID][sName],Preis);
	SendClientMessage(playerid,COLOR_INFO,string);
	format(string,sizeof(string),"%s %s biete dir eine Heilung in Höhe von %d$ an.",RangName(playerid),SpielerInfo[playerid][sName],Preis);
	SendClientMessage(pID,COLOR_INFO,string);
	SendClientMessage(pID,COLOR_INFO,"Benutze '/accept heal' um die Heilung anzunehmen.");
	SetPVarInt(playerid,"Patient",pID);
	SetPVarInt(pID,"Arzt",playerid);
	SetPVarInt(playerid,"HealthPreis",Preis);
	SetPVarInt(pID,"HealthPreis",Preis);
	return 1;
}

CMD:paket(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 5)return NichtBerechtigt
	if(GetPVarInt(playerid,"MedicDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	new pID, Preis, string[144];
	if(sscanf(params,"ud",pID,Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/paket [SpielerID] [Preis]");
	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du kannst dir nicht selber ein Paket verkaufen.");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(GetDistanceBetweenPlayersEx(playerid, pID) > 12)return NichtNahe
	if(Preis < 0 || Preis > 2000)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/paket [SpielerID] [Preis(1-2000$]");
	if(SpielerInfo[pID][sPaket] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler besitzt bereits ein Erste-Hilfe-Paket.");
	format(string,sizeof(string),"Du bietest %s ein Erste-Hilfe-Paket für %d$ an.",SpielerInfo[pID][sName],Preis);
	SendClientMessage(playerid,COLOR_INFO,string);
	format(string,sizeof(string),"%s %s biete dir ein Erste-Hilfe-Paket für %d$ an.",RangName(playerid),SpielerInfo[playerid][sName],Preis);
	SendClientMessage(pID,COLOR_INFO,string);
	SendClientMessage(pID,COLOR_INFO,"Benutze '/accept paket' um das Erste-Hilfe-Paket zu kaufen.");
	SetPVarInt(pID,"ErsteHilfePaket",playerid);
	SetPVarInt(pID,"ErsteHilfePaketPreis",Preis);
	return 1;
}

CMD:givebaseheal(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 5)return NichtBerechtigt
	if(SpielerInfo[playerid][sRank] < 4)return NichtBerechtigt
	if(GetPVarInt(playerid,"MedicDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	new frakID;
	if(sscanf(params,"i",frakID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givebaseheal [FraktionsID]");
	if(frakID > 18 && frakID < 9)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Baseheals können nur an Gangs und Mafian vergeben werden.");
	if(GetPlayerVirtualWorld(playerid) > 18 && GetPlayerVirtualWorld(playerid) < 9)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keiner Base.");
	if(FrakInfo[frakID][fiBaseheal] > 49)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Base hat noch alle 50 Heals übrig.");
	FrakInfo[frakID][fiBaseheal] = 50;
	new string[128];
	format(string,sizeof(string),"[Info]: %s %s hat eure Baseheals wieder aufgefüllt.",RangName(playerid),SpielerInfo[playerid][sName]);
	foreach(new i : Player){if(SpielerInfo[i][sFraktion] == frakID){SendClientMessage(i,COLOR_SUPER,string);}}
	format(string,sizeof(string),"[Info]: Du hast die Baseheals der Fraktion '%s' wieder aufgefüllt.",FrakName(frakID));
	SendClientMessage(playerid,COLOR_SUPER,string);
	return 1;
}

CMD:setteam(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 5)return NichtBerechtigt
	if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	new pID, Team, string[144];
	if(sscanf(params,"ud",pID,Team))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /setteam [SpielerID] [Team]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(SpielerInfo[pID][sFraktion] != 5)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Der angegebene Spieler ist nicht in deiner Fraktion.");
	SpielerInfo[pID][sTeam] = Team;
	if(Team == 0){format(string,sizeof(string),"Spieler %s wurde den Sanitäter-Rang erteilt.",SpielerInfo[pID][sName]);}
	else if(Team == 1){format(string,sizeof(string),"Spieler %s wurde den Feuerwehr-Rang erteilt.",SpielerInfo[pID][sName]);}
	SendClientMessage(playerid,COLOR_SUPER,string);
	if(Team == 0){format(string,sizeof(string),"%s %s hat dir den Sanitäter-Rang erteilt.",RangName(playerid),SpielerInfo[playerid][sName]);}
	else if(Team == 1){format(string,sizeof(string),"%s %s hat dir den Feuerwehr-Rang erteilt.",RangName(playerid),SpielerInfo[playerid][sName]);}
	SendClientMessage(pID,COLOR_SUPER,string);
	return 1;
}

CMD:deathcp(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] != 5)return NichtBerechtigt
	if(GetPVarInt(playerid,"MedicDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	new pID, string[144];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/cptot [SpielerID]");
    if(SpielerInfo[pID][sWiederbeleben] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Spieler muss nicht wiederbelebt werden.");
    if(GetDistanceBetweenPlayersEx(playerid, pID) >= 3)
    {
		new Float:pX, Float:pY, Float:pZ;
		GetPlayerPos(pID,pX,pY,pZ);
		SetPlayerCheckpointEx(playerid,pX,pY,pZ,2.0);
		foreach(new i : Player)
		{
		    if(SpielerInfo[i][sFraktion] != 5)continue;
		    if(GetPVarInt(i,"MedicDuty") != 1)continue;
		    format(string,128,"%s %s ist auf dem Weg zum Schwerverletzten %s.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
		    SendClientMessage(i,0x0073FFFF,string);
		}
		SendClientMessage(playerid,COLOR_INFO,"Die schwerverletzte Person wurde auf deiner Karte rot markiert.");
		return 1;
    }
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du stehst bereits neben dem Spieler.");
	return 1;
}
alias:deathcp("cptot")

CMD:deathslist(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 5)return NichtBerechtigt
    if(GetPVarInt(playerid,"MedicDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
    new merker = true;
    SendClientMessage(playerid, COLOR_YELLOW, "Folgende Personen sind schwer verletzt:");
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(SpielerInfo[i][sWiederbeleben] > 0 && GetPlayerInterior(i) == 0)
		{
			new string[128];
			format(string,128, "%s | ID: %d",SpielerInfo[i][sName],i);
			SendClientMessage(playerid, COLOR_WHITE, string);
			merker = false;
		}
	}
	if(merker)
	{
	    SendClientMessage(playerid, COLOR_WHITE, "Derzeit ist keine Person schwerverletzt.");
	    return 1;
	}
	SendClientMessage(playerid,COLOR_YELLOW, "Benutze '/cptot [SpielerID]' um den schwerverletzten zu finden.");
	return 1;
}
alias:deathslist("totliste")

CMD:wiederbeleben(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] != 5)return NichtBerechtigt
	if(GetPVarInt(playerid,"MedicDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	new pID, string[144];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/rea [SpielerID]");
	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dich nicht selber wiederbeleben.");
	if(GetDistanceBetweenPlayersEx(playerid, pID) >= 3)return NichtNahe
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
	if(SpielerInfo[pID][sWiederbeleben] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler muss nicht wiederbelebt werden.");
	KillTimer(DeadTimer[pID]);
	ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant", 4.1, false, true, true, true, 0, SYNC_ALL);
	ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant", 4.1, false, true, true, true, 0, SYNC_ALL);
	format(string,sizeof(string),"%s %s versucht %s wiederzubeleben.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	KillTimer(DeadTimer[pID]);
	DeadTimer[pID] = SetTimerEx("Reanimation",4100,false,"i",pID);
	SpielerInfo[pID][sWiederbeleben] = 0;
	SpielerInfo[pID][sKrankenhaus] = 0;
	ProxDetector(20.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
	SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist ein guter Rettungssanitäter! Für deine Bereitschaft erhälst du 250$.");
	GivePlayerMoneyEx(playerid,250);
	FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += 250;
	SetPVarInt(pID,"Lebensretter",playerid);
	SetPlayerHealth(pID,10);
	return 1;
}
alias:wiederbeleben("rea")