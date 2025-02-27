enum StoreData {
	siBesitzer[24],
	bool:siErstellt,
 	siPickup,
  	Text3D:siText,
	siPreis,
	siKasse,
	siNavi,
	siHandy,
	siTelefonbuch,
	siRepairkit,
	siKamera,
	Float:siPos_X,
	Float:siPos_Y,
	Float:siPos_Z
}
new StoreInfo[MAX_STORES][StoreData];