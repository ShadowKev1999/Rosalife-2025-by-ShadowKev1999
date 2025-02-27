#define MAX_PARTIES                 (15)

#define PARTIE_DEFAULT_MEMBER       (5)
#define PARTIE_DEFAULT_VEHICLE      (0)

#define PARTIE_COSTS                (250000)
#define PARTIE_CREATE_MIN_LEVEL     (5)

enum E_PARTIES_DATA {
    partieName[32],
    partieFounder[2],
    partieMemberLimit,
    partieVehicleLimit,
    partieUpgrades[4],
    partieCentralConfirmed,
    Float:partieCentral[4],
}
new PartieData[MAX_PARTIES][E_PARTIES_DATA],
    PartieRank[MAX_PARTIES][3][16],
    PartiePlayerSel[MAX_PLAYERS][5],
    Iterator:IterParties<MAX_PARTIES>;