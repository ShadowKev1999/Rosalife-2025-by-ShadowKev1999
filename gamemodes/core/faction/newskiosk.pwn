stock LoadNewsKisok()
{
	mysql_tquery(sqlHandle, "SELECT * FROM `newskiosk` ORDER BY `ID` ASC", "onLoadNewsKiosk");
	return 1;
}

forward onLoadNewsKiosk();
public onLoadNewsKiosk() {
    new rows, string[144];
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            NewsPaperKiosk[i][SlotUsed] = 1;
            cache_get_value_name_int(i, "ID", NewsPaperKiosk[i][dbID]);
            cache_get_value_name_float(i, "nkX", NewsPaperKiosk[i][nkX]);
            cache_get_value_name_float(i, "nkY", NewsPaperKiosk[i][nkY]); 
            cache_get_value_name_float(i, "nkZ", NewsPaperKiosk[i][nkZ]); 
            cache_get_value_name_int(i, "ZeitungAmount", NewsPaperKiosk[i][ZeitungAmount]);
            cache_get_value_name_int(i, "Ersteller", NewsPaperKiosk[i][Ersteller]);
            format(string, sizeof(string),"Zeitungsstand\n\nZeitungen: %i\n/buynewspaper\n%i $",NewsPaperKiosk[i][ZeitungAmount],ServerLager[it_newspaper_price]);
            NewsPaperKiosk[i][nkLabel] = CreateDynamic3DTextLabel(string, COLOR_WHITE, NewsPaperKiosk[i][nkX], NewsPaperKiosk[i][nkY], NewsPaperKiosk[i][nkZ]+0.2, 10.0);
            NewsPaperKiosk[i][nkPickup] = CreatePickup(2894, 23, NewsPaperKiosk[i][nkX], NewsPaperKiosk[i][nkY], NewsPaperKiosk[i][nkZ], -1);
        }
    }
    printf("Es wurde(n) %i Zeitungsstaende erfolgreich geladen und erstellt.", rows);
    return 1;
}

stock SaveNewsKiosk()
{
	new query[128];
	for(new i=0;i<MAX_KIOSKS;i++)
    {
	    if(NewsPaperKiosk[i][SlotUsed] == 0)continue;
	    mysql_format(sqlHandle, query,sizeof query,"UPDATE `newskiosk` SET `ZeitungAmount`='%d' WHERE `ID`='%d'",NewsPaperKiosk[i][ZeitungAmount],NewsPaperKiosk[i][dbID]);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock AmNewsKiosk(playerid)
{
 	for(new i=0; i<MAX_KIOSKS; i++)
 	{
 		if(IsPlayerInRangeOfPoint(playerid,5.0,NewsPaperKiosk[i][nkX],NewsPaperKiosk[i][nkY],NewsPaperKiosk[i][nkZ]))
 		{
 	    	return i;
		}
	}
	return -1;
}