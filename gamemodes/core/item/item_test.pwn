ItemTest_OnDialogResponse(playerid, dialogid, response, listitem) {
    switch(dialogid) {
        case DIALOG_GIVE_ITEM_TEST: {
            if(!response) return 1;
            if(listitem < 0 || listitem >= MAX_SERVER_ITEMS_TYPES) return 1;

            new Float:_tempX, Float:_tempY, Float:_tempZ;

            GetPlayerPos(playerid, _tempX, _tempY, _tempZ);

            CA_FindZ_For2DCoord(_tempX, _tempY, _tempZ);

            CreateItem(server_Items[listitem], _tempX, _tempY, _tempZ);
            return 1;
        }
    }
    return 1;
}