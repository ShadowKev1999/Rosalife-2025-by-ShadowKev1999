new Float:Muelltonnen[MAX_MUELLTONNEN][6] =
{
    {2513.974121, -1665.907959, 13.635386, 0.0000, 0.0000, 281.2500},
    {1993.576416, -1627.072998, 13.571859, 0.0000, 0.0000, 90.0000},
    {1451.862305, -1583.324219, 13.571859, 0.0000, 0.0000, 0.0000},
    {1365.263794, -1437.176758, 13.576775, 0.0000, 0.0000, 270.0000},
    {1309.862061, -911.458862, 38.660831, 0.0000, 6.8755, 0.0000},
    {1185.656372, -911.374084, 43.328209, 0.0000, 0.0000, 281.2500},
    {830.479492, -1068.277222, 25.186308, 0.0000, 0.0000, 168.7500},
    {330.864136, -1372.548828, 14.400108, 0.0000, 0.0000, 33.7500},
    {657.024292, -1766.828979, 13.597816, 0.0000, 0.0000, 258.7500},
    {1303.813232, -1862.807251, 13.521879, 0.0000, 0.0000, 180.0001},
    {-71.847382, -1163.344604, 1.951691, 0.0000, 0.0000, 157.5000},
    {-1809.748779, -187.621185, 13.377101, 0.0000, 2.5783, 1.7188},
    {-1911.473267, 308.637543, 41.109566, 0.0000, 0.0000, 0.0000},
    {-1662.103027, 456.034088, 7.167379, 0.0000, 0.0000, 45.0000},
    {-1989.635132, 957.548584, 45.420326, 0.0000, 0.0000, 0.0000},
    {-2044.343750, 142.218719, 28.860933, 0.0000, 0.0000, 270.0000},
    {1488.883911, -1687.149902, 14.109568, 0.0000, 0.0000, 270.0000}
};
new Muelltonne[MAX_MUELLTONNEN],
	MuelltonneTimer[MAX_MUELLTONNEN];

stock AnMuelltonne(playerid)
{
 	for(new mt=0; mt<sizeof(Muelltonnen); mt++)
 	{
 		if(IsPlayerInRangeOfPoint(playerid,2.5,Muelltonnen[mt][0],Muelltonnen[mt][1],Muelltonnen[mt][2]))
 		{
 	    	return mt;
		}
	}
	return -1;
}

CMD:durchsuchen(playerid, params[])
{
	new mt = AnMuelltonne(playerid);
	if(mt == -1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keiner Mülltonne.");
 	if(SpielerInfo[playerid][sPfandflaschen] > 14)return SendClientMessage(playerid, COLOR_RED,"[Info]: {FFFFFF}Du kannst maximal 15 Pfandflaschen tragen.");
	new muellsperre = MuelltonneTimer[mt] - gettime();
  	if(gettime() < MuelltonneTimer[mt])return SendClientMessage(playerid, COLOR_RED,"[Info]: {FFFFFF}Die Mülltonne wurde bereits durchsucht. Diese Mülltonne kann erst in %02d:%02d Minuten durchsucht werden.", muellsperre/60, muellsperre%60);
	if(SpielerInfo[playerid][sBeutel] == 0)return SendClientMessage(playerid, COLOR_RED,"[Info]: {FFFFFF}Besorge dir im OBI Baumarkt ein Beutel um Pfandflaschen sammeln zu können.");
 	new gefunden = 0 + random(6), string[128];
  	SpielerInfo[playerid][sPfandflaschen] += gefunden;
    if(gefunden > 0)
    {
		format(string, sizeof(string), "Du hast %d Pfandflaschen gefunden.",gefunden);
 		SendClientMessage(playerid, COLOR_SUPER, string);
   	}
    else if(gefunden == 0)
    {
   		SendClientMessage(playerid, COLOR_SUPER, "Du hast keine Pfandflaschen gefunden.");
    }
	MuelltonneTimer[mt] = gettime() + (60 * 30);
	return 1;
}