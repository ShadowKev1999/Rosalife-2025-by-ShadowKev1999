#include "core/item/item_defines.pwn"
#include "core/item/item_test.pwn"

Item_Init() {
    Item_Defines_Init();
    return 1;
}

Item_OnDialogResponse(playerid, dialogid, response, listitem) {
    ItemTest_OnDialogResponse(playerid, dialogid, response, listitem);
    return 1;
}