CMD:createtstelle(playerid,params[])
{
    new Auswahl, tsid, query[256], Float:pX, Float:pY, Float:pZ, Text[224];
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(sscanf(params,"d",Auswahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createtstelle [Eingang = 1|Tankstelle1 = 2|Tankstelle2 = 3|Tafel = 4]");
    if(Auswahl == 1)//Eingang der Tankstelle
    {
		new Preis;
		GetPlayerPos(playerid,pX,pY,pZ);
        if(sscanf(params,"dd",Auswahl,Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createtstelle [1] [Preis]");
   		for(new mf=1;mf<MAX_TSTELLEN;mf++)
    	{
    	    if(TankstellenInfo[mf][tsErstellt] == true)continue;
    	    TankstellenInfo[mf][tsErstellt] = true;
    	    TankstellenInfo[mf][tsEPos_X] = pX;
    	    TankstellenInfo[mf][tsEPos_Y] = pY;
    	    TankstellenInfo[mf][tsEPos_Z] = pZ;
    	    TankstellenInfo[mf][tsPreis] = Preis;
	        mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `tankstellen` (`ID`,`Preis`,`EPos_X`,`EPos_Y`,`EPos_Z`) VALUES ('%d','%d','%f','%f','%f')",mf,Preis,pX,pY,pZ);
   		 	mysql_tquery(sqlHandle, query);
  			format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir die Tankstelle zu kaufen", mf, Preis);
  			TankstellenInfo[mf][tsText][0] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX, pY, pZ, 10.0);
   			TankstellenInfo[mf][tsPickup][0] = CreatePickup(1273, 23, pX, pY, pZ, -1);
		    format(query,sizeof(query),"Die Tankstelle (ID: %d) wurde erfolgreich erstellt",mf);
    		SendClientMessage(playerid,COLOR_SUPER,query);
			format(TankstellenInfo[tsid][tsBeschreibung], 15, "Petrol Station");
   			return 1;
    	}
	}
	else if(Auswahl == 2)//Tankstelle1
	{
	    GetPlayerPos(playerid,pX,pY,pZ);
	    if(sscanf(params,"dd",Auswahl,tsid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createtstelle [2] [TankstellenID]");
        if(TankstellenInfo[tsid][tsErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese TankstellenID existiert nicht.");
       	mysql_format(sqlHandle, query,sizeof(query),"UPDATE `tankstellen` SET `TPos_X1`='%f', `TPos_Y1`='%f', `TPos_Z1`='%f' WHERE `ID`='%d'",pX,pY,pZ,tsid);
		mysql_tquery(sqlHandle, query);
		if(TankstellenInfo[tsid][tsPos_X][0] == 0)
		{
	        format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBenutze '{FF0000}/tanken{FFFFFF}'\num dein Fahrzeug zu betanken", tsid);
	        TankstellenInfo[tsid][tsText][1] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX,pY,pZ+0.2, 10.0);
	        TankstellenInfo[tsid][tsPickup][1] = CreatePickup(1650, 23, pX,pY,pZ, -1);
         	TankstellenInfo[tsid][tsPos_X][0] = pX;
	        TankstellenInfo[tsid][tsPos_Y][0] = pY;
	        TankstellenInfo[tsid][tsPos_Z][0] = pZ;
        	return 1;
        }
        else
        {
			DestroyDynamic3DTextLabel(TankstellenInfo[tsid][tsText][1]);
			TankstellenInfo[tsid][tsText][1] = Text3D:INVALID_3DTEXT_ID;
			DestroyPickup(TankstellenInfo[tsid][tsPickup][1]);
      		format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBenutze '{FF0000}/tanken{FFFFFF}'\num dein Fahrzeug zu betanken", tsid);
	        TankstellenInfo[tsid][tsText][1] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX,pY,pZ+0.2, 10.0);
	        TankstellenInfo[tsid][tsPickup][1] = CreatePickup(1650, 23, pX,pY,pZ, -1);
         	TankstellenInfo[tsid][tsPos_X][0] = pX;
	        TankstellenInfo[tsid][tsPos_Y][0] = pY;
	        TankstellenInfo[tsid][tsPos_Z][0] = pZ;
        }
	}
	else if(Auswahl == 3)//Tankstelle2
	{
	    GetPlayerPos(playerid,pX,pY,pZ);
	    if(sscanf(params,"dd",Auswahl,tsid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createtstelle [3] [TankstellenID]");
     	if(TankstellenInfo[tsid][tsErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese TankstellenID existiert nicht.");
       	mysql_format(sqlHandle, query,sizeof(query),"UPDATE `tankstellen` SET `TPos_X2`='%f', `TPos_Y2`='%f', `TPos_Z2`='%f' WHERE `ID`='%d'",pX,pY,pZ,tsid);
		mysql_tquery(sqlHandle, query);
		if(TankstellenInfo[tsid][tsPos_X][1] == 0)
		{
      		format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBenutze '{FF0000}/tanken{FFFFFF}'\num dein Fahrzeug zu betanken", tsid);
			TankstellenInfo[tsid][tsText][2] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX,pY,pZ+0.2, 10.0);
			TankstellenInfo[tsid][tsPickup][2] = CreatePickup(1650, 23, pX,pY,pZ, -1);
			TankstellenInfo[tsid][tsPos_X][1] = pX;
			TankstellenInfo[tsid][tsPos_Y][1] = pY;
			TankstellenInfo[tsid][tsPos_Z][1] = pZ;
			return 1;
		}
		else
		{

			DestroyDynamic3DTextLabel(TankstellenInfo[tsid][tsText][2]);
            TankstellenInfo[tsid][tsText][2] = Text3D:INVALID_3DTEXT_ID;
			DestroyPickup(TankstellenInfo[tsid][tsPickup][2]);
       		format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBenutze '{FF0000}/tanken{FFFFFF}'\num dein Fahrzeug zu betanken", tsid);
			TankstellenInfo[tsid][tsText][2] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX,pY,pZ+0.2, 10.0);
			TankstellenInfo[tsid][tsPickup][2] = CreatePickup(1650, 23, pX,pY,pZ, -1);
			TankstellenInfo[tsid][tsPos_X][1] = pX;
			TankstellenInfo[tsid][tsPos_Y][1] = pY;
			TankstellenInfo[tsid][tsPos_Z][1] = pZ;
		}
	}
	else if(Auswahl == 4)//Tafel
	{
	    new Float:pR;
	    GetPlayerPos(playerid,pX,pY,pZ);
	    GetPlayerFacingAngle(playerid,pR);
	    if(sscanf(params,"dd",Auswahl,tsid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createtstelle [4] [TankstellenID]");
     	if(TankstellenInfo[tsid][tsErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese TankstellenID existiert nicht.");
       	mysql_format(sqlHandle, query,sizeof(query),"UPDATE `tankstellen` SET `S_PosX`='%f', `S_PosY`='%f', `S_PosZ`='%f', `S_PosR`='%f' WHERE `ID`='%d'",pX,pY,pZ+3,pR,tsid);
		mysql_tquery(sqlHandle, query);
		if(TankstellenInfo[tsid][tsTPos_X] == 0)
		{
		    TankstellenTafelUpdate(tsid);
			TankstellenInfo[tsid][tsTPos_X] = pX;
			TankstellenInfo[tsid][tsTPos_Y] = pY;
			TankstellenInfo[tsid][tsTPos_Z] = pZ+3;
			TankstellenInfo[tsid][tsTPos_R] = pR;
			return 1;
		}
		else
		{
			TankstellenTafelUpdate(tsid);
			TankstellenInfo[tsid][tsTPos_X] = pX;
			TankstellenInfo[tsid][tsTPos_Y] = pY;
			TankstellenInfo[tsid][tsTPos_Z] = pZ+3;
			TankstellenInfo[tsid][tsTPos_R] = pR;
		}
	}
    return 1;
}

CMD:edittstelle(playerid,params[])
{
    new Preis, query[224];
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(!AnTankstellenHaus(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keiner Tankstelle.");
    if(sscanf(params,"d",Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/edittstelle [Preis]");
    new an = GetNearTankstellenHausID(playerid);
    TankstellenInfo[an][tsPreis] = Preis;
	format(query,sizeof(query),"Der Preis von der Tankstelle (ID:%d) wurde auf %d$ gesetzt.",an,Preis);
	SendClientMessage(playerid,COLOR_SUPER,query);
	DestroyDynamic3DTextLabel(TankstellenInfo[an][tsText][0]);
	TankstellenInfo[an][tsText][0] = Text3D:INVALID_3DTEXT_ID;
    if(strlen(TankstellenInfo[an][tsBesitzer]) < 2)
	{
		format(query, sizeof(query), "Tankstelle 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir die Tankstelle zu kaufen", an, TankstellenInfo[an][tsPreis]);
  	}
  	else
  	{
  	    format(query, sizeof(query), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBesitzer: {FF0000}%s", an, TankstellenInfo[an][tsBesitzer]);
  	}
	SaveTankstelleByID(an);
    TankstellenInfo[an][tsText][0] = CreateDynamic3DTextLabel(query, COLOR_WHITE, TankstellenInfo[an][tsPos_X], TankstellenInfo[an][tsPos_Y], TankstellenInfo[an][tsPos_Z], 10.0);
	return 1;
}

CMD:deltstelle(playerid,params[])
{
	new query[128], tsid;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(sscanf(params,"d",tsid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/deltstelle [ID]");
    if(TankstellenInfo[tsid][tsErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese TankstellenID existiert nicht.");
    mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `tankstellen` WHERE `ID`='%d'",tsid);
    mysql_tquery(sqlHandle, query);
	DestroyDynamic3DTextLabel(TankstellenInfo[tsid][tsText][0]);
	TankstellenInfo[tsid][tsText][0] = Text3D:INVALID_3DTEXT_ID;
	DestroyPickup(TankstellenInfo[tsid][tsPickup][0]);
	DestroyDynamic3DTextLabel(TankstellenInfo[tsid][tsText][1]);
	TankstellenInfo[tsid][tsText][1] = Text3D:INVALID_3DTEXT_ID;
	DestroyPickup(TankstellenInfo[tsid][tsPickup][1]);
	DestroyDynamic3DTextLabel(TankstellenInfo[tsid][tsText][2]);
    TankstellenInfo[tsid][tsText][2] = Text3D:INVALID_3DTEXT_ID;
	DestroyPickup(TankstellenInfo[tsid][tsPickup][2]);
	TankstellenInfo[tsid][tsPos_X][0] = 0;
	TankstellenInfo[tsid][tsPos_Y][0] = 0;
	TankstellenInfo[tsid][tsPos_Z][0] = 0;
	TankstellenInfo[tsid][tsPos_X][1] = 0;
	TankstellenInfo[tsid][tsPos_Y][1] = 0;
	TankstellenInfo[tsid][tsPos_Z][1] = 0;
	TankstellenInfo[tsid][tsErstellt] = false;
	TankstellenInfo[tsid][tsEPos_X] = 0;
	TankstellenInfo[tsid][tsEPos_Y] = 0;
	TankstellenInfo[tsid][tsEPos_Z] = 0;
	TankstellenInfo[tsid][tsPreis] = 0;
	TankstellenInfo[tsid][tsBenzin] = 0;
	TankstellenInfo[tsid][tsDiesel] = 0;
	TankstellenInfo[tsid][tsKerosin] = 0;
	TankstellenInfo[tsid][tsBenzinPreis] = 0;
	TankstellenInfo[tsid][tsDieselPreis] = 0;
	TankstellenInfo[tsid][tsKerosinPreis] = 0;
 	TankstellenInfo[tsid][tsBesitzer] = 0;
 	TankstellenInfo[tsid][tsBeschreibung] = 0;
    format(query,sizeof(query),"Die Tankstelle (ID: %d) wurde erfolgreich gelöscht",tsid);
    SendClientMessage(playerid,COLOR_SUPER,query);
    return 1;
}