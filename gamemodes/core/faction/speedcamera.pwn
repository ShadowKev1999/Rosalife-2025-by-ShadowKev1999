stock CreateBlitzer(playerid,geschwindigkeit,ortschaft[])
{
	new string[128],query[256];
    for(new i=1;i<MAX_BLITZER;i++)
	{
	 	if(Blitzer[i][Erstellt] == false)
		{
			GetPlayerPos(playerid,Blitzer[i][oPosX],Blitzer[i][oPosY],Blitzer[i][oPosZ]);
		    Blitzer[i][Erstellt] = true;
		    Blitzer[i][Kaputt] = 0;
		    Blitzer[i][Rauch] = -1;
		    Blitzer[i][Geschwindigkeit] = geschwindigkeit;
		    Blitzer[i][ObjectID] = -1;
		    strmid(Blitzer[i][BlitzerOrt],ortschaft,0,strlen(ortschaft),64);
		    strmid(Blitzer[i][Ersteller],SpielerInfo[playerid][sName],0,strlen(SpielerInfo[playerid][sName]),64);
		    new Float:angle;
		    GetPlayerFacingAngle(playerid, angle);
		    Blitzer[i][ID] = CreateDynamicObject(18880,Blitzer[i][oPosX],Blitzer[i][oPosY],Blitzer[i][oPosZ]-2.0,0.0,0.0,angle);
		    format(string,sizeof(string),"Blitzer %i\nRichtgeschwindigkeit: %iKm/h\n\nToleranz: %iKm/h",i,Blitzer[i][Geschwindigkeit]);
			BlitzerLabel[i] = CreateDynamic3DTextLabel(string,0x7DC5007A,Blitzer[i][oPosX],Blitzer[i][oPosY],Blitzer[i][oPosZ],10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,0);
			format(string,sizeof(string),"%s %s hat einen Blitzer aufgestellt. Geschwindigkeit: %i KM/H - Ort: %s",RangName(playerid),SpielerInfo[playerid][sName],geschwindigkeit,ortschaft);
			foreach(new id : Player){if(SpielerInfo[id][sFraktion] == 8){SendClientMessage(id,COLOR_INFO,string);}}
			mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `blitzer` (`ID`,`Ersteller`,`Geschwindigkeit`,`Ort`,`PosX`,`PosY`,`PosZ`) VALUES ('%d','%s','%d','%s','%f','%f','%f')",i,Blitzer[i][Ersteller],Blitzer[i][Geschwindigkeit],Blitzer[i][BlitzerOrt],Blitzer[i][oPosX],Blitzer[i][oPosY],Blitzer[i][oPosZ]);
		    mysql_tquery(sqlHandle, query);
			return i;
		}
	}
	return -1;
}

stock DeleteBlitzer(playerid)
{
    new query[128];
    for(new i=1;i<MAX_BLITZER;i++)
	{
	  	if(IsPlayerInRangeOfPoint(playerid,2,Blitzer[i][oPosX],Blitzer[i][oPosY],Blitzer[i][oPosZ]))
	   	{
	   	    if(Blitzer[i][Kaputt] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Blitzer ist defekt und kann zurzeit nicht abgebaut werden.");
		    if(Blitzer[i][Erstellt] == true)
		    {
			    Blitzer[i][Erstellt] = false;
			    Blitzer[i][Ersteller] = -1;
			    Blitzer[i][oPosX] = -1;
			    Blitzer[i][oPosY] = -1;
			    Blitzer[i][oPosZ] = -1;
 		    	Blitzer[i][Kaputt] = 0;
		    	Blitzer[i][Rauch] = -1;
			    Blitzer[i][Geschwindigkeit] = -1;
				if(Blitzer[i][ObjectID] != -1) DestroyDynamicObject(Blitzer[i][ObjectID]);
			    Blitzer[i][ObjectID] = -1;
				DestroyDynamicObject(Blitzer[i][ID]);
				DestroyDynamic3DTextLabel(BlitzerLabel[i]);
				SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Der Blitzer wurde wieder abgebaut.");
				mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `blitzer` WHERE `ID` = '%d'",i);
				mysql_tquery(sqlHandle, query);
				return 1;
		    }
	    }
    }
	return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich an keinem Blitzer.");
}

stock DeleteAllBlitzer()
{
	new query[128];
    for(new i=1;i<MAX_BLITZER;i++)
	{
	    if(Blitzer[i][Kaputt] > 0)continue;
	 	if(Blitzer[i][Erstellt] == true)
		{
			Blitzer[i][Erstellt] = false;
			Blitzer[i][Ersteller] = -1;
			Blitzer[i][oPosX] = -1;
			Blitzer[i][oPosY] = -1;
			Blitzer[i][oPosZ] = -1;
   			Blitzer[i][Kaputt] = 0;
		    Blitzer[i][Rauch] = -1;
			Blitzer[i][Geschwindigkeit] = -1;
			if(Blitzer[i][ObjectID] != -1) DestroyDynamicObject(Blitzer[i][ObjectID]);
		    Blitzer[i][ObjectID] = -1;
			DestroyDynamicObject(Blitzer[i][ID]);
			DestroyDynamic3DTextLabel(BlitzerLabel[i]);
			mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `blitzer` WHERE `ID` = '%d'",i);
		   	mysql_tquery(sqlHandle, query);
		}
	}
	return 1;
}

stock ReturnBlitzerID(playerid)
{
    for(new i=1;i<MAX_BLITZER;i++)
	{
	 	if(Blitzer[i][Erstellt] == true)
		{
			if(IsPlayerInRangeOfPoint(playerid,2.5,Blitzer[i][sperreX],Blitzer[i][sperreY],Blitzer[i][sperreZ]))
			return i;
		}
	}
	return -1;
}

public LoadBlitzer()
{
	new blitzers;
	for(new fc = 1;fc<MAX_BLITZER;fc++)
 	{
	    new str[256], var[46];
	    format(var,sizeof(var),"%d",fc);
	    mysql_format(sqlHandle, str,sizeof(str),"SELECT * FROM `blitzer` WHERE `ID` = '%d'", fc);
	    new Cache:result = mysql_query(sqlHandle, str);
	
		if(cache_num_rows())
		{
			cache_get_value_name(0, "ID",var); fc = strval(var);
			cache_get_value_name(0, "Ersteller",Blitzer[fc][Ersteller]);
			cache_get_value_name(0, "Geschwindigkeit",var); Blitzer[fc][Geschwindigkeit] = strval(var);
			cache_get_value_name(0, "Ort",var); Blitzer[fc][BlitzerOrt] = strval(var);
			cache_get_value_name(0, "PosX",var); Blitzer[fc][oPosX] = floatstr(var);
			cache_get_value_name(0, "PosY",var); Blitzer[fc][oPosY] = floatstr(var);
			cache_get_value_name(0, "PosZ",var); Blitzer[fc][oPosZ] = floatstr(var);
			cache_get_value_name(0, "PosA",var); Blitzer[fc][oPosA] = floatstr(var);
			Blitzer[fc][Erstellt] = true;
			Blitzer[fc][Kaputt] = 0;
			Blitzer[fc][Rauch] = -1;
			Blitzer[fc][ID] = CreateDynamicObject(18880,Blitzer[fc][oPosX],Blitzer[fc][oPosY],Blitzer[fc][oPosZ]-2.0,0.0,0.0,Blitzer[fc][oPosA]);
			format(str,sizeof(str),"Blitzer {FF0000}%d{FFFFFF}\nRichtgeschwindigkeit: {FF0000}%d{FFFFFF}Km/h",fc,Blitzer[fc][Geschwindigkeit]);
			BlitzerLabel[fc] = CreateDynamic3DTextLabel(str,COLOR_WHITE,Blitzer[fc][oPosX],Blitzer[fc][oPosY],Blitzer[fc][oPosZ],10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,0);
	      	blitzers++;
		}
		cache_delete(result);
	}
	printf("Es wurden %d Blitzer erfolgreich geladen.",blitzers);
}

stock AmBlitzer(playerid)
{
    for(new blitzer=1;blitzer<MAX_BLITZER;blitzer++)
	{
	    if(Blitzer[blitzer][Erstellt] == false)continue;
	  	if(IsPlayerInRangeOfPoint(playerid,2.5,Blitzer[blitzer][oPosX],Blitzer[blitzer][oPosY],Blitzer[blitzer][oPosZ]))
	  	{
	  	    return 1;
	  	}
	}
	return 0;
}

stock BlitzerID(playerid)
{
	for(new blitzer=1;blitzer<MAX_BLITZER;blitzer++)
	{
	    if(Blitzer[blitzer][Erstellt] == false)continue;
	  	if(IsPlayerInRangeOfPoint(playerid,2.5,Blitzer[blitzer][oPosX],Blitzer[blitzer][oPosY],Blitzer[blitzer][oPosZ]))return blitzer;
	}
	return -1;
}