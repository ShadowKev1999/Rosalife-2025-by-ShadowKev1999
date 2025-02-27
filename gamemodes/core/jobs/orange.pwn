/*
public SpielerPflueckt(playerid)
{
	new rand = random(2), orangenrand = random(4)+1;
    if(!AmOrangenBaum(playerid))
    {
        if(rand == 0)
        {
			SpielerInfo[playerid][sOrangen] += orangenrand;
			new string[128];
			format(string,sizeof(string),"[Info]: {FFFFFF}Du hast gerade %d Orangen gepflückt!",orangenrand);
			SendClientMessage(playerid,COLOR_SUPER,string);
			if(SpielerInfo[playerid][sOrangen] >= 20)
			{
			    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Mehr Orangen kannst du nicht tragen. Verkaufe deine Orangen an den alten Farmer.");
			    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Gehe zum Farmer und gib '/orangenverkaufen' ein.");
			}
			return 1;
        }
        else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Noch nichts gepflückt.");
		return 1;
    }
    return 1;
}
*/

stock AmOrangenBaum(playerid)
{
 	for(new orangenbaum=1; orangenbaum<sizeof(OrangenBaumInfo); orangenbaum++)
 	{
 		if(IsPlayerInRangeOfPoint(playerid,5.0,OrangenBaumInfo[orangenbaum][OBPos_X],OrangenBaumInfo[orangenbaum][OBPos_Y],OrangenBaumInfo[orangenbaum][OBPos_Z]))
 		{
 	    	return 1;
		}
	}
	return 0;
}