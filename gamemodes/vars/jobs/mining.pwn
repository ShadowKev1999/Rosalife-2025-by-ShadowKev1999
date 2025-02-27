#define     MAX_ORE_TYPES           (6)
#define     MAX_VEINS               (128)
#define     MAX_ORES                (256)
 
#define     MINING_UPDATE_RATE      (200)       // update rate of mining in miliseconds, higher the value longer the mining time (default: 200)
#define     MINING_BAR_MAX          (15.0)      // maximum value of the progress bar, higher the value longer the mining time (default: 15.0)
#define     MINING_VEHICLE_LIMIT    (8)         // how many ores someone can store in their vehicle (default: 8)
#define     MINING_ATTACH_INDEX     (3)         // setplayerattachedobject index
 
#define     MINING_REGEN_TIME       (45)        // how many minutes before respawning veins (default: 45)
#define     ORE_TIME                (5)         // how many minutes before destroying a dropped ore (default: 5)

enum    e_ores
{
    oName[16],
    oColor,
    Float: Modifier,
    Amount, // how many of this ore spawns in a vein
    Value, // value of this ore
    Rate // successful mining rate
}
 
enum    e_veins {
    Type,
    Amount,
    bool: BeingMined,
    VeinObject,
    Text3D: VeinLabel,
    bool: VeinExists
}
 
enum    e_droppedores {
    Type,
    OreTimer,
    OreObject,
    Text3D: OreLabel,
    bool: OreExists
}
 
enum    e_droppoints {
    Location[32],
    Float: PointX,
    Float: PointY,
    Float: PointZ,
    PointCP,
    Text3D: PointLabel
}
 
new
    OreData[MAX_ORE_TYPES][e_ores] = {
    // name, color, modifier, spawn amount, value, mining rate
        {"Kupfer", 0xB87333FF, 0.75, 8, 350, 65},
        {"Amethyst", 0x9B59B6FF, 0.60, 6, 450, 58},
        {"Smaragd", 0x2ECC71FF, 0.40, 4, 750, 50},
        {"Rubin", 0xD10056FF, 0.35, 3, 800, 55},
        {"Saphir", 0x0F52BAFF, 0.30, 3, 850, 45},
        {"Gold", 0xFFD700FF, 0.25, 4, 1000, 40}
    };
    
new
    VeinData[MAX_VEINS][e_veins],
    DroppedOres[MAX_ORES][e_droppedores];
    
new
    MiningVein[MAX_PLAYERS] = {-1, ...},
    MiningTimer[MAX_PLAYERS] = {-1, ...},
    CarryingOre[MAX_PLAYERS] = {-1, ...},
    LoadingPoint[MAX_PLAYERS] = {-1, ...},
    PlayerBar: MiningBar[MAX_PLAYERS] = {INVALID_PLAYER_BAR_ID, ...};
 
new
    LoadedOres[MAX_VEHICLES][MAX_ORE_TYPES];
    
new
    DropPoints[][e_droppoints] = {
    // location, x, y, z
        {"Las Venturas", 2489.462646, 2773.271240, 10.789896},
        {"San Fierro", -1823.034057, 2.284350, 15.117187},
        {"Los Santos", 2660.815673, -1433.876098, 30.050680}
    };
 
new
    PointIcons[MAX_PLAYERS][sizeof(DropPoints)];