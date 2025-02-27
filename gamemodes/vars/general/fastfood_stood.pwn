#define 	MAX_FOOD        (100)

//Prices
#define     PIZZA_PRICE     (10)
#define     FRIES_PRICE     (5)
#define     COLA_PRICE      (2)
#define     BURGER_PRICE    (10)
#define     HOTDOG_PRICE    (10)

enum FoodData
{
	foodid,
    fmodelid,
    fcheckpointid,
    foodtext[32],
    Text3D:textid,
    
    Float:ObjPosX,
    Float:ObjPosY,
    Float:ObjPosZ,
    Float:ObjRotX,
    Float:ObjRotY,
    Float:ObjRotZ,
    
    ActorID,
    ActorSkin,
    Float:ActorX,
    Float:ActorY,
    Float:ActorZ,
    Float:ActorRot
}

new
    FoodInfo[ MAX_FOOD ][FoodData],
	Iterator:Foods<MAX_FOOD>,
	Text:Foodobj[15],
	bool:Isviewingobj[MAX_PLAYERS],
	PlayerAttachedObject[MAX_PLAYERS];