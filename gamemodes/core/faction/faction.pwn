stock FrakKurzel(FrakID)
{
	new ausgabe[32];
	switch(FrakID)
	{
	    case 0:{ausgabe="Keine Fraktion";}
		case 1:{ausgabe="Regierung";}
		case 2:{ausgabe="LS Polizei";}
		case 3:{ausgabe="C.D.M.S.";}
		case 4:{ausgabe="Feuerwehr";}
		case 5:{ausgabe="Rettungsdienst";}
		case 6:{ausgabe="F.B.I";}
		case 7:{ausgabe="S.A Ordnungsamt";}
		case 8:{ausgabe="San News";}
		case 9:{ausgabe="G.S.F";}
		case 10:{ausgabe="R.H.B";}
		case 11:{ausgabe="L.S.V";}
		case 12:{ausgabe="V.L.A";}
		case 13:{ausgabe="S.F Rifa";}
		case 14:{ausgabe="Triaden";}
		case 15:{ausgabe="Yakuza";}
		case 16:{ausgabe="Camorra";}
		case 17:{ausgabe="La Cosa Nostra";}
		case 18:{ausgabe="Russian Mafia";}
		case 19:{ausgabe="International Contract Agency";}
	}
	return ausgabe;
}

stock FrakName(Fraktion)
{
	new frakname[37];
	switch(Fraktion)
	{
		case 0:{frakname="Keine Fraktion";}
		case 1:{frakname="Regierung";}
		case 2:{frakname="Los Santos Polizei";}
		case 3:{frakname="Central Defensive Marshallas Service";}
		case 4:{frakname="Feuerwehr";}
		case 5:{frakname="Rettungsdienst";}
		case 6:{frakname="Federal Bureau of Investigation";}
		case 7:{frakname="San Andreas Ordnungsamt";}
		case 8:{frakname="San News";}
		case 9:{frakname="Grove Street Families";}
		case 10:{frakname="Rolling High Ballas";}
		case 11:{frakname="Los Santos Vagos";}
		case 12:{frakname="Los Aztecas";}
		case 13:{frakname="San Fierro Rifa";}
		case 14:{frakname="Triaden";}
		case 15:{frakname="Yakuza";}
		case 16:{frakname="Camorra";}
		case 17:{frakname="La Cosa Nostra";}
		case 18:{frakname="Russian Mafia";}
		case 19:{frakname="International Contract Agency";}
	}
	return frakname;
}

stock FrakCarFarbe1(frakid)
{
    new frakcolor;
	if(frakid == 0){frakcolor=0;}//Zivi
	if(frakid == 1){frakcolor=1;}//Regierung
	if(frakid == 2){frakcolor=79;}//LSPD
	if(frakid == 3){frakcolor=79;}//SFPD
	if(frakid == 4){frakcolor=79;}//LVPD
	if(frakid == 5){frakcolor=3;}//San Andreas Rettungsdienst
	if(frakid == 6){frakcolor=0;}//Federal Bureau of Investigation
	if(frakid == 7){frakcolor=6;}//San Andreas Ordnungsamt
	if(frakid == 8){frakcolor=6;}//Interglobal Television
	if(frakid == 9){frakcolor=16;}//Grove Street Families
	if(frakid == 10){frakcolor=85;}//Rolling High Ballas
	if(frakid == 11){frakcolor=6;}//Los Santos Vagos
	if(frakid == 12){frakcolor=130;}//Varrios Los Aztecas
	if(frakid == 13){frakcolor=87;}//San Fierro Rifa
	if(frakid == 14){frakcolor=83;}//Triaden
	if(frakid == 15){frakcolor=0;}//Yakuza
	if(frakid == 16){frakcolor=14;}//Cali Kartell
	if(frakid == 17){frakcolor=61;}//La Cosa Nostra
	if(frakid == 18){frakcolor=0;}//Brigada
	if(frakid == 19){frakcolor=0;}//International Contract Agency
	return frakcolor;
}

stock FrakCarFarbe2(frakid)
{
    new frakcolor;
	if(frakid == 0){frakcolor=0;}//Zivi
	if(frakid == 1){frakcolor=1;}//Regierung
	if(frakid == 2){frakcolor=1;}//LSPD
	if(frakid == 3){frakcolor=1;}//SFPD
	if(frakid == 4){frakcolor=1;}//LVPD
	if(frakid == 5){frakcolor=1;}//San Andreas Rettungsdienst
	if(frakid == 6){frakcolor=0;}//Federal Bureau of Investigation
	if(frakid == 7){frakcolor=1;}//San Andreas Ordnungsamt
	if(frakid == 8){frakcolor=0;}//Interglobal Television
	if(frakid == 9){frakcolor=16;}//Grove Street Families
	if(frakid == 10){frakcolor=85;}//Rolling High Ballas
	if(frakid == 11){frakcolor=6;}//Los Santos Vagos
	if(frakid == 12){frakcolor=130;}//Varrios Los Aztecas
	if(frakid == 13){frakcolor=87;}//San Fierro Rifa
	if(frakid == 14){frakcolor=83;}//San Fierro Triads
	if(frakid == 15){frakcolor=0;}//Yakuza
	if(frakid == 16){frakcolor=14;}//Camorra
	if(frakid == 17){frakcolor=61;}//Italian Mafia
	if(frakid == 18){frakcolor=0;}//Russian Mafia
	if(frakid == 19){frakcolor=0;}//International Contract Agency
	return frakcolor;
}

stock IsPlayerInAnyGang(playerid)
{
	if(SpielerInfo[playerid][sFraktion] > 8 && SpielerInfo[playerid][sFraktion] < 19)
	    return 1;
	else return 0;
}

public ShowFrakVerwaltung(playerid)
{
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		ShowPlayerDialog(playerid,DIALOG_FRAKV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsverwaltung","Rangnamen bearbeiten\nSkinordnung festlegen\nFahrzeugverwaltung\nEquipt-Verwaltung\nGehaltverwaltung\nUndercover Management","Weiter","Abbrechen");
		return 1;
	}
	else if(SpielerInfo[playerid][sFraktion] == 5)
	{
		ShowPlayerDialog(playerid,DIALOG_SARDV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsverwaltung","Sanitäter | Rangnamen bearbeiten\nFeuerwehr | Rangnamen bearbeiten\nSanitäter | Skinordnung festlegen\nFeuerwehr | Skinordnung festlegen\nFahrzeugverwaltung\nGehaltverwaltung","Weiter","Abbrechen");
		return 1;
	}
	else if(SpielerInfo[playerid][sFraktion] > 5 && SpielerInfo[playerid][sFraktion] < 9 && SpielerInfo[playerid][sFraktion] != 19)
	{
		ShowPlayerDialog(playerid,DIALOG_FRAKV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsverwaltung","Rangnamen bearbeiten\nSkinordnung festlegen\nFahrzeugverwaltung\nGehaltverwaltung","Weiter","Abbrechen");
		return 1;
	}
	else if(SpielerInfo[playerid][sFraktion] > 8 && SpielerInfo[playerid][sFraktion] != 19)//Gangs & Mafian only
	{
		if(FrakInfo[SpielerInfo[playerid][sFraktion]][fiBaseZugang] > 0)//Base Auf
		{
	    	ShowPlayerDialog(playerid,DIALOG_FRAKV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsverwaltung","Rangnamen bearbeiten\nSkinordnung festlegen\nFahrzeugverwaltung\nGehaltverwaltung\nBase ist {00A300}geöffnet\nBündnisse\nGangupgrades\nBefehle Management","Weiter","Abbrechen");
		}
		else //Base zu
		{
			ShowPlayerDialog(playerid,DIALOG_FRAKV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsverwaltung","Rangnamen bearbeiten\nSkinordnung festlegen\nFahrzeugverwaltung\nGehaltverwaltung\nBase ist {CD0000}verschlossen\nBündnisse\nGangupgrades\nBefehle Management","Weiter","Abbrechen");
		}
		return 1;
	}
	else if(SpielerInfo[playerid][sFraktion] == 19)
	{
		ShowPlayerDialog(playerid,DIALOG_FRAKV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsverwaltung","Rangnamen bearbeiten\nFahrzeugverwaltung\nGehaltverwaltung","Weiter","Abbrechen");
		return 1;
	}
	return 1;
}


stock RangName(playerid)
{
    new rstring1[3], rstring2[3], r1[24];
    if(SpielerInfo[playerid][sRank] < 1)
	{
	    format(r1,sizeof(r1),"Kein Rang");
	    return r1;
	}
	if(SpielerInfo[playerid][sFraktion] == 5)
	{
	    if(GetPVarInt(playerid,"MedicDuty") > 0 && GetPVarInt(playerid,"FeuerwehrDuty") < 1)//Sanitäter
	    {
			format(rstring1,sizeof(rstring1),"%d",SpielerInfo[playerid][sRank]);
			format(rstring2,sizeof(rstring2),"%d",SpielerInfo[playerid][sFraktion]);
		    format(r1,sizeof(r1),"%s",mysql_GetString("rangnamen", rstring1, "frakid", rstring2));
		    return r1;
		}
		else if(GetPVarInt(playerid,"MedicDuty") < 1 && GetPVarInt(playerid,"FeuerwehrDuty") > 0)//Feuerwehr
	    {
			format(rstring1,sizeof(rstring1),"T%d",SpielerInfo[playerid][sRank]);
			format(rstring2,sizeof(rstring2),"%d",SpielerInfo[playerid][sFraktion]);
		    format(r1,sizeof(r1),"%s",mysql_GetString("rangnamen", rstring1, "frakid", rstring2));
		    return r1;
	    }
    }
    else
    {
		format(rstring1,sizeof(rstring1),"%d",SpielerInfo[playerid][sRank]);
		format(rstring2,sizeof(rstring2),"%d",SpielerInfo[playerid][sFraktion]);
	    format(r1,sizeof(r1),"%s",mysql_GetString("rangnamen", rstring1, "frakid", rstring2));
	    return r1;
    }
    return r1;
}

stock LoadFrakInfo()
{
    new frakinfos;
	new fc = 0;
	new var[24];
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `frakinfos` ORDER BY `FID` ASC");

	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "FID",var);	fc = strval(var);
		cache_get_value_name(i, "Members",var); FrakInfo[fc][fiFrakMembers] = strval(var);
		cache_get_value_name(i, "Kasse",var); FrakInfo[fc][fiFrakKasse] = strval(var);
		cache_get_value_name(i, "Mats",var); FrakInfo[fc][fiMats] = strval(var);
		cache_get_value_name(i, "Drogen",var); FrakInfo[fc][fiDrogen] = strval(var);
		cache_get_value_name(i, "Bomben",var); FrakInfo[fc][fiBomb] = strval(var);
		cache_get_value_name(i, "GVerbrecher",var); FrakInfo[fc][fiFrakGVerbrecher] = strval(var);
		cache_get_value_name(i, "WarGegner",var); FrakInfo[fc][fiWarGegner] = strval(var);
		cache_get_value_name(i, "WarPoints",var); FrakInfo[fc][fiWarPoints] = strval(var);
		cache_get_value_name(i, "Skinordnung",var); FrakInfo[fc][fiSkinordnung] = strval(var);
		cache_get_value_name(i, "BaseZugang",var); FrakInfo[fc][fiBaseZugang] = strval(var);
		cache_get_value_name(i, "Baseheal",var); FrakInfo[fc][fiBaseheal] = strval(var);
		cache_get_value_name(i, "Masken",var); FrakInfo[fc][fiMasken] = strval(var);

		//Upgrades
		cache_get_value_name(i, "Gangpunkte",var); FrakInfo[fc][fiGangpunkte] = strval(var);
		cache_get_value_name(i, "DrogenUpgrade",var); FrakInfo[fc][fiDrogenUpgrade] = strval(var);
		cache_get_value_name(i, "AmmunationUpgrade",var); FrakInfo[fc][fiAmmunationUpgrade] = strval(var);
		cache_get_value_name(i, "BasehealUpgrade",var); FrakInfo[fc][fiBasehealUpgrade] = strval(var);
		cache_get_value_name(i, "GangzonenUpgrade",var); FrakInfo[fc][fiGangzonenUpgrade] = strval(var);
		cache_get_value_name(i, "MatsUpgrade",var); FrakInfo[fc][fiMatsUpgrade] = strval(var);

		//Bündnisse
		cache_get_value_name(i, "BND9",var); FrakInfo[fc][fiBnd][9] = strval(var);
		cache_get_value_name(i, "BND10",var); FrakInfo[fc][fiBnd][10] = strval(var);
		cache_get_value_name(i, "BND11",var); FrakInfo[fc][fiBnd][11] = strval(var);
		cache_get_value_name(i, "BND12",var); FrakInfo[fc][fiBnd][12] = strval(var);
		cache_get_value_name(i, "BND13",var); FrakInfo[fc][fiBnd][13] = strval(var);
		cache_get_value_name(i, "BND14",var); FrakInfo[fc][fiBnd][14] = strval(var);
		cache_get_value_name(i, "BND15",var); FrakInfo[fc][fiBnd][15] = strval(var);
		cache_get_value_name(i, "BND16",var); FrakInfo[fc][fiBnd][16] = strval(var);
		cache_get_value_name(i, "BND17",var); FrakInfo[fc][fiBnd][17] = strval(var);
		cache_get_value_name(i, "BND18",var); FrakInfo[fc][fiBnd][18] = strval(var);

		//Befehle
		cache_get_value_name(i, "KidnapCMD",var); FrakInfo[fc][fiKidnapCMD] = strval(var);
		cache_get_value_name(i, "SelldrugsCMD",var); FrakInfo[fc][fiSelldrugsCMD] = strval(var);
		cache_get_value_name(i, "GangfightCMD",var); FrakInfo[fc][fiGangfightCMD] = strval(var);
		cache_get_value_name(i, "BasehealCMD",var); FrakInfo[fc][fiBasehealCMD] = strval(var);
		cache_get_value_name(i, "MaskeCMD",var); FrakInfo[fc][fiMaskeCMD] = strval(var);
	    frakinfos++;
	}
	cache_delete(result);
	printf(" Es wurden %d Fraktioninfos erfolgreich geladen.",frakinfos);
	return 1;
}

stock SaveFrakInfo()
{
	new query[350];
	for(new mf=1;mf<MAX_FRAKS;mf++)
    {
   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `Members`='%d', `Kasse`='%d', `Mats`='%d', `Drogen`='%d', `Bomben`='%d', `GVerbrecher`='%d', `WarGegner`='%d', `WarPoints`='%d', `Skinordnung`='%d', `BaseZugang`='%d', `Baseheal`='%d' WHERE `FID`='%d'",
	    FrakInfo[mf][fiFrakMembers],FrakInfo[mf][fiFrakKasse],FrakInfo[mf][fiMats],FrakInfo[mf][fiDrogen],FrakInfo[mf][fiBomb],FrakInfo[mf][fiFrakGVerbrecher],FrakInfo[mf][fiWarGegner],FrakInfo[mf][fiWarPoints],FrakInfo[mf][fiSkinordnung],FrakInfo[mf][fiBaseZugang],FrakInfo[mf][fiBaseheal],mf);
		mysql_tquery(sqlHandle, query);

		//Bündnisse
		mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `BND9`='%d', `BND10`='%d', `BND11`='%d', `BND12`='%d', `BND13`='%d', `BND14`='%d', `BND15`='%d', `BND16`='%d', `BND17`='%d', `BND18`='%d' WHERE `FID`='%d'",
	    FrakInfo[mf][fiBnd][9],FrakInfo[mf][fiBnd][10],FrakInfo[mf][fiBnd][11],FrakInfo[mf][fiBnd][12],FrakInfo[mf][fiBnd][13],FrakInfo[mf][fiBnd][14],FrakInfo[mf][fiBnd][15],FrakInfo[mf][fiBnd][16],FrakInfo[mf][fiBnd][17],FrakInfo[mf][fiBnd][18],mf);
		mysql_tquery(sqlHandle, query);

		//Upgrades
		mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `Gangpunkte`='%d', `DrogenUpgrade`='%d', `AmmunationUpgrade`='%d', `BasehealUpgrade`='%d', `GangzonenUpgrade`='%d', `MatsUpgrade`='%d', `Masken`='%d' WHERE `FID`='%d'",
	    FrakInfo[mf][fiGangpunkte],FrakInfo[mf][fiDrogenUpgrade],FrakInfo[mf][fiAmmunationUpgrade],FrakInfo[mf][fiBasehealUpgrade],FrakInfo[mf][fiGangzonenUpgrade],FrakInfo[mf][fiMatsUpgrade],FrakInfo[mf][fiMasken],mf);
		mysql_tquery(sqlHandle, query);

		//Befehle
		mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `KidnapCMD`='%d', `SelldrugsCMD`='%d', `GangfightCMD`='%d', `BasehealCMD`='%d', `MaskeCMD`='%d' WHERE `FID`='%d'",
	    FrakInfo[mf][fiKidnapCMD],FrakInfo[mf][fiSelldrugsCMD],FrakInfo[mf][fiGangfightCMD],FrakInfo[mf][fiBasehealCMD],FrakInfo[mf][fiMaskeCMD],mf);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock SaveFrakInfoById(mf)
{
	new query[350];

	mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `Members`='%d', `Kasse`='%d', `Mats`='%d', `Drogen`='%d', `Bomben`='%d', `GVerbrecher`='%d', `WarGegner`='%d', `WarPoints`='%d', `Skinordnung`='%d', `BaseZugang`='%d', `Baseheal`='%d' WHERE `FID`='%d'",
	FrakInfo[mf][fiFrakMembers],FrakInfo[mf][fiFrakKasse],FrakInfo[mf][fiMats],FrakInfo[mf][fiDrogen],FrakInfo[mf][fiBomb],FrakInfo[mf][fiFrakGVerbrecher],FrakInfo[mf][fiWarGegner],FrakInfo[mf][fiWarPoints],FrakInfo[mf][fiSkinordnung],FrakInfo[mf][fiBaseZugang],FrakInfo[mf][fiBaseheal],mf);
	mysql_tquery(sqlHandle, query);

	//Bündnisse
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `BND9`='%d', `BND10`='%d', `BND11`='%d', `BND12`='%d', `BND13`='%d', `BND14`='%d', `BND15`='%d', `BND16`='%d', `BND17`='%d', `BND18`='%d' WHERE `FID`='%d'",
	FrakInfo[mf][fiBnd][9],FrakInfo[mf][fiBnd][10],FrakInfo[mf][fiBnd][11],FrakInfo[mf][fiBnd][12],FrakInfo[mf][fiBnd][13],FrakInfo[mf][fiBnd][14],FrakInfo[mf][fiBnd][15],FrakInfo[mf][fiBnd][16],FrakInfo[mf][fiBnd][17],FrakInfo[mf][fiBnd][18],mf);
	mysql_tquery(sqlHandle, query);

	//Upgrades
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `Gangpunkte`='%d', `DrogenUpgrade`='%d', `AmmunationUpgrade`='%d', `BasehealUpgrade`='%d', `GangzonenUpgrade`='%d', `MatsUpgrade`='%d', `Masken`='%d' WHERE `FID`='%d'",
	FrakInfo[mf][fiGangpunkte],FrakInfo[mf][fiDrogenUpgrade],FrakInfo[mf][fiAmmunationUpgrade],FrakInfo[mf][fiBasehealUpgrade],FrakInfo[mf][fiGangzonenUpgrade],FrakInfo[mf][fiMatsUpgrade],FrakInfo[mf][fiMasken],mf);
	mysql_tquery(sqlHandle, query);

	//Befehle
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `frakinfos` SET `KidnapCMD`='%d', `SelldrugsCMD`='%d', `GangfightCMD`='%d', `BasehealCMD`='%d', `MaskeCMD`='%d' WHERE `FID`='%d'",
	FrakInfo[mf][fiKidnapCMD],FrakInfo[mf][fiSelldrugsCMD],FrakInfo[mf][fiGangfightCMD],FrakInfo[mf][fiBasehealCMD],FrakInfo[mf][fiMaskeCMD],mf);
	mysql_tquery(sqlHandle, query);
	
	return 1;
}

stock CreateFrakNummernSchild(vehicleid,frakid)
{
	new string[10];
	if(frakid == 1)
	{
 		format(string, sizeof(string), "Regierung");
	}
	else if(frakid == 2)
	{
 		format(string, sizeof(string), "SAPD");
	}
	else if(frakid == 3)
	{
	    format(string, sizeof(string), "CDMS");
	}
	else if(frakid == 4)
	{
	    format(string, sizeof(string), "SAFD");
	}
	else if(frakid == 5)
	{
	    format(string, sizeof(string), "SARD");
	}
	else if(frakid == 6)
	{
	    format(string, sizeof(string), "FBI");
	}
	else if(frakid == 7)
	{
	    format(string, sizeof(string), "O-AMT");
	}
	else if(frakid == 8)
	{
	    format(string, sizeof(string), "NEWS");
	}
	else if(frakid == 9)
	{
	    format(string, sizeof(string), "GROVE");
	}
	else if(frakid == 10)
	{
	    format(string, sizeof(string), "BALLAS");
	}
	else if(frakid == 11)
	{
	    format(string, sizeof(string), "VAGOS");
	}
	else if(frakid == 12)
	{
	    format(string, sizeof(string), "AZTECAS");
	}
	else if(frakid == 13)
	{
	    format(string, sizeof(string), "RIFA");
	}
	else if(frakid == 14)
	{
	    format(string, sizeof(string), "TRIADEN");
	}
	else if(frakid == 15)
	{
	    format(string, sizeof(string), "YAKUZA");
	}
	else if(frakid == 16)
	{
	    format(string, sizeof(string), "CAMORRA");
	}
	else if(frakid == 17)
	{
	    format(string, sizeof(string), "ITALIAN");
	}
	else if(frakid == 18)
	{
	    format(string, sizeof(string), "RUSSIA");
	}
	format(FahrzeugInfo[vehicleid][fKennzeichen], 10, string);
	SetVehicleNumberPlate(vehicleid,string);
	return 1;
}

stock IsAllowedForCommand(playerid, const command[])
{
	if(strcmp(command,"Kidnap",true) ==0 )
	{
		if(SpielerInfo[playerid][sRank] >= FrakInfo[SpielerInfo[playerid][sFraktion]][fiKidnapCMD]){return true;}
	}
	else if(strcmp(command,"Selldrugs",true) ==0 )
	{
		if(SpielerInfo[playerid][sRank] >= FrakInfo[SpielerInfo[playerid][sFraktion]][fiSelldrugsCMD]){return true;}
	}
	else if(strcmp(command,"Gangfight",true) ==0 )
	{
		if(SpielerInfo[playerid][sRank] >= FrakInfo[SpielerInfo[playerid][sFraktion]][fiGangfightCMD]){return true;}
	}
	else if(strcmp(command,"Baseheal",true) ==0 )
	{
		if(SpielerInfo[playerid][sRank] >= FrakInfo[SpielerInfo[playerid][sFraktion]][fiBasehealCMD]){return true;}
	}
	else if(strcmp(command,"Maske",true) ==0 )
	{
		if(SpielerInfo[playerid][sRank] >= FrakInfo[SpielerInfo[playerid][sFraktion]][fiMaskeCMD]){return true;}
	}
	return false;
}

stock GetFraktion(frak)
{
	new fName[37]="Unbekannt";
	switch(frak)
	{
		case 1:{fName="Regierung";}
		case 2:{fName="Los Santos Polizei";}
		case 3:{fName="Central Defensive Marshallas Service";}
		case 4:{fName="Feuerwehr";}
		case 5:{fName="Rettungsdienst";}
		case 6:{fName="Federal Bureau of Investigation";}
		case 7:{fName="San Andreas Ordnungsamt";}
		case 8:{fName="San News";}
		case 9:{fName="Grove Street Families";}
		case 10:{fName="Rolling High Ballas";}
		case 11:{fName="Los Santos Vagos";}
		case 12:{fName="Los Aztecas";}
		case 13:{fName="San Fierro Rifa";}
		case 14:{fName="Triaden";}
		case 15:{fName="Yakuza";}
		case 16:{fName="Camorra";}
		case 17:{fName="La Cosa Nostra";}
		case 18:{fName="Russian Mafia";}
		case 19:{fName="International Contract Agency";}
	}
	return fName;
}

sendFactionMessage(color, factionId, const messagetext[]) {
	for(new ss = 0; ss < MAX_PLAYERS; ss++) {
		if(SpielerInfo[ss][sFraktion] == factionId) {
			SendSplitMessage(ss, color, messagetext);
			//SCM(ss,COLOR_BLUE,messagetext);
		}
	}
	return 1;
}