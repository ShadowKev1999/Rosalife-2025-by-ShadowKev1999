stock Actor_Init() {
    PDActorLinks = CreateActor(306,1541.8203,-1656.3230,13.5592,179.9794); // PDActorLinks
	PDActorRechts = CreateActor(307,1541.7552,-1657.8563,13.5600,357.0470); // PDActorRechts
	ApplyActorAnimation(PDActorLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(PDActorRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	SetActorInvulnerable(PDActorLinks, true); SetActorInvulnerable(PDActorRechts, true);

	PD2ActorLinks = CreateActor(300,1543.9468,-1679.5181,13.5574,224.0358); // PD2ActorLinks
	PD2ActorRechts = CreateActor(301,1545.3818,-1680.8906,13.5603,38.9558); // PD2ActorRechts
	ApplyActorAnimation(PD2ActorLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(PD2ActorRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	SetActorInvulnerable(PD2ActorLinks, true); SetActorInvulnerable(PD2ActorRechts, true);

	ZiviSpawnLinks = CreateActor(25,2210.3013,-1151.0144,25.7347,314.8927); // ZiviSpawnLinks
	ZiviSpawnRechts = CreateActor(15,2211.3337,-1150.0498,25.7425,135.7782); // ZiviSpawnRechts
	ApplyActorAnimation(ZiviSpawnLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(ZiviSpawnRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	SetActorInvulnerable(ZiviSpawnLinks, true); SetActorInvulnerable(ZiviSpawnRechts, true);

	KrankenHausLinks = CreateActor(276,1183.3717,-1338.4340,13.5739,6.2735); // KrankenHausLinks
	KrankenHausRechts = CreateActor(274,1183.2843,-1337.2721,13.5762,182.9779); // KrankenHausRechts
	ApplyActorAnimation(KrankenHausLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(KrankenHausRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	SetActorInvulnerable(KrankenHausLinks, true); SetActorInvulnerable(KrankenHausRechts, true);

	PizzaBoteLinks = CreateActor(19,2101.0381,-1802.2064,13.5547,236.4912); // PizzaBoteLinks
	PizzaBoteRechts = CreateActor(20,2102.0186,-1802.7710,13.5547,57.9290); // PizzaBoteRechts
	ApplyActorAnimation(PizzaBoteLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(PizzaBoteRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	SetActorInvulnerable(PizzaBoteLinks, true); SetActorInvulnerable(PizzaBoteRechts, true);

	LSPDInnen = CreateActor(309,341.6108,1827.3502,2241.5850,359.5079); // LSPD-Innen
	LSPDWKammer = CreateActor(309,313.9105,1834.3005,2241.5850,269.6978); // LSPD-Waffenkammer
	GovGruppe = CreateActor(17,321.2980,1894.1051,907.8959,179.6241); // Gov-Gruppe
	SetActorInvulnerable(LSPDInnen, true); SetActorInvulnerable(GovGruppe, true); SetActorInvulnerable(LSPDWKammer, true);

	Matsdealer = CreateActor(33,713.4388,-1171.7941,16.4407,243.3127); // Matsdealer
	SetActorInvulnerable(Matsdealer, true);

	mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `server_actors` (`id` INT(12) NOT NULL AUTO_INCREMENT , \
							`name` VARCHAR(24) NOT NULL , `x` FLOAT NOT NULL , `y` FLOAT NOT NULL , `z` FLOAT NOT NULL , \
							`a` FLOAT NOT NULL , `animation` INT(12) NOT NULL , `skin` INT(12) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;");

	mysql_tquery(sqlHandle, "SELECT * FROM `server_actors`;", "onLoadServerActors");
    return 1;
}

stock Actor_OnActorStreamIn()
{
	SetActorPos(PDActorLinks,1541.8203,-1656.3230,13.5592);
	SetActorPos(PDActorRechts,1541.7552,-1657.8563,13.5600);
	ApplyActorAnimation(PDActorLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(PDActorRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);

	SetActorPos(PD2ActorLinks,1543.9468,-1679.5181,13.5574);
	SetActorPos(PD2ActorRechts,1545.3818,-1680.8906,13.5603);
	ApplyActorAnimation(PD2ActorLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(PD2ActorRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);

	SetActorPos(ZiviSpawnLinks,2210.3013,-1151.0144,25.7347);
	SetActorPos(ZiviSpawnRechts,2211.3337,-1150.0498,25.7425);
	ApplyActorAnimation(ZiviSpawnLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(ZiviSpawnRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);

	SetActorPos(KrankenHausLinks,1183.3717,-1338.4340,13.5739);
	SetActorPos(KrankenHausRechts,1183.2843,-1337.2721,13.5762);
	ApplyActorAnimation(KrankenHausLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(KrankenHausRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);

	SetActorPos(PizzaBoteLinks,2101.0381,-1802.2064,13.5547);
	SetActorPos(PizzaBoteRechts,2102.0186,-1802.7710,13.5547);
	ApplyActorAnimation(PizzaBoteLinks, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
	ApplyActorAnimation(PizzaBoteRechts, "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);

	SetActorPos(LSPDInnen,341.6108,1827.3502,2241.5850);
	SetActorPos(LSPDWKammer,313.9105,1834.3005,2241.5850);
	SetActorPos(GovGruppe,321.2980,1894.1051,907.8959);

	SetActorPos(Matsdealer,713.4388,-1171.7941,16.4407);
	return 1;
}

forward onLoadServerActors();
public onLoadServerActors() {
	new rows;
	cache_get_row_count(rows);
	if(rows) {
		for(new i = 0; i < rows; i++) {
			cache_get_value_name_int(i, "id", ServerActors[i][actorDatabase]);
			cache_get_value_name_int(i, "skin", ServerActors[i][actorSkinId]);
			cache_get_value_name(i, "name", ServerActors[i][actorName]);
			cache_get_value_name_float(i, "x", ServerActors[i][actorPos][0]);
			cache_get_value_name_float(i, "y", ServerActors[i][actorPos][1]);
			cache_get_value_name_float(i, "z", ServerActors[i][actorPos][2]);
			cache_get_value_name_float(i, "a", ServerActors[i][actorPos][3]);
			cache_get_value_name_int(i, "animation", ServerActors[i][actorAnimation]);

			ServerActors[i][actorId] = CreateDynamicActor(ServerActors[i][actorSkinId], ServerActors[i][actorPos][0], ServerActors[i][actorPos][1], ServerActors[i][actorPos][2], ServerActors[i][actorPos][3]);

			new label[64];
			format(label, sizeof(label), "{99CCFF}%s (%i)", ServerActors[i][actorName], i);
			ServerActors[i][actorLabel] = CreateDynamic3DTextLabel(label, COLOR_WHITE, ServerActors[i][actorPos][0], ServerActors[i][actorPos][1], ServerActors[i][actorPos][2] + 1.0, 5.0);

			switch(ServerActors[i][actorAnimation]) {
				case 1: {
					ApplyDynamicActorAnimation(ServerActors[i][actorId], "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
				}
			}

			Iter_Add(IterServerActors, i);
		}
	}
	return 1;
}

public OnDynamicActorStreamIn(actorid, forplayerid) {
	new id = getServerActorSlot(actorid);
	if(id != -1) {
		switch(ServerActors[id][actorAnimation]) {
			case 1: {
				ApplyDynamicActorAnimation(ServerActors[id][actorId], "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
			}
		}
	}
	return 1;
}

stock getServerActorSlot(actorid) {
	foreach(new i : IterServerActors) {
		if(ServerActors[i][actorId] != actorid) continue;
		return i;
	}
	return -1;
}

forward onActorInserted(slot);
public onActorInserted(slot) {
	ServerActors[slot][actorDatabase] = cache_insert_id();
	return 1;
}