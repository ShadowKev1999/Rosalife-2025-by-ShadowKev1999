MoneyDraw_PlayerConnect(playerid) {
    MoneyDraw[playerid][0] = CreatePlayerTextDraw(playerid, 610.233398, 78.199264, "usebox");
    PlayerTextDrawLetterSize(playerid, MoneyDraw[playerid][0], 0.000000, 2.080657);
    PlayerTextDrawTextSize(playerid, MoneyDraw[playerid][0], 495.233245, 0.000000);
    PlayerTextDrawAlignment(playerid, MoneyDraw[playerid][0], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, MoneyDraw[playerid][0], 0);
    PlayerTextDrawUseBox(playerid, MoneyDraw[playerid][0], true);
    PlayerTextDrawBoxColour(playerid, MoneyDraw[playerid][0], -5963521);
    PlayerTextDrawSetShadow(playerid, MoneyDraw[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, MoneyDraw[playerid][0], 0);
    PlayerTextDrawFont(playerid, MoneyDraw[playerid][0], TEXT_DRAW_FONT_0);
 
    MoneyDraw[playerid][1] = CreatePlayerTextDraw(playerid, 608.533813, 80.190361, "usebox");
    PlayerTextDrawLetterSize(playerid, MoneyDraw[playerid][1], 0.000000, 1.638805);
    PlayerTextDrawTextSize(playerid, MoneyDraw[playerid][1], 496.733184, 0.000000);
    PlayerTextDrawAlignment(playerid, MoneyDraw[playerid][1], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, MoneyDraw[playerid][1], 0);
    PlayerTextDrawUseBox(playerid, MoneyDraw[playerid][1], true);
    PlayerTextDrawBoxColour(playerid, MoneyDraw[playerid][1], 255);
    PlayerTextDrawSetShadow(playerid, MoneyDraw[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, MoneyDraw[playerid][1], 0);
    PlayerTextDrawFont(playerid, MoneyDraw[playerid][1], TEXT_DRAW_FONT_0);
 
    MoneyDraw[playerid][2] = CreatePlayerTextDraw(playerid, 506.233306, 83.211807, "~y~0 $");
    PlayerTextDrawLetterSize(playerid, MoneyDraw[playerid][2], 0.250333, 0.957036);
    PlayerTextDrawAlignment(playerid, MoneyDraw[playerid][2], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, MoneyDraw[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, MoneyDraw[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, MoneyDraw[playerid][2], 1);
    PlayerTextDrawBackgroundColour(playerid, MoneyDraw[playerid][2], 51);
    PlayerTextDrawFont(playerid, MoneyDraw[playerid][2], TEXT_DRAW_FONT_2);
    PlayerTextDrawSetProportional(playerid, MoneyDraw[playerid][2], true);

    toggleMoneyDraw[playerid] = false;
    return 1;
}

MoneyDraw_PlayerDisconnect(playerid) {
    for(new i=0; i<3; i++){
        PlayerTextDrawDestroy(playerid, MoneyDraw[playerid][i]);
    }
    toggleMoneyDraw[playerid] = false;
    return 1;
}

hideMoneyDraw(playerid) {
    for(new i=0; i<3; i++) {
        PlayerTextDrawHide(playerid, MoneyDraw[playerid][i]);
    }
    toggleMoneyDraw[playerid] = false;
    return 1;
}

showMoneyDraw(playerid) {
    for(new i=0; i<3; i++) {
        PlayerTextDrawShow(playerid, MoneyDraw[playerid][i]);
    }
    toggleMoneyDraw[playerid] = true;
    return 1;
}


setMoneyDraw(playerid, amount) {

    if(!toggleMoneyDraw[playerid]) {
        for(new i=0; i<3; i++) {
            PlayerTextDrawShow(playerid, MoneyDraw[playerid][i]);
        }
        toggleMoneyDraw[playerid] = true;
    }

    new string[64];
    if(amount > 0) {
        format(string, sizeof(string), "~g~%i $", amount);
    } else if (amount < 0) {
        format(string, sizeof(string), "~r~%i $", amount);
    } else {
        format(string, sizeof(string), "~y~%i $", amount);
    }
    PlayerTextDrawSetString(playerid, MoneyDraw[playerid][2], string);
    return 1;
}