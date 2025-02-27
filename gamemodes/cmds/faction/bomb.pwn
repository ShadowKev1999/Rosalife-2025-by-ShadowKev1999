CMD:laybomb(playerid, params[])
{
	if(SpielerInfo[playerid][sBombe] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Bombe.");
 	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
  	if(BombenInfo[playerid][biBombObject] != INVALID_OBJECT_ID)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nur eine Bombe platzieren.");
	GetPlayerPos(playerid,BombenInfo[playerid][biPosX],BombenInfo[playerid][biPosY],BombenInfo[playerid][biPosZ]);
	BombenInfo[playerid][biBombObject] = CreateDynamicObject(1252, BombenInfo[playerid][biPosX],BombenInfo[playerid][biPosY],BombenInfo[playerid][biPosZ]+1, 0.0, 0.0, 0.0);
 	ClearAnimations(playerid);
  	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, false, false, false, false, 0);
   	SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast eine Bombe platziert. Benutze '/bombe' um die Detonation auszulösen.");
    SpielerInfo[playerid][sBombe] = 0;
    return 1;
}
CMD:bombe(playerid, params[])
{
	if(BombenInfo[playerid][biBombObject] == INVALID_OBJECT_ID)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast keine Bombe platziert.");
 	CreateExplosion(BombenInfo[playerid][biPosX],BombenInfo[playerid][biPosY],BombenInfo[playerid][biPosZ], 0, 25.0);
  	DestroyDynamicObject(BombenInfo[playerid][biBombObject]);
   	BombenInfo[playerid][biBombObject] = INVALID_OBJECT_ID;
    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Die Detonation wurde ausgelöst!");
    return 1;
}
CMD:takebomb(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] >= 9 && SpielerInfo[playerid][sFraktion] < 19)
 	{
  		if(!IsPlayerInRangeOfPoint(playerid,2.5,268.67346, 1883.53430, -30.26508))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst hier keine Bombe holen.");
  		if(SpielerInfo[playerid][sBombe] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nur eine Bombe tragen. Bringe die Bombe erst zur Fraktionskiste.");
    	SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast eine Bombe aufgehoben. Bring Sie schnell zur Fraktionskiste.");
     	SpielerInfo[playerid][sBombe] += 1;
      	PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
       	if(SpielerInfo[playerid][sFraktion] > 8 && SpielerInfo[playerid][sFraktion] < 19)
		{
  			new string[128];
	    	format(string,sizeof(string),"[Gangpunkte]: {FFFFFF}%s %s hat gerade eine Bombe geklaut. +2 Gangpunkte.",RangName(playerid),SpielerInfo[playerid][sName]);
		    foreach(new i : Player)
		    {
      			if(SpielerInfo[i][sFraktion] == SpielerInfo[playerid][sFraktion])
       			{
          			SendClientMessage(i,COLOR_SUPER,string);
	        	}
		    }
		    FrakInfo[SpielerInfo[playerid][sFraktion]][fiGangpunkte] += 2;
		}
  		return 1;
	}
	else NichtBerechtigt
	return 1;
}