forward onLoadAccount(playerid);
public onLoadAccount(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        new var, string[1024];

        cache_get_value_name_int(0, "ID", SpielerInfo[playerid][sDBID]);
        cache_get_value_name_float(0, "PositionX", SpielerInfo[playerid][sPosX]);
        cache_get_value_name_float(0, "PositionY", SpielerInfo[playerid][sPosY]);
        cache_get_value_name_float(0, "PositionZ", SpielerInfo[playerid][sPosZ]); 
        cache_get_value_name_float(0, "PositionA", SpielerInfo[playerid][sPosA]); 
        cache_get_value_name_int(0, "Interior", SpielerInfo[playerid][sInterior]);
        cache_get_value_name_int(0, "VirtualWorld", SpielerInfo[playerid][sVirtualWorld]);
        cache_get_value_name_int(0, "Tot_Int", Tot_Int[playerid]);
        cache_get_value_name_int(0, "Tot_World", Tot_World[playerid]);
        cache_get_value_name_int(0, "Spawn", SpielerInfo[playerid][sSpawn]);
        cache_get_value_name_int(0, "Stadt", SpielerInfo[playerid][sStadt]);
        cache_get_value_name_int(0, "SkinID", var); SetPlayerSkin(playerid, var);
        cache_get_value_name_int(0, "Admin", SpielerInfo[playerid][sAdmin]);
        cache_get_value_name_int(0, "FV", SpielerInfo[playerid][sFV]);
        cache_get_value_name_int(0, "Fraktion", SpielerInfo[playerid][sFraktion]); 
        cache_get_value_name_int(0, "Team", SpielerInfo[playerid][sTeam]); 
        cache_get_value_name_int(0, "Leader", SpielerInfo[playerid][sLeader]); 
        cache_get_value_name_int(0, "Rank", SpielerInfo[playerid][sRank]); 
        cache_get_value_name_int(0, "Wanteds", var); SetPlayerWantedLevelEx(playerid, var);
        cache_get_value_name_int(0, "Knastzeit", SpielerInfo[playerid][sKnast]);
        cache_get_value_name_int(0, "Zelle", SpielerInfo[playerid][sZelle]);
        cache_get_value_name_int(0, "EXP", SpielerInfo[playerid][sEXP]); 
        cache_get_value_name_int(0, "EXPNeeded", SpielerInfo[playerid][sEXPNeeded]); 
        cache_get_value_name_int(0, "Level", var); SetPlayerScore(playerid, var);
        cache_get_value_name_int(0, "Verwarnungen", SpielerInfo[playerid][sWarns]); 
        cache_get_value_name_int(0, "Mutezeit", SpielerInfo[playerid][sMuted]); 
        cache_get_value_name_int(0, "WerbungSperre", SpielerInfo[playerid][sADSperre]); 
        cache_get_value_name_int(0, "Badword", SpielerInfo[playerid][sBadword]); 
        cache_get_value_name_int(0, "Bargeld", var); GivePlayerMoneyEx(playerid, var);
        cache_get_value_name_int(0, "Perso", SpielerInfo[playerid][sPerso]);
        cache_get_value_name_int(0, "Stadtplan", SpielerInfo[playerid][sStadtplan]); 
        cache_get_value_name_int(0, "BankPIN", SpielerInfo[playerid][sBankPin]);
        cache_get_value_name_int(0, "Bankkonto", SpielerInfo[playerid][sBankkonto]); 
        cache_get_value_name_int(0, "Tankstelle", SpielerInfo[playerid][sTankstelle]); 
        cache_get_value_name_int(0, "Ammunation", SpielerInfo[playerid][sAmmunation]); 
        cache_get_value_name_int(0, "Store", SpielerInfo[playerid][sStore]); 
        cache_get_value_name_int(0, "Haus", SpielerInfo[playerid][sHaus]); 
        cache_get_value_name_int(0, "Gruppenhaus", SpielerInfo[playerid][sGHaus]); 
        cache_get_value_name_int(0, "Mieter", SpielerInfo[playerid][sMieter]); 
        cache_get_value_name_int(0, "Nebenjob", SpielerInfo[playerid][sNebenjob]); 
        cache_get_value_name_int(0, "Geschlecht", SpielerInfo[playerid][sGeschlecht]); 
        cache_get_value_name_int(0, "QuitJob", SpielerInfo[playerid][sQuitJob]); 
        cache_get_value_name_int(0, "Autoschein", SpielerInfo[playerid][sCarLic]); 
        cache_get_value_name_int(0, "Bootschein", SpielerInfo[playerid][sBootLic]); 
        cache_get_value_name_int(0, "Waffenschein", SpielerInfo[playerid][sWeaponLic]); 
        cache_get_value_name_int(0, "Flugschein", SpielerInfo[playerid][sFlugLic]); 
        cache_get_value_name_int(0, "LKWschein", SpielerInfo[playerid][sTruckLic]); 
        cache_get_value_name_int(0, "Motorradschein", SpielerInfo[playerid][sBikeLic]); 
        cache_get_value_name_int(0, "Krankenhaus", SpielerInfo[playerid][sKrankenhaus]); 
        cache_get_value_name_int(0, "Wiederbeleben", SpielerInfo[playerid][sWiederbeleben]); 
        cache_get_value_name_int(0, "Paket", SpielerInfo[playerid][sPaket]); 
        cache_get_value_name_int(0, "PayDay", SpielerInfo[playerid][sPayDay]); 
        cache_get_value_name_int(0, "Navi", SpielerInfo[playerid][sNavi]); 
        cache_get_value_name_int(0, "Handy", SpielerInfo[playerid][sHandy]); 
        cache_get_value_name_int(0, "Guthaben", SpielerInfo[playerid][sGuthaben]); 
        cache_get_value_name_int(0, "Telefonbuch", SpielerInfo[playerid][sTelefonbuch]); 
        cache_get_value_name_int(0, "Repairkit", SpielerInfo[playerid][sRepairkit]); 
        cache_get_value_name_int(0, "PBKills", SpielerInfo[playerid][sPBKills]); 
        cache_get_value_name_int(0, "PBTode", SpielerInfo[playerid][sPBTode]);
        cache_get_value_name_int(0, "Startbonus", SpielerInfo[playerid][sStartbonus]); 
        cache_get_value_name_int(0, "Fraksperre", SpielerInfo[playerid][sFrakSperre]); 
        //cache_get_value_name_int(0, "Handschellen", var); SetPVarInt(playerid,"HandschellenLogged", var);
        cache_get_value_name_int(0, "icpNachrichten", SpielerInfo[playerid][icpNachrichten]); 
        cache_get_value_name_int(0, "icpHitsound", SpielerInfo[playerid][icpHitsound]); 
        cache_get_value_name_int(0, "icpOChat", SpielerInfo[playerid][icpOChat]); 
        cache_get_value_name_int(0, "icpCamera", SpielerInfo[playerid][icpCamera]); 
        cache_get_value_name_int(0, "icpHandy", SpielerInfo[playerid][icpHandy]); 
        cache_get_value_name_int(0, "icpBlinker", SpielerInfo[playerid][icpBlinker]); 
        cache_get_value_name_int(0, "stvoAutoschein", SpielerInfo[playerid][stvoCarLic]); 
        cache_get_value_name_int(0, "stvoMotorradschein", SpielerInfo[playerid][stvoBikeLic]); 
        cache_get_value_name_int(0, "stvoTruckschein", SpielerInfo[playerid][stvoTruckLic]); 
        cache_get_value_name_int(0, "stvoFlugschein", SpielerInfo[playerid][stvoFlugLic]); 
        cache_get_value_name_int(0, "stvoBootschein", SpielerInfo[playerid][stvoBootLic]); 
        cache_get_value_name_int(0, "TicketsBearbeitet", SpielerInfo[playerid][sTicketsBearbeitet]); 
        cache_get_value_name_int(0, "PayDayGeld", SpielerInfo[playerid][sPayDayGeld]); 
        cache_get_value_name_int(0, "Lotto1", SpielerInfo[playerid][sLotto][0]); 
        cache_get_value_name_int(0, "Lotto2", SpielerInfo[playerid][sLotto][1]); 
        cache_get_value_name_int(0, "Lotto3", SpielerInfo[playerid][sLotto][2]); 
        cache_get_value_name_int(0, "TruckerSkill", SpielerInfo[playerid][sJobEXP][0]); 
        cache_get_value_name_int(0, "PizzaboteSkill", SpielerInfo[playerid][sJobEXP][1]); 
        cache_get_value_name_int(0, "KehrmaschinenSkill", SpielerInfo[playerid][sJobEXP][2]); 
        cache_get_value_name_int(0, "PilotenSkill", SpielerInfo[playerid][sJobEXP][3]); 
        cache_get_value_name_int(0, "BusfahrerSkill", SpielerInfo[playerid][sJobEXP][4]); 
        cache_get_value_name_int(0, "MullmannSkill", SpielerInfo[playerid][sJobEXP][5]); 
        cache_get_value_name_int(0, "GeldlieferSkill", SpielerInfo[playerid][sJobEXP][10]); 
        cache_get_value_name_int(0, "Drogen", SpielerInfo[playerid][sDrogen]); 
        cache_get_value_name_int(0, "Tutorial", SpielerInfo[playerid][sTutorial]); 
        cache_get_value_name_int(0, "Contract", SpielerInfo[playerid][sContract]); 
        cache_get_value_name_int(0, "Gruppe", SpielerInfo[playerid][sGruppe]); 
        cache_get_value_name_int(0, "GLeader", SpielerInfo[playerid][sGLeader]); 
        cache_get_value_name_int(0, "GRank", SpielerInfo[playerid][sGRank]); 
        cache_get_value_name_int(0, "VIP", SpielerInfo[playerid][sVIP]); 
        cache_get_value_name_int(0, "Garage", SpielerInfo[playerid][sGarage]); 
        cache_get_value_name_int(0, "GMieter", SpielerInfo[playerid][sGMieter]); 
        cache_get_value_name_int(0, "Materialien", SpielerInfo[playerid][sMaterialien]); 
        cache_get_value_name_int(0, "Kurrier", SpielerInfo[playerid][sKurrier]); 
        cache_get_value_name_int(0, "Bombe", SpielerInfo[playerid][sBombe]); 
        cache_get_value_name_int(0, "Pfandflaschen", SpielerInfo[playerid][sPfandflaschen]); 
        cache_get_value_name_int(0, "Beutel", SpielerInfo[playerid][sBeutel]); 
        cache_get_value_name_int(0, "Kampfstyle", SpielerInfo[playerid][sKampfstyle]); 
        cache_get_value_name_int(0, "Helm", SpielerInfo[playerid][sHelm]); 
        cache_get_value_name_int(0, "PrisonCP", SpielerInfo[playerid][sPrisonCP]); 
        cache_get_value_name_int(0, "Prison", SpielerInfo[playerid][sPrison]); 
        cache_get_value_name_int(0, "Kicks", SpielerInfo[playerid][sKicks]); 
        cache_get_value_name_int(0, "Timebans", SpielerInfo[playerid][sTimebans]); 
        cache_get_value_name_int(0, "Prisons", SpielerInfo[playerid][sPrisons]); 
        cache_get_value_name_int(0, "Tagesbelohnung", SpielerInfo[playerid][sTagesbelohnung]); 
        cache_get_value_name_int(0, "LastTagesbelohnung", SpielerInfo[playerid][sLastTagesbelohnung]); 
        cache_get_value_name_int(0, "Mission1", SpielerInfo[playerid][sMissionSolved][1]); 
        cache_get_value_name_int(0, "Mission2", SpielerInfo[playerid][sMissionSolved][2]); 
        cache_get_value_name_int(0, "Mission3", SpielerInfo[playerid][sMissionSolved][3]); 
        cache_get_value_name_int(0, "Mission4", SpielerInfo[playerid][sMissionSolved][4]); 
        cache_get_value_name_int(0, "Mission5", SpielerInfo[playerid][sMissionSolved][5]); 
        cache_get_value_name_int(0, "Mission6", SpielerInfo[playerid][sMissionSolved][6]); 
        cache_get_value_name_int(0, "Kongress", SpielerInfo[playerid][sKongress]); 
        cache_get_value_name_int(0, "Senator", SpielerInfo[playerid][sSenator]); 
        cache_get_value_name_int(0, "Alter", SpielerInfo[playerid][sAlter]); 
        cache_get_value_name_int(0, "ACEnable", SpielerInfo[playerid][sACEnable]); 
        cache_get_value_name_int(0, "Kanister", SpielerInfo[playerid][sKanister]); 
        cache_get_value_name_int(0, "AchivLeader", SpielerInfo[playerid][sAchivLeader]); 
        cache_get_value_name_int(0, "AchivMillion", SpielerInfo[playerid][sAchivMillion]); 
        cache_get_value_name_int(0, "AchivAuto", SpielerInfo[playerid][sAchivAuto]); 
        cache_get_value_name_int(0, "AchivJobGehalt", SpielerInfo[playerid][sAchivJobGehalt]); 
        cache_get_value_name_int(0, "AchivFlugLic", SpielerInfo[playerid][sAchivFlugLic]); 
        cache_get_value_name_int(0, "AchivPfand", SpielerInfo[playerid][sAchivPfand]); 
        cache_get_value_name_int(0, "AchivVIP", SpielerInfo[playerid][sAchivVIP]); 
        cache_get_value_name_int(0, "AchivPaintball", SpielerInfo[playerid][sAchivPB]); 
        cache_get_value_name_int(0, "AchivPerso", SpielerInfo[playerid][sAchivPerso]); 
        cache_get_value_name_int(0, "PayBackCard", SpielerInfo[playerid][sPayBackCard]); 
        cache_get_value_name_int(0, "PayBackPunkte", SpielerInfo[playerid][sPayBackPunkte]); 
        cache_get_value_name_int(0, "Feuerzeug", SpielerInfo[playerid][sFeuerzeug]); 
        cache_get_value_name_int(0, "FischGewicht", SpielerInfo[playerid][sFischGewicht]); 
        cache_get_value_name_int(0, "ZweitKey", SpielerInfo[playerid][sZweitKey]); 
        cache_get_value_name_int(0, "LegBroken", SpielerInfo[playerid][sLegBroken]); 
        cache_get_value_name_int(0, "VictimBrille", SpielerInfo[playerid][sVictimBrille]); 
        cache_get_value_name_int(0, "VictimBrilleF", SpielerInfo[playerid][sVictimBrilleF]); 
        cache_get_value_name_int(0, "VictimCap", SpielerInfo[playerid][sVictimCap]); 
        cache_get_value_name_int(0, "VictimCapF", SpielerInfo[playerid][sVictimCapF]); 
        cache_get_value_name_int(0, "VictimBandana", SpielerInfo[playerid][sVictimBandana]); 
        cache_get_value_name_int(0, "VictimBandanaF", SpielerInfo[playerid][sVictimBandanaF]); 
        cache_get_value_name_float(0, "sVictimBrilleOffX", SpielerInfo[playerid][sVictimBrilleOffX]);  
        cache_get_value_name_float(0, "sVictimBrilleOffY", SpielerInfo[playerid][sVictimBrilleOffY]);  
        cache_get_value_name_float(0, "sVictimBrilleOffZ", SpielerInfo[playerid][sVictimBrilleOffZ]);  
        cache_get_value_name_float(0, "sVictimBrilleRotX", SpielerInfo[playerid][sVictimBrilleRotX]);  
        cache_get_value_name_float(0, "sVictimBrilleRotY", SpielerInfo[playerid][sVictimBrilleRotY]); 
        cache_get_value_name_float(0, "sVictimBrilleRotZ", SpielerInfo[playerid][sVictimBrilleRotZ]); 
        cache_get_value_name_float(0, "sVictimBrilleScaX", SpielerInfo[playerid][sVictimBrilleScaX]); 
        cache_get_value_name_float(0, "sVictimBrilleScaY", SpielerInfo[playerid][sVictimBrilleScaY]); 
        cache_get_value_name_float(0, "sVictimBrilleScaZ", SpielerInfo[playerid][sVictimBrilleScaZ]); 
        cache_get_value_name_float(0, "sVictimCapOffX", SpielerInfo[playerid][sVictimCapOffX]); 
        cache_get_value_name_float(0, "sVictimCapOffY", SpielerInfo[playerid][sVictimCapOffY]); 
        cache_get_value_name_float(0, "sVictimCapOffZ", SpielerInfo[playerid][sVictimCapOffZ]); 
        cache_get_value_name_float(0, "sVictimCapRotX", SpielerInfo[playerid][sVictimCapRotX]); 
        cache_get_value_name_float(0, "sVictimCapRotZ", SpielerInfo[playerid][sVictimCapRotZ]); 
        cache_get_value_name_float(0, "sVictimCapRotY", SpielerInfo[playerid][sVictimCapRotY]); 
        cache_get_value_name_float(0, "sVictimCapScaX", SpielerInfo[playerid][sVictimCapScaX]); 
        cache_get_value_name_float(0, "sVictimCapScaY", SpielerInfo[playerid][sVictimCapScaY]); 
        cache_get_value_name_float(0, "sVictimCapScaZ", SpielerInfo[playerid][sVictimCapScaZ]); 
        cache_get_value_name_float(0, "sVictimBandanaOffX", SpielerInfo[playerid][sVictimBandanaOffX]); 
        cache_get_value_name_float(0, "sVictimBandanaOffY", SpielerInfo[playerid][sVictimBandanaOffY]);  
        cache_get_value_name_float(0, "sVictimBandanaOffZ", SpielerInfo[playerid][sVictimBandanaOffZ]);  
        cache_get_value_name_float(0, "sVictimBandanaRotX", SpielerInfo[playerid][sVictimBandanaRotX]);  
        cache_get_value_name_float(0, "sVictimBandanaRotY", SpielerInfo[playerid][sVictimBandanaRotY]);  
        cache_get_value_name_float(0, "sVictimBandanaRotZ", SpielerInfo[playerid][sVictimBandanaRotZ]);  
        cache_get_value_name_float(0, "sVictimBandanaScaX", SpielerInfo[playerid][sVictimBandanaScaX]);  
        cache_get_value_name_float(0, "sVictimBandanaScaY", SpielerInfo[playerid][sVictimBandanaScaY]);  
        cache_get_value_name_float(0, "sVictimBandanaScaZ", SpielerInfo[playerid][sVictimBandanaScaZ]);  
        cache_get_value_name_int(0, "PDSwat", SpielerInfo[playerid][sPDSwat]); 
        cache_get_value_name_int(0, "BankAngelegt", SpielerInfo[playerid][sBankAngelegt]); 
        cache_get_value_name_int(0, "BankAngelegtMoney", SpielerInfo[playerid][sBankAngelegtMoney]); 
        cache_get_value_name_int(0, "ICPCarlock", SpielerInfo[playerid][sICPTasteCarlock]); 
        cache_get_value_name_int(0, "ICPFlock", SpielerInfo[playerid][sICPTasteFlock]); 
        cache_get_value_name_int(0, "ICPMotor", SpielerInfo[playerid][sICPTasteMotor]); 
        cache_get_value_name_int(0, "ICPLicht", SpielerInfo[playerid][sICPTasteLicht]); 
        cache_get_value_name_int(0, "Obstkorb", SpielerInfo[playerid][sObstkorb]); 
        cache_get_value_name_int(0, "Orangen", SpielerInfo[playerid][sOrangen]); 
        cache_get_value_name_int(0, "PlayerObjects", SpielerInfo[playerid][sPlayerObjects]);
        cache_get_value_name_int(0, "healthInsurance", SpielerInfo[playerid][sHealthInsurance]);
        cache_get_value_name_int(0, "healthInsuranceTime", SpielerInfo[playerid][sHealthInsuranceTime]);

        new Waffen[13][2];
        cache_get_value_name_int(0, "wpSlot1", Waffen[0][0]);  cache_get_value_name_int(0, "wpSlot2", Waffen[1][0]);  cache_get_value_name_int(0, "wpSlot3", Waffen[2][0]); 
        cache_get_value_name_int(0, "wpSlot4", Waffen[3][0]);  cache_get_value_name_int(0, "wpSlot5", Waffen[4][0]);  cache_get_value_name_int(0, "wpSlot6", Waffen[5][0]); 
        cache_get_value_name_int(0, "wpSlot7", Waffen[6][0]);  cache_get_value_name_int(0, "wpSlot8", Waffen[7][0]);  cache_get_value_name_int(0, "wpSlot9", Waffen[8][0]); 
        cache_get_value_name_int(0, "wpSlot10", Waffen[9][0]);  cache_get_value_name_int(0, "wpSlot11", Waffen[10][0]);  cache_get_value_name_int(0, "wpSlot12", Waffen[11][0]); 

        cache_get_value_name_int(0, "wpSlot1Ammu", Waffen[0][1]);  cache_get_value_name_int(0, "wpSlot2Ammu", Waffen[1][1]);  cache_get_value_name_int(0, "wpSlot3Ammu", Waffen[2][1]); 
        cache_get_value_name_int(0, "wpSlot4Ammu", Waffen[3][1]);  cache_get_value_name_int(0, "wpSlot5Ammu", Waffen[4][1]);  cache_get_value_name_int(0, "wpSlot6Ammu", Waffen[5][1]); 
        cache_get_value_name_int(0, "wpSlot7Ammu", Waffen[6][1]);  cache_get_value_name_int(0, "wpSlot8Ammu", Waffen[7][1]);  cache_get_value_name_int(0, "wpSlot9Ammu", Waffen[8][1]); 
        cache_get_value_name_int(0, "wpSlot10Ammu", Waffen[9][1]);  cache_get_value_name_int(0, "wpSlot11Ammu", Waffen[10][1]);  cache_get_value_name_int(0, "wpSlot12Ammu", Waffen[11][1]); 

        GivePlayerWeapon(playerid,WEAPON:Waffen[0][0],Waffen[0][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[1][0],Waffen[1][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[2][0],Waffen[2][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[3][0],Waffen[3][1]);
        GivePlayerWeapon(playerid,WEAPON:Waffen[4][0],Waffen[4][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[5][0],Waffen[5][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[6][0],Waffen[6][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[7][0],Waffen[7][1]);
        GivePlayerWeapon(playerid,WEAPON:Waffen[8][0],Waffen[8][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[9][0],Waffen[9][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[10][0],Waffen[10][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[11][0],Waffen[11][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[12][0],Waffen[12][1]);
    
        SpielerInfo[playerid][sOnline] = 1;
		if(MedicDuty < 1 && SpielerInfo[playerid][sLegBroken] > 0)
		{
			SpielerInfo[playerid][sLegBroken] = 0;
			SendClientMessage(playerid,COLOR_SUPER,"Da kein Medic da ist der deine Wunden verartzten könnte, wurdest du automatisch geheilt.");
		}
		if(SpielerInfo[playerid][sMuted] > 0)
		{
			MutePlayer(playerid,SpielerInfo[playerid][sMuted]);
			format(string,128,"Du bist noch für weitere %d Minuten gemutet. Reiß dich in Zukunft zusammen.",SpielerInfo[playerid][sMuted]);
			SendClientMessage(playerid,COLOR_RED,string);
		}
		if(SpielerInfo[playerid][sADSperre] > 0)
		{
			format(string,128,"Du bist noch für weitere %d Minuten von der Werbung ausgeschlossen.",SpielerInfo[playerid][sADSperre]);
			SendClientMessage(playerid,COLOR_RED,string);
		}
		if(SpielerInfo[playerid][sPrisonCP] > 0)
		{
			format(string,128,"Du bist noch für weitere %d Checkpooint(s) im Prison. Reiß dich in Zukunft zusammen.",SpielerInfo[playerid][sPrisonCP]);
			SendClientMessage(playerid,COLOR_RED,string);
		}
		if(SpielerInfo[playerid][sPrison] > 0)
		{
			PrisonPlayer(playerid,SpielerInfo[playerid][sPrison]);
			format(string,128,"Du bist noch für weitere %d Minuten im Prison. Reiß dich in Zukunft zusammen.",SpielerInfo[playerid][sPrison]);
			SendClientMessage(playerid,COLOR_RED,string);
		}
		if(SpielerInfo[playerid][sAdmin] > 0)
		{
			format(string,128,"%s %s hat sich soeben eingeloggt.",AdminName(playerid),SpielerInfo[playerid][sName]);
			SendAdminMessage(COLOR_BLUE,string);
		}
		if(SpielerInfo[playerid][sLastTagesbelohnung] != 0 && gettime() < SpielerInfo[playerid][sLastTagesbelohnung])
		{
		    new differenz = SpielerInfo[playerid][sLastTagesbelohnung] - gettime();
			new minuten = differenz / 60;
			format(string,sizeof(string),"[Info]: Du musst noch %i Minuten bis zur nächsten Tagesbelohnung warten.",minuten);
			SendClientMessage(playerid,COLOR_INFO,string);
		}
        if(SpielerInfo[playerid][sHealthInsurance] != -1) {
            if(gettime() > SpielerInfo[playerid][sHealthInsuranceTime]) {
                SendClientMessage(playerid, COLOR_WHITE, "Deine Krankenversicherung ist abgelaufen. Du kannst in der Stadthalle eine neue abschließen.");
                SpielerInfo[playerid][sHealthInsuranceTime] = 0;
                SpielerInfo[playerid][sHealthInsurance] = -1;
            }
        }
		if(SpielerInfo[playerid][sLastTagesbelohnung] == 0 || gettime() >= SpielerInfo[playerid][sLastTagesbelohnung])
		{
			GiveTagesBelohnung(playerid);
		}
		if(SpielerInfo[playerid][sKampfstyle] == 1){SetPlayerFightingStyle(playerid,FIGHT_STYLE_NORMAL);}
		else if(SpielerInfo[playerid][sKampfstyle] == 2){SetPlayerFightingStyle(playerid,FIGHT_STYLE_BOXING);}
		else if(SpielerInfo[playerid][sKampfstyle] == 3){SetPlayerFightingStyle(playerid,FIGHT_STYLE_KUNGFU);}
		else if(SpielerInfo[playerid][sKampfstyle] == 4){SetPlayerFightingStyle(playerid,FIGHT_STYLE_KNEEHEAD);}
		else if(SpielerInfo[playerid][sKampfstyle] == 5){SetPlayerFightingStyle(playerid,FIGHT_STYLE_GRABKICK);}
		else if(SpielerInfo[playerid][sKampfstyle] == 6){SetPlayerFightingStyle(playerid,FIGHT_STYLE_ELBOW);}
		LoadPrivatCar(playerid);

		if(SpielerInfo[playerid][sVIP] > 0)
		{
            new query[128];
 	    	mysql_format(sqlHandle, query, sizeof(query), "SELECT `serv_Data` FROM `vip` WHERE `Name` = '%s'", SpielerInfo[playerid][sName]);
            mysql_tquery(sqlHandle, query, "onCheckPlayerVIPStatus", "i", playerid);
		}
        //PlayerTitle System
        LoadPlayerTitles(playerid);
        LoadPlayerJobSkills(playerid);
        SetPVarInt(playerid,"FirstSpawn",1);

        addPlayerProtocoll(playerid);

        LoadEXPStatus(playerid);
		KillTimer(PayDayTimer[playerid]);
		PayDayTimer[playerid] = SetTimerEx("PayDay",60000,true,"i",playerid);
		KillTimer(AC_Check[playerid]);
		AC_Check[playerid] = SetTimerEx("AC_CheckStatus",1000,true,"i",playerid);
		KillTimer(Afktimer[playerid]);
		Afktimer[playerid] = SetTimerEx("Afktimered",60000, true,"i",playerid);
		KillTimer(LoseHealthTimer[playerid]);
		LoseHealthTimer[playerid] = SetTimerEx("LoseHealth",60000, true,"i",playerid);
		SetPlayerColor(playerid,0xFFFFFFFF);
		SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
		TogglePlayerSpectating(playerid, false);
		SpawnPlayerEx(playerid);
		TextDrawHideForPlayer(playerid, LoginScreen[0]);
		TextDrawHideForPlayer(playerid, LoginScreen[1]);
		TextDrawHideForPlayer(playerid, LoginScreen[2]);
		TextDrawHideForPlayer(playerid, LoginScreen[3]);
		TextDrawHideForPlayer(playerid, LoginScreen[4]);
		TextDrawHideForPlayer(playerid, LoginScreen[5]);

		if(GlobalVars[EasterEvent] == true)
		{
			updatePlayerEggTextdraws(playerid);
		}

    } else {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "Du wurdest automatisch vom System gekickt - Fehler beim Spielerkonto! Umgehend beim RSL-Team melden!");
        KickPlayer(playerid,"");
    }
    return 1;
}