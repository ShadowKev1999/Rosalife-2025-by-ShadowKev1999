
Item_Defines_Init() {
    for(new i = 0; i < MAX_SERVER_ITEMS_TYPES; i++) {
        server_Items[i] = DefineItemType(server_ItemsDefines[i][sItemName], server_ItemsDefines[i][sItemName], server_ItemsDefines[i][sItemModelId], server_ItemsDefines[i][sItemSize]);
    }
    return 1;
}