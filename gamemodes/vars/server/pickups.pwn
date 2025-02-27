#define MAX_SERVER_PICKUPS  (200)

enum {
    PICKUP_TYPE_CITYHALL,
    PICKUP_TYPE_CREATEGROUP,
    PICKUP_TYPE_ORDERFURNITURE,
    PICKUP_TYPE_CREATEPARTIE,
}

enum E_SERVER_PICKUPS {
    ePickupId,
    Float:ePickupX,
    Float:ePickupY,
    Float:ePickupZ,
    ePickupType,
    ePickupModel,
    ePickupWorld,
    ePickupInterior,
    ePickupText[256],
    ePickupObj,
    Text3D:ePickupLabel,
}  
new ServerPickups[MAX_SERVER_PICKUPS][E_SERVER_PICKUPS],
    Iterator:IterPickup<MAX_SERVER_PICKUPS>;