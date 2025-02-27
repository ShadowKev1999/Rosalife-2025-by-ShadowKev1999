enum objInfo
{
	Erstellt,
	ObjDbId,
	omid,
	ObjID,
	Float:oX,
	Float:oY,
	Float:oZ,
	Float:orX,
	Float:orY,
	Float:orZ,
    oWorldId,
    oInteriorId,
    Float:oStreamDistance,
    Float:oDrawDistance,
	oKommentar[30],
 	oIndex[10],
	oModelID,
	oTxdName[40],
	oTextureName[40],
	oMaterialColor,
 	oText[128],
 	oMaterialSize,
 	oFontFace[20],
 	oFontBold,
	oFontSize,
	oMaterialBack,
	oTextAlign,
}
new ObjektInfo[objInfo];

#define MAX_SERVER_REMOVES  1000

enum E_SERVER_REMOVES {
    remModelId,
    Float:remCenterX,
    Float:remCenterY,
    Float:remCenterZ,
    Float:remRadius,
    remKommentar[30],
}
new ServerRemoves[MAX_SERVER_REMOVES][E_SERVER_REMOVES],
    Iterator:ServerRemovesItter<MAX_SERVER_REMOVES>;