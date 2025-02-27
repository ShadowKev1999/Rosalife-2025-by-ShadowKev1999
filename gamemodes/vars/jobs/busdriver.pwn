#define MAX_BUS_ROUTES		(20)
#define MAX_BUS_ROUTES_CPS	(15)

enum E_BUS_ROUTE_DATA {
	bool:bRouteCreated,
	bRouteDatabaseId,
	bRouteColor[16],
	bRouteName[32],
	bBusSkill,
	bBusMoneyBonus,
	bBusJobExpBonus
}
new busRoutesData[MAX_BUS_ROUTES][E_BUS_ROUTE_DATA],
	Float:busRouteCheckpoint[MAX_BUS_ROUTES][MAX_BUS_ROUTES_CPS][3],
	busRoutePlayerList[MAX_PLAYERS][MAX_BUS_ROUTES];