stock AddSchild(playerid,id,Float:x,Float:y,Float:z,Float:a)
{
   	for(new i=0;i<MAX_SCHILDER;i++)
	{
	 	if(SchildInfo[i][Erstellt] == false)
		{
	  		SchildInfo[i][oPosX] = x;
	   		SchildInfo[i][oPosY] = y;
	    	SchildInfo[i][oPosZ] = z;
	    	SchildInfo[i][oPosA] = a;
	    	SchildInfo[i][Erstellt] = true;
	    	SchildInfo[i][ID] = CreateDynamicObject(id,SchildInfo[i][oPosX],SchildInfo[i][oPosY],SchildInfo[i][oPosZ],0.0,0.0,a);

			new query[300];
	    	mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `streetschilder` (`ModelID`, `PosX`, `PosY`, `PosZ`, `PosA`, `createdby`) VALUES ('%i', '%.2f', '%.2f', '%.2f', '%.2f', '%s')", id, x, y, z, a, SpielerInfo[playerid][sName]);
		    mysql_tquery(sqlHandle, query);
			return i;
	    }
    }
    return SendClientMessage(playerid,COLOR_RED,"Die maximale Anzahl an Straßenschilder wurden erreicht.");
}

stock RemoveSchild(playerid)
{
	for(new i=0;i<MAX_SCHILDER;i++)
 	{
	  	if(IsPlayerInRangeOfPoint(playerid,2,SchildInfo[i][oPosX],SchildInfo[i][oPosY],SchildInfo[i][oPosZ]))
	   	{
		    if(SchildInfo[i][Erstellt] == true)
		    {
			    SchildInfo[i][Erstellt] = false;
			    SchildInfo[i][oPosX] = -1;
			    SchildInfo[i][oPosY] = -1;
			    SchildInfo[i][oPosZ] = -1;
				DestroyDynamicObject(SchildInfo[i][ID]);
				SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast ein Straßenschild entfernt.");

				new schildDBid[11];
				format(schildDBid,sizeof(schildDBid),"%i",SchildInfo[i][dbID]);
				mysql_Delete("streetschilder", "ID", schildDBid);
				SchildInfo[i][dbID] = 0;
				return i;
		    }
	    }
    }
    return SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist an keinem Straßenschild.");
}

stock RemoveAllSchilder()
{
	for(new i=0;i<MAX_SCHILDER;i++)
 	{
	 	if(SchildInfo[i][Erstellt] == true)
		{
			SchildInfo[i][Erstellt] = false;
			SchildInfo[i][oPosX] = -1;
			SchildInfo[i][oPosY] = -1;
			SchildInfo[i][oPosZ] = -1;
			DestroyDynamicObject(SchildInfo[i][ID]);
		}
	}
 	return 1;
}

stock SchilderCount()
{
	new index;
	for(new i=0;i<MAX_SCHILDER;i++)
 	{
	 	if(SchildInfo[i][Erstellt] == true)
		index++;
	}
 	return index;
}

stock LoadStrassenSchilder() {
    mysql_tquery(sqlHandle, "SELECT * FROM `streetschilder` ORDER BY `ID` ASC", "LoadStrassenSchilder");
	return 1;
}