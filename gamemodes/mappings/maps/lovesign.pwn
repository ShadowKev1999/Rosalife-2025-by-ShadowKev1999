LoveSign_Init() {
    static obj;
    obj = CreateObjectEx(7093, 996.063415, -1861.518188, 16.145988, 0.000000, 0.000007, 124.699989, -1, -1, 300.00, 300.00, "Love Sign");
    SetObjectMaterialEx(obj, 0, 19297, "matlights", "invisible", 0x00000000);
    SetObjectMaterialEx(obj, 1, 19607, "enexmarkers", "enexmarker4-2", 0x00000000);
    obj = CreateObjectEx(19430, 999.174621, -1860.268920, 13.688986, -44.999996, 0.000000, -145.299987, -1, -1, 300.00, 300.00, "Love Sign");
    SetObjectMaterialEx(obj, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    obj = CreateObjectEx(19430, 996.918762, -1857.009399, 16.508987, 43.000003, 0.000000, -145.299987, -1, -1, 300.00, 300.00, "Love Sign");
    SetObjectMaterialEx(obj, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    obj = CreateObjectEx(19430, 998.737487, -1859.546142, 11.825986, 0.000000, 90.000007, 124.699989, -1, -1, 300.00, 300.00, "Love Sign");
    SetObjectMaterialEx(obj, 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
    obj = CreateObjectEx(19430, 997.823913, -1858.316528, 14.804986, 43.000003, 0.000000, -145.299987, -1, -1, 300.00, 300.00, "Love Sign");
    SetObjectMaterialEx(obj, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    obj = CreateObjectEx(19328, 999.290283, -1860.253295, 14.324986, 0.598999, -44.599990, 124.699989, -1, -1, 300.00, 300.00, "Love Sign");
    SetObjectMaterialTextEx(obj, 0, "I", 60, "Engravers MT", 110, 1, 0xFF000000, 0x00000000, 0);
    obj = CreateObjectEx(4988, 994.931884, -1853.899291, 17.165985, 6.599998, 46.298992, -48.299987, -1, -1, 300.00, 300.00, "Love Sign");
    SetObjectMaterialTextEx(obj, 0, "Rosa Life", 130, "Calibri", 50, 1, 0xFF010000, 0x00000000, 0);
    return 1;
}

LoveSign_PlayerConnect(playerid) {
    RemoveBuildingForPlayerEx(playerid, 748, 997.5547, -1858.2188, 11.9063, 150.0, "Love Sign");
    RemoveBuildingForPlayerEx(playerid, 748, 999.6875, -1861.1016, 11.9063, 150.0, "Love Sign");
    RemoveBuildingForPlayerEx(playerid, 712, 998.7266, -1859.5781, 21.0938, 150.0, "Love Sign"); 
    return 1;
}