forward onLoadStrassenSchilder();
public onLoadStrassenSchilder() {
	new rows, ModelID = 0, Database = 0;
	cache_get_row_count(rows);
	if(rows) {
		for(new i = 0; i < rows; i++) {
			if(i >= MAX_SCHILDER) break;
			cache_get_value_name_int(i, "ID", Database);
			cache_get_value_name_int(i, "ModelID", ModelID);
			cache_get_value_name_float(i, "PosX", SchildInfo[Database][oPosX]); 
			cache_get_value_name_float(i, "PosY", SchildInfo[Database][oPosY]); 
			cache_get_value_name_float(i, "PosZ", SchildInfo[Database][oPosZ]); 
			cache_get_value_name_float(i, "PosA", SchildInfo[Database][oPosA]);

			SchildInfo[Database][dbID] = Database;
			SchildInfo[Database][Erstellt] = true;
			SchildInfo[Database][ID] = CreateDynamicObject(ModelID,SchildInfo[Database][oPosX],SchildInfo[Database][oPosY],SchildInfo[Database][oPosZ],0.0,0.0,SchildInfo[Database][oPosA]);
		}
	}
	printf("MYSQL: Es wurden '%d' Strassenschilder geladen und erstellt.", rows);
	return 1;
}