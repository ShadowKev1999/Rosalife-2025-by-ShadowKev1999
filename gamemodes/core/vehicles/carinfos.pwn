stock LoadCarInfos()
{
	mysql_tquery(sqlHandle, "SELECT * FROM `carinfos` ORDER BY `ModelID` ASC", "OnLoadCarInfos");
}

forward OnLoadCarInfos();
public OnLoadCarInfos() {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "ModelID", VehicleData[i][vehModelID]);
			cache_get_value_name_int(i, "TankArt",VehicleData[i][vehTankArt]);
			cache_get_value_name_float(i, "Verbrauch",VehicleData[i][vehVerbrauch]);
			cache_get_value_name_int(i, "Liter",VehicleData[i][vehLiter]); 
        }
    }
    printf("Es wurden %d Carinfo-Eintraege geladen.", rows);
    return 1;
}