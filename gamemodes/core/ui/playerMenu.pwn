
#define ShowPlayerMenu(%0,%1, \
	Internal_ShowPlayerMenu(%0, #%1,
stock Internal_ShowPlayerMenu(playerid, const menuid[], const caption[], const type[] = "INTERACTION MENU", captionTextColor = 0xf7f7f7ff, captionBoxColor = 0x166CB3FF, const captionSprite[] = "loadsc12:loadsc12")
{
	if (playerid < 0 || playerid >= MAX_PLAYERS)
	{
	    return 0;
	}

	for (new i; i < menuPlayerTextDrawsCount[playerid]; i++)
	{
	    PlayerTextDrawDestroy(playerid, menuPlayerTextDraws[playerid][i]);
	}
    menuPlayerTextDrawsCount[playerid] = 0;

    menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,12.000000, 141.000000, captionSprite);
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 255);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_SPRITE_DRAW);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 4.000000);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], captionBoxColor);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 139.000000, 40.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 143.000000, "_box");
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 255);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 4.000000);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], -1);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], captionBoxColor);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]]);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++], false);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,16.000000, 151.000000, caption);
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.399998, 2.299998);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], captionTextColor);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 182.000000, "_box");
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 1.200000);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 421075400);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	for (new i; type[i] != EOS; i++)
	{
	    toupper(type[i]);
	}
	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,14.000000, 183.000000, type);
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.189998, 1.000000);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0xf7f7f7ff);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,149.000000, 183.000000, "-/-");
	PlayerTextDrawAlignment(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_ALIGN_RIGHT);
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.189998, 1.000000);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0xf7f7f7ff);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]]);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEM_COUNT] = menuPlayerTextDrawsCount[playerid]++;

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 196.000000, "_box");
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, (1.999999 + (1.6 * (MENU_MAX_LISTITEMS_PERPAGE - 1))));
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 421075400);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	PlayerTextDrawShow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]++]);

	for (new i; i < MENU_MAX_LISTITEMS_PERPAGE; i++)
	{
		menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, (196.000000 + (15 * i)), "_");
		PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
		PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
		PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.230000, 1.399999);
		PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], -1);
		PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
		PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
		PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
		PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
		PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 175);
		PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
		PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
		menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i] = menuPlayerTextDrawsCount[playerid]++;
	}

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 319.000000, "_box");
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, 1.999999);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 421075400);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_BOX] = menuPlayerTextDrawsCount[playerid]++;

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,13.000000, 319.000000, "_model");
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, 0.899999);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], -1);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 10.000000, 10.000000);
	PlayerTextDrawSetPreviewModel(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1239);
	PlayerTextDrawSetPreviewRot(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.000000, 0.000000, 0.000000, 1.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_ICON] = menuPlayerTextDrawsCount[playerid]++;

	menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]] = CreatePlayerTextDraw(playerid,23.000000, 319.000000, "Write listitem info here");
	PlayerTextDrawBackgroundColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawFont(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0.159999, 0.899999);
	PlayerTextDrawColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], -1);
	PlayerTextDrawSetOutline(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawSetProportional(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawSetShadow(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 1);
	PlayerTextDrawUseBox(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], true);
	PlayerTextDrawBoxColour(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 0);
	PlayerTextDrawTextSize(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], 150.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid,menuPlayerTextDraws[playerid][menuPlayerTextDrawsCount[playerid]], false);
	menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_TEXT] = menuPlayerTextDrawsCount[playerid]++;

	format(playerMenu[playerid][E_PLAYER_MENU_ID], 32, menuid);
	playerMenu[playerid][E_PLAYER_MENU_PAGE] = 0;
	playerMenu[playerid][E_PLAYER_MENU_LISTITEM] = 0;
	playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS] = 0;
	playerMenu[playerid][E_PLAYER_MENU_TICKCOUNT] = 0;
	return 1;
}

stock AddPlayerMenuItem(playerid, const text[], const info[] = "")
{
	if(playerid == INVALID_PLAYER_ID)return 0;
	if(!playerMenu[playerid][E_PLAYER_MENU_ID][0])return 0;
	if(playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS] == MENU_MAX_LISTITEMS)return 0;

	strpack(playerMenuListitems[playerid][playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]], text, MENU_MAX_LISTITEM_SIZE);
	strpack(playerMenuListitemsInfo[playerid][playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]], info, MENU_MAX_LISTITEM_SIZE);
    playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]++;

    Internal_UpdateListitems(playerid);
    return 1;
}

stock HidePlayerMenu(playerid)
{
	if(playerid == INVALID_PLAYER_ID)return 0;

    for(new i; i < menuPlayerTextDrawsCount[playerid]; i++)
	{
	    PlayerTextDrawDestroy(playerid, menuPlayerTextDraws[playerid][i]);
	}
    menuPlayerTextDrawsCount[playerid] = 0;

    playerMenu[playerid][E_PLAYER_MENU_ID][0] = EOS;
	return 1;
}

stock Internal_UpdateListitemInfo(playerid)
{
	new listitemid = (playerMenu[playerid][E_PLAYER_MENU_LISTITEM] + (playerMenu[playerid][E_PLAYER_MENU_PAGE] * MENU_MAX_LISTITEMS_PERPAGE));
	if(playerMenuListitemsInfo[playerid][listitemid]{0})
	{
        PlayerTextDrawShow(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_BOX]]);
        PlayerTextDrawShow(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_ICON]]);

	    new gmenu_string[MENU_MAX_LISTITEM_SIZE];
	    strunpack(gmenu_string, playerMenuListitemsInfo[playerid][listitemid]);
	    PlayerTextDrawSetString(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_TEXT]], gmenu_string);
        PlayerTextDrawShow(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_TEXT]]);
	}
	else
	{
        PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_BOX]]);
        PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_ICON]]);
		PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_INFO_TEXT]]);
	}
	return 1;
}

stock Internal_UpdateListitems(playerid)
{
	new gmenu_string[MENU_MAX_LISTITEM_SIZE];
	new listitem = ((playerMenu[playerid][E_PLAYER_MENU_LISTITEM] + (playerMenu[playerid][E_PLAYER_MENU_PAGE] * MENU_MAX_LISTITEMS_PERPAGE)) + 1);
    format(gmenu_string, sizeof gmenu_string, "%i/%i", listitem, playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS]);
	PlayerTextDrawSetString(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEM_COUNT]], gmenu_string);

	for (new i; i < MENU_MAX_LISTITEMS_PERPAGE; i++)
	{
	    listitem = (i + (playerMenu[playerid][E_PLAYER_MENU_PAGE] * MENU_MAX_LISTITEMS_PERPAGE));
 		if(listitem >= playerMenu[playerid][E_PLAYER_MENU_TOTAL_LISTITEMS])
		{
 			PlayerTextDrawHide(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]]);
	 		continue;
		}

		if(i == playerMenu[playerid][E_PLAYER_MENU_LISTITEM])
  		{
        	PlayerTextDrawColour(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], 255);
        	PlayerTextDrawBoxColour(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], -86);
		}
		else
		{
        	PlayerTextDrawColour(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], -1);
        	PlayerTextDrawBoxColour(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], 175);
		}

	    strunpack(gmenu_string, playerMenuListitems[playerid][listitem]);
	    PlayerTextDrawSetString(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]], gmenu_string);
        PlayerTextDrawShow(playerid, menuPlayerTextDraws[playerid][menuPlayerTextDrawsID[playerid][E_MENU_TEXTDRAW_LISTITEMS][i]]);
	}

	Internal_UpdateListitemInfo(playerid);
	return 1;
}