enum SprayTagsData {
	stObjectID,
	Float:stPos_X,
	Float:stPos_Y,
	Float:stPos_Z,
	Float:stRot_X,
	Float:stRot_Y,
	Float:stRot_Z,
	stFactionID,
	stText[64],
	stSprayed,
	bool:stErstellt
}
new SprayTagInfo[MAX_SPRAYTAGS][SprayTagsData];