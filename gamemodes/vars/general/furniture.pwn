enum e_furniture
{
	SQLID,
	HouseID,
	ArrayID,
	Float: furnitureX,
	Float: furnitureY,
	Float: furnitureZ,
	Float: furnitureRX,
	Float: furnitureRY,
	Float: furnitureRZ,
    Float:furnitureWeight,
    furniturePrice,
    furnitureModel,
};

#define FURNITURE_SERVER_WAIT       60
#define MAX_FURNITURE_ITEMS_LIST    25

new furnitureList[MAX_PLAYERS][MAX_FURNITURE_ITEMS_LIST];