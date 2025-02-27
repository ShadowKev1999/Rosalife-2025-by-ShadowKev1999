COMMAND:createitem(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] < 5)return NichtBerechtigt
    new mainstring[512];

    for(new i = 0; i < MAX_SERVER_ITEMS_TYPES; i++) {
        format(mainstring, sizeof(mainstring), "%s\n%s", mainstring, server_ItemsDefines[i][sItemName]);
    }

    ShowPlayerDialog(playerid, DIALOG_GIVE_ITEM_TEST, DIALOG_STYLE_LIST, "Create Item Test", mainstring, "Auswählen", "Abbrechen");
    return 1;
}