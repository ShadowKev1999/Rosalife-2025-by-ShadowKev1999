#define MAX_EASTEREGGS 20

new Text:esterEggTextdraw[2];
new esterEggTimer,
    easterEggTimerEx;

enum eggInfo
{
	egg_id,
	egg_model,
	egg_found,
	egg_objectid,
	Float:egg_x,
	Float:egg_y,
	Float:egg_z,
	Float:egg_rx,
	Float:egg_ry,
	Float:egg_rz
}
new easteregg[MAX_EASTEREGGS][eggInfo];

new EastereggAmount = 0;

stock Easter_Tables()
{
	easterEggTables();
}

stock Easter_OnGameModeInit() {

    esterEggTextdraw[0] = TextDrawCreate(320.000000, 0.000000, "box");
	TextDrawLetterSize(esterEggTextdraw[0], 0.000000, 1.049999);
	TextDrawTextSize(esterEggTextdraw[0], 0.000000, 155.000000);
	TextDrawAlignment(esterEggTextdraw[0], TEXT_DRAW_ALIGN_CENTER);
	TextDrawColour(esterEggTextdraw[0], -1);
	TextDrawUseBox(esterEggTextdraw[0], true);
	TextDrawBoxColour(esterEggTextdraw[0], 90);
	TextDrawSetShadow(esterEggTextdraw[0], 0);
	TextDrawBackgroundColour(esterEggTextdraw[0], 255);
	TextDrawFont(esterEggTextdraw[0], TEXT_DRAW_FONT_1);
	TextDrawSetProportional(esterEggTextdraw[0], true);

	esterEggTextdraw[1] = TextDrawCreate(321.000000, 0.033332, "20/20_Ostereier_-_Neue_Ostereier_in_59:59");
	TextDrawLetterSize(esterEggTextdraw[1], 0.155500, 1.139555);
	TextDrawAlignment(esterEggTextdraw[1], TEXT_DRAW_ALIGN_CENTER);
	TextDrawColour(esterEggTextdraw[1], -1);
	TextDrawSetShadow(esterEggTextdraw[1], 0);
	TextDrawBackgroundColour(esterEggTextdraw[1], 255);
	TextDrawFont(esterEggTextdraw[1], TEXT_DRAW_FONT_2);
	TextDrawSetProportional(esterEggTextdraw[1], true);

    mysql_tquery(sqlHandle, "SELECT * FROM `eastereggs` WHERE TIMESTAMPDIFF(MINUTE, lastPick, NOW()) > 1440 ORDER BY lastPick, RAND() LIMIT 20", "onLoadEasterEggs");

    easterEggTimerEx = SetTimer("EasterEggTimer", 997, true);

	foreach(new i : Player)
	{
		updatePlayerEggTextdraws(i);
	}
    return 1;
}

forward EasterEggTimer();
public EasterEggTimer()
{
    handleEasterEggs();
    return 1;
}

stock Easter_OnPlayerConnect(playerid) {
    
    return 1;
}

stock Easter_OnGamemodeExit()
{
    foreach(new i : Player)
    {
        Easter_OnPlayerDisconnect(i);
    }
    for(new i = 0; i < sizeof(easteregg); i++) {
		if(!easteregg[i][egg_found] && easteregg[i][egg_objectid]) {
            DestroyDynamicObject(easteregg[i][egg_objectid]);
        	easteregg[i][egg_objectid] = 0;
		}
	}
	EastereggAmount = 0;
    KillTimer(easterEggTimerEx);
    return 1;
}

stock Easter_OnPlayerDisconnect(playerid) {
    updatePlayerEggTextdraws(playerid, false);  
    return 1;
}

forward onReloadEasterEggs();
public onReloadEasterEggs() {

    new Field[32], rows = cache_num_rows();

	//Alte Ostereier löschen!!!
	for(new i = 0; i < sizeof(easteregg); i++) {
		if(!easteregg[i][egg_found] && easteregg[i][egg_objectid]) {
            DestroyDynamicObject(easteregg[i][egg_objectid]);
        	easteregg[i][egg_objectid] = 0;
		}
	}
	EastereggAmount = 0;

	for(new i = 0; i < rows; i++) {
		cache_get_value(i, "id", Field); easteregg[i][egg_id] = strval(Field);
		cache_get_value(i, "model", Field); easteregg[i][egg_model] = strval(Field);

		cache_get_value(i, "x", Field); easteregg[i][egg_x] = floatstr(Field);
		cache_get_value(i, "y", Field); easteregg[i][egg_y] = floatstr(Field);
		cache_get_value(i, "z", Field); easteregg[i][egg_z] = floatstr(Field);
		cache_get_value(i, "rx", Field); easteregg[i][egg_rx] = floatstr(Field);
		cache_get_value(i, "ry", Field); easteregg[i][egg_ry] = floatstr(Field);
		cache_get_value(i, "rz", Field); easteregg[i][egg_rz] = floatstr(Field);

	    easteregg[i][egg_found] = 0;
		easteregg[i][egg_objectid] = CreateDynamicObject(easteregg[i][egg_model], easteregg[i][egg_x], easteregg[i][egg_y], easteregg[i][egg_z], easteregg[i][egg_rx], easteregg[i][egg_ry], easteregg[i][egg_rz]);
        EastereggAmount ++;
	}

	return 1;
}

forward onLoadEasterEggs();
public onLoadEasterEggs() {

    new Field[16], rows = cache_num_rows();

	for(new i = 0; i < rows; i++) {
        if(i >= sizeof(easteregg)) {
			printf("ERROR in onLoadEasterEggs. Could not store id %d in array (Out Of Bounds!)", i);
			break;
		}
		cache_get_value(i, "id", Field); easteregg[i][egg_id] = strval(Field);
		cache_get_value(i, "model", Field); easteregg[i][egg_model] = strval(Field);

		cache_get_value(i, "x", Field); easteregg[i][egg_x] = floatstr(Field);
		cache_get_value(i, "y", Field); easteregg[i][egg_y] = floatstr(Field);
		cache_get_value(i, "z", Field); easteregg[i][egg_z] = floatstr(Field);
		cache_get_value(i, "rx", Field); easteregg[i][egg_rx] = floatstr(Field);
		cache_get_value(i, "ry", Field); easteregg[i][egg_ry] = floatstr(Field);
		cache_get_value(i, "rz", Field); easteregg[i][egg_rz] = floatstr(Field);

	    easteregg[i][egg_found] = 0;
		easteregg[i][egg_objectid] = CreateDynamicObject(easteregg[i][egg_model], easteregg[i][egg_x], easteregg[i][egg_y], easteregg[i][egg_z], easteregg[i][egg_rx], easteregg[i][egg_ry], easteregg[i][egg_rz]);
        EastereggAmount ++;
	}
	esterEggTimer = 3600;
	return 1;

}

stock handleEasterEggs() {
	if(esterEggTimer) {
        esterEggTimer --;
        if(!esterEggTimer) {
			mysql_tquery(sqlHandle, "SELECT * FROM `eastereggs` WHERE TIMESTAMPDIFF(MINUTE, lastPick, NOW()) > 1440 ORDER BY lastPick, RAND() LIMIT 20", "onReloadEasterEggs");
			esterEggTimer = 3600;
		}
		new eventString[64], easterminutes = (esterEggTimer/60), easterSeconds = (esterEggTimer-(easterminutes*60));
		format(eventString, sizeof(eventString), "%d/20_Ostereier_-_Neue_Ostereier_in_%02d:%02d", EastereggAmount, easterminutes, easterSeconds);
        TextDrawSetString(esterEggTextdraw[1], eventString);
	}
	return 1;
}

stock updatePlayerEggTextdraws(playerid, bool:toggle = true) {
    if(toggle) {
        TextDrawShowForPlayer(playerid, esterEggTextdraw[0]);
        TextDrawShowForPlayer(playerid, esterEggTextdraw[1]);
	} else {
        TextDrawHideForPlayer(playerid, esterEggTextdraw[0]);
        TextDrawHideForPlayer(playerid, esterEggTextdraw[1]);
	}
	return 1;
}

forward pickupEasterEgg(playerid, eggId);
public pickupEasterEgg(playerid, eggId) {

 	if(easteregg[eggId][egg_found] || !IsPlayerInRangeOfPoint(playerid, 3.0, easteregg[eggId][egg_x], easteregg[eggId][egg_y], easteregg[eggId][egg_z])) {
        SendClientMessage(playerid, COLOR_RED, "An dieser Stelle befindet sich leider kein Osterei.");
        SetCameraBehindPlayer(playerid);
		DeletePVar(playerid, "openingEasterEgg");
	    TogglePlayerControllable(playerid, true);
		return 1;
	}

    easteregg[eggId][egg_found] = 1;
    if(easteregg[eggId][egg_objectid]) {
        DestroyDynamicObject(easteregg[eggId][egg_objectid]);
        easteregg[eggId][egg_objectid] = 0;
	}
    new sqlquery[128];

	format(sqlquery, sizeof(sqlquery), "UPDATE `eastereggs` SET `lastPick`=NOW() WHERE `id` = '%d'", easteregg[eggId][egg_id]);
	mysql_tquery(sqlHandle, sqlquery);

	format(sqlquery, sizeof(sqlquery), "UPDATE `accounts` SET `eastereggsfound`=`eastereggsfound`+1 WHERE `id`='%d'", SpielerInfo[playerid][sDBID]);
	mysql_tquery(sqlHandle, sqlquery);

    EastereggAmount --;

	SetCameraBehindPlayer(playerid);

	DeletePVar(playerid, "openingEasterEgg");

    TogglePlayerControllable(playerid, true);
	
    static globalstring[128], cmd_string[32];

	new gift = random(100);
	switch(gift)
	{
		case 0 .. 6: // 7%
		{
		    new Float:coinsValue = 100.0;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er eine Schutzweste und 120 HP**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie eine Schutzweste und 120 HP**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            format(cmd_string, sizeof(cmd_string), "%f Weste, 120 HP", coinsValue);
        	logPickedEasterEgg(playerid, cmd_string);

			SetPlayerArmour(playerid, coinsValue);
		    SetPlayerHealthEx(playerid,120.0);
		}
		case 7 .. 11: // 5%
		{
		    new coinsValue = 20;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Repairkits**", SpielerInfo[playerid][sName], coinsValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Repairkits**", SpielerInfo[playerid][sName], coinsValue);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            format(cmd_string, sizeof(cmd_string), "%d Repairkits", coinsValue);
        	logPickedEasterEgg(playerid, cmd_string);

        	SpielerInfo[playerid][sRepairkit] += coinsValue;
		}
		case 12 .. 15: // 4%
		{
		    new coinsValue = 60;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Drogen**", SpielerInfo[playerid][sName], coinsValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Drogen**", SpielerInfo[playerid][sName], coinsValue);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            format(cmd_string, sizeof(cmd_string), "%d Drogen", coinsValue);
        	logPickedEasterEgg(playerid, cmd_string);

        	SpielerInfo[playerid][sDrogen] += coinsValue;
		}
		case 16 .. 18: // 3%
		{
		    new coinsValue = 80;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Drogen**", SpielerInfo[playerid][sName], coinsValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Drogen**", SpielerInfo[playerid][sName], coinsValue);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            format(cmd_string, sizeof(cmd_string), "%d Drogen", coinsValue);
        	logPickedEasterEgg(playerid, cmd_string);

        	SpielerInfo[playerid][sDrogen] += coinsValue;
		}
		case 19: // 1%
		{
		    new coinsValue = 30;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Tage VIP**", SpielerInfo[playerid][sName], coinsValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Tage VIP**", SpielerInfo[playerid][sName], coinsValue);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            format(cmd_string, sizeof(cmd_string), "%d VIP", coinsValue);
        	logPickedEasterEgg(playerid, cmd_string);

        	GiveVIP(SpielerInfo[playerid][sName],coinsValue,"Easter-Event");
		}
		case 20 .. 24: // 5%
		{
		    new moneyValue = 10000;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %dSA$**", SpielerInfo[playerid][sName], moneyValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %dSA$**", SpielerInfo[playerid][sName], moneyValue);
        	SendClientMessageToAll(COLOR_BLUE, globalstring);
        	
            format(cmd_string, sizeof(cmd_string), "%d SA$", moneyValue);
        	logPickedEasterEgg(playerid, cmd_string);

        	GivePlayerMoneyEx(playerid, moneyValue);
		}
		case 25 .. 29: // 5%
		{
		    new moneyValue = 25000;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %dSA$**", SpielerInfo[playerid][sName], moneyValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %dSA$**", SpielerInfo[playerid][sName], moneyValue);
        	SendClientMessageToAll(COLOR_BLUE, globalstring);
        	
            format(cmd_string, sizeof(cmd_string), "%d SA$", moneyValue);
        	logPickedEasterEgg(playerid, cmd_string);

        	GivePlayerMoneyEx(playerid, moneyValue);
		}
		case 30 .. 34: // 5%
		{
		    new moneyValue = 50000;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %dSA$**", SpielerInfo[playerid][sName], moneyValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %dSA$**", SpielerInfo[playerid][sName], moneyValue);
        	SendClientMessageToAll(COLOR_BLUE, globalstring);
        	
            format(cmd_string, sizeof(cmd_string), "%d SA$", moneyValue);
        	logPickedEasterEgg(playerid, cmd_string);

        	GivePlayerMoneyEx(playerid, moneyValue);
		}
		case 35 .. 39: // 5%
		{
		    new value = 10;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Feuerzeuge**", SpielerInfo[playerid][sName], value);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Feuerzeuge**", SpielerInfo[playerid][sName], value);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            logPickedEasterEgg(playerid, "10 Feuerzeuge");

		    SpielerInfo[playerid][sFeuerzeug] += 10;
		}
		case 40 .. 44: // 5%
		{
		    new value = 30;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Drogen**", SpielerInfo[playerid][sName], value);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Drogen**", SpielerInfo[playerid][sName], value);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		   
            logPickedEasterEgg(playerid, "30 Drogen");

			SpielerInfo[playerid][sDrogen] += value;
		}
		case 45 .. 49: // 5%
		{
		    new value = 20;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Materialien**", SpielerInfo[playerid][sName], value);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Materialien**", SpielerInfo[playerid][sName], value);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            logPickedEasterEgg(playerid, "20 Materialien");

		    SpielerInfo[playerid][sMaterialien] += value;
		}
		case 50 .. 54:
		{
		    new value = 20;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d Materialien**", SpielerInfo[playerid][sName], value);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d Materialien**", SpielerInfo[playerid][sName], value);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
		    logPickedEasterEgg(playerid, "20 Materialien");

		    SpielerInfo[playerid][sMaterialien] += value;
		}
		case 55 .. 59:
		{
		    new value = 2000;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d EXP**", SpielerInfo[playerid][sName], value);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d EXP**", SpielerInfo[playerid][sName], value);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            logPickedEasterEgg(playerid, "2000 EXP");

		    GivePlayerEXP(playerid,value);
		}
		case 60 .. 62: //3%
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er 5000 EXP**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie 5000 EXP**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            logPickedEasterEgg(playerid, "5000 EXP");

            GivePlayerEXP(playerid,5000);
		}
        case 63 .. 64: //2%
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er 3000 EXP**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie 3000 EXP**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
		    logPickedEasterEgg(playerid, "3000 EXP");

            GivePlayerEXP(playerid,3000);
		}
		case 65 .. 69:
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er 20 Materialien**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie 20 Materialien**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);

            logPickedEasterEgg(playerid, "20 Materialien");

		    SpielerInfo[playerid][sMaterialien] += 20;
		}
		case 70 .. 74:
		{
		    new experienceValue = 500;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d EXP**", SpielerInfo[playerid][sName], experienceValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d EXP**", SpielerInfo[playerid][sName], experienceValue);
        	SendClientMessageToAll(COLOR_BLUE, globalstring);
        	
            format(cmd_string, sizeof(cmd_string), "%d EXP", experienceValue);
        	logPickedEasterEgg(playerid, cmd_string);

			GivePlayerEXP(playerid, experienceValue);
		}
		case 75 .. 79:
		{
		    new experienceValue = 1000;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d EXP**", SpielerInfo[playerid][sName], experienceValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d EXP**", SpielerInfo[playerid][sName], experienceValue);
        	SendClientMessageToAll(COLOR_BLUE, globalstring);
        	
            format(cmd_string, sizeof(cmd_string), "%d EXP", experienceValue);
        	logPickedEasterEgg(playerid, cmd_string);

		    GivePlayerEXP(playerid, experienceValue);
		}
		case 80 .. 83: // 4%
		{
		    new experienceValue = 2500;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d EXP**", SpielerInfo[playerid][sName], experienceValue);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d EXP**", SpielerInfo[playerid][sName], experienceValue);
        	SendClientMessageToAll(COLOR_BLUE, globalstring);

            format(cmd_string, sizeof(cmd_string), "%d EXP", experienceValue);
        	logPickedEasterEgg(playerid, cmd_string);

		    GivePlayerEXP(playerid, experienceValue);
		}
		case 84 .. 87: // 4%
		{
            SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er 50 Drogen**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie 50 Drogen**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);

			logPickedEasterEgg(playerid, "50 Drogen");

			SpielerInfo[playerid][sDrogen] += 50;
		}
		case 88: // 1%
		{
            SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er 200 Drogen**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie 200 Drogen**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
			
            logPickedEasterEgg(playerid, "200 Drogen");

			SpielerInfo[playerid][sDrogen] += 200;
		}
		case 89: // 1%
		{
	        SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er 60 Tage VIP**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie 60 Tage VIP**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
			
            logPickedEasterEgg(playerid, "60 Tage VIP");

			GiveVIP(SpielerInfo[playerid][sName],60,"Easter-Event");
		}
		case 90: // 1%
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er einen Payday**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie einen Payday**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);

			logPickedEasterEgg(playerid, "Payday geschenkt");

            SpielerInfo[playerid][sPayDay] = 44;
		}
		case 91 .. 92: // 2%
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er einen Payday**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie einen Payday**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);

			logPickedEasterEgg(playerid, "Payday geschenkt");

		  	SpielerInfo[playerid][sPayDay] = 44;
		}
		case 93 .. 94: // 2%
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er 1 Level**", SpielerInfo[playerid][sName]);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie 1 Level**", SpielerInfo[playerid][sName]);
		    SendClientMessageToAll(COLOR_BLUE,globalstring);

            logPickedEasterEgg(playerid, "1 Level");
			SetPVarInt(playerid,"LevelUpTime",1);
		  	SetTimerEx("LevelUpPlayer",1000,false,"i",playerid);
		}
		case 95 .. 97: // 3%
		{
		    new value = 3000;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d SA$**", SpielerInfo[playerid][sName], value);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d SA$**", SpielerInfo[playerid][sName], value);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);
		    
            format(cmd_string, sizeof(cmd_string), "%d SA$", value);
        	logPickedEasterEgg(playerid, cmd_string);

        	GivePlayerMoneyEx(playerid, value);
		}
		case 98 .. 100: // 2%
		{
		    new value = 5000;
		    SendClientMessage(playerid, COLOR_WHITE, "Herzlichen Glückwunsch! Du hast soeben ein Osterei gefunden.");

		    if(SpielerInfo[playerid][sGeschlecht] == 1) format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält er %d SA$**", SpielerInfo[playerid][sName], value);
		    else format(globalstring, sizeof(globalstring), "** Oster Event: %s hat ein Osterei gefunden. Als Geschenk erhält sie %d SA$**", SpielerInfo[playerid][sName], value);
		    SendClientMessageToAll(COLOR_BLUE, globalstring);

            format(cmd_string, sizeof(cmd_string), "%d SA$", value);
        	logPickedEasterEgg(playerid, cmd_string);

        	GivePlayerMoneyEx(playerid, value);
		}
		default:
		{
            format(cmd_string, sizeof(cmd_string), "ERROR %d", gift);
        	logPickedEasterEgg(playerid, cmd_string);
		}
	}
	return 1;
}

stock logPickedEasterEgg(playerid, const content[]) {
    new sqlquery[128];
    mysql_format(sqlHandle, sqlquery, sizeof(sqlquery), "INSERT INTO `serverlog_easter` (`userID`, `content`) VALUES ('%d', '%s')", SpielerInfo[playerid][sDBID], content);
    mysql_tquery(sqlHandle, sqlquery);
    return 1;
}

stock easterEggTables() {

    mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `serverlog_easter` ( \
            `logID` int(11) NOT NULL AUTO_INCREMENT, \
            `userID` int(11) NOT NULL, \
            `content` varchar(128) NOT NULL, \
            `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, \
            PRIMARY KEY (`logID`), \
            KEY `userID` (`userID`) \
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8; \
    ");

    mysql_tquery(sqlHandle, "\
            CREATE TABLE IF NOT EXISTS `eastereggs` ( \
            `id` int(12) NOT NULL AUTO_INCREMENT, \
            `model` int(12) NOT NULL, \
            `x` float NOT NULL, \
            `y` float NOT NULL, \
            `z` float NOT NULL, \
            `rx` float NOT NULL DEFAULT '0.000', \
            `ry` float NOT NULL DEFAULT '0.000', \
            `rz` float NOT NULL DEFAULT '0.000', \
            `lastPick` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP, \
            PRIMARY KEY (`id`) \
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8; \
    ");

    return 1;
}


COMMAND:addegg(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new objectFound = 0, sqlquery[128];
    for(new i = 0; i < MAX_GAME_OBJECTS; i++) {
		if(!adminObject[i][ao_Created]) continue;
	    if(adminObject[i][ao_Model] >= 19341 && adminObject[i][ao_Model] <= 19345 && IsPlayerInRangeOfPoint(playerid, 3.0, adminObject[i][ao_Position][0], adminObject[i][ao_Position][1], adminObject[i][ao_Position][2])) {
	        format(sqlquery, sizeof(sqlquery), "INSERT INTO `eastereggs` (`model`, `x`, `y`, `z`) VALUES ('%d', '%f', '%f', '%f')", adminObject[i][ao_Model], adminObject[i][ao_Position][0], adminObject[i][ao_Position][1], adminObject[i][ao_Position][2]);
			mysql_tquery(sqlHandle, sqlquery);

	        SendClientMessage(playerid, COLOR_WHITE, "* Du hast das Osterei erfolgreich hinzugefügt. Das Objekt wurde automatisch entfernt.");

	        adminObject[i][ao_Created] = false;
	        DestroyDynamicObject(adminObject[i][ao_ObjectId]);
	        adminObject[i][ao_ObjectId] = 0;
	        objectFound = 1;
		}
	}
	if(!objectFound) {
        SendClientMessage(playerid, COLOR_RED, "Es wurde kein Osterei in deiner Umgebung gefunden.");
	}
	return 1;
}

COMMAND:geteggs(playerid, params[])
{
    new globalstring[128];
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	for(new i = 0; i < sizeof(easteregg); i++) {
        format(globalstring, sizeof(globalstring), "[ArrayId %d - databaseId %d - Found %d] %f - %f - %f", i, easteregg[i][egg_id], easteregg[i][egg_found], easteregg[i][egg_x], easteregg[i][egg_y], easteregg[i][egg_z]);
    	SendClientMessage(playerid, COLOR_WHITE, globalstring);
	}
	return 1;
}

COMMAND:gotoegg(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new eggId;
	if(sscanf(params, "i", eggId))return SendClientMessage(playerid, COLOR_GREY, "Tippe: /gotoegg [Osterei-ID]");
	SetPlayerPos(playerid, easteregg[eggId][egg_x], easteregg[eggId][egg_y], easteregg[eggId][egg_z]);
	return 1;
}

COMMAND:easteregg(playerid, params[])
{
	if(GetPVarInt(playerid, "openingEasterEgg")) return SendClientMessage(playerid, COLOR_RED, "Du hebst aktuell ein Osterei auf.");
    new eggId = -1;
	for(new i = 0; i < sizeof(easteregg); i++) {
		if(!easteregg[i][egg_found] && IsPlayerInRangeOfPoint(playerid, 3.0, easteregg[i][egg_x], easteregg[i][egg_y], easteregg[i][egg_z])) {
            eggId = i;
            break;
		}
	}
	if(eggId != -1) {
   	    SetPVarInt(playerid, "openingEasterEgg", 1);
   	    ApplyAnimationEx(playerid, "BOMBER", "BOM_Plant", 2.5, false, false, false, false, 0, SYNC_ALL);
   	    SendClientMessage(playerid, COLOR_WHITE, "* Du hebst das Osterei auf ....");
   	    SetPlayerCameraPos(playerid, easteregg[eggId][egg_x], easteregg[eggId][egg_y], easteregg[eggId][egg_z] + 10);
   	    SetPlayerCameraLookAt(playerid, easteregg[eggId][egg_x] + 1, easteregg[eggId][egg_y] + 1, easteregg[eggId][egg_z]);
   	    TogglePlayerControllable(playerid, false);

   	    SetTimerEx("pickupEasterEgg", 5000, false, "ii", playerid, eggId);
	} else {
		SendClientMessage(playerid, COLOR_RED, "An dieser Stelle befindet sich leider kein Osterei.");
	}
	return 1;
}