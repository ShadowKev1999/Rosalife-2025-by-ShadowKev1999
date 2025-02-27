stock LoadSprayTags()
{
	mysql_tquery(sqlHandle, "SELECT * FROM `spraytags` ORDER BY `ID` ASC", "onSprayTagsLoaded");
    return 1;
}

forward onSprayTagsLoaded();
public onSprayTagsLoaded() {
    new rows, string[164], fc = 1;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "ID", fc);
            cache_get_value_name_float(i, "PosX", SprayTagInfo[fc][stPos_X]); 
            cache_get_value_name_float(i, "PosY", SprayTagInfo[fc][stPos_Y]); 
            cache_get_value_name_float(i, "PosZ", SprayTagInfo[fc][stPos_Z]); 
            cache_get_value_name_float(i, "RotX", SprayTagInfo[fc][stRot_X]);  
            cache_get_value_name_float(i, "RotY", SprayTagInfo[fc][stRot_Y]); 
            cache_get_value_name_float(i, "RotZ", SprayTagInfo[fc][stRot_Z]); 
            cache_get_value_name_int(i, "FactionID", SprayTagInfo[fc][stFactionID]);

            SprayTagInfo[fc][stObjectID] = CreateDynamicObject(2789,SprayTagInfo[fc][stPos_X],SprayTagInfo[fc][stPos_Y],SprayTagInfo[fc][stPos_Z],SprayTagInfo[fc][stRot_X],SprayTagInfo[fc][stRot_Y],SprayTagInfo[fc][stRot_Z]);
            if(SprayTagInfo[fc][stFactionID] > 0)
            {
                format(string,sizeof(string),"{%s}%s",FrakSprayTagColor(SprayTagInfo[fc][stFactionID]),FrakName(SprayTagInfo[fc][stFactionID]));
                SetDynamicObjectMaterialText(SprayTagInfo[fc][stObjectID], 0, string, OBJECT_MATERIAL_SIZE_256x32, "Segoe Script", 32, 1, 0xFFFFFFFF, 0x00000000, 0);
            }
            else SetDynamicObjectMaterialText(SprayTagInfo[fc][stObjectID], 0, "{FFFFFF}Spraytag", OBJECT_MATERIAL_SIZE_256x32, "Segoe Script", 32, 1, 0xFFFFFFFF, 0x00000000, 0);
            SprayTagInfo[fc][stErstellt] = true;
        }
    }
    printf(" Es wurde(n) %d Spraytags erfolgreich geladen und erstellt.", rows);
    return 1;
}

stock FrakSprayTagColor(Fraktion)
{
	new string[11];
    if(Fraktion == 9){format(string,sizeof(string),"00AB00");}//Grove
    else if(Fraktion == 10){format(string,sizeof(string),"BE00FF");}//Ballas
    else if(Fraktion == 11){format(string,sizeof(string),"FFDC00");}//Vagos
    else if(Fraktion == 12){format(string,sizeof(string),"0073FF");}//Aztecas
    else if(Fraktion == 13){format(string,sizeof(string),"00FFFA");}//Rifa
    else if(Fraktion == 14){format(string,sizeof(string),"000095");}//Triads
    else if(Fraktion == 15){format(string,sizeof(string),"282828");}//DaNangBoys
    else if(Fraktion == 16){format(string,sizeof(string),"FF7800");}//Camorra
    else if(Fraktion == 17){format(string,sizeof(string),"000000");}//Italian
    else if(Fraktion == 18){format(string,sizeof(string),"000000");}//Russian
    else {format(string,sizeof(string),"FFFFFF");}//keine Fraktion
    return string;
}