public LoadWerbetafeln()
{
	new ts = 0, wtafel = 0;
	new var[24];
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `werbetafel` ORDER BY `ID` ASC");

	new stringwtafeltext[64], tocorrect[80];
	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "ID",var); ts = strval(var);
		cache_get_value_name(i, "Text",Werbetafeln[ts][wtafeltext]);
		cache_get_value_name(i, "Text",tocorrect);

	    if(strfind(Werbetafeln[ts][wtafeltext], "--", true) != -1)
	    {
	        new firstline[64];
	        new postext = strfind(Werbetafeln[ts][wtafeltext], "--", true);

			strmid(firstline, Werbetafeln[ts][wtafeltext], 0, postext);
			strdel(Werbetafeln[ts][wtafeltext], 0, postext+2);

	        format(stringwtafeltext,sizeof(stringwtafeltext),"%s\n%s",firstline,Werbetafeln[ts][wtafeltext]);
	    }
	    else format(stringwtafeltext,sizeof(stringwtafeltext),"%s",Werbetafeln[ts][wtafeltext]);

		Werbetafelobject[ts] = CreateDynamicObject(Werbetafeln[ts][wtafelobjectid],Werbetafeln[ts][wtafelx],Werbetafeln[ts][wtafely],Werbetafeln[ts][wtafelz],Werbetafeln[ts][wtafelxrot],Werbetafeln[ts][wtafelyrot],Werbetafeln[ts][wtafelzrot]);
		SetDynamicObjectMaterialText(Werbetafelobject[ts],Werbetafeln[ts][wtafeltmindex],stringwtafeltext,Werbetafeln[ts][wtafeltmsize],Werbetafeln[ts][wtafeltfonts],Werbetafeln[ts][wtafeltfontsize],Werbetafeln[ts][wtafeltbold],Werbetafeln[ts][wtafeltfontcolor],Werbetafeln[ts][wtafeltbackcolor],Werbetafeln[ts][wtafeltaligment]);

        Werbetafeln[ts][wtafeltext] = tocorrect;

		wtafel++;
	}
	cache_delete(result);
	printf(" Es wurden %d Werbetafeln erfolgreich geladen.",wtafel);
}

stock SaveWerbetafel()
{
	new query[164], wtafel = 0;
	while(wtafel<sizeof(Werbetafeln))
	{
   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `werbetafel` SET `Text`='%s' WHERE `ID`='%d'",
	    Werbetafeln[wtafel][wtafeltext],wtafel);
		mysql_tquery(sqlHandle, query);
		wtafel++;
	}
	printf("Werbetafeln gespeichert %d/%d -",wtafel,sizeof(Werbetafeln));
	return 1;
}

