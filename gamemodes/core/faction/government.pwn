stock LoadRegierung()
{
	mysql_tquery(sqlHandle, "SELECT * FROM `regierung` ORDER BY `ID` ASC", "onLoadGovermentData");
    return 1;
}

forward onLoadGovermentData();
public onLoadGovermentData() {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        cache_get_value_name_int(0, "Steuern", GovVars[govSteuern]);
		cache_get_value_name_int(0, "Kasse", GovVars[govKasse]);
		cache_get_value_name_int(0, "SteuernKFZ", GovVars[govSteuernKFZ]);
		cache_get_value_name_int(0, "SteuernHaus", GovVars[govSteuernHaus]);
    }
    printf(" Die Regierungseinstellungen wurden erfolgreich geladen. $%d in Staatskasse.",GovVars[govKasse]);
    return 1;
}

stock SaveRegierung()
{
    new query[230];
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `regierung` SET `Steuern`='%d', `Kasse`='%d', `SteuernHaus`='%d', `SteuernKFZ`='%d'  WHERE `ID`='1'",GovVars[govSteuern],GovVars[govKasse],GovVars[govSteuernHaus],GovVars[govSteuernKFZ]);
	mysql_tquery(sqlHandle, query);
	return 1;
}