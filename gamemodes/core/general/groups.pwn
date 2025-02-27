stock LoadGruppen() {
	mysql_tquery(sqlHandle, "SELECT * FROM `gruppen` ORDER BY `ID` ASC", "onGroupsLoaded");
	return 1;
}

forward onGroupsLoaded();
public onGroupsLoaded() {
	new rows, ts = 1;
	cache_get_row_count(rows);
	if(rows) {
		for(new i = 0; i < rows; i++) {
			cache_get_value_name_int(i, "ID", ts);
			cache_get_value_name(i, "Name", GruppenInfo[ts][gName]);
			cache_get_value_name(i, "Kennzeichen", GruppenInfo[ts][gSchild]);
			cache_get_value_name_int(i, "Kasse", GruppenInfo[ts][gKasse]);
			cache_get_value_name_int(i, "GehaltUpgrade", GruppenInfo[ts][gUpgrade][0]);
			GruppenInfo[ts][gErstellt] = true;
		}
	}
	printf(" Es wurden %d Gruppen erfolgreich geladen.", rows);
	return 1;
}

stock SaveGruppen()
{
	new query[230];
	for(new mf=1;mf<MAX_GRUPPEN;mf++)
    {
        if(GruppenInfo[mf][gErstellt] == false)continue;
   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `gruppen` SET `Kasse`='%d', `GehaltUpgrade`='%d', `Kennzeichen`='%s' WHERE `ID`='%d'",
	    GruppenInfo[mf][gKasse],GruppenInfo[mf][gUpgrade][0],GruppenInfo[mf][gSchild],mf);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock GRangName(playerid)
{
	new rstring1[3], rstring2[3], r1[24];
	if(SpielerInfo[playerid][sRank] < 1)
	{
	    format(r1,sizeof(r1),"Kein Rang");
	    return r1;
	}
	format(rstring1,sizeof(rstring1),"%d",SpielerInfo[playerid][sGRank]);
	format(rstring2,sizeof(rstring2),"%d",SpielerInfo[playerid][sGruppe]);
    format(r1,sizeof(r1),"%s",mysql_GetString("grangnamen", rstring1, "gid", rstring2));
    return r1;
}

Group_DialogResponse(playerid, dialogid, response, const inputtext[]) {
	switch(dialogid) {
		case DIALOG_CREATE_GRUPPE: {
  			if(!response) return 1;
			if(strlen(inputtext) < 1 || strlen(inputtext) > 24) {
				return ShowPlayerDialog(playerid,DIALOG_CREATE_GRUPPE,DIALOG_STYLE_INPUT,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppe erstellen","Bitte gib unten ein Namen deiner Gruppe ein.\n\n{FF0000}Der Gruppen Name darf nicht kleiner als 1 Zeichen und nicht größer als 24 Zeichen haben.","Weiter","Abbrechen");
			}
			new str[164];
			format(str,sizeof(str),"{FFFFFF}Bist du dir sicher, dass du die Gruppe {FF0000}%s{FFFFFF} erstellen möchtest ?",inputtext);
			ShowPlayerDialog(playerid,DIALOG_CREATE_GRUPPE2,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppe erstellen",str,"Ja","Nein");
			SetPVarString(playerid,"GruppenName",inputtext);
			return 1;
		}
		case DIALOG_CREATE_GRUPPE2:
		{
  			if(!response) {
				DeletePVar(playerid,"GruppenName");
				return 1;
			}
			ShowPlayerDialog(playerid,DIALOG_CREATE_GRUPPE3,DIALOG_STYLE_INPUT,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppe erstellen","{FFFFFF}Bitte gib unten dein Wunschkennzeichen an. {FF0000}(3-5 Zeichen)","Weiter","Abbrechen");
		    return 1;
		}
		case DIALOG_CREATE_GRUPPE3:
		{
  			if(!response) {
				DeletePVar(playerid,"GruppenName");
				return 1;
			}
			if(strlen(inputtext) < 1 || strlen(inputtext) > 5) {
				return ShowPlayerDialog(playerid,DIALOG_CREATE_GRUPPE3,DIALOG_STYLE_INPUT,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppe erstellen","{FFFFFF}Bitte gib unten dein Wunschkennzeichen an. {FF0000}(3-5 Zeichen)","Weiter","Abbrechen");
			}
			new query[164], GruppenName[24];
			GetPVarString(playerid, "GruppenName", GruppenName, sizeof(GruppenName));

			mysql_format(sqlHandle, query, sizeof(query), "SELECT `Name` FROM `gruppen` WHERE `Name` = '%s'", GruppenName);
			mysql_tquery(sqlHandle, query, "onCheckGroupName", "is", playerid, inputtext);
			return 1;
			
		}
	}
	return 1;
}