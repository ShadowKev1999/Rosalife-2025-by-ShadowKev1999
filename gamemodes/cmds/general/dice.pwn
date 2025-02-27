CMD:dice(playerid,params[])
{
	new pID, string[128];
	if(GetPlayerScore(playerid) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du musst min. das Level 2 erreicht haben.");
	if(GetPVarInt(playerid,"DiceGegner") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist bereits mit einem Spieler am Würfeln!");
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/dice [SpielerID/Name]");
	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nicht selber mit dir würfeln!");
 	if(GetDistanceBetweenPlayersEx(playerid, pID) >= 5)return NichtNahe
	if(GetPlayerScore(pID) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler hat noch nicht Level 2 erreicht.");
	if(GetPVarInt(pID,"DiceGegner") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bereits mit jemanden am Würfeln!");
	SetPVarInt(pID,"DiceAngebot",playerid);
	format(string,sizeof(string),"Du hast %s gefragt, ob er mit dir Würfeln möchte. Warte bis er das Angebot akzeptiert.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_INFO,string);
	format(string,sizeof(string),"%s möchte mit dir Würfeln. Benutze '/accept dice' um mit ihm zu würfeln.",SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_INFO,string);
	return 1;
}