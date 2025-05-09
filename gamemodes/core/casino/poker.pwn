forward bool: FoldPlayer(handle, playerid);
native calculate_hand_worth(const hands[], count = sizeof(hands));

#define T_SendWarning(%0)      		(printf(" * [PokerPrint]: " %0))

/******************************************************************************************
	Utils
*******************************************************************************************/
stock UpdateDynamic3DTextLabelTextEx(STREAMER_TAG_3D_TEXT_LABEL id, color, const format[], OPEN_MP_TAGS:...)
{
	return UpdateDynamic3DTextLabelText(id, color, va_return(format, va_start<3>));
}
/******************************************************************************************
										Constants
*******************************************************************************************/

//Limits
#define T_MAX_POKER_TABLES													36
#define T_MAX_CHAIRS_PER_TABLE												7
#define T_CHAIR_MODEL 														2120
#define T_MAX_CHIPS_PER_CHAIR												4
#define T_MAX_WAIT_TIME														20 //20 seconds to make a choice
#define T_START_DELAY														5 //5 seconds
#define T_SAVE_PLAYER_POS 													true
//Max number the chips can express 10^(MAX_CHIP_DIGITS) - 1
#define MAX_CHIP_DIGITS														7
#define T_TABLE_TICK_INTERVAL												500 //(in ms) half a second
#define T_POT_FEE_RATE 														0.02


//Layout and design
#define T_Z_OFFSET 															0.442852
#define T_CHAIR_RANGE														1.250000
#define T_Z_CAMERA_OFFSET													3.0
#define T_CHIP_OFFSET														0.13
//Length and width of cards
#define T_CARD_X_SIZE														23.0 // 21.000000
#define T_CARD_Y_SIZE														31.0 // 29.000000


#define T_TWO_CARD_DISTANCE													23.904725 //Distance between the two cards each player receives
#define T_CARDS_RADIAL_DISTANCE												144.00000 //Distance from the first card to the center of the table
#define T_SCREEN_CENTER_X 													320.00000
#define T_SCREEN_CENTER_Y 													215.00000
#define T_CHIPS_DISTANCE 													0.6582
#define T_RADIUS															0.971977
#define T_BET_LABEL_COLOR													0x0080FFFF
//Radial distance required to enter a table
#define T_JOIN_TABLE_RANGE													2.5



/*Textdraw constants*/

#define MAIN_POT 															0
#define CALL 																2
#define RAISE 																3
#define FOLD 																4
// #define DIALOG_BUY_IN														19232
// #define DIALOG_INPUT_RAISE													9231


#define SendPokerMessage(%0,%1) \
	SendClientMessage(%0, -1, "{4B8774}[POKER] {E5861A}"%1)

#define IsPlayerPlayingPoker(%0) (GetPVarInt(%0,"t_is_in_table"))


/******************************************************************************************
	Enums and arrays
*******************************************************************************************/

/* Iterators */

new Iterator:IT_Tables<T_MAX_POKER_TABLES>;
new Iterator:IT_TableCardSet[T_MAX_POKER_TABLES]<52>; //Card sample space

new Iterator:IT_PlayersTable<T_MAX_POKER_TABLES, MAX_PLAYERS>; //Current players in the table (might not be playing but just looking the rest of the players play)
new Iterator:IT_PlayersInGame<T_MAX_POKER_TABLES, MAX_PLAYERS>; //Current players in the table playing
new Iterator:IT_PlayersAllIn<T_MAX_POKER_TABLES, MAX_PLAYERS>;

//Syntax: It_SidepotMembers[_IT[idx_table][idx_chair_slot]]
new Iterator:It_SidepotMembers[T_MAX_POKER_TABLES * T_MAX_CHAIRS_PER_TABLE]<MAX_PLAYERS>;
new Iterator:IT_Sidepots[T_MAX_POKER_TABLES]<T_MAX_CHAIRS_PER_TABLE>;
#define _IT[%0][%1]            %0*T_MAX_CHAIRS_PER_TABLE+%1
#define IsValidTable(%0)		((0 <= %0 < T_MAX_POKER_TABLES) && Iter_Contains(IT_Tables, %0))

enum E_TABLE_STATES
{
	STATE_IDLE,
	STATE_BEGIN, //Game has started
}

//Rankings: from lowest to highest
new const HAND_RANKS[][] =
{
	{"Undefined"}, //will never occur
	{"High Card"},
	{"Pair"},
	{"Two Pair"},
	{"Three of a Kind"},
	{"Straight"},
	{"Flush"},
	{"Full House"},
	{"Four of a Kind"},
	{"Straight Flush"},
	{"Royal Flush"}
};
enum E_CARD_SUITS
{
	SUIT_SPADES,
	SUIT_HEARTS,
	SUIT_CLUBS,
	SUIT_DIAMONDS
};

enum E_CARD_DATA
{
	E_CARD_TEXTDRAW[48],
	E_CARD_NAME[48],
	E_CARD_SUITS:E_CARD_SUIT,
	E_CARD_RANK
};


new const CardData[ 52 ] [E_CARD_DATA] = {

	//Spades
    {"LD_CARD:cd2s", 		"Two of Spades", 		SUIT_SPADES,		0},
    {"LD_CARD:cd3s", 		"Three of Spades", 		SUIT_SPADES,		1},
    {"LD_CARD:cd4s", 		"Four of Spades", 		SUIT_SPADES,		2},
    {"LD_CARD:cd5s", 		"Five of Spades", 		SUIT_SPADES,		3},
    {"LD_CARD:cd6s", 		"Six of Spades", 		SUIT_SPADES,		4},
    {"LD_CARD:cd7s", 		"Seven of Spades", 		SUIT_SPADES,		5},
    {"LD_CARD:cd8s", 		"Eight of Spades", 		SUIT_SPADES,		6},
    {"LD_CARD:cd9s", 		"Nine of Spades", 		SUIT_SPADES,		7},
    {"LD_CARD:cd10s",		"Ten of Spades",		SUIT_SPADES,		8},
    {"LD_CARD:cd11s",		"Jack of Spades", 		SUIT_SPADES,		9},
    {"LD_CARD:cd12s",		"Queen of Spades", 		SUIT_SPADES,		10},
    {"LD_CARD:cd13s", 		"King of Spades", 		SUIT_SPADES,		11},
    {"LD_CARD:cd1s", 		"Ace of Spades", 		SUIT_SPADES,		12},

	//Hearts
    {"LD_CARD:cd2h", 		"Two of Hearts", 		SUIT_HEARTS,		0},
    {"LD_CARD:cd3h", 		"Three of Hearts", 		SUIT_HEARTS,		1},
    {"LD_CARD:cd4h", 		"Four of Hearts", 		SUIT_HEARTS,		2},
    {"LD_CARD:cd5h", 		"Five of Hearts", 		SUIT_HEARTS,		3},
    {"LD_CARD:cd6h", 		"Six of Hearts", 		SUIT_HEARTS,		4},
    {"LD_CARD:cd7h", 		"Seven of Hearts", 		SUIT_HEARTS,		5},
    {"LD_CARD:cd8h", 		"Eight of Hearts", 		SUIT_HEARTS,		6},
    {"LD_CARD:cd9h", 		"Nine of Hearts", 		SUIT_HEARTS,		7},
    {"LD_CARD:cd10h",		"Ten of Hearts",		SUIT_HEARTS,		8},
    {"LD_CARD:cd11h",		"Jack of Hearts", 		SUIT_HEARTS,		9},
    {"LD_CARD:cd12h",		"Queen of Hearts", 		SUIT_HEARTS,		10},
    {"LD_CARD:cd13h",		"King of Hearts", 		SUIT_HEARTS,		11},
    {"LD_CARD:cd1h", 		"Ace of Hearts", 		SUIT_HEARTS,		12},

	//Clubs
    {"LD_CARD:cd2c", 		"Two of Clubs", 		SUIT_CLUBS, 		0},
    {"LD_CARD:cd3c", 		"Three of Clubs", 		SUIT_CLUBS, 		1},
    {"LD_CARD:cd4c", 		"Four of Clubs", 		SUIT_CLUBS, 		2},
    {"LD_CARD:cd5c", 		"Five of Clubs", 		SUIT_CLUBS, 		3},
    {"LD_CARD:cd6c", 		"Six of Clubs", 		SUIT_CLUBS, 		4},
    {"LD_CARD:cd7c", 		"Seven of Clubs", 		SUIT_CLUBS, 		5},
    {"LD_CARD:cd8c", 		"Eight of Clubs", 		SUIT_CLUBS, 		6},
    {"LD_CARD:cd9c", 		"Nine of Clubs", 		SUIT_CLUBS, 		7},
    {"LD_CARD:cd10c",		"Ten of Clubs",			SUIT_CLUBS, 		8},
    {"LD_CARD:cd11c",		"Jack of Clubs", 		SUIT_CLUBS, 		9},
    {"LD_CARD:cd12c",		"Queen of Clubs", 		SUIT_CLUBS, 		10},
    {"LD_CARD:cd13c",		"King of Clubs", 		SUIT_CLUBS, 		11},
    {"LD_CARD:cd1c", 		"Ace of Clubs", 		SUIT_CLUBS, 		12},

    //Diamonds
    {"LD_CARD:cd2d", 		"Two of Diamonds", 		SUIT_DIAMONDS, 		0},
    {"LD_CARD:cd3d", 		"Three of Diamonds", 	SUIT_DIAMONDS, 		1},
    {"LD_CARD:cd4d", 		"Four of Diamonds", 	SUIT_DIAMONDS, 		2},
    {"LD_CARD:cd5d", 		"Five of Diamonds", 	SUIT_DIAMONDS, 		3},
    {"LD_CARD:cd6d", 		"Six of Diamonds", 		SUIT_DIAMONDS, 		4},
    {"LD_CARD:cd7d", 		"Seven of Diamonds", 	SUIT_DIAMONDS, 		5},
    {"LD_CARD:cd8d", 		"Eight of Diamonds", 	SUIT_DIAMONDS, 		6},
    {"LD_CARD:cd9d", 		"Nine of Diamonds", 	SUIT_DIAMONDS, 		7},
    {"LD_CARD:cd10d",		"Ten of Diamonds", 		SUIT_DIAMONDS, 		8},
    {"LD_CARD:cd11d",		"Jack of Diamonds", 	SUIT_DIAMONDS, 		9},
    {"LD_CARD:cd12d",		"Queen of Diamonds", 	SUIT_DIAMONDS, 		10},
    {"LD_CARD:cd13d",		"King of Diamonds", 	SUIT_DIAMONDS, 		11},
    {"LD_CARD:cd1d", 		"Ace of Diamonds", 		SUIT_DIAMONDS, 		12}
};


//Card rank = (array index % 13) | Card native index = 4 * rank + suit
#define GetCardNativeIndex(%0) 			((4*((%0) % 13))+_:CardData[(%0)][E_CARD_SUIT])


new const TableRotCorrections[][] =
{
	{-1, -1, -1, -1, -1, -1},//0seats
	{-1, -1, -1, -1, -1, -1},//1 seat
	{ 1,  0, -1, -1, -1, -1},//2 seats
	{ 1,  0,  2, -1, -1, -1},//3 seats
	{ 1,  0,  3,  2, -1, -1},//4 seats
	{ 1,  0,  4,  3,  2, -1},//5 seats
	{ 1,  0,  5,  4,  3,  2} //6 seats
};


new const colors[MAX_CHIP_DIGITS] =
{
	0xFF0080C0,//1
	0xFF008000,//10
	0xFF324A4E,//100
	0xFF7C4303,//1,000
	0xFF63720E,//10,000
	0xFFE2C241,//100,000
	0xFFE4603F//1,000,000
	//0xFFCD270A, //100,000,000
	//0xFFFF2424, //1,000,000,000
	//0xFFFF2424, //10,000,000,000

};

new const chip_text[MAX_CHIP_DIGITS][8] =
{
	{"$1"},
	{"$10"},
	{"$100"},
	{"$1K"},
	{"$10K"},
	{"$100K"},
	{"$1M"}
	//{"$10M"},
	//{"$100M"},
	//{"$1,000M"}
};
/*============*/

enum E_TABLE_ROUNDS
{
	ROUND_PRE_FLOP, //no community cards displayed yet
	ROUND_FLOP,
	ROUND_TURN, //4th com card is shown
	ROUND_RIVER //5th community card is shown
};

enum e_TABLE
{
	E_TABLE_BUY_IN,
	E_TABLE_SMALL_BLIND,
	E_TABLE_BIG_BLIND,
	E_TABLE_LAST_TO_RAISE,
	E_TABLE_LAST_TO_RAISE_SEAT,
	E_TABLE_CURRENT_TURN,
	E_TABLE_LAST_BET,
	E_TABLE_STATES:E_TABLE_CURRENT_STATE,
	E_TABLE_PLAYER_DEALER_ID,
	E_TABLE_PLAYER_BIG_BLIND_ID,
	E_TABLE_PLAYER_SMALL_BLIND_ID,
	bool:E_TABLE_CHECK_FIRST,
	E_TABLE_FIRST_TURN,
	//============SIDEPOTS===================
	E_TABLE_POT_CHIPS[T_MAX_CHAIRS_PER_TABLE],

	//=======================================
	bool: E_TABLE_TIMER_STARTED,
	E_TABLE_OBJECT_IDS[2], //Two objects (models 2111 and 2189)
	Float:E_TABLE_POS_X,
	Float:E_TABLE_POS_Y,
	Float:E_TABLE_POS_Z,
	E_TABLE_ROUNDS: E_TABLE_CURRENT_ROUND,
	E_TABLE_DEALER_SEAT,
	E_TABLE_TOTAL_SEATS,
	E_TABLE_TIMER_ID,
	bool: E_TABLE_LOADING_GAME,
	bool: E_TABLE_STING_NEW_GAME,
	E_TABLE_COM_CARDS_VALUES[5],
	Text3D:E_TABLE_POT_LABEL,
	E_TABLE_VIRTUAL_WORLD,
	E_TABLE_INTERIOR,

	Text3D:E_TABLE_BET_LABELS[T_MAX_CHAIRS_PER_TABLE],
	E_TABLE_CHAIR_OBJECT_IDS[T_MAX_CHAIRS_PER_TABLE],
	bool:E_TABLE_IS_SEAT_TAKEN[T_MAX_CHAIRS_PER_TABLE],
	E_TABLE_CHAIR_PLAYER_ID[T_MAX_CHAIRS_PER_TABLE],
	Float:E_TABLE_SEAT_POS_X[T_MAX_CHAIRS_PER_TABLE],
	Float:E_TABLE_SEAT_POS_Y[T_MAX_CHAIRS_PER_TABLE],
	Float:E_TABLE_SEAT_POS_Z[T_MAX_CHAIRS_PER_TABLE],

	E_TABLE_CHIPS[MAX_CHIP_DIGITS],
	E_TABLE_CHIPS_LABEL[MAX_CHIP_DIGITS]
};
new TableData[T_MAX_POKER_TABLES + 1][e_TABLE];
new TableChips[T_MAX_POKER_TABLES + 1][T_MAX_CHAIRS_PER_TABLE][MAX_CHIP_DIGITS];
new TableChipsLabel[T_MAX_POKER_TABLES + 1][T_MAX_CHAIRS_PER_TABLE][MAX_CHIP_DIGITS];

#define SetTableFirstTurn(%0,%1)		TableData[(%0)][E_TABLE_FIRST_TURN]=%1
#define GetTableFirstTurn(%0)			(TableData[(%0)][E_TABLE_FIRST_TURN])
#define GetPlayerSeat(%0)				(PlayerData[(%0)][E_PLAYER_CURRENT_CHAIR_SLOT])
enum E_RAISE_CHOICES
{
	E_RAISE_BET,
	E_RAISE_RAISE,
	E_RAISE_ALL_IN
};
enum e_PLAYER
{
	bool: E_PLAYER_IS_PLAYING,
	E_PLAYER_CURRENT_HANDLE,
	E_PLAYER_CURRENT_BET,
	E_PLAYER_CARD_VALUES[2],
	E_PLAYER_TOTAL_CHIPS,
	bool: E_PLAYER_CLICKED_TXT,
	E_PLAYER_TIMER_ID,
	bool:E_PLAYER_TIMER_STARTED,
	bool:E_PLAYER_FOLDED,
	//Textdraws
	E_RAISE_CHOICES: E_PLAYER_RCHOICE,
	PlayerText: E_PLAYER_COMMUNITY_CARDS_TXT[5], //5 cards
	PlayerText: E_PLAYER_CARDS_TXT_1[T_MAX_CHAIRS_PER_TABLE],
	PlayerText: E_PLAYER_CARDS_TXT_2[T_MAX_CHAIRS_PER_TABLE],
	PlayerText: E_PLAYER_CHOICES_TXT[5],
	PlayerText: E_PLAYER_INFO_TXT[6],
	Text3D:E_PLAYER_3D_LABEL,
	/*******/
	E_PLAYER_CURRENT_CHAIR_SLOT,
	E_PLAYER_CHAIR_ATTACH_INDEX_ID
};

new PlayerData[MAX_PLAYERS + 1][e_PLAYER];



stock SetPlayerClickedTxt(playerid, bool:choice)
{
	PlayerData[playerid][E_PLAYER_CLICKED_TXT] = choice;
	return 1;
}
#define GetPlayerClickedTxt(%0)		(PlayerData[(%0)][E_PLAYER_CLICKED_TXT])


forward Poker_StartGame(handle, dealer);

stock SetLastToRaise(handle, playerid)
{
	if(!IsValidTable(handle))
	{
		return 0;
	}
	if(!Iter_Contains(IT_PlayersInGame<handle>, playerid))
	{
		T_SendWarning("[SetLastToRaise] playerid %d is not playing in table ID %d", playerid, handle);
		return 0;
	}
	TableData[handle][E_TABLE_LAST_TO_RAISE] = playerid;
	TableData[handle][E_TABLE_LAST_TO_RAISE_SEAT] = GetPlayerSeat(playerid);
	return 1;
}

stock ResetLabel(handle)
{
	if(!IsValidTable(handle)) return 0;
	new const buy_in = TableData[handle][E_TABLE_BUY_IN];
	new const small_blind = TableData[handle][E_TABLE_SMALL_BLIND];
	UpdateDynamic3DTextLabelTextEx(TableData[handle][E_TABLE_POT_LABEL], COLOR_GREY,
		"Press ENTER To Play Poker\n{FFFFFF}%s Minimum\n%s / %s Blinds", cash_format(buy_in), cash_format(small_blind), cash_format(small_blind * 2));
	return 1;
}

stock GetClosestTableForPlayer(playerid)
{
	new const Float:infinity = Float:0x7F800000;
	new Float:tmpdist = infinity;
	new Float:Pos[3];
	new handle = ITER_NONE;
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	foreach(new i: IT_Tables)
	{
		new const Float:dist = VectorSize(Pos[0]-TableData[i][E_TABLE_POS_X], Pos[1]-TableData[i][E_TABLE_POS_Y], Pos[2]-TableData[i][E_TABLE_POS_Z]);
		if(dist < tmpdist)
		{
			tmpdist = dist;
			handle = i;
		}
	}
	return handle;
}

stock bool:IsPlayerInRangeOfTable(playerid, handle, Float:range)
{
	if(!IsValidTable(handle)) return false;
	if(IsPlayerInRangeOfPoint(playerid, range, TableData[handle][E_TABLE_POS_X], TableData[handle][E_TABLE_POS_Y], TableData[handle][E_TABLE_POS_Z])) return true;
	return false;
}


/******************************************************************************************
	Actual functions
*******************************************************************************************/

stock CreatePokerTable(buy_in, small_blind, Float: X, Float: Y, Float: Z, seats, vworld, interior)
{
	new handle = Iter_Free(IT_Tables);

	if(handle == ITER_NONE)
	{
        static overflow;
        printf("[POKER ERROR] Reached limit of %d blackjack tables, increase to %d to fix.", T_MAX_POKER_TABLES, T_MAX_POKER_TABLES + ( ++ overflow ) );
		return ITER_NONE;
	}
	if(seats >= T_MAX_CHAIRS_PER_TABLE)
	{
		T_SendWarning("Max number of chairs per table has been reached. Increase T_MAX_CHAIRS_PER_TABLE.");
		return ITER_NONE;
	}
	if(buy_in <= small_blind || buy_in <= 2 * small_blind)
	{
		T_SendWarning("Buy in cannot be less than the small blind or big blind.");
		return ITER_NONE;
	}
	//TableData[T_MAX_POKER_TABLES] (dummy array)
	memcpy(TableData[handle], TableData[T_MAX_POKER_TABLES], 0, sizeof(TableData[]) * 4, sizeof(TableData[]));


	TableData[handle][E_TABLE_BUY_IN] = buy_in;
	TableData[handle][E_TABLE_SMALL_BLIND] = small_blind;
	TableData[handle][E_TABLE_BIG_BLIND] = small_blind * 2;
	TableData[handle][E_TABLE_TOTAL_SEATS] = seats;
	TableData[handle][E_TABLE_VIRTUAL_WORLD] = vworld;
	TableData[handle][E_TABLE_INTERIOR] = interior;

	/* Positions */
	TableData[handle][E_TABLE_POS_X] = X;
	TableData[handle][E_TABLE_POS_Y] = Y;
	TableData[handle][E_TABLE_POS_Z] = Z;

	/* Objects */

	//Table
	TableData[handle][E_TABLE_OBJECT_IDS][0] = CreateDynamicObject(2189, X, Y, Z + T_Z_OFFSET - 0.01, 0.0, 0.0, 0.0, vworld, interior, .priority = 9999);
	TableData[handle][E_TABLE_OBJECT_IDS][1] = CreateDynamicObject(2111, X, Y, Z-0.01, 0.0, 0.0, 0.0, vworld, interior, .priority = 9999);

	//Textures
	if(buy_in >= 10000000) SetDynamicObjectMaterial(TableData[handle][E_TABLE_OBJECT_IDS][0], 0, 2189, "poker_tbl", "roulette_6_256", -52310);
	else if (buy_in >= 1000000) SetDynamicObjectMaterial(TableData[handle][E_TABLE_OBJECT_IDS][0], 0, 2189, "poker_tbl", "roulette_6_256", -16737793);
	else if (buy_in >= 100000) SetDynamicObjectMaterial(TableData[handle][E_TABLE_OBJECT_IDS][0], 0, 2189, "poker_tbl", "roulette_6_256", -65485);

	//Chairs
	TableData[handle][E_TABLE_POT_LABEL] = CreateDynamic3DTextLabel("-", -1, X+T_CHIP_OFFSET, Y+T_CHIP_OFFSET, Z+0.5, 10.0, .worldid = vworld, .interiorid = interior);

	new Float:angle_step = floatdiv(360.0, float(seats));
	for(new i = 0; i < seats; i++)
	{
		new const Float:unit_posx = floatcos(float(i) * angle_step, degrees);
		new const Float:unit_posy = floatsin(float(i) * angle_step, degrees);
		new const Float:o_posx = unit_posx * T_CHAIR_RANGE + X;
		new const Float:o_posy = unit_posy * T_CHAIR_RANGE + Y;
		new const Float:c_posz = Z + 0.36;
		TableData[handle][E_TABLE_CHAIR_OBJECT_IDS][i] = CreateDynamicObject(T_CHAIR_MODEL, o_posx, o_posy, Z + 0.25, 0.0, 0.0, angle_step * float(i), vworld, interior, .priority = 9999);
		TableData[handle][E_TABLE_SEAT_POS_X][i] = o_posx;
		TableData[handle][E_TABLE_SEAT_POS_Y][i] = o_posy;
		TableData[handle][E_TABLE_SEAT_POS_Z][i] = Z;
		//Currently invisible
		TableData[handle][E_TABLE_BET_LABELS][i] = CreateDynamic3DTextLabel("$9", T_BET_LABEL_COLOR & ~0xFF,  0.65 * floatcos(float(i) * angle_step, degrees) + X, 0.65 * floatsin(float(i) * angle_step, degrees) + Y,  c_posz, 3.0 , .worldid = vworld, .interiorid = interior);

		CreateChips(handle, i);
	}
	new const Float: or_z = Z + 0.284; //No chips are visible
	new Float: a_s = floatdiv(360.0, float(MAX_CHIP_DIGITS));
	//center chips
	for(new j = 0; j < MAX_CHIP_DIGITS; j++)
	{
		new Float:rad = 0.11;
		new rand = random(20);
		new Float:px = rad * floatcos(float(j) * a_s, degrees) + X + T_CHIP_OFFSET;
		new Float:py = rad * floatsin(float(j) * a_s, degrees) + Y + T_CHIP_OFFSET;
		TableData[handle][E_TABLE_CHIPS][j] = CreateDynamicObject(1902, px, py, or_z + float(rand) * 0.008, 0.0, 0.0, 0.0, vworld, interior, .priority = 9999);
		SetDynamicObjectMaterialText(TableData[handle][E_TABLE_CHIPS][j], 0, " ", .backcolor = colors[j]);
		TableData[handle][E_TABLE_CHIPS_LABEL][j] = CreateDynamicObject(1905, px, py, or_z + float(rand) * 0.008 + 0.1 + 0.025, 0.0, 0.0, 0.0, vworld, interior, .priority = 9999);
		SetDynamicObjectMaterialText(TableData[handle][E_TABLE_CHIPS_LABEL][j],
		0, chip_text[j], 50, "Arial", 44, 1, colors[j], -1, 1 );
	}
	TableData[handle][E_TABLE_CURRENT_STATE] = STATE_IDLE;
	Iter_Clear(IT_TableCardSet[handle]);

	for(new i = 0; i < 52; i++)
		Iter_Add(IT_TableCardSet[handle], i);

	/* Sidepots */
	Iter_Clear(IT_Sidepots[handle]);

	for(new i = 0; i < T_MAX_CHAIRS_PER_TABLE; i++)
	{
		TableData[handle][E_TABLE_POT_CHIPS][i] = 0;
		Iter_Clear(It_SidepotMembers[_IT[handle][i]]);
	}
	/*=================================================*/
	Iter_Add(IT_Tables, handle);
	ResetLabel(handle);
	ResetChips(handle);

	foreach(new i: Player)
	{
		if(IsPlayerInRangeOfPoint(i, 35.0, X, Y, Z))
		{
			Streamer_Update(i);
		}
	}
	return handle;
}


stock SetPotChipsValue(handle, value)
{
	new
		dec_pos = 0,
		Float: base_z = TableData[handle][E_TABLE_POS_Z] + 0.284
	;
	for(new j = 0; j < MAX_CHIP_DIGITS; j++)
	{
		new Float:c_x, Float:c_y, Float:c_z;
		new objectid = TableData[handle][E_TABLE_CHIPS][j];
		GetDynamicObjectPos(objectid, c_x, c_y, c_z);
		SetDynamicObjectPos(objectid, c_x, c_y, base_z);
		SetDynamicObjectPos(TableData[handle][E_TABLE_CHIPS_LABEL][j], c_x, c_y, base_z + 0.12);
	}
	for(new val = value; val != 0; val /= 10)
	{
		if(dec_pos >= MAX_CHIP_DIGITS) break;
		new const digit = val % 10;
		if(!digit)
		{
			dec_pos++;
			continue;
		}
		new Float:c_x, Float:c_y, Float:c_z;
		//Chip object
		new objectid = TableData[handle][E_TABLE_CHIPS][dec_pos];
		GetDynamicObjectPos(objectid, c_x, c_y, c_z);
		SetDynamicObjectPos(objectid, c_x, c_y, base_z + 0.016 * (float(digit)));
		//Chip label:
		SetDynamicObjectPos(TableData[handle][E_TABLE_CHIPS_LABEL][dec_pos], c_x, c_y, 0.125 + base_z + 0.016 * (float(digit)));
		dec_pos++;
	}
	return 1;
}

stock CreateChips(handle, i)
{
	new Float:angle_step = floatdiv(360.0, float(TableData[handle][E_TABLE_TOTAL_SEATS]));
	new const Float:c_posz = TableData[handle][E_TABLE_POS_Z] + 0.36;

	new const Float: or_x = 0.70 * floatcos(float(i) * angle_step, degrees) + TableData[handle][E_TABLE_POS_X];
	new const Float: or_y = 0.70 * floatsin(float(i) * angle_step, degrees) + TableData[handle][E_TABLE_POS_Y];
	new const Float: or_z = c_posz - 0.076;

	new Float: a_s = floatdiv(360.0, float(MAX_CHIP_DIGITS));

	for(new j = 0; j < MAX_CHIP_DIGITS; j++)
	{
		new Float:rad = 0.11;
		new rand = random(20);
		TableChips[handle][i][j] = CreateDynamicObject(1902, rad * floatcos(float(j) * a_s, degrees) + or_x , rad * floatsin(float(j)* a_s, degrees) + or_y, or_z + float(rand) * 0.008, 0.0, 0.0, 0.0, TableData[handle][E_TABLE_VIRTUAL_WORLD], TableData[handle][E_TABLE_INTERIOR], .priority = 9999);
		SetDynamicObjectMaterialText(TableChips[handle][i][j], 0, " ", .backcolor = colors[j]);
		TableChipsLabel[handle][i][j] = CreateDynamicObject(1905, rad * floatcos(float(j) * a_s, degrees) + or_x , rad * floatsin(float(j)* a_s, degrees) + or_y, or_z + float(rand) * 0.008 + 0.1 + 0.025, 0.0, 0.0, 0.0, TableData[handle][E_TABLE_VIRTUAL_WORLD], TableData[handle][E_TABLE_INTERIOR], .priority = 9999);
		SetDynamicObjectMaterialText(TableChipsLabel[handle][i][j], 0, chip_text[j], 50, "Arial", 44, 1, colors[j], -1, 1 );
	}

	// update users within premise
	foreach(new playerid: Player) if(IsPlayerInRangeOfPoint(playerid, 35.0, TableData[handle][E_TABLE_POS_X], TableData[handle][E_TABLE_POS_Y], TableData[handle][E_TABLE_POS_Z])) {
		Streamer_Update(playerid);
	}
	return 1;
}

stock ResetChips(handle)
{
	new
		Float: base_z = TableData[handle][E_TABLE_POS_Z] + 0.284
	;
	new seats = TableData[handle][E_TABLE_TOTAL_SEATS];
	for(new i = 0; i < seats; i++) {
		for(new j = 0; j < MAX_CHIP_DIGITS; j++) {
			DestroyDynamicObject(TableChips[handle][i][j]), TableChips[handle][i][j] = -1;
			DestroyDynamicObject(TableChipsLabel[handle][i][j]), TableChipsLabel[handle][i][j] = -1;
		}
	}
	/*for(new i = 0; i < seats; i++)
	{
		for(new j = 0; j < MAX_CHIP_DIGITS; j++)
		{
			new rand = random(20);
			new Float:c_x, Float:c_y, Float:c_z;
			new objectid = TableChips[handle][i][j];
			GetDynamicObjectPos(objectid, c_x, c_y, c_z);
			SetDynamicObjectPos(objectid, c_x, c_y, (float(rand) * 0.008) + base_z);
			SetDynamicObjectPos(TableChipsLabel[handle][i][j], c_x, c_y, (float(rand) * 0.008) + base_z + 0.125);
		}
	}*/
	for(new j = 0; j < MAX_CHIP_DIGITS; j++)
	{
		new rand = random(20);
		new Float:c_x, Float:c_y, Float:c_z;
		new objectid = TableData[handle][E_TABLE_CHIPS][j];
		GetDynamicObjectPos(objectid, c_x, c_y, c_z);
		SetDynamicObjectPos(objectid, c_x, c_y, (float(rand) * 0.008) + base_z);
		SetDynamicObjectPos(TableData[handle][E_TABLE_CHIPS_LABEL][j], c_x, c_y, (float(rand) * 0.008) + base_z + 0.125);
	}
	return 1;
}
stock SetChipsValue(handle, seat, value)
{
	new
		dec_pos = 0,
		Float: base_z = TableData[handle][E_TABLE_POS_Z] + 0.284
	;
	if (!IsValidDynamicObject(TableChips[handle][seat][0])) CreateChips(handle, seat);
	for(new j = 0; j < MAX_CHIP_DIGITS; j++)
	{
		new Float:c_x, Float:c_y, Float:c_z;
		new objectid = TableChips[handle][seat][j];
		GetDynamicObjectPos(objectid, c_x, c_y, c_z);
		SetDynamicObjectPos(objectid, c_x, c_y, base_z);
		SetDynamicObjectPos(TableChipsLabel[handle][seat][j], c_x, c_y, base_z + 0.12);
	}
	for(new val = value; val != 0; val /= 10)
	{
		if(dec_pos >= MAX_CHIP_DIGITS) break;
		new const digit = val % 10;
		if(!digit)
		{
			dec_pos++;
			continue;
		}
		new Float:c_x, Float:c_y, Float:c_z;
		//Chip object
		new objectid = TableChips[handle][seat][dec_pos];
		GetDynamicObjectPos(objectid, c_x, c_y, c_z);
		SetDynamicObjectPos(objectid, c_x, c_y, base_z + 0.016 * (float(digit)));
		//Chip label:
		SetDynamicObjectPos(TableChipsLabel[handle][seat][dec_pos], c_x, c_y, 0.125 + base_z + 0.016 * (float(digit)));
		dec_pos++;
	}
	return 1;
}

stock DestroyPokertable( handle)
{
	if(!Iter_Contains(IT_Tables, handle)) return 0;

	if(Iter_Count(IT_PlayersTable<handle>))
	{
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(Iter_Contains(IT_PlayersTable<handle>, i))
			{
				KickPlayerFromTable(i);
			}
		}
	}
	TableData[handle][E_TABLE_BUY_IN] = 0;
	TableData[handle][E_TABLE_SMALL_BLIND] = 0;
	TableData[handle][E_TABLE_BIG_BLIND] = 0;

	DestroyDynamicObject(TableData[handle][E_TABLE_OBJECT_IDS][0]);
	TableData[handle][E_TABLE_OBJECT_IDS][0] = INVALID_OBJECT_ID;

	DestroyDynamicObject(TableData[handle][E_TABLE_OBJECT_IDS][1]);
	TableData[handle][E_TABLE_OBJECT_IDS][1] = INVALID_OBJECT_ID;

	KillTimer(TableData[handle][E_TABLE_TIMER_ID]);
	TableData[handle][E_TABLE_TIMER_ID] = 0;

	DestroyDynamic3DTextLabel(TableData[handle][E_TABLE_POT_LABEL]);
	for(new i = 0; i < TableData[handle][E_TABLE_TOTAL_SEATS]; i++)
	{
		DestroyDynamicObject(TableData[handle][E_TABLE_CHAIR_OBJECT_IDS][i]);
		TableData[handle][E_TABLE_CHAIR_OBJECT_IDS][i] = INVALID_OBJECT_ID;
		TableData[handle][E_TABLE_SEAT_POS_X][i] = 0.0;
		TableData[handle][E_TABLE_SEAT_POS_Y][i] = 0.0;
		TableData[handle][E_TABLE_SEAT_POS_Z][i] = 0.0;
		for(new j = 0; j < MAX_CHIP_DIGITS; j++)
		{
			DestroyDynamicObject(TableChips[handle][i][j]), TableChips[handle][i][j] = -1;
			DestroyDynamicObject(TableChipsLabel[handle][i][j]), TableChipsLabel[handle][i][j] = -1;
		}
	}
	for(new j = 0; j < MAX_CHIP_DIGITS; j++)
	{
		DestroyDynamicObject(TableData[handle][E_TABLE_CHIPS][j]);
		DestroyDynamicObject(TableData[handle][E_TABLE_CHIPS_LABEL][j]);
	}
	TableData[handle][E_TABLE_TOTAL_SEATS] = 0;
	Iter_Remove(IT_Tables, handle);
	Iter_Clear(IT_TableCardSet[handle]);
	Iter_Clear(IT_PlayersInGame<handle>);
	Iter_Clear(IT_PlayersTable<handle>);
	return 1;
}



stock KickPlayerFromTable(playerid)
{
	if(!GetPVarInt(playerid, "t_is_in_table")) return 0;
	new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
	if(!Iter_Contains(IT_PlayersTable<handle>, playerid)) return 0;
	new slot = PlayerData[playerid][E_PLAYER_CURRENT_CHAIR_SLOT];
	new attach_index = PlayerData[playerid][E_PLAYER_CHAIR_ATTACH_INDEX_ID];
	RemovePlayerAttachedObject(playerid, attach_index);
	ClearAnimations(playerid, 1);
	TogglePlayerControllable(playerid, true);
	new const Float:angle_step = floatdiv(360.0, TableData[handle][E_TABLE_TOTAL_SEATS]);
	//Create the chair object again:
	TableData[handle][E_TABLE_CHAIR_OBJECT_IDS][slot] = CreateDynamicObject(T_CHAIR_MODEL, TableData[handle][E_TABLE_SEAT_POS_X][slot], TableData[handle][E_TABLE_SEAT_POS_Y][slot], TableData[handle][E_TABLE_SEAT_POS_Z][slot], 0.0, 0.0, angle_step * float(slot), TableData[handle][E_TABLE_VIRTUAL_WORLD], TableData[handle][E_TABLE_INTERIOR], .priority = 9999);
	Internal_RemoveChairSlot(handle, slot);
	Iter_Remove(IT_PlayersTable<handle>, playerid);
	if(Iter_Contains(IT_PlayersInGame<handle>, playerid)) Iter_Remove(IT_PlayersInGame<handle>, playerid);
	SetPlayerPos(playerid, TableData[handle][E_TABLE_SEAT_POS_X][slot], TableData[handle][E_TABLE_SEAT_POS_Y][slot], TableData[handle][E_TABLE_SEAT_POS_Z][slot]);
	SetCameraBehindPlayer(playerid);

	// remove player chips
	for(new j = 0; j < MAX_CHIP_DIGITS; j++) {
		DestroyDynamicObject(TableChips[handle][slot][j]), TableChips[handle][slot][j] = -1;
		DestroyDynamicObject(TableChipsLabel[handle][slot][j]), TableChipsLabel[handle][slot][j] = -1;
	}

	// hide textdraws
	for(new i = 0; i < TableData[handle][E_TABLE_TOTAL_SEATS]; i++)
	{
		PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i]);
		PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i]);
		PlayerTextDrawDestroy(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i]);
		PlayerTextDrawDestroy(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i]);
	}
	for(new i = 0; i < 5; i++){
		PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_COMMUNITY_CARDS_TXT][i]);
		PlayerTextDrawDestroy(playerid, PlayerData[playerid][E_PLAYER_COMMUNITY_CARDS_TXT][i]);
		PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][i]);
		PlayerTextDrawDestroy(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][i]);
	}
	for(new i = 0; i < 6; i++){
		PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][i]);
		PlayerTextDrawDestroy(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][i]);
	}
	DestroyDynamic3DTextLabel(PlayerData[playerid][E_PLAYER_3D_LABEL]);

	UpdateDynamic3DTextLabelText(TableData[handle][E_TABLE_BET_LABELS][slot], 0, " ");

	GivePlayerMoneyEx(playerid, PlayerData[playerid][E_PLAYER_TOTAL_CHIPS]);


	if(PlayerData[playerid][E_PLAYER_TIMER_STARTED])
	{
		KillTimer(PlayerData[playerid][E_PLAYER_TIMER_ID]);
	}
	memcpy(PlayerData[playerid], PlayerData[MAX_PLAYERS], 0, sizeof(PlayerData[]) * 4, sizeof(PlayerData[]));
	#if T_SAVE_PLAYER_POS == true
	SetPlayerPos(playerid, GetPVarFloat(playerid, "t_temp_posX"), GetPVarFloat(playerid, "t_temp_posY"), GetPVarFloat(playerid, "t_temp_posZ"));
	SetPlayerFacingAngle(playerid, GetPVarFloat(playerid, "t_temp_angle"));
	#endif
	SetPVarInt(playerid, "t_is_in_table", 0);
	new Float:X, Float:Y, Float:Z;
	X = TableData[handle][E_TABLE_POS_X];
	Y = TableData[handle][E_TABLE_POS_Y];
	Z = TableData[handle][E_TABLE_POS_Z];
	foreach(new i: Player)
	{
		if(IsPlayerInRangeOfPoint(i, 35.0, X, Y, Z))
		{
			Streamer_Update(i);
		}
	}
	if(!Iter_Count(IT_PlayersTable<handle>))
	{
		ResetLabel(handle);
		ResetChips(handle);
	}
	return 1;
}

stock Player_CreateTextdraws(playerid)
{
	new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
	new Float:px;
	new Float:py;
	new Float:t_angle = 0.0;

	new const seats = TableData[handle][E_TABLE_TOTAL_SEATS];
	switch(seats)
	{
		case 2: t_angle = 120.0;
		case 3: t_angle = 180.0;
		case 4: t_angle = 210.0;
		case 5: t_angle = 240.0;
		case 6: t_angle = 240.0;
	}
	//Hole cards
	new const Float:angle_step = floatdiv(360.0, float(seats));
	for(new i = 0; i < TableData[handle][E_TABLE_TOTAL_SEATS]; i++)
	{
		px = (T_CARDS_RADIAL_DISTANCE * floatcos(float(i) * angle_step + t_angle, degrees)) + T_SCREEN_CENTER_X;
		py = (T_CARDS_RADIAL_DISTANCE * floatsin(float(i) * angle_step + t_angle, degrees)) + T_SCREEN_CENTER_Y + 25.0;

		PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i] = CreatePlayerTextDraw(playerid, px, py, "LD_POKE:cdback");
		PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i], T_CARD_X_SIZE, T_CARD_Y_SIZE);
		PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i], 2);
		PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i], 4);


		PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i] = CreatePlayerTextDraw(playerid, px + T_TWO_CARD_DISTANCE, py, "LD_POKE:cdback");
		PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i], T_CARD_X_SIZE, T_CARD_Y_SIZE);
		PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i], 2);
		PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i], 4);
	}
	//Community cards
	for(new i = 0; i < 5; i++)
	{
		px = i * T_TWO_CARD_DISTANCE + T_SCREEN_CENTER_X - 58.0;
		py = T_SCREEN_CENTER_Y + 10.0;
		PlayerData[playerid][E_PLAYER_COMMUNITY_CARDS_TXT][i] = CreatePlayerTextDraw(playerid, px, py, "LD_POKE:cdback");
		PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_COMMUNITY_CARDS_TXT][i], T_CARD_X_SIZE, T_CARD_Y_SIZE);
		PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_COMMUNITY_CARDS_TXT][i], 2);
		PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_COMMUNITY_CARDS_TXT][i], 4);
	}

	//Buttons

	PlayerData[playerid][E_PLAYER_CHOICES_TXT][0] = CreatePlayerTextDraw(playerid, 613.000122, 109.940643, "box");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 0.000000, 8.599979);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 0.000000, 57.000000);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 2);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], -1);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 1);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 177);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 0);
	PlayerTextDrawSetOutline(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 0);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 169);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 1);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][0], 0);

	PlayerData[playerid][E_PLAYER_CHOICES_TXT][1] = CreatePlayerTextDraw(playerid, 612.000122, 110.770355, "Options");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 0.182333, 1.039999);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 0.000000, 53.000000);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 2);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], -1);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 1);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], -1061109505);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 0);
	PlayerTextDrawSetOutline(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 1);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][1], 0);

	PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL] = CreatePlayerTextDraw(playerid, 615.999755, 131.511154, "Call");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 0.182333, 1.039999);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 10.000000, 49.000000);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 2);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], -1);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 1);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], -2139094785);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 0);
	PlayerTextDrawSetOutline(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 1);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], 0);
	//PlayerTextDrawSetSelectable(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], true);

	PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE] = CreatePlayerTextDraw(playerid, 615.999755, 148.518554, "Raise");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 0.182333, 1.039999);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 10.000000, 49.000000);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 2);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], -1);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 1);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], -1378294017);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 0);
	PlayerTextDrawSetOutline(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 1);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], 0);
	PlayerTextDrawSetSelectable(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], true);

	PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD] = CreatePlayerTextDraw(playerid, 615.999755, 165.525954, "Fold");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 0.182333, 1.039999);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 10.000000, 49.000000);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 2);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], -1);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 1);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], -1523963137);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 0);
	PlayerTextDrawSetOutline(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 1);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], 0);
	PlayerTextDrawSetSelectable(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD], true);

	//Info
	PlayerData[playerid][E_PLAYER_INFO_TXT][0] = CreatePlayerTextDraw(playerid, 597.333435, 253.051803, "box");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 0.000000, 7.366664);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 0.000000, 84.000000);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 2);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], -1);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 1);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 193);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][0], 1);

	PlayerData[playerid][E_PLAYER_INFO_TXT][1] = CreatePlayerTextDraw(playerid, 597.999694, 253.466537, "INFORMATION");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 0.265333, 1.093926);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 0.000000, 84.000000);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 2);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], -1);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 1);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], -2139062017);
	PlayerTextDrawSetOutline(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 2);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][1], 1);

	PlayerData[playerid][E_PLAYER_INFO_TXT][2] = CreatePlayerTextDraw(playerid, 559.666687, 268.814849, "Chips:_2934123");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][2], 0.166999, 1.023407);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][2], 1);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][2], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][2], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][2], 1);

	PlayerData[playerid][E_PLAYER_INFO_TXT][3] = CreatePlayerTextDraw(playerid, 559.666687, 279.600128, "Pot:_23124");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][3], 0.166999, 1.023407);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][3], 1);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][3], -1); //10.785279
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][3], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][3], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][3], 1);

	PlayerData[playerid][E_PLAYER_INFO_TXT][4] = CreatePlayerTextDraw(playerid, 559.666687, 290.385407, "Last_bet:_$4213");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][4], 0.166999, 1.023407);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][4], 1);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][4], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][4], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][4], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][4], 1);

	PlayerData[playerid][E_PLAYER_INFO_TXT][5] = CreatePlayerTextDraw(playerid, 559.666687, 301.170686, "Your_bet:_$124");
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][5], 0.166999, 1.023407);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][5], 1);
	PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][5], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][5], 255);
	PlayerTextDrawFont(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][5], 1);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][5], 1);

	return 1;
}

hook OnPlayerConnect(playerid)
{
	for(new i = 0; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
    {
        if(!IsPlayerAttachedObjectSlotUsed(playerid, i)) continue;
        RemovePlayerAttachedObject(playerid, i);
    }
    return 0;
}

stock AddPlayerToTable(playerid, handle)
{
	if(!Iter_Contains(IT_Tables, handle)) return 0;
	if(GetPVarInt(playerid, "t_is_in_table")) return 0;
	new slot = Internal_GetFreeChairSlot(handle);
	if(slot == ITER_NONE)
	{
		SendPokerMessage(playerid, "There aren't currently any unnocupied seats in this table at the moment. You cannot enter it.");
		return 0;
	}

	if(GetPlayerMoneyEx(playerid) < TableData[handle][E_TABLE_BUY_IN]) return SendPokerMessage(playerid, "You don't have enough money to access this table. Buy In: %s", cash_format(TableData[handle][E_TABLE_BUY_IN]));

	new index = Player_GetUnusedAttachIndex(playerid);
	if(index == cellmin)
	{
		SendPokerMessage(playerid, "You cannot access this table in this moment.");
		return 0;
	}
	//Reset player data
	memcpy(PlayerData[playerid], PlayerData[MAX_PLAYERS], 0, sizeof(PlayerData[]) * 4, sizeof(PlayerData[]));


	//Information to set the player's position, angle, etc..
	new Float:Pos[3];
	Pos[0] = TableData[handle][E_TABLE_SEAT_POS_X][slot];
	Pos[1] = TableData[handle][E_TABLE_SEAT_POS_Y][slot];
	Pos[2] = TableData[handle][E_TABLE_SEAT_POS_Z][slot];
	//new const Float:angle_step = floatdiv(360.0, float(TableData[handle][E_TABLE_TOTAL_SEATS]));
	//new Float:facing_angle = (TableData[handle][E_TABLE_TOTAL_SEATS] == 2)  ? (270 - angle_step * float(slot + 1)) : angle_step * float(slot + 1);
	new Float:facing_angle = atan2(TableData[handle][E_TABLE_POS_Y] - Pos[1], TableData[handle][E_TABLE_POS_X] - Pos[0]) - 90.0;
	DestroyDynamicObject(TableData[handle][E_TABLE_CHAIR_OBJECT_IDS][slot]);
	SetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	SetPlayerFacingAngle(playerid, facing_angle);

	SetPlayerAttachedObject(playerid, index, T_CHAIR_MODEL, 7, 0.061999, -0.046, 0.095999, 90.6, -171.8, -10.5, 1.0, 1.0, 1.0);
	SetPlayerCameraPos(playerid, TableData[handle][E_TABLE_POS_X], TableData[handle][E_TABLE_POS_Y], TableData[handle][E_TABLE_POS_Z]+T_Z_CAMERA_OFFSET);
	SetPlayerCameraLookAt(playerid, TableData[handle][E_TABLE_POS_X], TableData[handle][E_TABLE_POS_Y], TableData[handle][E_TABLE_POS_Z]);
	ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Bored_Loop", 4.1, 1, 1, 1, 0, 0, 1);
	new tstr[64];
	format(tstr, sizeof(tstr), "%s\n* waiting next game *", ReturnPlayerName(playerid));
	PlayerData[playerid][E_PLAYER_3D_LABEL] = CreateDynamic3DTextLabel(tstr, 0x808080FF, Pos[0], Pos[1], Pos[2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1,  5.0);

	//Information that will be used later
	PlayerData[playerid][E_PLAYER_CHAIR_ATTACH_INDEX_ID] = index;
	PlayerData[playerid][E_PLAYER_CURRENT_CHAIR_SLOT] = slot;

	PlayerData[playerid][E_PLAYER_CURRENT_HANDLE] = handle;
	Player_CreateTextdraws(playerid);
	//Iterators
	Internal_AddChairSlot(handle, slot);
	Iter_Add(IT_PlayersTable<handle>, playerid);
	TableData[handle][E_TABLE_CHAIR_PLAYER_ID][slot] = playerid;
	GivePlayerMoneyEx(playerid, -TableData[handle][E_TABLE_BUY_IN]);
	PlayerData[playerid][E_PLAYER_TOTAL_CHIPS] = TableData[handle][E_TABLE_BUY_IN];
	SendPokerMessage(playerid, "You've been charged %s as a result of joining in the table.", cash_format(TableData[handle][E_TABLE_BUY_IN]));
	//Allow players to join a table where a game has already started but there are empty seats remaining (these players will be able to play once the current match finishes)
	if(TableData[handle][E_TABLE_CURRENT_STATE] != STATE_BEGIN)
	{
		if(Iter_Count(IT_PlayersTable<handle>) == 2 && !TableData[handle][E_TABLE_LOADING_GAME]) //Minimum two seats
		{
			if(!TableData[handle][E_TABLE_STING_NEW_GAME])
			{
				SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"There are currently two players in the table.");
				SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Any players interested in being part of this game have "#T_START_DELAY" seconds to join the table.");
				SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"The game will begin in "#T_START_DELAY" seconds...");
				Iter_Clear(IT_PlayersInGame<handle>);
				TableData[handle][E_TABLE_LOADING_GAME] = true;
				SetTimerEx("Poker_StartGame", T_START_DELAY * 1000, false, "ii", handle, INVALID_PLAYER_ID);
			}
		}
	}
	else
	{
		SendPokerMessage(playerid, "You have entered this poker table but the game has already begun.");
		SendPokerMessage(playerid, "You must wait until this match is finished to play!");
		SendTableMessage(handle, "{25728B}- - Player %s has joined the table... - -", ReturnPlayerName(playerid));
	}

	foreach(new i: Player)
	{
		if(IsPlayerInRangeOfPoint(i, 35.0, Pos[0], Pos[1], Pos[2]))
		{
			Streamer_Update(i);
		}
	}

	#if T_SAVE_PLAYER_POS == true

	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	SetPVarFloat(playerid, "t_temp_posX", Pos[0]);
	SetPVarFloat(playerid, "t_temp_posY", Pos[1]);
	SetPVarFloat(playerid, "t_temp_posZ", Pos[2]);
	GetPlayerFacingAngle(playerid, Pos[0]);
	SetPVarFloat(playerid, "t_temp_angle", Pos[0]);
	#endif

	SetPVarInt(playerid, "t_is_in_table", 1);
	return 1;
}

stock SendTableMessage(handle, const format[], va_args<>)
{
	new sstr[164];
	va_format(sstr, sizeof (sstr), format, va_start<2>);
	//strins(sstr, "{cc8e35}-|- {739e82} ", 0);
	foreach(new playerid: IT_PlayersTable<handle>)
	{
		SendClientMessage(playerid, -1, sstr);
		// printf( "[poker_%d] %s", handle, sstr);
	}
	return 1;
}
stock UpdateInfoTextdrawsForPlayer(playerid)
{
	new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
	new tstring[64];
	format(tstring, sizeof(tstring), "~g~Chips:_~w~%s", cash_format(PlayerData[playerid][E_PLAYER_TOTAL_CHIPS]));
	PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][2], tstring);
	format(tstring, sizeof(tstring), "~y~Pot:_~w~%s", cash_format(TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT]));
	PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][3], tstring);
	format(tstring, sizeof(tstring), "~r~Last_bet:_~w~%s", cash_format(TableData[handle][E_TABLE_LAST_BET]));
	PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][4], tstring);
	format(tstring, sizeof(tstring), "~r~Your_bet:_~w~%s", cash_format(PlayerData[playerid][E_PLAYER_CURRENT_BET]));
	PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][5], tstring);
	return 1;
}

public Poker_StartGame(handle, dealer)
{
	TableData[handle][E_TABLE_STING_NEW_GAME] = false;
	if(Iter_Count(IT_PlayersTable<handle>) < 2)
	{
		TableData[handle][E_TABLE_LOADING_GAME] = false;
		return 0;
	}
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(!Iter_Contains(IT_PlayersTable<handle>, i)) continue;
		if(!PlayerData[i][E_PLAYER_TOTAL_CHIPS])
		{
			SendPokerMessage(i, "You don't have any chips left.");
			SendPokerMessage(i, "You may join the table again and pay the buy-in fee to play once again!");
			SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been kicked out of the table. [Reason: Ran out of chips]", ReturnPlayerName(i));
			KickPlayerFromTable(i);
			ShowPlayerDialog(i, -1, DIALOG_STYLE_INPUT, " ", " ", " ", " ");
		}
	}

	if(Iter_Count(IT_PlayersTable<handle>) < 2)
	{
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"There aren't enough players to start a game");
		TableData[handle][E_TABLE_LOADING_GAME] = false;
		return 0;
	}
	for (new i = 0; i < 5; i ++) {
		TableData[handle][E_TABLE_COM_CARDS_VALUES][i] = ITER_NONE;
	}
	TableData[handle][E_TABLE_LOADING_GAME] = true;
	//Add these two players to (currently playing iterator)
	Iter_Clear(IT_PlayersInGame<handle>);
	Iter_Clear(IT_PlayersAllIn<handle>);
	foreach(new i: IT_PlayersTable<handle>)
	{
		Player_Clearchat(i);
		Iter_Add(IT_PlayersInGame<handle>, i);
		PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
		PlayerData[i][E_PLAYER_IS_PLAYING] = true;
		ApplyAnimation(i, "INT_OFFICE", "OFF_Sit_Bored_Loop", 4.1, 1, 1, 1, 0, 0, 1);

	}
	TableData[handle][E_TABLE_CURRENT_STATE] = STATE_BEGIN; //Will prevent players from leaving the table

	foreach(new playerid: IT_PlayersInGame<handle>)
	{
		for(new i = 0; i < TableData[handle][E_TABLE_TOTAL_SEATS]; i++)
		{
			PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i], "LD_POKE:cdback");
			PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i], "LD_POKE:cdback");
			PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i]);
			PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i]);
		}
		for(new i = 0; i < 5; i++){
			PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_COMMUNITY_CARDS_TXT][i]);
		}
		for(new i = 0; i < 5; i++){
			PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][i]);
		}
		for(new i = 0; i < 6; i++){
			PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][i]);
		}
	}

	TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT] = 0;

	dealer = GetTurnAfterDealer(handle);
	//Select BB, SB in terms of a random dealer
	dealer = (dealer == INVALID_PLAYER_ID) ? Iter_Random(IT_PlayersInGame<handle>) : dealer;

	new count = Iter_Count(IT_PlayersInGame<handle>);
	if(count < 2)
	{
		return -1;
	}
	else if(count == 2)
	{
		TableData[handle][E_TABLE_PLAYER_DEALER_ID] = dealer;
		TableData[handle][E_TABLE_DEALER_SEAT] = PlayerData[dealer][E_PLAYER_CURRENT_CHAIR_SLOT];
		TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID] = dealer;
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been chosen to be the dealer and big blind in this first stage of the game!", ReturnPlayerName(dealer));
		UpdateDynamic3DTextLabelTextEx(PlayerData[dealer][E_PLAYER_3D_LABEL], -1, "{7AC72E}%s\n{FD4102}Big Blind + Dealer", ReturnPlayerName(dealer));

		//small blind..
		new next_turn = GetTurnAfterPlayer(handle, dealer);
		UpdateDynamic3DTextLabelTextEx(PlayerData[next_turn][E_PLAYER_3D_LABEL], -1, "{7AC72E}%s\n{FD4102}Small Blind", ReturnPlayerName(next_turn));
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been chosen to be the small blind in this first stage of the game!", ReturnPlayerName(next_turn));
		TableData[handle][E_TABLE_PLAYER_SMALL_BLIND_ID] = next_turn;


	}
	else
	{

		//Dealer
		UpdateDynamic3DTextLabelTextEx(PlayerData[dealer][E_PLAYER_3D_LABEL], -1, "{7AC72E}%s\n{FD4102}Dealer", ReturnPlayerName(dealer));
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been chosen to be the dealer in this first stage of the game!", ReturnPlayerName(dealer));
		TableData[handle][E_TABLE_PLAYER_DEALER_ID] = dealer;
		TableData[handle][E_TABLE_DEALER_SEAT] = PlayerData[dealer][E_PLAYER_CURRENT_CHAIR_SLOT];

		//Big blind
		new next_player = GetTurnAfterPlayer(handle, dealer);
		UpdateDynamic3DTextLabelTextEx(PlayerData[next_player][E_PLAYER_3D_LABEL], -1, "{7AC72E}%s\n{FD4102}Small Blind", ReturnPlayerName(next_player));
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been chosen to be the Small Blind in this first stage of the game!", ReturnPlayerName(next_player));
		TableData[handle][E_TABLE_PLAYER_SMALL_BLIND_ID] = next_player;

		//Small blind
		next_player = GetTurnAfterPlayer(handle, next_player);
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been chosen to be the Big Blind in this first stage of the game!", ReturnPlayerName(next_player));
		UpdateDynamic3DTextLabelTextEx(PlayerData[next_player][E_PLAYER_3D_LABEL], -1, "{7AC72E}%s\n{FD4102}Big Blind", ReturnPlayerName(next_player));
		TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID] = next_player;
	}


	foreach(new playerid: IT_PlayersInGame<handle>) //loop through the players already in the table
	{
		if(playerid != TableData[handle][E_TABLE_PLAYER_DEALER_ID] && playerid != TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID] && playerid != TableData[handle][E_TABLE_PLAYER_SMALL_BLIND_ID])
		{
			UpdateDynamic3DTextLabelTextEx(PlayerData[playerid][E_PLAYER_3D_LABEL], 0x7AC72EFF, "%s", ReturnPlayerName(playerid));
		}
		for(new k = 0; k < 6; k++)
		{
			PlayerTextDrawShow(playerid, PlayerData[playerid][E_PLAYER_INFO_TXT][k]);
		}
		UpdateInfoTextdrawsForPlayer(playerid);
		Streamer_Update(playerid);
	}

	SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Dealer is shuffling the pack of cards. Cards will be handed out in two seconds...!");
	//If everything executes without stop, it wouldn't look that nice for me, so a timer comes handy..
	SetTimerEx("Poker_DealCards", 2000, false, "i", handle);
	return 1;
}


forward Poker_KickPlayers(handle);
public Poker_KickPlayers(handle)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(!Iter_Contains(IT_PlayersTable<handle>, i)) continue;
		if(!PlayerData[i][E_PLAYER_TOTAL_CHIPS])
		{
			if(GetPlayerMoneyEx(i) < TableData[handle][E_TABLE_BUY_IN])
			{
				SendPokerMessage(i, "You don't have any chips left.");
				SendPokerMessage(i, "You may join the table again and pay the buy-in fee to play once again!");
				SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been kicked out of the table. [Reason: Ran out of chips]", ReturnPlayerName(i));
				KickPlayerFromTable(i);
			}
			else
			{
				ShowPlayerDialog(i, DIALOG_BUY_IN, DIALOG_STYLE_MSGBOX, "Buy-In", ""COL_WHITE"You've ran out of chips. Do you want to pay the buy-in fee again to continue playing?", "Yes", "No");
			}
		}
	}
	//Iter_Clear(IT_PlayersInGame<handle>);
	return 1;
}

stock StartNewPokerGame(handle, time)
{
	for (new i = 0; i < 5; i ++) {
		TableData[handle][E_TABLE_COM_CARDS_VALUES][i] = ITER_NONE;
	}

	foreach(new i: IT_PlayersInGame<handle>) {
		HidePlayerChoices(i);
	}

	//This will allow players to leave before the new game begins.
	TableData[handle][E_TABLE_CURRENT_STATE] = STATE_IDLE;
	TableData[handle][E_TABLE_STING_NEW_GAME] = true;

	TableData[handle][E_TABLE_FIRST_TURN] = INVALID_PLAYER_ID;
	TableData[handle][E_TABLE_CHECK_FIRST]  = false;
	TableData[handle][E_TABLE_CURRENT_TURN] = INVALID_PLAYER_ID;
	TableData[handle][E_TABLE_LOADING_GAME] = false;
	ResetLabel(handle);

	Iter_Clear(IT_TableCardSet[handle]);

	for(new i = 0; i < 52; i++)
		Iter_Add(IT_TableCardSet[handle], i);

	//Never change this order
	Iter_Clear(IT_PlayersAllIn<handle>);
	Iter_Clear(IT_Sidepots[handle]);

	SetTimerEx("Poker_KickPlayers", 1000 * (time - 5), false, "i", handle);

	for(new i = 0; i < T_MAX_CHAIRS_PER_TABLE; i++)
	{
		TableData[handle][E_TABLE_POT_CHIPS][i] = 0;
		Iter_Clear(It_SidepotMembers[_IT[handle][i]]);
	}
	Iter_Clear(IT_PlayersInGame<handle>);

	if(Iter_Count(IT_PlayersTable<handle>) >= 2)
	{
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Starting a new game in %d seconds...", time);
		SetTimerEx("Poker_StartGame", 1000 * time, false, "ii", handle, INVALID_PLAYER_ID);
	}
	else
	{
		SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"There are not enough players to start a new game!");
	}
	return 1;
}

stock GetTurnAfterSeat(handle, seat)
{
	seat -= 1;
	new target = INVALID_PLAYER_ID;
	for(new i = 0, j = TableData[handle][E_TABLE_TOTAL_SEATS]; i < j; i++)
	{
		if(seat < 0) seat = TableData[handle][E_TABLE_TOTAL_SEATS] - 1;
		target = TableData[handle][E_TABLE_CHAIR_PLAYER_ID][seat];
		if(Iter_Contains(IT_PlayersInGame<handle>, target) && !Iter_Contains(IT_PlayersAllIn<handle>, target))
		{
			break;
		}
		seat--;
	}
	if(seat < 0 || seat >= T_MAX_CHAIRS_PER_TABLE) return INVALID_PLAYER_ID;
	return target;
}

stock GetTurnAfterDealer(handle)
{
	new seat = TableData[handle][E_TABLE_DEALER_SEAT];
	new target = GetTurnAfterSeat(handle, seat);
	if(target == INVALID_PLAYER_ID)
	{
		printf("Something went wrong while executing GetTurnAfterPlayer");
		return -1;
	}
	return target;
}


stock GetTurnAfterPlayer(handle, playerid)
{
	/*Finds the ID of the player to the left of 'playerid', skips players not currently playing or empty seats.
		The number of iterations it performs is the number of seats in between both players
		Worst case would be the number of seats O(n), n = number of seats, O(1) would be the best case (players next to each other)
	*/
	new slot = PlayerData[playerid][E_PLAYER_CURRENT_CHAIR_SLOT] - 1;
	if(slot < 0) slot = TableData[handle][E_TABLE_TOTAL_SEATS] - 1;
	for(new i = 0, j = TableData[handle][E_TABLE_TOTAL_SEATS]; i < j; i++)
	{
		if(slot < 0) slot = TableData[handle][E_TABLE_TOTAL_SEATS] - 1;
		new const target = TableData[handle][E_TABLE_CHAIR_PLAYER_ID][slot];
		if(Iter_Contains(IT_PlayersInGame<handle>, target) && !Iter_Contains(IT_PlayersAllIn<handle>, target))
		{
			break;
		}
		slot--;
	}
	if(slot < 0 || slot >= T_MAX_CHAIRS_PER_TABLE) return INVALID_PLAYER_ID;
	new target = TableData[handle][E_TABLE_CHAIR_PLAYER_ID][slot];
	if(!Iter_Contains(IT_PlayersInGame<handle>, target)) return INVALID_PLAYER_ID;
	new next_player = INVALID_PLAYER_ID;
	next_player = TableData[handle][E_TABLE_CHAIR_PLAYER_ID][slot];
	return next_player;
}
stock GetTurnAfterPlayerEx(handle, playerid)
{
	/*Finds the ID of the player to the left of 'playerid', skips players not currently playing or empty seats.
		The number of iterations it performs is the number of seats in between both players
		Worst case would be the number of seats O(n), n = number of seats, O(1) would be the best case (players next to each other)
	*/
	new slot = PlayerData[playerid][E_PLAYER_CURRENT_CHAIR_SLOT] - 1;
	if(slot < 0) slot = TableData[handle][E_TABLE_TOTAL_SEATS] - 1;
	for(new i = 0, j = TableData[handle][E_TABLE_TOTAL_SEATS]; i < j; i++)
	{
		if(slot < 0) slot = TableData[handle][E_TABLE_TOTAL_SEATS] - 1;
		new const target = TableData[handle][E_TABLE_CHAIR_PLAYER_ID][slot];
		if(Iter_Contains(IT_PlayersInGame<handle>, target))
		{
			break;
		}
		slot--;
	}
	new next_player = INVALID_PLAYER_ID;
	next_player = TableData[handle][E_TABLE_CHAIR_PLAYER_ID][slot];
	return next_player;
}
stock Internal_GetFreeChairSlot(handle)
{
	//This goes in reverse (left)
	new seats = TableData[handle][E_TABLE_TOTAL_SEATS];
	for(new i = seats; i--; )
	{
		if(!TableData[handle][E_TABLE_IS_SEAT_TAKEN][i])
		{
			return i;
		}
	}
	return ITER_NONE;
}
stock Internal_AddChairSlot(handle, slot)
{
	TableData[handle][E_TABLE_IS_SEAT_TAKEN][slot] = true;
	return 1;
}
stock Internal_RemoveChairSlot(handle, slot)
{
	TableData[handle][E_TABLE_IS_SEAT_TAKEN][slot] = false;
	return 1;
}

stock RemoveChipsFromPlayer( forplayer, amount)
{
	PlayerData[forplayer][E_PLAYER_TOTAL_CHIPS] -= amount;
	return 1;
}

stock AbortGame(handle)
{
	if(TableData[handle][E_TABLE_CURRENT_STATE] != STATE_BEGIN) return 0;
	//Could have used Iter_SafeRemove, prefer not to
	for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
		if(Iter_Contains(IT_PlayersTable<handle>, playerid))
		{
			KickPlayerFromTable(playerid);
		}
		CancelSelectTextDraw(playerid);
	}

	for(new i = 0; i < 5; i++)
	{
		TableData[handle][E_TABLE_COM_CARDS_VALUES][i] = ITER_NONE;
	}
	//This will allow players to leave before the new game begins.
	TableData[handle][E_TABLE_CURRENT_STATE] = STATE_IDLE;
	TableData[handle][E_TABLE_STING_NEW_GAME] = false;

	TableData[handle][E_TABLE_FIRST_TURN] = INVALID_PLAYER_ID;
	TableData[handle][E_TABLE_CHECK_FIRST]  = false;
	TableData[handle][E_TABLE_LOADING_GAME] = false;
	ResetLabel(handle);
	Iter_Clear(IT_TableCardSet[handle]);
	//Never change this order
	Iter_Clear(IT_PlayersAllIn<handle>);
	Iter_Clear(IT_Sidepots[handle]);

	for(new i = 0; i < T_MAX_CHAIRS_PER_TABLE; i++)
	{
		TableData[handle][E_TABLE_POT_CHIPS][i] = 0;
		Iter_Clear(It_SidepotMembers[_IT[handle][i]]);
	}

	for(new i = 0; i < 52; i++)
		Iter_Add(IT_TableCardSet[handle], i);

	TableData[handle][E_TABLE_CURRENT_STATE] = STATE_IDLE;
	return 1;
}

forward Poker_DealCards(handle);
public Poker_DealCards(handle)
{
	foreach(new playerid: IT_PlayersTable<handle>) //loop through the players already in the table
	{
		if(Iter_Contains(IT_PlayersInGame<handle>, playerid))
		{
			new seat = TableRotCorrections[TableData[PlayerData[playerid][E_PLAYER_CURRENT_HANDLE]][E_TABLE_TOTAL_SEATS]][ PlayerData[playerid][E_PLAYER_CURRENT_CHAIR_SLOT]];
			new card1 = Iter_Random(IT_TableCardSet[handle]);
			Iter_Remove(IT_TableCardSet[handle], card1);


			new card2 = Iter_Random(IT_TableCardSet[handle]);
			Iter_Remove(IT_TableCardSet[handle], card2);

			PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][seat], CardData[card1][E_CARD_TEXTDRAW]);
			PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][seat], CardData[card2][E_CARD_TEXTDRAW]);
			PlayerData[playerid][E_PLAYER_CARD_VALUES][0] = card1;
			PlayerData[playerid][E_PLAYER_CARD_VALUES][1] = card2;

			foreach(new p: IT_PlayersInGame<handle>)
			{
				seat = TableRotCorrections[TableData[PlayerData[p][E_PLAYER_CURRENT_HANDLE]][E_TABLE_TOTAL_SEATS]][ PlayerData[p][E_PLAYER_CURRENT_CHAIR_SLOT]];
				PlayerTextDrawShow(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][seat]);
				PlayerTextDrawShow(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][seat]);
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0 );
			}

			PlayerData[playerid][E_PLAYER_CURRENT_BET] = 0;
		}
		else
		{
			for(new i = 0; i < TableData[handle][E_TABLE_TOTAL_SEATS]; i++)
			{
				PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i], "LD_POKE:cdback");
				PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i], "LD_POKE:cdback");
				PlayerTextDrawShow(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_1][i]);
				PlayerTextDrawShow(playerid, PlayerData[playerid][E_PLAYER_CARDS_TXT_2][i]);
			}
		}

	}
	//Set variables

	TableData[handle][E_TABLE_CURRENT_ROUND] = ROUND_PRE_FLOP;




	new big_blind = TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID];
	new small_blind = TableData[handle][E_TABLE_PLAYER_SMALL_BLIND_ID];

	new bool: b_big_blind = (PlayerData[big_blind][E_PLAYER_TOTAL_CHIPS] > TableData[handle][E_TABLE_BIG_BLIND]);
	new bool: b_small_blind = (PlayerData[small_blind][E_PLAYER_TOTAL_CHIPS] > TableData[handle][E_TABLE_SMALL_BLIND]);
	if(b_big_blind && b_small_blind)
	{
		PlayerData[big_blind][E_PLAYER_CURRENT_BET] = TableData[handle][E_TABLE_BIG_BLIND];
		PlayerData[small_blind][E_PLAYER_CURRENT_BET] = TableData[handle][E_TABLE_SMALL_BLIND];
		SendTableMessage(handle, "{2DD9A9} * * %s posts a small blind of %s.. * *", ReturnPlayerName(TableData[handle][E_TABLE_PLAYER_SMALL_BLIND_ID]), cash_format(TableData[handle][E_TABLE_SMALL_BLIND]));
		SendTableMessage(handle, "{2DD9A9}  * * %s posts a big blind of %s.. * *", ReturnPlayerName(TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID]), cash_format(TableData[handle][E_TABLE_BIG_BLIND]));
		new next_turn = GetTurnAfterPlayer(handle, TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID]);
		TableData[handle][E_TABLE_LAST_BET] = TableData[handle][E_TABLE_BIG_BLIND];
		SetLastToRaise(handle, next_turn);
		RemoveChipsFromPlayer( big_blind, TableData[handle][E_TABLE_BIG_BLIND]);
		RemoveChipsFromPlayer( small_blind, TableData[handle][E_TABLE_SMALL_BLIND]);
		TableData[handle][E_TABLE_FIRST_TURN] = next_turn;
		TableData[handle][E_TABLE_CHECK_FIRST] = true;
		SendTurnMessage(handle, next_turn);

		UpdateTable(handle);
	}
	else
	{
		new next_turn = GetTurnAfterPlayer(handle, TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID]);
		SetLastToRaise(handle, next_turn);
		if(!b_small_blind)
		{

			ForcePlayerAllIn(small_blind, handle, false);
		}
		else
		{
			SendTableMessage(handle, "{2DD9A9} * * %s posts a small blind of %s.. * *", ReturnPlayerName(TableData[handle][E_TABLE_PLAYER_SMALL_BLIND_ID]), cash_format(TableData[handle][E_TABLE_SMALL_BLIND]));
			RemoveChipsFromPlayer( small_blind, TableData[handle][E_TABLE_SMALL_BLIND]);
			PlayerData[small_blind][E_PLAYER_CURRENT_BET] = TableData[handle][E_TABLE_SMALL_BLIND];
		}

		if(!b_big_blind)
		{
			TableData[handle][E_TABLE_LAST_TO_RAISE] = big_blind;
			TableData[handle][E_TABLE_LAST_BET] = PlayerData[big_blind][E_PLAYER_TOTAL_CHIPS];
			ForcePlayerAllIn(big_blind, handle, false);

			if(!b_small_blind && GetTurnAfterPlayerEx(handle, next_turn) == small_blind)
			{
				SetLastToRaise(handle, small_blind);
			}
		}
		else
		{

			SendTableMessage(handle, "{2DD9A9}  * * %s posts a big blind of %s.. * *", ReturnPlayerName(TableData[handle][E_TABLE_PLAYER_BIG_BLIND_ID]), cash_format(TableData[handle][E_TABLE_BIG_BLIND]));
			RemoveChipsFromPlayer( big_blind, TableData[handle][E_TABLE_BIG_BLIND]);
			PlayerData[big_blind][E_PLAYER_CURRENT_BET] = TableData[handle][E_TABLE_BIG_BLIND];
			TableData[handle][E_TABLE_LAST_BET] = TableData[handle][E_TABLE_BIG_BLIND];
		}

		if(Iter_Contains(IT_PlayersAllIn<handle>, next_turn))
		{
			CheckPotAndNextTurn(next_turn, handle);
		}
		else
		{
			SendTurnMessage(handle, next_turn);
		}
		UpdateTable(handle);

	}

	return 1;
}



static stock UpdateTable(handle)
{
	foreach(new playerid: IT_PlayersInGame<handle>)
	{
		UpdateInfoTextdrawsForPlayer(playerid);
		new const seat = PlayerData[playerid][E_PLAYER_CURRENT_CHAIR_SLOT];
		new str[128	];
		format(str, sizeof(str), "{34c5db}Chips: {db8d34}%s\n{db3a34}Last bet: {db8d34}%s", cash_format(PlayerData[playerid][E_PLAYER_TOTAL_CHIPS]), cash_format(PlayerData[playerid][E_PLAYER_CURRENT_BET]));
		UpdateDynamic3DTextLabelText(TableData[handle][E_TABLE_BET_LABELS][seat], T_BET_LABEL_COLOR, str);
		SetChipsValue(handle, PlayerData[playerid][E_PLAYER_CURRENT_CHAIR_SLOT], PlayerData[playerid][E_PLAYER_TOTAL_CHIPS]);

	}
	new str[256];
	new tmp[10];
	format(str, sizeof(str), "{59cdff}Main Pot: {ff9059}%s\n", cash_format(TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT]));
	SetPotChipsValue(handle, TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT]);
	if(Iter_Count(IT_Sidepots[handle] > 1))
	{
		strcat(str, "{008000}Side Pot:\n{008080}");
		foreach(new i: IT_Sidepots[handle])
		{
			if(i == MAIN_POT) continue;
			format(tmp, sizeof(tmp), "%s\n", cash_format(TableData[handle][E_TABLE_POT_CHIPS][i]));
			strcat(str, tmp);
		}
	}
	str[strlen(str)-1] = EOS;
	UpdateDynamic3DTextLabelText(TableData[handle][E_TABLE_POT_LABEL], T_BET_LABEL_COLOR, str);

	return 1;
}
static stock ShowChoicesToPlayer(playerid)
{
	new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
	//Call or check
	if(TableData[handle][E_TABLE_LAST_BET] == PlayerData[playerid][E_PLAYER_CURRENT_BET]) //check
	{
		PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], "Check");
	}
	else //call
	{
		PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], "Call");
	}

	//Bet, raise or all in
	if(TableData[handle][E_TABLE_LAST_BET] == 0)
	{
		PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], "Bet");
		PlayerData[playerid][E_PLAYER_RCHOICE] = E_RAISE_BET;
	}
	else if(PlayerData[playerid][E_PLAYER_TOTAL_CHIPS] > TableData[handle][E_TABLE_LAST_BET] + PlayerData[playerid][E_PLAYER_CURRENT_BET])
	{
		PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], "Raise");
		PlayerData[playerid][E_PLAYER_RCHOICE] = E_RAISE_RAISE;
	}
	else //player doesn't have enough money, only option is to go all in
	{
		PlayerTextDrawSetString(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE], "All In");
		PlayerData[playerid][E_PLAYER_RCHOICE] = E_RAISE_ALL_IN;
	}

	if(PlayerData[playerid][E_PLAYER_TOTAL_CHIPS] + PlayerData[playerid][E_PLAYER_CURRENT_BET] <= TableData[handle][E_TABLE_LAST_BET])
	{
		//all in and fold are the only options available
		PlayerTextDrawSetSelectable(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], false);
		PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], COLOR_RED);
	}
	else
	{
		PlayerTextDrawSetSelectable(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], true);
		PlayerTextDrawColor(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL], -1);
	}
	for(new i = 0; i < 5; i++)
	{
		PlayerTextDrawShow(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][i]);
	}


	SelectTextDraw(playerid, 0x00FF00FF);
	return 1;
}

static stock HidePlayerChoices(playerid)
{
	for(new i = 0; i < 5; i++)
	{
		PlayerTextDrawHide(playerid, PlayerData[playerid][E_PLAYER_CHOICES_TXT][i]);
	}
    CancelSelectTextDraw(playerid);
	return 1;
}

static stock SendTurnMessage(handle, playerid)
{
	SetPlayerClickedTxt(playerid, false);
	SendTableMessage(handle, "{008080}It's %s{008080}'s turn...", ReturnPlayerName(playerid));
	SendPokerMessage(playerid, "It's your turn. You have "#T_MAX_WAIT_TIME" seconds to make a decision.");
	TableData[handle][E_TABLE_CURRENT_TURN] = playerid;
	PlayerData[playerid][E_PLAYER_TIMER_STARTED] = true;
	PlayerData[playerid][E_PLAYER_TIMER_ID] = SetTimerEx("Timer_FoldPlayer", T_MAX_WAIT_TIME * 1000, false, "ii", handle, playerid);
	ShowChoicesToPlayer(playerid);
	return 1;
}

stock KillPlayerTurnTimer(playerid, bool: callback = false)
{
	new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
	if(!IsValidTable(handle))
	{
		//T_SendWarning("[KillPlayerTurnTimer] Invalid handle passed (%d) for playerid: %d", handle, playerid);
		return 0;
	}
	if(!Iter_Contains(IT_PlayersInGame<handle>, playerid))
	{
		//T_SendWarning("[KillPlayerTurnTimer] Invalid playerid passed: %d, handle: %d, player is not in the game.", playerid, handle);
		return 0;
	}
	if(!PlayerData[playerid][E_PLAYER_TIMER_STARTED]) return 0;

	PlayerData[playerid][E_PLAYER_TIMER_STARTED] = false;
	if(!callback)
		KillTimer(PlayerData[playerid][E_PLAYER_TIMER_ID]);

	return 1;
}
forward Timer_FoldPlayer(handle, playerid);
public Timer_FoldPlayer(handle, playerid)
{
	if(TableData[handle][E_TABLE_CURRENT_TURN] == playerid && PlayerData[playerid][E_PLAYER_TIMER_STARTED])
	{
		TableData[handle][E_TABLE_CURRENT_TURN] = INVALID_PLAYER_ID;
		HidePlayerChoices(playerid);
		ShowPlayerDialog(playerid, -1, DIALOG_STYLE_INPUT, " ", " ", " ", " ");
		KillPlayerTurnTimer(playerid, true);
		if(!FoldPlayer(handle, playerid))
			CheckPotAndNextTurn(playerid, handle);
	}
	return 1;
}
/*

	GetTurnAfterPlayer(handle, playerid); //Returns the playerid of the next turn (skips players that have gone all in)
	GetTurnAfterPlayerEx(handle, playerid); //Returns the playerid of the next turn (does not skip players that went all in)
*/

forward CheckRounds(handle, bool: start_showdown);
public CheckRounds(handle, bool: start_showdown)
{
	new next_turn = INVALID_PLAYER_ID;
	//we can proceed to another round
	switch(TableData[handle][E_TABLE_CURRENT_ROUND])
	{
		case ROUND_PRE_FLOP:
		{
			//Display 3 cards now
			TableData[handle][E_TABLE_CURRENT_ROUND] = ROUND_FLOP;
			for(new i = 0; i < 3; i++)
			{
				new card = Iter_Random(IT_TableCardSet[handle]);
				Iter_Remove(IT_TableCardSet[handle], card);
				TableData[handle][E_TABLE_COM_CARDS_VALUES][i] = card;
				foreach(new k:  IT_PlayersTable<handle>)
				{
					//for(new j = 0; j < 15; j++) SendTableMessage(k, " ");

					PlayerTextDrawSetString(k, PlayerData[k][E_PLAYER_COMMUNITY_CARDS_TXT][i], CardData[card][E_CARD_TEXTDRAW]);
					PlayerTextDrawShow(k, PlayerData[k][E_PLAYER_COMMUNITY_CARDS_TXT][i]);
					PlayerData[k][E_PLAYER_CURRENT_BET] = 0;
					PlayerPlaySound(k, 1145, 0.0, 0.0, 0.0 );
				}
			}

			SendTableMessage(handle, "{D07035}======================================================================================");
			SendTableMessage(handle, "{D07035}									  The Flop 											");
			SendTableMessage(handle, "{D07035}======================================================================================");
			TableData[handle][E_TABLE_LAST_BET] = 0;

			if(start_showdown)
			{
				SetTimerEx("CheckRounds", 2000, false, "ib", handle, true);
			}
			else
			{
				//Player next to the dealer
				next_turn = GetTurnAfterDealer(handle);
				SetLastToRaise(handle, next_turn);
				//player next to the dealer is the next turn
				SendTurnMessage(handle, next_turn);
			}



		}
		case ROUND_FLOP:
		{
			//Display 1 card
			TableData[handle][E_TABLE_CURRENT_ROUND] = ROUND_TURN;
			new card = Iter_Random(IT_TableCardSet[handle]);
			Iter_Remove(IT_TableCardSet[handle], card);
			TableData[handle][E_TABLE_COM_CARDS_VALUES][3] = card;
			foreach(new k:  IT_PlayersTable<handle>)
			{
				//for(new j = 0; j < 15; j++) SendTableMessage(k, " ");

				PlayerData[k][E_PLAYER_CURRENT_BET] = 0;
				PlayerTextDrawSetString(k, PlayerData[k][E_PLAYER_COMMUNITY_CARDS_TXT][3], CardData[card][E_CARD_TEXTDRAW]);
				PlayerTextDrawShow(k, PlayerData[k][E_PLAYER_COMMUNITY_CARDS_TXT][3]);
				PlayerPlaySound(k, 1145, 0.0, 0.0, 0.0 );
			}
			TableData[handle][E_TABLE_LAST_BET] = 0;

			SendTableMessage(handle, "{D07035}======================================================================================");
			SendTableMessage(handle, "{D07035}									  The Turn 											");
			SendTableMessage(handle, "{D07035}======================================================================================");


			if(start_showdown)
			{
				SetTimerEx("CheckRounds", 2000, false, "ib", handle, true);
			}
			else
			{
				//Player next to the dealer
				next_turn = GetTurnAfterDealer(handle);
				SetLastToRaise(handle, next_turn);
				//player next to the dealer is the next turn
				SendTurnMessage(handle, next_turn);
			}

		}
		case ROUND_TURN:
		{
			//Display 1 more card
			TableData[handle][E_TABLE_CURRENT_ROUND] = ROUND_RIVER;
			new card = Iter_Random(IT_TableCardSet[handle]);
			Iter_Remove(IT_TableCardSet[handle], card);
			TableData[handle][E_TABLE_COM_CARDS_VALUES][4] = card;
			foreach(new k:  IT_PlayersTable<handle>)
			{
				//for(new j = 0; j < 15; j++) SendTableMessage(k, " ");
				PlayerData[k][E_PLAYER_CURRENT_BET] = 0;
				PlayerTextDrawSetString(k, PlayerData[k][E_PLAYER_COMMUNITY_CARDS_TXT][4], CardData[card][E_CARD_TEXTDRAW]);
				PlayerTextDrawShow(k, PlayerData[k][E_PLAYER_COMMUNITY_CARDS_TXT][4]);
				PlayerPlaySound(k, 1145, 0.0, 0.0, 0.0 );
			}
			TableData[handle][E_TABLE_LAST_BET] = 0;

			SendTableMessage(handle, "{D07035}======================================================================================");
			SendTableMessage(handle, "{D07035}									  The River 										");
			SendTableMessage(handle, "{D07035}======================================================================================");
			//SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"%s, %s, %s", CardData[TableData[handle][T_COM_CARDS_VALUES][0]][E_CARD_NAME], CardData[TableData[handle][T_COM_CARDS_VALUES][1]][E_CARD_NAME], CardData[TableData[handle][T_COM_CARDS_VALUES][2]][E_CARD_NAME]);
			if(start_showdown)
			{
				SetTimerEx("CheckRounds", 2000, false, "ib", handle, false);
			}
			else
			{
				//Player next to the dealer
				next_turn = GetTurnAfterDealer(handle);
				SetLastToRaise(handle, next_turn);
				//player next to the dealer is the next turn
				SendTurnMessage(handle, next_turn);
			}
		}
		case ROUND_RIVER:
		{
			CheckShowdown(handle);
			//Start a new game
			StartNewPokerGame(handle, 8);

			//Show down
		}
	}
	return 1;
}

stock CheckShowdown(handle)
{
	SendTableMessage(handle, "{F25B13}======================================================================================");
	SendTableMessage(handle, "{F25B13}									  Showdown 											");
	SendTableMessage(handle, "{F25B13}======================================================================================");

	foreach(new p: IT_PlayersTable<handle>) //loop through the players already in the table
	{
		foreach(new k: IT_PlayersInGame<handle>) //loop through the players already in the table
		{
			new seat = TableRotCorrections[TableData[PlayerData[k][E_PLAYER_CURRENT_HANDLE]][E_TABLE_TOTAL_SEATS]][ PlayerData[k][E_PLAYER_CURRENT_CHAIR_SLOT]];
			new card1 = PlayerData[k][E_PLAYER_CARD_VALUES][0];
			new card2 = PlayerData[k][E_PLAYER_CARD_VALUES][1];

			PlayerTextDrawSetString(p, PlayerData[p][E_PLAYER_CARDS_TXT_1][seat], CardData[card1][E_CARD_TEXTDRAW]);
			PlayerTextDrawSetString(p, PlayerData[p][E_PLAYER_CARDS_TXT_2][seat], CardData[card2][E_CARD_TEXTDRAW]);
		}
	}
	if(!Iter_Contains(IT_Sidepots[handle], MAIN_POT))
	{
		Iter_Add(IT_Sidepots[handle], MAIN_POT);
		foreach(new k: IT_PlayersInGame<handle>) //loop through the players already in the table
		{
			Iter_Add(It_SidepotMembers[_IT[handle][MAIN_POT]], k);
		}
	}
	foreach(new pot_id: IT_Sidepots[handle])
	{
		new highest_rank = -0x7FFFFFFF;
		new PlayerRanks[MAX_PLAYERS];
		new high_id = INVALID_PLAYER_ID;
		foreach(new p: It_SidepotMembers[_IT[handle][pot_id]])
		{
			if(!Iter_Contains(IT_PlayersInGame<handle>, p)) continue;
			new card[7];
			card[0] = GetCardNativeIndex(PlayerData[p][E_PLAYER_CARD_VALUES][0]);
			card[1] = GetCardNativeIndex(PlayerData[p][E_PLAYER_CARD_VALUES][1]);
			card[2] = GetCardNativeIndex(TableData[handle][E_TABLE_COM_CARDS_VALUES][0]);
			card[3] = GetCardNativeIndex(TableData[handle][E_TABLE_COM_CARDS_VALUES][1]);
			card[4] = GetCardNativeIndex(TableData[handle][E_TABLE_COM_CARDS_VALUES][2]);
			card[5] = GetCardNativeIndex(TableData[handle][E_TABLE_COM_CARDS_VALUES][3]);
			card[6] = GetCardNativeIndex(TableData[handle][E_TABLE_COM_CARDS_VALUES][4]);

			PlayerRanks[p] = calculate_hand_worth(card, 7);

			if(PlayerRanks[p] > highest_rank)
			{
				highest_rank = PlayerRanks[p];
				high_id = p;
			}
		}
		new count = 0;
		foreach(new p: It_SidepotMembers[_IT[handle][pot_id]])
		{
			if(!Iter_Contains(IT_PlayersInGame<handle>, p)) continue;
			if(PlayerRanks[p] == highest_rank)
			{
				count++;
			}
		}
		if(count == 1)
		{
			foreach(new p: It_SidepotMembers[_IT[handle][pot_id]])
			{
				if(!Iter_Contains(IT_PlayersInGame<handle>, p)) continue;
				if(p == high_id) continue;
				ApplyAnimation(p, "INT_OFFICE", "OFF_Sit_Crash", 4.1, 0, 1, 1, 1, 0, 1);
			}
			new w_chips = floatround(float(TableData[handle][E_TABLE_POT_CHIPS][pot_id]) * (1.0 - T_POT_FEE_RATE));
			new fee_earned = floatround((float(TableData[handle][E_TABLE_POT_CHIPS][pot_id]) / 1000.0) * T_POT_FEE_RATE);
			UpdateServerVariable( "poker_fees", 0, GetGVarFloat( "poker_fees" ) + fee_earned, "", GLOBAL_VARTYPE_FLOAT );
          	StockMarket_UpdateEarnings( E_STOCK_CASINO, fee_earned, 0.25 );
			GivePlayerCasinoRewardsPoints(high_id, fee_earned, .house_edge = 100.0);
			SendTableMessage(handle, "{9FCF30}****************************************************************************************");
			SendTableMessage(handle, "{9FCF30}Player {FF8000}%s {9FCF30}has won with a {377CC8}%s", ReturnPlayerName(high_id), HAND_RANKS[highest_rank >> 12]);
			SendTableMessage(handle, "{9FCF30}Prize: {377CC8}%s | -%0.0f%s percent fee.", cash_format(w_chips), T_POT_FEE_RATE * 100.0, "%%");
			SendTableMessage(handle, "{9FCF30}****************************************************************************************");
			if (strmatch(HAND_RANKS[highest_rank >> 12], "Royal Flush")) printf("****\nRoyal Flush Player %s\n****\n", ReturnPlayerName(high_id));
			PlayerData[high_id][E_PLAYER_TOTAL_CHIPS] += w_chips;
		}
		else
		{
			SendTableMessage(handle, "{9FCF30}****************************************************************************************");
			SendTableMessage(handle, "{9FCF30}Draw! These players have won with a {377CC8}%s:", HAND_RANKS[highest_rank >> 12]);
			new w_chips = floatround(float(TableData[handle][E_TABLE_POT_CHIPS][pot_id]) * (1.0 - T_POT_FEE_RATE));
			new fee_earned = floatround((float(TableData[handle][E_TABLE_POT_CHIPS][pot_id]) / 1000.0) * T_POT_FEE_RATE);
			UpdateServerVariable( "poker_fees", 0, GetGVarFloat( "poker_fees" ) + fee_earned, "", GLOBAL_VARTYPE_FLOAT );
          	StockMarket_UpdateEarnings( E_STOCK_CASINO, fee_earned, 0.25 );
			new amount = w_chips / count;
			//new excess = TableData[handle][E_TABLE_POT_CHIPS][pot_id] % count
			foreach(new p: It_SidepotMembers[_IT[handle][pot_id]])
			{
				if(!Iter_Contains(IT_PlayersInGame<handle>, p)) continue;
				if(PlayerRanks[p] == highest_rank)
				{
					GivePlayerCasinoRewardsPoints(p, floatround(float(fee_earned) / float(count)), .house_edge = 100.0);
					SendTableMessage(handle, "{9FCF30}%s", ReturnPlayerName(p));
					PlayerData[p][E_PLAYER_TOTAL_CHIPS] += amount;
				}
				else
				{
					ApplyAnimation(p, "INT_OFFICE", "OFF_Sit_Crash", 4.1, 0, 1, 1, 1, 0, 1);
				}
			}
			SendTableMessage(handle, "{9FCF30}Each receives 1/%d of the total pot available. | -%0.0f%s percent fee", count, T_POT_FEE_RATE * 100.0, "%%");
			SendTableMessage(handle, "{9FCF30}****************************************************************************************");
		}
		UpdateTable(handle);
	}
	return 1;
}
stock CheckPotAndNextTurn(playerid, handle)
{
	if(GetPVarInt(playerid, "t_Clicked"))
	{
		SetPVarInt(playerid, "t_Clicked", 0);
	}
	new next_turn = INVALID_PLAYER_ID;
	HidePlayerChoices(playerid);
	new bool: is_cycle_complete = false;

	next_turn = GetTurnAfterPlayer(handle, playerid);
	new last_to_raise = TableData[handle][E_TABLE_LAST_TO_RAISE];


	if(next_turn == INVALID_PLAYER_ID){
		is_cycle_complete = true;
	}

	if(!is_cycle_complete)
	{
		if(next_turn == last_to_raise || next_turn == playerid)
		{
			is_cycle_complete = true;
		}
		else
		{
			//further checking
			if(Iter_Count(IT_PlayersAllIn<handle>))
			{
				new next_player = INVALID_PLAYER_ID;
				new last_player = playerid;
				for(new i = 0; i < Iter_Count(IT_PlayersInGame<handle>); i++)
				{
					next_player = GetTurnAfterPlayerEx(handle, last_player);
					if(!Iter_Contains(IT_PlayersAllIn<handle>, next_player)) break;
					if(next_player == last_to_raise)
					{
						is_cycle_complete = true;
						break;
					}
					last_player = next_player;
				}
			}

		}

		if(!is_cycle_complete)
		{
			if(!Iter_Contains(IT_PlayersInGame<handle>, last_to_raise))
			{
				new const total_seats = TableData[handle][E_TABLE_TOTAL_SEATS];
				new slot = GetPlayerSeat(playerid) - 1;
				if(slot < 0) slot = total_seats - 1;
				new next_slot = ITER_NONE;
				for(new i = 0; i < total_seats; i++)
				{
					if(slot < 0) slot = total_seats - 1;
					next_slot = slot;
					new player = TableData[handle][E_TABLE_CHAIR_PLAYER_ID][next_slot];
					if(Iter_Contains(IT_PlayersInGame<handle>, player)) break;

					if(next_slot == TableData[handle][E_TABLE_LAST_TO_RAISE_SEAT])
					{
						is_cycle_complete = true;
						break;
					}
					slot--;
				}
			}

		}
	}

	/*if(TableData[handle][E_TABLE_FIRST_TURN] == playerid && TableData[handle][E_TABLE_CHECK_FIRST] && PlayerData[playerid][E_PLAYER_FOLDED])
	{
		new turn = GetTurnAfterPlayer(handle, playerid);
		SetLastToRaise(handle, turn);
		is_cycle_complete = false;
		TableData[handle][E_TABLE_FIRST_TURN] = INVALID_PLAYER_ID;
		TableData[handle][E_TABLE_CHECK_FIRST] = false;
	}*/

	PlayerData[playerid][E_PLAYER_FOLDED] = false;
	if(is_cycle_complete)
	{
		if(Iter_Count(IT_PlayersAllIn<handle>))
		{
			/*==================================================================================================
				Main pot and sidepot creation
			==================================================================================================*/

			for(new i = 0; i < Iter_Count(IT_PlayersInGame<handle>); i++)
			{
				new p_count = 0;
				new min_bet = cellmax;
				foreach(new player: IT_PlayersInGame<handle>)
				{
					new const player_bet = PlayerData[player][E_PLAYER_CURRENT_BET];
					if(!player_bet) continue;
					if(player_bet < min_bet)
					{
						min_bet = player_bet;
					}
					p_count++;
				}
				if(!p_count || p_count == 1)
				{
					break;
				}
				else //greater than two players
				{
					new pot_id = Iter_Free(IT_Sidepots[handle]);
					TableData[handle][E_TABLE_POT_CHIPS][pot_id] += min_bet * p_count;
					foreach(new player: IT_PlayersInGame<handle>)
					{
						if(!PlayerData[player][E_PLAYER_CURRENT_BET]) continue;
						PlayerData[player][E_PLAYER_CURRENT_BET] -= min_bet;
						Iter_Add(It_SidepotMembers[_IT[handle][pot_id]], player);
					}
					Iter_Add(IT_Sidepots[handle], pot_id);
				}
			}
			//Return any excess
			foreach(new player: IT_PlayersInGame<handle>)
			{
				if(!PlayerData[player][E_PLAYER_CURRENT_BET]) continue;
				PlayerData[player][E_PLAYER_TOTAL_CHIPS] += PlayerData[player][E_PLAYER_CURRENT_BET];
			}
		}
		else
		{
			foreach(new player: IT_PlayersInGame<handle>)
			{
				TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT] += PlayerData[player][E_PLAYER_CURRENT_BET];
			}
			UpdateTable(handle);
		}

		new const all_in = Iter_Count(IT_PlayersAllIn<handle>);
		new const current_players = Iter_Count(IT_PlayersInGame<handle>);
		if(all_in == current_players || all_in == current_players - 1)
		{
			CheckRounds(handle, true);
		}
		else
		{
			CheckRounds(handle, false);
		}
	}
	else
	{
		SendTurnMessage(handle, next_turn);
	}
	UpdateTable(handle);
	return 1;
}

stock bool: FoldPlayer(handle, playerid)
{
	ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Crash", 4.1, 0, 1, 1, 1, 0, 1);
	PlayerData[playerid][E_PLAYER_FOLDED] = true;
	KillPlayerTurnTimer(playerid);
	SendTableMessage(handle, "{2DD9A9}  * * %s folds.. * *", ReturnPlayerName(playerid));
	SetPlayerChatBubble(playerid, -1, 30.0, 2000, "{D6230A}** FOLDS ** ");

	PlayerData[playerid][E_PLAYER_IS_PLAYING] = false;
	TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT] += PlayerData[playerid][E_PLAYER_CURRENT_BET];
	HidePlayerChoices(playerid);
	Iter_Remove(IT_PlayersInGame<handle>, playerid);
	new count = Iter_Count(IT_PlayersInGame<handle>);
	if(count == 1)
	{
		Iter_Remove(IT_PlayersInGame<handle>, playerid);
		new winner = Iter_First(IT_PlayersInGame<handle>);
		HidePlayerChoices(winner);
		SendTableMessage(handle, "{9FCF30}****************************************************************************************");
		SendTableMessage(handle, "{9FCF30}Player {FF8000}%s {9FCF30}has won the game!", ReturnPlayerName(winner));
		new w_chips = floatround(float(TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT]) * (1.0 - T_POT_FEE_RATE));
		new fee_earned = floatround((float(TableData[handle][E_TABLE_POT_CHIPS][MAIN_POT]) / 1000.0) * T_POT_FEE_RATE);
		UpdateServerVariable( "poker_fees", 0, GetGVarFloat( "poker_fees" ) + fee_earned, "", GLOBAL_VARTYPE_FLOAT );
		GivePlayerCasinoRewardsPoints(winner, fee_earned, .house_edge = 100.0);
		SendTableMessage(handle, "{9FCF30}Prize: {377CC8}%s | -%0.0f%s percent fee", cash_format(w_chips), T_POT_FEE_RATE * 100.0, "%%");
		SendTableMessage(handle, "{9FCF30}****************************************************************************************");
		PlayerData[winner][E_PLAYER_TOTAL_CHIPS]  += w_chips;
		PlayerData[winner][E_PLAYER_TOTAL_CHIPS]  += PlayerData[winner][E_PLAYER_CURRENT_BET];
		UpdateTable(handle);
		StartNewPokerGame(handle, 8);
		TableData[handle][E_TABLE_CURRENT_TURN] = INVALID_PLAYER_ID;
		return true;
	}
	else if(!count)
	{
		Iter_Remove(IT_PlayersInGame<handle>, playerid);
		//Might happen if all the players disconnect
		AbortGame(handle);
		return true;
	}
	else if(TableData[handle][E_TABLE_CURRENT_TURN] == playerid)
	{
		KillTimer(PlayerData[playerid][E_PLAYER_TIMER_ID]);
		PlayerData[playerid][E_PLAYER_TIMER_STARTED] = false;
		return false;
	}
	else
	{
		return false;
	}
}
hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if(PlayerData[playerid][E_PLAYER_IS_PLAYING])
	{

		if(GetPlayerClickedTxt(playerid)) return 1;
		new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
		if(TableData[handle][E_TABLE_CURRENT_TURN] != playerid) {
			HidePlayerChoices(playerid);
			return 1;
		}
		if(playertextid == PlayerData[playerid][E_PLAYER_CHOICES_TXT][FOLD])
		{
			//Fold
			SetPlayerClickedTxt(playerid, true);
			if(!FoldPlayer(handle, playerid))
				CheckPotAndNextTurn(playerid, handle);
		}
		else if(playertextid ==  PlayerData[playerid][E_PLAYER_CHOICES_TXT][CALL])
		{
			//Call or check
			if(TableData[handle][E_TABLE_LAST_BET] == PlayerData[playerid][E_PLAYER_CURRENT_BET]) //check
			{
				SetPlayerClickedTxt(playerid, true);
				KillPlayerTurnTimer(playerid);
				SendTableMessage(handle, "{2DD9A9}  * * %s checks .. * *", ReturnPlayerName(playerid));
				SetPlayerChatBubble(playerid, -1, 30.0, 2000, "{22B1BD}** CHECKS ** ");
			}
			else //call
			{
				new dif = TableData[handle][E_TABLE_LAST_BET] - PlayerData[playerid][E_PLAYER_CURRENT_BET];
				if(PlayerData[playerid][E_PLAYER_TOTAL_CHIPS] >= dif)
				{
					KillPlayerTurnTimer(playerid);
					SendTableMessage(handle, "{2DD9A9}  * * %s calls %s .. * *", ReturnPlayerName(playerid), cash_format(dif));
					SetPlayerChatBubble(playerid, -1, 30.0, 2000, "{22B1BD}** CALLS %s ** ", cash_format(dif));
					RemoveChipsFromPlayer( playerid, dif);
					PlayerData[playerid][E_PLAYER_CURRENT_BET] = TableData[handle][E_TABLE_LAST_BET];
					SetPlayerClickedTxt(playerid, true);
				}
				else
				{
					SendPokerMessage(playerid, "ERROR: You can't call as you don't have enough chips. You have two possible options: going all in or folding.");
					return 1;
				}

			}
			CheckPotAndNextTurn(playerid, handle);
		}
		else if(playertextid ==  PlayerData[playerid][E_PLAYER_CHOICES_TXT][RAISE])
		{
			switch(PlayerData[playerid][E_PLAYER_RCHOICE])
			{
				case E_RAISE_BET:
				{
					SendPokerMessage(playerid, "Please enter an amount to bet, the total amount of chips you current have is: %d", PlayerData[playerid][E_PLAYER_TOTAL_CHIPS]);
					ShowPlayerRaiseDialog(playerid);
					HidePlayerChoices(playerid);
				}
				case E_RAISE_RAISE:
				{
					SendPokerMessage(playerid, "Please enter an amount to raise, the total amount of chips you current have is: %d", PlayerData[playerid][E_PLAYER_TOTAL_CHIPS]);
					HidePlayerChoices(playerid);
					ShowPlayerRaiseDialog(playerid);
				}
				case E_RAISE_ALL_IN:
				{
					ForcePlayerAllIn(playerid, handle);
					SetPlayerClickedTxt(playerid, true);
				}
			}
		}
	}
	return 1;
}


stock ForcePlayerAllIn(playerid, handle, bool:checkpot = true)
{
	ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Idle_Loop", 4.1, 1, 1, 1, 0, 0, 1);
	KillPlayerTurnTimer(playerid);
	Iter_Add(IT_PlayersAllIn<handle>, playerid);
	new raise = PlayerData[playerid][E_PLAYER_TOTAL_CHIPS] + PlayerData[playerid][E_PLAYER_CURRENT_BET];
	PlayerData[playerid][E_PLAYER_CURRENT_BET] = raise;
	SendTableMessage(handle, "{2DD9A9}  * * %s goes all in with %s .. * *", ReturnPlayerName(playerid), cash_format(raise));
	SetPlayerChatBubble(playerid, -1, 30.0, 2000, "{9512CD}** ALL IN with %s ** ", cash_format(raise));
	PlayerData[playerid][E_PLAYER_TOTAL_CHIPS] = 0;
	if(checkpot)
		CheckPotAndNextTurn(playerid, handle);
	return 1;
}

stock ShowPlayerRaiseDialog(playerid)
{
	return ShowPlayerDialog(playerid, DIALOG_INPUT_RAISE, DIALOG_STYLE_INPUT, "{FF8000}Input", "Submit", "Cancel", "{FFFFFF}Please input the desired amount of chips: \n{FFFFFF}You may type {FF8000}%d {FFFFFF} if you want to go All In\n",  PlayerData[playerid][E_PLAYER_TOTAL_CHIPS]);
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_BUY_IN)
	{
		new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
		if(!IsValidTable(handle)) return 1;
		if(!Iter_Contains(IT_PlayersTable<handle>, playerid)) return 1;
		if(response)
		{
			GivePlayerMoneyEx(playerid, -TableData[handle][E_TABLE_BUY_IN]);
			PlayerData[playerid][E_PLAYER_TOTAL_CHIPS] = TableData[handle][E_TABLE_BUY_IN];
			SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has paid the buy-in fee of %s chips to keep playing.", ReturnPlayerName(playerid), cash_format(TableData[handle][E_TABLE_BUY_IN]));
		}
		else
		{
			SendTableMessage(handle, ""COL_GREY"-- "COL_WHITE"Player %s has been kicked out of the table. [Reason: Failure to pay the buy-in fee]", ReturnPlayerName(playerid));
			KickPlayerFromTable(playerid);
		}
	}
	if(dialogid == DIALOG_INPUT_RAISE)
	{
		if(response)
		{
			new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
			if(!IsValidTable(handle)) return 0;
			if(!Iter_Contains(IT_PlayersTable<handle>, playerid)) return 1;
			if(TableData[handle][E_TABLE_CURRENT_STATE] != STATE_BEGIN)
			{
				SendPokerMessage(playerid, "There isn't any active game at the moment.");
				return 0;
			}
			if(!Iter_Contains(IT_PlayersInGame<handle>, playerid))
			{
				return 0;
			}
			new raise = 0;
			if(sscanf(inputtext, "d", raise))
			{
				SendPokerMessage(playerid, "Input must be numeric.");
				ShowPlayerRaiseDialog(playerid);
				return 1;
			}
			if(raise < 0)
			{
				SendPokerMessage(playerid, "Input must be greater than 0.");
				ShowPlayerRaiseDialog(playerid);
				return 1;
			}
			else if(raise > PlayerData[playerid][E_PLAYER_TOTAL_CHIPS])
			{
				SendPokerMessage(playerid, "You don't have that many chips available.");
				ShowPlayerRaiseDialog(playerid);
				return 1;
			}
			else if(raise <= TableData[handle][E_TABLE_LAST_BET])
			{
				SendPokerMessage(playerid, "Value must be greater than the last bet: %s", cash_format(TableData[handle][E_TABLE_LAST_BET]));
				ShowPlayerRaiseDialog(playerid);
				return 1;
			}
			else if(raise == PlayerData[playerid][E_PLAYER_TOTAL_CHIPS])
			{
				ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Idle_Loop", 4.1, 1, 1, 1, 0, 0, 1);
				KillPlayerTurnTimer(playerid);
				//all in - not mandatory
				SendTableMessage(handle, "{2DD9A9}  * * %s goes all in with %s .. * *", ReturnPlayerName(playerid), cash_format(raise));
				SetPlayerChatBubble(playerid, -1, 30.0, 2000, "{9512CD}** ALL IN with %s ** ", cash_format(raise));
				Iter_Add(IT_PlayersAllIn<handle>, playerid);
				RemoveChipsFromPlayer( playerid, raise);
				SetLastToRaise(handle, playerid);

				PlayerData[playerid][E_PLAYER_CURRENT_BET] += raise;
				TableData[handle][E_TABLE_LAST_BET] = PlayerData[playerid][E_PLAYER_CURRENT_BET];
				CheckPotAndNextTurn(playerid, handle);
			}
			else
			{
				KillPlayerTurnTimer(playerid);
				new dif = raise - PlayerData[playerid][E_PLAYER_CURRENT_BET];
				TableData[handle][E_TABLE_LAST_BET] = raise;
				SetLastToRaise(handle, playerid);
				PlayerData[playerid][E_PLAYER_CURRENT_BET] = raise;
				RemoveChipsFromPlayer( playerid, dif);
				if(PlayerData[playerid][E_PLAYER_RCHOICE] == E_RAISE_BET)
				{
					SendTableMessage(handle, "{2DD9A9}  * * %s bets %s .. * *", ReturnPlayerName(playerid), cash_format(raise));
					SetPlayerChatBubble(playerid, -1, 30.0, 2000, "{31CA15}** BETS %s ** ", cash_format(raise));
				}
				else
				{
					SendTableMessage(handle, "{2DD9A9}  * * %s raises to %s .. * *", ReturnPlayerName(playerid), cash_format(raise));
					SetPlayerChatBubble(playerid, -1, 30.0, 2000, "{31CA15}** RAISES to %s ** ", cash_format(raise));
				}
				CheckPotAndNextTurn(playerid, handle);
			}
		}
		else
		{
			new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
			if(!IsValidTable(handle)) return 1;
			if(TableData[handle][E_TABLE_CURRENT_TURN] == playerid)
			{
				SetPlayerClickedTxt(playerid, false);
				ShowChoicesToPlayer(playerid);
			}
			else
			{
				ShowPlayerDialog(playerid, -1, DIALOG_STYLE_INPUT, " ", " ", " ", " ");

			}
		}
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PRESSED(KEY_SECONDARY_ATTACK))
	{
		new handle = GetClosestTableForPlayer(playerid);
		if(handle != ITER_NONE)
		{
			if(TableData[handle][E_TABLE_VIRTUAL_WORLD] == GetPlayerVirtualWorld(playerid) && TableData[handle][E_TABLE_INTERIOR] == GetPlayerInterior(playerid))
			{
				if(!Iter_Contains(IT_PlayersTable<handle>, playerid))
				{
					if(IsPlayerInRangeOfTable(playerid, handle, T_JOIN_TABLE_RANGE))
					{
						AddPlayerToTable(playerid, handle);
					}
				}
				else
				{
					if((Iter_Contains(IT_PlayersInGame<handle>, playerid) && TableData[handle][E_TABLE_CURRENT_STATE] == STATE_BEGIN)
					|| TableData[T_MAX_POKER_TABLES][E_TABLE_LOADING_GAME])
					{
						SendPokerMessage(playerid, "You cannot exit this table as there's currently an active match under process.");
						return 0;
					}
					KickPlayerFromTable(playerid);
				}
			}
		}
	}
	return 1;

}

#if defined AC_INCLUDED
hook OnPlayerDeathEx( playerid, killerid, reason, Float: damage, bodypart )
#else
hook OnPlayerDeath(playerid, killerid, reason)
#endif
{
	Player_CheckPokerGame(playerid, "Died");
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	Player_CheckPokerGame(playerid, "Disconnected");
	return 1;
}

stock Player_CheckPokerGame(playerid, const reason[])
{
	if(GetPVarInt(playerid, "t_is_in_table"))
    {
        new handle = PlayerData[playerid][E_PLAYER_CURRENT_HANDLE];
        if(Iter_Contains(IT_PlayersInGame<handle>, playerid)) {
            if(!FoldPlayer(handle, playerid)) {
                CheckPotAndNextTurn(playerid, handle);
            }
        }

        SendTableMessage(handle, "Player %s has been kicked out from the table [REASON: %s].", ReturnPlayerName(playerid), reason);
        KickPlayerFromTable(playerid);
    }
    return 1;
}

hook OnGameModeExit()
{
	for(new i = 0; i < T_MAX_POKER_TABLES; i++)
	{
		if(!Iter_Contains(IT_Tables, i)) continue;
		DestroyPokertable(i);
		memcpy(TableData[i], TableData[T_MAX_POKER_TABLES], 0, sizeof(TableData[]) * 4, sizeof(TableData[]));
	}
	return 1;
}

hook OnGameModeInit()
{
	//Setting values to dummy arrays

	//Player data:
	PlayerData[MAX_PLAYERS][E_PLAYER_CURRENT_HANDLE] = ITER_NONE;
	PlayerData[MAX_PLAYERS][E_PLAYER_CURRENT_CHAIR_SLOT] = ITER_NONE;
	PlayerData[MAX_PLAYERS][E_PLAYER_CHAIR_ATTACH_INDEX_ID] = ITER_NONE;
	PlayerData[MAX_PLAYERS][E_PLAYER_IS_PLAYING] = false;
	PlayerData[MAX_PLAYERS][E_PLAYER_TIMER_STARTED] = false;
	PlayerData[MAX_PLAYERS][E_PLAYER_CARD_VALUES][0] = ITER_NONE;
	PlayerData[MAX_PLAYERS][E_PLAYER_CARD_VALUES][1] = ITER_NONE;
	PlayerData[MAX_PLAYERS][E_PLAYER_CURRENT_BET] = 0;
	PlayerData[MAX_PLAYERS][E_PLAYER_TOTAL_CHIPS] = 0;
	PlayerData[MAX_PLAYERS][E_PLAYER_FOLDED] = false;

	TableData[T_MAX_POKER_TABLES][E_TABLE_STING_NEW_GAME] = false;
	//Table data
    TableData[T_MAX_POKER_TABLES][E_TABLE_TOTAL_SEATS] = 0;
    TableData[T_MAX_POKER_TABLES][E_TABLE_LOADING_GAME] = false;
    TableData[T_MAX_POKER_TABLES][E_TABLE_CHECK_FIRST] = false;
    TableData[T_MAX_POKER_TABLES][E_TABLE_FIRST_TURN] = INVALID_PLAYER_ID;
	TableData[T_MAX_POKER_TABLES][E_TABLE_CURRENT_STATE] = STATE_IDLE;
	TableData[T_MAX_POKER_TABLES][E_TABLE_BUY_IN] = 0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_SMALL_BLIND] = 0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_VIRTUAL_WORLD] = 0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_INTERIOR] = 0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_BIG_BLIND] = 0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_POS_X] = 0.0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_POS_Y] = 0.0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_POS_Z] = 0.0;

	TableData[T_MAX_POKER_TABLES][E_TABLE_OBJECT_IDS][0] = 0;
	TableData[T_MAX_POKER_TABLES][E_TABLE_OBJECT_IDS][1] = 0;
	for(new i = 0; i < T_MAX_CHAIRS_PER_TABLE; i++)
	{
		TableData[T_MAX_POKER_TABLES][E_TABLE_CHAIR_OBJECT_IDS][i] = INVALID_OBJECT_ID;
		TableData[T_MAX_POKER_TABLES][E_TABLE_IS_SEAT_TAKEN][i] = false;
		TableData[T_MAX_POKER_TABLES][E_TABLE_CHAIR_PLAYER_ID][i] = INVALID_PLAYER_ID;
		TableData[T_MAX_POKER_TABLES][E_TABLE_SEAT_POS_X][i] = 0.0;
		TableData[T_MAX_POKER_TABLES][E_TABLE_SEAT_POS_Y][i] = 0.0;
		TableData[T_MAX_POKER_TABLES][E_TABLE_SEAT_POS_Z][i] = 0.0;
		TableChips[T_MAX_POKER_TABLES][i][0] = 0;
		TableChips[T_MAX_POKER_TABLES][i][1] = 0;
		TableChips[T_MAX_POKER_TABLES][i][2] = 0;
		TableChips[T_MAX_POKER_TABLES][i][3] = 0;
	}

	// server variables
	AddServerVariable( "poker_fees", "0.0", GLOBAL_VARTYPE_FLOAT );

	// red dragons casino
	CreatePokerTable( 1000000, 10000, 1968.395019, 1027.808959, 991.828002, 2, 23, 10 );
	CreatePokerTable( 500000, 5000, 1940.795043, 1008.741027, 991.828002, 3, 23, 10 );
	CreatePokerTable( 250000, 2500, 1940.795043, 1027.240966, 991.828002, 3, 23, 10 );
	CreatePokerTable( 100000, 1000, 1940.795043, 1021.075012, 991.828002, 4, 23, 10 );
	CreatePokerTable( 50000, 500, 1940.795043, 1014.908996, 991.828002, 4, 23, 10 );
	CreatePokerTable( 25000, 250, 1968.395019, 1014.609008, 991.828002, 5, 23, 10 );
	CreatePokerTable( 10000, 100, 1968.395019, 1021.208984, 991.828002, 6, 23, 10 );
	CreatePokerTable( 5000, 50, 1968.395019, 1008.008972, 991.828002, 6, 23, 10 );

	// caliguas casino
	CreatePokerTable( 250000, 2500, 2273.936035, 1597.272949, 1005.568969, 2, 82, 1 );
	CreatePokerTable( 125000, 1250, 2252.936035, 1591.272949, 1005.568969, 2, 82, 1 );
	CreatePokerTable( 100000, 1000, 2255.936035, 1597.272949, 1005.568969, 3, 82, 1 );
	CreatePokerTable( 50000, 500, 2258.936035, 1591.272949, 1005.568969, 4, 82, 1 );
	CreatePokerTable( 25000, 250, 2261.936035, 1597.272949, 1005.568969, 5, 82, 1 );
	CreatePokerTable( 10000, 100, 2264.936035, 1591.272949, 1005.568969, 5, 82, 1 );
	CreatePokerTable( 5000, 50, 2267.936035, 1597.272949, 1005.568969, 6, 82, 1 );
	CreatePokerTable( 2500, 25, 2270.936035, 1591.272949, 1005.568969, 6, 82, 1 );
	T_SendWarning("TPoker by ThreeKingz has been succesfully loaded!");
	return 1;
}

/******************************************************************************************
	Commands
*******************************************************************************************/

CMD:ctable(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return 0;
	new seats, small_blind, buy_in;
	if(sscanf(params, "ddd", seats, small_blind, buy_in))
	{
		SendPokerMessage(playerid, "/ctable [number of seats] [small blind] [buy in]");
		return 1;
	}
	//Assumes the player is on a flat surface <Pos[2]-0.6>
	new Float:Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	new table = CreatePokerTable(buy_in, small_blind, Pos[0], Pos[1], Pos[2]-0.6, seats, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	SendPokerMessage(playerid, "You have created table ID: %d | Small blind: %s | Big blind: %s | Buy In: %s | Seats: %d", table, cash_format(small_blind), cash_format(small_blind*2), cash_format(buy_in), seats);
	return 1;
}

CMD:dtable(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return 0;
	new ptable = 0;
	if(sscanf(params, "d", ptable))
	{
		SendClientMessage(playerid, 0x3E969FFF, "/ctable [pokertable ID]");
		return 1;
	}
	if(!IsValidTable(ptable))
	{
		SendClientMessageFormatted(playerid, 0x3E969FFF, "Invalid pokertable ID");
		return 1;
	}
	SendPokerMessage(playerid,  "You have deleted poker table ID: %d", ptable);
	DestroyPokertable(ptable);
	return 1;
}

CMD:agame(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return 0;
	new ptable;
	if(sscanf(params, "d", ptable))
	{
		SendPokerMessage(playerid, "/agame [table ID]");
		SendPokerMessage(playerid, "Will abort a game if started, ejecting all the players out of the table.");
		return 1;
	}
	if(!IsValidTable(ptable))
	{
		SendClientMessageFormatted(playerid, 0x3E969FFF, "Invalid pokertable ID");
		return 1;
	}
	if(AbortGame(ptable))
	{
		SendPokerMessage(playerid, "You have successfully aborted the game on table ID: %d", ptable);
	}
	else
	{
		SendPokerMessage(playerid, "No game has started in this table yet.");
	}
	return 1;
}
