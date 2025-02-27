forward OnVehicleRegistered(vehicleid);
public OnVehicleRegistered(vehicleid) {
    FahrzeugInfo[vehicleid][fDatabaseID] = cache_insert_id();
    return 1;
}