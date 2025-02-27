stock LoadEventboxen()
{
	mysql_tquery(sqlHandle, "SELECT * FROM `eventboxen` ORDER BY `ID` ASC", "onLoadEventboxes");
    return 1;
}

forward onLoadEventboxes();
public onLoadEventboxes() {
    new rows, fc = 1, string[164];
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "ID", fc);
            cache_get_value_name_int(i, "ObjectID", EventboxInfo[fc][ebObjectID]);
            cache_get_value_name_float(i, "Pos_X", EventboxInfo[fc][ebPos_X]); 
            cache_get_value_name_float(i, "Pos_Y", EventboxInfo[fc][ebPos_Y]); 
            cache_get_value_name_float(i, "Pos_Z", EventboxInfo[fc][ebPos_Z]);
            cache_get_value_name_int(i, "Gift", EventboxInfo[fc][ebGift]);

            EventboxInfo[fc][ebObject] = CreateDynamicObject(EventboxInfo[fc][ebObjectID], EventboxInfo[fc][ebPos_X], EventboxInfo[fc][ebPos_Y], EventboxInfo[fc][ebPos_Z], 0.0, 0.0, 0.0);
            format(string, sizeof(string), ""SERV_NAME" - Eventbox %d\nBenutze {FF0000}/eb{FFFFFF} um die Box zu öffnen",fc);
            EventboxInfo[fc][ebText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, EventboxInfo[fc][ebPos_X], EventboxInfo[fc][ebPos_Y], EventboxInfo[fc][ebPos_Z], 5.0);
            EventboxInfo[fc][ebErstellt] = true;
        }
    }
    printf(" Es wurde(n) %d Eventboxen erfolgreich geladen und erstellt.", rows);
    return 1;
}

stock AnEventbox(playerid)
{
    for(new ts = 1;ts<MAX_EVENTBOXES;ts++)
    {
		if(EventboxInfo[ts][ebErstellt] == false)continue;
 		if(IsPlayerInRangeOfPoint(playerid,3.0,EventboxInfo[ts][ebPos_X],EventboxInfo[ts][ebPos_Y],EventboxInfo[ts][ebPos_Z]))
 		{
 	    	return ts;
		}
	}
	return 0;
}