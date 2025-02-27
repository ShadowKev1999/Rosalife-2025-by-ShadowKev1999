#define MAX_ENTER_EXITS                 100
#define ENTER_EXIT_PICKUP_MODEL         19130

enum E_SERVER_ENTER_EXIT {
    sEnterDbId,
    Float:sEnterPos[4],
    Float:sExitPos[4],
    sEnterExitName[32],
    sEnterExitPickup[2],
    sEnterExitInteriorId[2],
    sEnterExitWorldId[2],
    sEnterExitArea[2],
    Text3D:sEnterExitLabel[2],
    bool:sEnterCreated
}
new sEnterExits[MAX_ENTER_EXITS][E_SERVER_ENTER_EXIT];