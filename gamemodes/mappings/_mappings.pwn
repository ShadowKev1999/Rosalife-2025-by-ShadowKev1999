#include "mappings/maps/sapd_rodeo.pwn"
#include "mappings/maps/ls_bank.pwn"
//#include "mappings/maps/c0kkies_house.pwn"
//#include "mappings/maps/lovesign.pwn"
#include "mappings/maps/spawn_lossantos.pwn"
//#include "mappings/maps/sweeper_base.pwn"
//#include "mappings/maps/trucker_base_ls.pwn"
//#include "mappings/maps/hospital_lossantos.pwn"
#include "mappings/maps/airport_lossantos_int.pwn"
//#include "mappings/maps/drivingschool_lossantos.pwn"
//#include "mappings/maps/kevins_house.pwn"
#include "mappings/maps/eddys_house.pwn"
#include "mappings/maps/boatshop_lossantos.pwn"
#include "mappings/maps/furniture_office.pwn"

#include "mappings/maps/cityhall_lossantos.pwn"
//#include "mappings/maps/cityhall_int_risq.pwn"

stock MappingsInit() {
    createObjectTable();

    mysql_tquery(sqlHandle, "SELECT * FROM `mapping_objects`;", "@Load_Map", "");
    mysql_tquery(sqlHandle, "SELECT * FROM `mapping_removes`;", "@Load_RemoveBuildings", "");
    //SAPD_Rodeo_Init();
    InitLosSantosBank();
    //HospitalLosSantos_Init();
    //sweeperBase_Init();
    //truckerBaseLosSantos_Init();
    //Init_CookiesHouse();
    NoobSpawn_LosSantos_Init();
    //RemovesNoobSpawn_LosSantos();
    //LoveSign_Init();
//   DrivingSchool_LosSantos_Init();
    FurnitureOffice_Init();
    Init_BoatShopMap();
    Eddy_Init();
    CityHall_LosSantos_Init();
//    CityHall_Int_Risq_Init();
    //KevinsHouse_Init();

    LosSantos_AirportInt_init();
    return 1;
}

stock MappingsOnPlayerConnect(playerid) {
    Eddy_RemovePlayer(playerid);
    //SAPD_Rodeo_OnPlayerConnect(playerid);
    InitLosSantosBankPlayer(playerid);
    RemoveServerBuildingsForPlayer(playerid);
    //LoveSign_PlayerConnect(playerid);
    return 1;
}
