#define     MAX_TREES           (100)   // tree limit
#define     MAX_LOGS            (300)   // dropped log limit
#define     MAX_BUYERS          (10)    // log buyer limit

#define     LOG_CUTTING_TIME    (8)		// required seconds to cut a tree down (Default: 8)
#define     LOG_LIMIT     	    (10)    // how many logs a player can load to a bobcat (if you change this, don't forget to modify LogAttachOffsets array) (Default: 10)
#define     LOG_ATTACH_INDEX    (7)     // for setplayerattachedobject (Default: 7)
#define     TREE_RESPAWN        (1800)   // required seconds to respawn a tree (Default: 300)
#define     LOG_LIFETIME	    (60)   // life time of a dropped log, in seconds (Default: 120)
#define     LOG_PRICE           (200)    // price of a log (Default: 50)
#define     CSAW_PRICE          (500)  	// price of a chainsaw (Default: 500)

enum    E_TREE
{
	// loaded from db
	Float: treeX,
	Float: treeY,
	Float: treeZ,
	Float: treeRX,
	Float: treeRY,
	Float: treeRZ,
	// temp
	treeLogs,
	treeSeconds,
	bool: treeGettingCut,
	treeObjID,
	Text3D: treeLabel,
	treeTimer
}

enum    E_LOG
{
	// temp
	logDroppedBy[MAX_PLAYER_NAME],
	logSeconds,
	logObjID,
	logTimer,
	Text3D: logLabel
}

enum    E_BUYER
{
	// loaded from db
	buyerSkin,
	Float: buyerX,
	Float: buyerY,
	Float: buyerZ,
	Float: buyerA,
	// temp
	buyerActorID,
	Text3D: buyerLabel
}

new
	TreeData[MAX_TREES][E_TREE],
	LogData[MAX_LOGS][E_LOG],
	BuyerData[MAX_BUYERS][E_BUYER];
	
new
	Iterator: Trees<MAX_TREES>,
	Iterator: Logs<MAX_LOGS>,
	Iterator: Buyers<MAX_BUYERS>;

new
	LogObjects[MAX_VEHICLES][LOG_LIMIT];
	
new
	CuttingTreeID[MAX_PLAYERS] = {-1, ...},
	CuttingTimer[MAX_PLAYERS] = {-1, ...},
	PlayerBar: CuttingBar[MAX_PLAYERS] = {INVALID_PLAYER_BAR_ID, ...},
	bool: CarryingLog[MAX_PLAYERS],
	playerBuyerDialogHelper[MAX_PLAYERS][MAX_BUYERS],
	EditingTreeID[MAX_PLAYERS] = {-1, ...};

new
	Float: LogAttachOffsets[LOG_LIMIT][4] = {
	    {-0.223, -1.089, -0.230, -90.399},
		{-0.056, -1.091, -0.230, 90.399},
		{0.116, -1.092, -0.230, -90.399},
		{0.293, -1.088, -0.230, 90.399},
		{-0.123, -1.089, -0.099, -90.399},
		{0.043, -1.090, -0.099, 90.399},
		{0.216, -1.092, -0.099, -90.399},
		{-0.033, -1.090, 0.029, -90.399},
		{0.153, -1.089, 0.029, 90.399},
		{0.066, -1.091, 0.150, -90.399}
	};