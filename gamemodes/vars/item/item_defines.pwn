#define MAX_SERVER_ITEMS_TYPES  (9)

enum {
    ITEM_DRUGS,
    ITEM_LIGHTER,
    ITEM_REPAIRKIT,
    ITEM_DEPOSIT_BOTTLE,
    ITEM_DEPOSIT_BAG,
    ITEM_ORANGE,
    ITEM_BASKET,
    ITEM_BOMB,
    ITEM_MATERIALS,
}

enum E_SERVER_ITEMS_DEFINES {
    sItemName[32],
    sItemSize,
    sItemModelId,
}

new
    ItemType:server_Items[MAX_SERVER_ITEMS_TYPES],
    server_ItemsDefines[MAX_SERVER_ITEMS_TYPES][E_SERVER_ITEMS_DEFINES] = {
        {"Cannabis", 2, 1575},
        {"Feuerzeug", 1, 19998},
        {"Repairkit", 4, 18875},
        {"Pfandflasche", 1, 1484},
        {"Beutel", 1, 2663},
        {"Orange", 1, 19574},
        {"Obstkorb", 2, 19592},
        {"Bombe", 5, 364},
        {"Materialien", 2, 1580}
    };