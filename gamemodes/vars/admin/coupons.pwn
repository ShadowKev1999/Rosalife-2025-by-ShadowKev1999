#define MAX_SERVER_COUPONS          8
#define MAX_PLAYER_OBJECT_CATALOG   42
#define MAX_SERVER_OBJECTS          300
#define MAX_COUPON_LIST             10

enum {
    COUPON_MONSTER_TRUCK,
    COUPON_MONSTERA_TRUCK,
    COUPON_MONSTERB_TRUCK,
    COUPON_PLAYER_OBJECTS,
    COUPON_SULTAN_VEHICLE,
    COUPON_PLAYER_VIP,
    COUPON_BOXVILLE_VEHICLE,
    COUPON_BOBCAT_VEHICLE,
}

new ServerCoupons[MAX_SERVER_COUPONS][] = {
    "MONSTER TRUCK",
    "MONSTER A TRUCK",
    "MONSTER B TRUCK",
    "25 Player Objects",
    "SULTAN VEHICLE",
    "PLAYER VIP",
    "BOXVILLE VEHICLE",
    "BOBCAT VEHICLE"
};
new ServerCouponsModel[MAX_SERVER_COUPONS] = {
    444, //VehicleID
    556, //VehicleID
    557, //VehicleID
    25, //PlayerObjects
    560, //VehicleID
    30, //30 Tage
    609, //VehicleID
    422 //VehicleID
};
new ServerCouponPlayObj[MAX_PLAYER_OBJECT_CATALOG] = {
    714, //Big tree
    738, //Green bushy tree
    19076, //Christmas Tree
    655, //Coniferous tree
    708, //A small tree
    660, //Coniferous tree
    1368, //public bench
    1280, //parkbench
    1256, //stonebench
    19632, //burning logs
    19865, //light wooden fence
    1408, //white wood fence fence
    1418, //part of the wooden fence
    1446, //wooden fence
    19869, //meshfence
    11474, //des_swtfence2
    824, //Large Bush
    823, //Big Bush
    15038, //A small Bush in a pot
    8991, //bush12_lvs
    8990, //bush11_lvs
    747, //Light stone with grass
    899, //Big Stone
    900, //Big Stone
    13645, //kickramp06
    1463, //wood log
    14872, //wood log
    3408,
    2677,
    1369,
    1568,
    2671,
    2860,
    2673,
    2674,
    1334,
    1362,
    19793,
    672,
    659,
    737,
    3276
};

new PlayerCouponId[MAX_PLAYERS],
    PlayerCouponList[MAX_COUPON_LIST][2];

enum E_SERVER_OBJECTS
{
	serverObjectId,
    serverObjectDbId,
    serverObjectModelId,
    
    Float:serverObjectPosX,
    Float:serverObjectPosY,
    Float:serverObjectPosZ,
    Float:serverObjectRotX,
    Float:serverObjectRotY,
    Float:serverObjectRotZ,

    serverObjectUserId
}

new
    ServerObjects[MAX_SERVER_OBJECTS][E_SERVER_OBJECTS],
	Iterator:ServerObjectsItter<MAX_SERVER_OBJECTS>;