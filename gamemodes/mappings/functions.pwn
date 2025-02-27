stock createObjectTable() {
    new query[4000];
    strcat(query,"CREATE TABLE IF NOT EXISTS `mapping_objects` (`id` int(11) NOT NULL AUTO_INCREMENT,`modelid` int(11) DEFAULT NULL,`X` DECIMAL(10,5) NOT NULL,`Y` DECIMAL(10,5) NOT NULL,`Z` DECIMAL(10,5) NOT NULL,`RX` DECIMAL(10,5) NOT NULL,`RY` DECIMAL(10,5) NOT NULL,`RZ` DECIMAL(10,5) NOT NULL,");
    strcat(query,"`worldid` int(11) NOT NULL, `interiorid` int(11) NOT NULL, `streamdistance` DECIMAL(10,5) NOT NULL, `drawdistance` DECIMAL(10,5) NOT NULL,");
    strcat(query,"`Material1` varchar(256) DEFAULT '|',`Material2` varchar(256) DEFAULT '|',`Material3` varchar(256) DEFAULT '|',");
	strcat(query,"`MaterialText` varchar(256) DEFAULT NULL,`kommentar` varchar(30) DEFAULT NULL,PRIMARY KEY (`id`))ENGINE=InnoDB DEFAULT CHARSET=latin1;");
 	mysql_pquery(sqlHandle, query);

    strdel(query,0,sizeof(query));

    strcat(query,"CREATE TABLE IF NOT EXISTS `mapping_removes` (`id` int(11) NOT NULL AUTO_INCREMENT,`modelid` int(11) DEFAULT NULL,");
    strcat(query,"`centerX` DECIMAL(10,5) NOT NULL,`centerY` DECIMAL(10,5) NOT NULL,`centerZ` DECIMAL(10,5) NOT NULL,`radius` DECIMAL(10,5) NOT NULL,");
    strcat(query,"`kommentar` varchar(30) DEFAULT NULL,PRIMARY KEY (`id`))ENGINE=InnoDB DEFAULT CHARSET=latin1;");
    mysql_pquery(sqlHandle, query);
    return 1;
}

stock RemoveBuildingForPlayerEx(playerid, modelid, Float:centerX, Float:centerY, Float:centerZ, Float:radius, kommentar[]="") {
    new query[500];
    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `mapping_removes` (`modelid`, `centerX`, `centerY`, `centerZ`, `radius`, `kommentar`) VALUES ('%i', '%f', '%f', '%f', '%f', '%s')", modelid, centerX, centerY, centerZ, radius, kommentar);
    mysql_tquery(sqlHandle, query);
    return RemoveBuildingForPlayer(playerid, modelid, centerX, centerY, centerZ, radius);
}

stock RemoveBuildingEx(modelid, Float:centerX, Float:centerY, Float:centerZ, Float:radius, kommentar[]="") {
    new query[500];
    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `mapping_removes` (`modelid`, `centerX`, `centerY`, `centerZ`, `radius`, `kommentar`) VALUES ('%i', '%f', '%f', '%f', '%f', '%s')", modelid, centerX, centerY, centerZ, radius, kommentar);
    mysql_tquery(sqlHandle, query);
    return 1;
}

//Um Objekte mit Datenbank-Eintrag zu erstellen
stock CreateObjectEx(oid, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, worldid = -1, interiorid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, Kommentar[]=""){
	new query[800];
	new objid = CreateDynamicObject(oid, X, Y, Z, rX, rY, rZ, worldid, interiorid, .streamdistance = streamdistance, .drawdistance = drawdistance);
	format(query, 800, "INSERT INTO `mapping_objects` (`ModelID`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`, `worldid`, `interiorid`, `streamdistance`, `drawdistance`, `kommentar`) VALUES ('%d','%f','%f','%f','%f','%f','%f','%i','%i','%f','%f','%s')",oid,X,Y,Z,rX,rY,rZ,worldid, interiorid, streamdistance, drawdistance, Kommentar);
	new Cache:result = mysql_query(sqlHandle, query);
	Streamer_SetIntData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, 1234567+cache_insert_id());
    cache_delete(result);
    return objid;
}

//Um den Material-Text von einem Objekt zu ändern
stock SetObjectMaterialTextEx(i, materialindex, const text[], materialsize = OBJECT_MATERIAL_SIZE_256x256, const fontface[] = "Arial", fontsize = 24, bold = 1, fontcolor = COLOR_WHITE, backcolor = 0, textalignment = 0){
	new query[800];
    SetDynamicObjectMaterialText(i, materialindex, text, materialsize, fontface, fontsize, bold, fontcolor, backcolor, textalignment);
	format(query, 800, "UPDATE `mapping_objects` SET MaterialText%i='%d|%s|%d|%s|%d|%d|%d|%d|%d' WHERE id='%d'", materialindex, materialindex, text, materialsize, fontface, fontsize, bold, fontcolor, backcolor, textalignment ,Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID)-1234567);
 	mysql_tquery(sqlHandle, query);
 	return 1;
}

//Um ein ServerObjekt zu texturieren
stock SetObjectMaterialEx(i, materialindex, modelidd, txdname[], texturename[], materialcolor){
	new query[800], query2[200], string[200];
	ObjektInfo[ObjDbId] = Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID)-1234567;
    SetDynamicObjectMaterial(i, materialindex, modelidd, txdname, texturename, materialcolor);
    format(query, 800, "SELECT * FROM `mapping_objects` WHERE id='%d'", ObjektInfo[ObjDbId]);
    new Cache:result = mysql_query(sqlHandle, query);
    //strdel(query,0,sizeof(query));
    for(new e=1; e<4; e++){
        format(string, 200, "Material%d", e);
		cache_get_value_name(0,string,query2);
		format(query, 800, "%s", query2);
		if(query[0] != '|' && query[1] != EOS){
			sscanf(query,"p<|>s[10]ds[40]s[40]d",ObjektInfo[oIndex],ObjektInfo[oModelID],ObjektInfo[oTxdName],ObjektInfo[oTextureName],ObjektInfo[oMaterialColor]);
			new k,j=strlen(ObjektInfo[oIndex]);
			for(; k != j; k++){
			    if(strval(ObjektInfo[oIndex][k]) == materialindex){
					format(query, 800, "UPDATE `mapping_objects` SET %s='%d|%d|%s|%s|%d' WHERE id='%d'", string, materialindex, modelidd, txdname, texturename, materialcolor ,Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID)-1234567);
					mysql_tquery(sqlHandle, query);
		 			return 1;
				}
			}
			if(strcmp(txdname, ObjektInfo[oTxdName], true) == 0 && strcmp(texturename, ObjektInfo[oTextureName], true) == 0 && ObjektInfo[oMaterialColor] == materialcolor){
				format(query, 800, "UPDATE `mapping_objects` SET %s='%s+%d|%d|%s|%s|%d' WHERE id='%d'", string, ObjektInfo[oIndex], materialindex, modelidd, txdname, texturename, materialcolor ,Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID)-1234567);
				mysql_tquery(sqlHandle, query);
	 			return 1;
			}
			continue;
		}
		else if(query[0] == '|' && query[1] == EOS){
			format(query, 800, "UPDATE `mapping_objects` SET %s='%d|%d|%s|%s|%d' WHERE id='%d'", string, materialindex, modelidd, txdname, texturename, materialcolor ,Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID)-1234567);
			mysql_tquery(sqlHandle, query);
	 		return 1;
		}
	}
	cache_delete(result);
	return 1;
}

stock RemoveServerBuildingsForPlayer(playerid) {
    foreach(new i : ServerRemovesItter) {
        RemoveBuildingForPlayer(playerid, ServerRemoves[i][remModelId], ServerRemoves[i][remCenterX], ServerRemoves[i][remCenterY], ServerRemoves[i][remCenterZ], ServerRemoves[i][remRadius]);
    }
    return 1;
}

forward @Load_RemoveBuildings();
public @Load_RemoveBuildings() {
    new rows;
    cache_get_row_count(rows);
    for(new i = 0; i < rows; i++) {
        cache_get_value_name_int(i, "modelid", ServerRemoves[i][remModelId]);
        cache_get_value_name_float(i, "centerX", ServerRemoves[i][remCenterX]);
        cache_get_value_name_float(i, "centerY", ServerRemoves[i][remCenterY]);
        cache_get_value_name_float(i, "centerZ", ServerRemoves[i][remCenterZ]);
        cache_get_value_name_float(i, "radius", ServerRemoves[i][remRadius]);
        cache_get_value_name(i, "kommentar", ServerRemoves[i][remKommentar]);
        Iter_Add(ServerRemovesItter, i);
    }
    printf("- Die ServerRemoves wurden erfolgreich geladen [%d]!", rows);
    return 1;
}

forward @Load_Map();
public @Load_Map() {
    new string[256], i, count = cache_num_rows();
	for(; i != count; i++){
		ObjektInfo[Erstellt] = 1;
		cache_get_value_name_int(i, "id", ObjektInfo[ObjDbId]);
		cache_get_value_name_int(i, "modelid", ObjektInfo[omid]);
		cache_get_value_name_float(i, "X", ObjektInfo[oX]);
		cache_get_value_name_float(i, "Y", ObjektInfo[oY]);
		cache_get_value_name_float(i, "Z", ObjektInfo[oZ]);
		cache_get_value_name_float(i, "RX", ObjektInfo[orX]);
		cache_get_value_name_float(i, "RY", ObjektInfo[orY]);
		cache_get_value_name_float(i, "RZ", ObjektInfo[orZ]);
        cache_get_value_name_int(i, "worldid", ObjektInfo[oWorldId]);
        cache_get_value_name_int(i, "interiorid", ObjektInfo[oInteriorId]);
        cache_get_value_name_float(i, "streamdistance", ObjektInfo[oStreamDistance]);
        cache_get_value_name_float(i, "drawdistance", ObjektInfo[oDrawDistance]);
		cache_get_value_name(i, "kommentar", string);
		format(ObjektInfo[oKommentar], 50, "%s", string);
		new objID;
		objID = CreateDynamicObject(ObjektInfo[omid],ObjektInfo[oX],ObjektInfo[oY],ObjektInfo[oZ],ObjektInfo[orX],ObjektInfo[orY],ObjektInfo[orZ], ObjektInfo[oWorldId], ObjektInfo[oInteriorId], .streamdistance = ObjektInfo[oStreamDistance], .drawdistance = ObjektInfo[oDrawDistance]);
		Streamer_SetIntData(STREAMER_TYPE_OBJECT ,objID , E_STREAMER_EXTRA_ID, 1234567+ObjektInfo[ObjDbId]);
		strdel(string,0,sizeof(string));
		ObjektInfo[ObjID] = objID;
		cache_get_value_name(i,"Material1",string);
		if(strlen(string) > 4){
			sscanf(string,"p<|>s[10]ds[30]s[30]d",ObjektInfo[oIndex],ObjektInfo[oModelID],ObjektInfo[oTxdName],ObjektInfo[oTextureName],ObjektInfo[oMaterialColor]);
			new e,j=strlen(ObjektInfo[oIndex]);
			for(; e != j; ++e){
				switch(ObjektInfo[oIndex][e]){
					case EOS:break;
					case '+':continue;
					default:SetDynamicObjectMaterial(objID, strval(ObjektInfo[oIndex][e]), ObjektInfo[oModelID], ObjektInfo[oTxdName], ObjektInfo[oTextureName], ObjektInfo[oMaterialColor]);
				}
			}
		}
		cache_get_value_name(i,"Material2",string);
		if(strlen(string) > 4){
			sscanf(string,"p<|>s[10]ds[30]s[30]d",ObjektInfo[oIndex],ObjektInfo[oModelID],ObjektInfo[oTxdName],ObjektInfo[oTextureName],ObjektInfo[oMaterialColor]);
			new e,j=strlen(ObjektInfo[oIndex]);
			for(; e != j; ++e){
				switch(ObjektInfo[oIndex][e]){
					case EOS:break;
					case '+':continue;
					default:SetDynamicObjectMaterial(objID, strval(ObjektInfo[oIndex][e]), ObjektInfo[oModelID], ObjektInfo[oTxdName], ObjektInfo[oTextureName], ObjektInfo[oMaterialColor]);
				}
			}
		}
		cache_get_value_name(i,"Material3",string);
		if(strlen(string) > 4){
			sscanf(string,"p<|>s[10]ds[30]s[30]d",ObjektInfo[oIndex],ObjektInfo[oModelID],ObjektInfo[oTxdName],ObjektInfo[oTextureName],ObjektInfo[oMaterialColor]);
			new e,j=strlen(ObjektInfo[oIndex]);
			for(; e != j; ++e){
				switch(ObjektInfo[oIndex][e]){
					case EOS:break;
					case '+':continue;
					default:SetDynamicObjectMaterial(objID, strval(ObjektInfo[oIndex][e]), ObjektInfo[oModelID], ObjektInfo[oTxdName], ObjektInfo[oTextureName], ObjektInfo[oMaterialColor]);
				}
			}
		}
		cache_get_value_name(i,"MaterialText0",string);
		if(strlen(string) > 4){
			sscanf(string,"p<|>s[10]s[128]ds[20]ddddd",ObjektInfo[oIndex],ObjektInfo[oText],ObjektInfo[oMaterialSize],ObjektInfo[oFontFace],ObjektInfo[oFontSize],ObjektInfo[oFontBold],ObjektInfo[oMaterialColor],ObjektInfo[oMaterialBack],ObjektInfo[oTextAlign]);
			SetDynamicObjectMaterialText(objID, strval(ObjektInfo[oIndex]), ObjektInfo[oText],ObjektInfo[oMaterialSize],ObjektInfo[oFontFace],ObjektInfo[oFontSize],ObjektInfo[oFontBold],ObjektInfo[oMaterialColor],ObjektInfo[oMaterialBack],ObjektInfo[oTextAlign]);
		}
		cache_get_value_name(i,"MaterialText1",string);
		if(strlen(string) > 4){
			sscanf(string,"p<|>s[10]s[128]ds[20]ddddd",ObjektInfo[oIndex],ObjektInfo[oText],ObjektInfo[oMaterialSize],ObjektInfo[oFontFace],ObjektInfo[oFontSize],ObjektInfo[oFontBold],ObjektInfo[oMaterialColor],ObjektInfo[oMaterialBack],ObjektInfo[oTextAlign]);
			SetDynamicObjectMaterialText(objID, strval(ObjektInfo[oIndex]), ObjektInfo[oText],ObjektInfo[oMaterialSize],ObjektInfo[oFontFace],ObjektInfo[oFontSize],ObjektInfo[oFontBold],ObjektInfo[oMaterialColor],ObjektInfo[oMaterialBack],ObjektInfo[oTextAlign]);
		}
	}
	printf("- Die Serverobjekte wurden erfolgreich geladen [%d]!", i);
	printf("- Es wurden erfolgreich [%d] Objekte geladen", CountDynamicObjects());
    return 1;
}