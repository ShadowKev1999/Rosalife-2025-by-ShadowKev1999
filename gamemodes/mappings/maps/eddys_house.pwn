

Eddy_RemovePlayer(playerid) {
    RemoveBuildingForPlayer(playerid, 735, 892.6640, -37.7891, 60.6719, 0.10); // tree_hipoly09b
    RemoveBuildingForPlayer(playerid, 759, 861.5310, -37.3437, 61.2733, 0.10); // sm_bush_large_1
    RemoveBuildingForPlayer(playerid, 759, 853.5390, -21.2733, 62.4062, 0.10); // sm_bush_large_1
    RemoveBuildingForPlayer(playerid, 12937, 873.9920, -22.7577, 65.1016, 0.10); // CE_CATshack
    RemoveBuildingForPlayer(playerid, 735, 851.5079, -19.7500, 61.3750, 0.10); // tree_hipoly09b
    RemoveBuildingForPlayer(playerid, 12957, 861.5230, -25.3827, 62.8516, 0.10); // sw_pickupwreck01
    RemoveBuildingForPlayer(playerid, 3276, 884.3280, -20.7343, 63.0937, 0.10); // cxreffencesld
    RemoveBuildingForPlayer(playerid, 3276, 894.4530, -25.7733, 63.1483, 0.10); // cxreffencesld
    RemoveBuildingForPlayer(playerid, 3276, 877.2109, -23.4843, 63.0546, 0.10); // cxreffencesld
    RemoveBuildingForPlayer(playerid, 3276, 891.4530, -18.3906, 63.0546, 0.10); // cxreffencesld
    RemoveBuildingForPlayer(playerid, 3276, 854.2579, -20.0077, 63.0155, 0.10); // cxreffencesld
    RemoveBuildingForPlayer(playerid, 13360, 870.5390, -24.6016, 64.1172, 0.10); // CE_CATshackdoor
    RemoveBuildingForPlayer(playerid, 698, 890.5780, -13.7031, 65.6952, 0.10); // sm_firtbshg
    RemoveBuildingForPlayer(playerid, 759, 857.7189, -9.8828, 62.3594, 0.10); // sm_bush_large_1
    RemoveBuildingForPlayer(playerid, 3275, 866.2269, -8.4687, 62.8983, 0.10); // cxreffence
    RemoveBuildingForPlayer(playerid, 3275, 879.2579, -14.2109, 63.0233, 0.10); // cxreffence
    RemoveBuildingForPlayer(playerid, 3276, 857.5310, -11.9687, 63.3280, 0.10); // cxreffencesld
    RemoveBuildingForPlayer(playerid, 790, 851.8670, -11.6406, 56.2891, 0.10); // sm_fir_tallgroup
    return 1;
}

Eddy_Init() {
    static g_Object[407];
    g_Object[0] = CreateDynamicObject(19376, 868.5543, -14.3093, 62.8698, 0.0000, 90.0000, -23.6000); //Podea stanga
    SetDynamicObjectMaterial(g_Object[0], 0, 2212, "burger_tray", "btdeck256", 0x00000000);
    g_Object[1] = CreateDynamicObject(19376, 875.2429, -17.2318, 62.8800, 0.0000, 90.0000, -23.6000); //Podea dreapta
    SetDynamicObjectMaterial(g_Object[1], 0, 2212, "burger_tray", "btdeck256", 0x00000000);
    g_Object[2] = CreateDynamicObject(19458, 870.0565, -9.7516, 61.1952, 0.0000, 0.0000, 66.3999); //wall098
    SetDynamicObjectMaterial(g_Object[2], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    g_Object[3] = CreateDynamicObject(18771, 874.3649, -13.7390, 16.5352, 0.0000, 0.0000, 68.8998); //Scari
    SetDynamicObjectMaterial(g_Object[3], 0, 14650, "ab_trukstpc", "sa_wood08_128", 0x00000000);
    SetDynamicObjectMaterial(g_Object[3], 1, 6487, "councl_law2", "stonewall2_la", 0x00000000);
    SetDynamicObjectMaterial(g_Object[3], 2, 6487, "councl_law2", "stonewall2_la", 0x00000000);
    SetDynamicObjectMaterial(g_Object[3], 3, 6487, "councl_law2", "stonewall2_la", 0x00000000);
    g_Object[4] = CreateDynamicObject(19458, 866.2280, -18.5345, 61.1952, 0.0000, 0.0000, 66.3999); //wall098
    SetDynamicObjectMaterial(g_Object[4], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    g_Object[5] = CreateDynamicObject(19458, 873.7230, -21.8094, 61.2052, 0.0000, 0.0000, 66.3999); //wall098
    SetDynamicObjectMaterial(g_Object[5], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    g_Object[6] = CreateDynamicObject(19458, 863.8375, -12.2018, 61.1752, 0.0000, 0.0000, 156.3997); //wall098
    SetDynamicObjectMaterial(g_Object[6], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    g_Object[7] = CreateDynamicObject(19458, 879.9754, -19.3180, 61.1952, 0.0000, 0.0000, 156.3997); //wall098
    SetDynamicObjectMaterial(g_Object[7], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    g_Object[8] = CreateDynamicObject(19383, 870.7932, -20.5088, 64.6752, 0.0000, 0.0000, 66.4999); //Perete Usa
    SetDynamicObjectMaterialText(g_Object[8], 0, "EDDYS Immobilie", OBJECT_MATERIAL_SIZE_256x128, "Verdana", 27, 1, 0xFF8B4513, 0xFFF5F5F5, 0);
    g_Object[9] = CreateDynamicObject(19399, 875.2044, -22.4395, 64.6651, 0.0000, 0.0000, 66.5000); //Perete dreapta geam
    SetDynamicObjectMaterialText(g_Object[9], 0, "2023", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 2);
    g_Object[10] = CreateDynamicObject(19353, 876.4948, -14.4286, 64.6548, 0.0000, 0.0000, -22.2000); //Perete2 plin interio
    SetDynamicObjectMaterialText(g_Object[10], 0, "Eddys Welt", OBJECT_MATERIAL_SIZE_256x128, "Arial", 120, 1, 0xFF8B4513, 0xFFF5F5F5, 0);
    g_Object[11] = CreateDynamicObject(19426, 872.9984, -21.4755, 64.6752, 0.0000, 0.0000, 66.3001); //Perete scund mijloc
    SetDynamicObjectMaterialText(g_Object[11], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[12] = CreateDynamicObject(19399, 864.9215, -17.9470, 64.6651, 0.0000, 0.0000, 66.5000); //Perete geam st.
    SetDynamicObjectMaterialText(g_Object[12], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[13] = CreateDynamicObject(19426, 862.7177, -16.9839, 64.6752, 0.0000, 0.0000, 66.3001); //Perete scund stang
    SetDynamicObjectMaterialText(g_Object[13], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[14] = CreateDynamicObject(19353, 865.0748, -9.3472, 64.6651, 0.0000, 0.0000, -23.6000); //Perete plin st.lat.
    SetDynamicObjectMaterialText(g_Object[14], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[15] = CreateDynamicObject(19399, 863.7937, -12.2882, 64.6651, 0.0000, 0.0000, -23.3999); //Perete geam st.lat.
    SetDynamicObjectMaterialText(g_Object[15], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[16] = CreateDynamicObject(19353, 867.1052, -8.4757, 64.6651, 0.0000, 0.0000, 66.3999); //Perete plin spate 1
    SetDynamicObjectMaterialText(g_Object[16], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[17] = CreateDynamicObject(19353, 870.0383, -9.7566, 64.6651, 0.0000, 0.0000, 66.3999); //Perete plin spate 2
    SetDynamicObjectMaterialText(g_Object[17], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[18] = CreateDynamicObject(19353, 872.9616, -11.0340, 64.6651, 0.0000, 0.0000, 66.3999); //Perete plin spate 3
    SetDynamicObjectMaterialText(g_Object[18], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[19] = CreateDynamicObject(19353, 875.8942, -12.3149, 64.6651, 0.0000, 0.0000, 66.3999); //Perete plin spate 4
    SetDynamicObjectMaterialText(g_Object[19], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[20] = CreateDynamicObject(19353, 876.6431, -14.4891, 64.6548, 0.0000, 0.0000, -22.2000); //Perete plin interior
    SetDynamicObjectMaterialText(g_Object[20], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[21] = CreateDynamicObject(19383, 877.5952, -16.5303, 64.6451, 0.0000, 0.0000, 66.4999); //Perete usa interior
    SetDynamicObjectMaterialText(g_Object[21], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[22] = CreateDynamicObject(2802, 879.7423, -16.5384, 63.3133, 0.0000, 0.0000, -105.7995); //masa scaun terasa
    g_Object[23] = CreateDynamicObject(19399, 880.0053, -19.2390, 64.6651, 0.0000, 0.0000, -23.5998); //Perete geam dr.lat.
    SetDynamicObjectMaterialText(g_Object[23], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[24] = CreateDynamicObject(19353, 878.7233, -22.1643, 64.6651, 0.0000, 0.0000, -23.6000); //Perete plin dr.lat
    SetDynamicObjectMaterialText(g_Object[24], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[25] = CreateDynamicObject(19353, 866.4428, -10.1300, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 1 Et.
    SetDynamicObjectMaterial(g_Object[25], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[26] = CreateDynamicObject(19353, 864.0285, -15.6555, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 2 Et.
    SetDynamicObjectMaterial(g_Object[26], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[27] = CreateDynamicObject(19353, 865.2891, -12.7692, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 3 Et.
    SetDynamicObjectMaterial(g_Object[27], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[28] = CreateDynamicObject(19353, 869.3726, -11.4111, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 4 Et.
    SetDynamicObjectMaterial(g_Object[28], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[29] = CreateDynamicObject(19353, 867.9719, -14.6183, 66.3168, 0.0000, -90.0000, 66.3999); //Podea 5 Et.
    SetDynamicObjectMaterial(g_Object[29], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[30] = CreateDynamicObject(19353, 866.9652, -16.8959, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 6 Et.
    SetDynamicObjectMaterial(g_Object[30], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[31] = CreateDynamicObject(19353, 872.3118, -12.6962, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 7.Et.
    SetDynamicObjectMaterial(g_Object[31], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[32] = CreateDynamicObject(19353, 872.9528, -12.9764, 66.3367, 0.0000, -90.0000, 66.3999); //Podea 8.Et.
    SetDynamicObjectMaterial(g_Object[32], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[33] = CreateDynamicObject(19353, 870.9091, -15.8809, 66.3367, 0.0000, -90.0000, 66.3999); //Podea 9.Et.
    SetDynamicObjectMaterial(g_Object[33], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[34] = CreateDynamicObject(19353, 869.9047, -18.1812, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 10.Et.
    SetDynamicObjectMaterial(g_Object[34], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[35] = CreateDynamicObject(19353, 873.9281, -16.9699, 66.3367, 0.0000, -90.0000, 66.3999); //Podea 11.Et.
    SetDynamicObjectMaterial(g_Object[35], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[36] = CreateDynamicObject(19353, 872.8405, -19.4755, 66.3264, 0.0000, -90.0000, 66.3999); //Podea 12.Et.
    SetDynamicObjectMaterial(g_Object[36], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[37] = CreateDynamicObject(19353, 875.7730, -20.7567, 66.3367, 0.0000, -90.0000, 66.3999); //Podea 13.Et.
    SetDynamicObjectMaterial(g_Object[37], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[38] = CreateDynamicObject(19353, 876.9229, -18.1268, 66.3367, 0.0000, -90.0000, 66.3999); //Podea 14.Et.
    SetDynamicObjectMaterial(g_Object[38], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[39] = CreateDynamicObject(19353, 878.4890, -18.8113, 66.3366, 0.0000, -90.0000, 66.3999); //Podea 15.Et.
    SetDynamicObjectMaterial(g_Object[39], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[40] = CreateDynamicObject(19353, 877.3400, -21.4414, 66.3367, 0.0000, -89.6996, 65.9999); //Podea 16.Et.
    SetDynamicObjectMaterial(g_Object[40], 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
    g_Object[41] = CreateDynamicObject(19353, 880.0003, -19.2409, 68.1453, 0.0000, 0.0000, -23.6000); //Zid2 plin.dr.lat.et.
    SetDynamicObjectMaterialText(g_Object[41], 0, "Fern Ridge Catalina", OBJECT_MATERIAL_SIZE_256x128, "Arial Black", 32, 1, 0xFF8B4513, 0xFFF5F5F5, 1);
    g_Object[42] = CreateDynamicObject(1491, 876.8792, -16.2329, 62.9080, 0.0000, 0.0000, -23.5998); //Usa Terasa
    SetDynamicObjectMaterial(g_Object[42], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
    SetDynamicObjectMaterial(g_Object[42], 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    SetDynamicObjectMaterial(g_Object[42], 2, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[42], 3, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
    g_Object[43] = CreateDynamicObject(19353, 876.7374, -14.3226, 68.1453, 0.0000, 0.0000, -23.6000); //Zid int.et.
    SetDynamicObjectMaterialText(g_Object[43], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[44] = CreateDynamicObject(19353, 865.0985, -9.2923, 68.1453, 0.0000, 0.0000, -23.6000); //Zid1 St.lat.et.
    SetDynamicObjectMaterialText(g_Object[44], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[45] = CreateDynamicObject(19353, 862.5285, -15.1752, 68.1453, 0.0000, 0.0000, -23.6000); //Zid2 st.lat.et.
    SetDynamicObjectMaterialText(g_Object[45], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[46] = CreateDynamicObject(19399, 863.8175, -12.2332, 68.1451, 0.0000, 0.0000, -23.3999); //Zid geam st.lat.et.
    SetDynamicObjectMaterialText(g_Object[46], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[47] = CreateDynamicObject(19353, 867.1052, -8.4757, 68.1445, 0.0000, 0.0000, 66.3999); //Zid1 plin spate.et.
    SetDynamicObjectMaterialText(g_Object[47], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[48] = CreateDynamicObject(19353, 870.0194, -9.7488, 68.1445, 0.0000, 0.0000, 66.3999); //Zid2 plin spate.et.
    SetDynamicObjectMaterialText(g_Object[48], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[49] = CreateDynamicObject(19353, 872.9611, -11.0339, 68.1445, 0.0000, 0.0000, 66.3999); //Zid3 plin spate.et.
    SetDynamicObjectMaterialText(g_Object[49], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[50] = CreateDynamicObject(19353, 875.9119, -12.3226, 68.1445, 0.0000, 0.0000, 66.3999); //Zid4 plin spate.et
    SetDynamicObjectMaterialText(g_Object[50], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[51] = CreateDynamicObject(19353, 879.0795, -17.1879, 68.1445, 0.0000, 0.0000, 66.3999); //Zid5 plin spate.et.
    SetDynamicObjectMaterialText(g_Object[51], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[52] = CreateDynamicObject(19353, 876.1519, -15.9195, 68.1445, 0.0000, 0.0000, 66.3999); //Zid6. plin.int.et.
    SetDynamicObjectMaterialText(g_Object[52], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[53] = CreateDynamicObject(19426, 874.2785, -15.1021, 68.1651, 0.0000, 0.0000, 66.3001); //Zid8 scund.int.et.
    SetDynamicObjectMaterialText(g_Object[53], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[54] = CreateDynamicObject(19426, 874.0794, -14.2117, 68.1651, 0.0000, 0.0000, 156.5997); //Zid9 scund.int.et.
    SetDynamicObjectMaterialText(g_Object[54], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[55] = CreateDynamicObject(19426, 873.9146, -14.1405, 68.1651, 0.0000, 0.0000, 156.5997); //Zid10 scund.int.et.
    SetDynamicObjectMaterialText(g_Object[55], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[56] = CreateDynamicObject(19353, 863.4149, -17.2644, 68.1445, 0.0000, 0.0000, 66.3999); //Zid1 plin fata.et.
    SetDynamicObjectMaterialText(g_Object[56], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[57] = CreateDynamicObject(19399, 866.3413, -18.5426, 68.1451, 0.0000, 0.0000, 66.5000); //Zid.geam.et.
    SetDynamicObjectMaterialText(g_Object[57], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[58] = CreateDynamicObject(19353, 869.2714, -19.8229, 68.1445, 0.0000, 0.0000, 66.3999); //Zid2 plin fata.et.
    SetDynamicObjectMaterialText(g_Object[58], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[59] = CreateDynamicObject(19353, 872.2039, -21.1040, 68.1445, 0.0000, 0.0000, 66.3999); //Zid2 plin fata.et.
    SetDynamicObjectMaterialText(g_Object[59], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[60] = CreateDynamicObject(19399, 875.1193, -22.3808, 68.1451, 0.0000, 0.0000, 66.5000); //Zid2 geam.et.
    SetDynamicObjectMaterialText(g_Object[60], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[61] = CreateDynamicObject(19426, 877.4223, -23.3852, 68.1651, 0.0000, 0.0000, 66.3001); //Zid9 scund.int.et.dr
    SetDynamicObjectMaterialText(g_Object[61], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[62] = CreateDynamicObject(19426, 876.9284, -23.1683, 68.1352, 0.0000, 0.0000, 66.3001); //Zid10 scund.int.et.d
    SetDynamicObjectMaterialText(g_Object[62], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[63] = CreateDynamicObject(19383, 870.7973, -20.4995, 64.6752, 0.0000, 0.0000, 66.4999); //Perete Usa parter
    SetDynamicObjectMaterialText(g_Object[63], 0, "EDDYS Immobilie", OBJECT_MATERIAL_SIZE_256x128, "Verdana", 27, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[64] = CreateDynamicObject(19458, 877.5753, -13.0478, 61.1851, 0.0000, 0.0000, 66.3999); //soclu spate dreapta
    SetDynamicObjectMaterial(g_Object[64], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    g_Object[65] = CreateDynamicObject(19376, 867.8598, -13.0333, 69.9692, 0.0000, 90.0000, -23.6000); //Acoperis stanga spat
    SetDynamicObjectMaterial(g_Object[65], 0, 18241, "cw_tempstuffcs_t", "roof11new", 0x00000000);
    SetDynamicObjectMaterial(g_Object[65], 1, 18201, "cw_roofbitcs_t", "aroofbit5", 0x00000000);
    g_Object[66] = CreateDynamicObject(19376, 867.1068, -14.8006, 69.9794, 0.0000, 90.0000, -23.6000); //Acoperis stanga fata
    SetDynamicObjectMaterial(g_Object[66], 0, 18241, "cw_tempstuffcs_t", "roof11new", 0x00000000);
    SetDynamicObjectMaterial(g_Object[66], 1, 18201, "cw_roofbitcs_t", "aroofbit5", 0x00000000);
    g_Object[67] = CreateDynamicObject(19376, 876.6298, -16.8645, 69.9794, 0.0000, 90.0000, -23.6000); //Acoperis dreapta spa
    SetDynamicObjectMaterial(g_Object[67], 0, 18241, "cw_tempstuffcs_t", "roof11new", 0x00000000);
    SetDynamicObjectMaterial(g_Object[67], 1, 18201, "cw_roofbitcs_t", "aroofbit5", 0x00000000);
    g_Object[68] = CreateDynamicObject(19376, 875.8565, -18.6331, 69.9896, 0.0000, 90.0000, -23.6000); //Acoperis dreapta spa
    SetDynamicObjectMaterial(g_Object[68], 0, 18241, "cw_tempstuffcs_t", "roof11new", 0x00000000);
    SetDynamicObjectMaterial(g_Object[68], 1, 18201, "cw_roofbitcs_t", "aroofbit5", 0x00000000);
    g_Object[69] = CreateDynamicObject(19353, 867.8518, -19.2248, 64.6651, 0.0000, 0.0000, 66.3999); //Perete plin st.
    SetDynamicObjectMaterialText(g_Object[69], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[70] = CreateDynamicObject(1689, 871.6812, -16.1471, 71.2079, 0.0000, -0.3998, 154.8999); //Aerisiri Acoperis
    g_Object[71] = CreateDynamicObject(19426, 877.4025, -23.4088, 64.6651, 0.0000, 0.0000, 66.3001); //Perete scund Dr.
    SetDynamicObjectMaterialText(g_Object[71], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[72] = CreateDynamicObject(19376, 868.5543, -14.3093, 69.9595, 0.0000, 90.0000, -23.6000); //Tavan stanga Et.
    SetDynamicObjectMaterialText(g_Object[72], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[73] = CreateDynamicObject(19376, 875.2550, -17.2042, 69.9598, 0.0000, 90.0000, -23.6000); //Tavan dreapta et.
    SetDynamicObjectMaterialText(g_Object[73], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[74] = CreateDynamicObject(1692, 866.7537, -13.8499, 70.8768, 0.0000, 0.0000, 66.2994); //Solar Acoperis stang
    SetDynamicObjectMaterial(g_Object[74], 0, 1692, "moregenroofstuff", "solar_panel_1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[74], 1, 16322, "a51_stores", "wtmetal3", 0x00000000);
    g_Object[75] = CreateDynamicObject(1692, 876.3209, -18.0503, 70.8768, 0.0000, 0.0000, 66.2994); //Solar Acoperis dreap
    SetDynamicObjectMaterial(g_Object[75], 0, 1692, "moregenroofstuff", "solar_panel_1", 0x00000000);
    SetDynamicObjectMaterial(g_Object[75], 1, 16322, "a51_stores", "wtmetal3", 0x00000000);
    g_Object[76] = CreateDynamicObject(1472, 870.3004, -21.5597, 62.5452, 0.0000, 0.0000, -23.8999); //Scari intrare
    g_Object[77] = CreateDynamicObject(1649, 875.1544, -22.4470, 64.7751, 0.0000, 0.0000, -23.5998); //Geam parter dr.
    g_Object[78] = CreateDynamicObject(1474, 870.3695, -21.3556, 64.4141, 0.0000, 0.0000, -22.8999); //Acoperis intrare
    g_Object[79] = CreateDynamicObject(3850, 880.4273, -14.2243, 63.4359, 0.0000, 0.0000, 66.5000); //Gard1 sticla spate
    g_Object[80] = CreateDynamicObject(3850, 877.2816, -12.8563, 63.4359, 0.0000, 0.0000, 66.5000); //Gard2 sticla spate
    g_Object[81] = CreateDynamicObject(3850, 881.2979, -16.4918, 63.4356, 0.0000, 0.0000, -23.6000); //Gard3 sticla lateral
    g_Object[82] = CreateDynamicObject(19383, 877.5808, -16.5669, 64.6451, 0.0000, 0.0000, 66.4999); //Perete usa interior
    SetDynamicObjectMaterialText(g_Object[82], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[83] = CreateDynamicObject(19353, 876.5556, -14.4651, 64.6548, 0.0000, 0.0000, -23.2000); //Perete plin int.ascu
    SetDynamicObjectMaterialText(g_Object[83], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[84] = CreateDynamicObject(19353, 876.6937, -14.5242, 64.6548, 0.0000, 0.0000, -23.2000); //Perete plin int.ascu
    SetDynamicObjectMaterialText(g_Object[84], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[85] = CreateDynamicObject(19426, 879.7769, -17.5270, 64.6651, 0.0000, 0.0000, 66.3001); //Perete scund interi
    SetDynamicObjectMaterialText(g_Object[85], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[86] = CreateDynamicObject(19353, 876.7531, -14.3863, 64.6548, 0.0000, 0.0000, -23.2000); //Perete plin int.ascu
    SetDynamicObjectMaterialText(g_Object[86], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[87] = CreateDynamicObject(1649, 875.1544, -22.4470, 64.7751, 0.0000, 0.0000, 156.8997); //Geam2 parter.dr.
    g_Object[88] = CreateDynamicObject(1649, 864.8989, -17.9426, 64.7751, 0.0000, 0.0000, 156.3997); //Geam4 parter.st.
    g_Object[89] = CreateDynamicObject(1649, 864.9008, -17.9671, 64.7751, 0.0000, 0.0000, -23.5998); //Geam3 parter.st.
    g_Object[90] = CreateDynamicObject(19353, 863.2957, -17.2124, 68.1445, 0.0000, 0.0000, 66.3999); //Zid1 plin fata.et.
    SetDynamicObjectMaterialText(g_Object[90], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[91] = CreateDynamicObject(1649, 866.2728, -18.5431, 68.1949, 0.0000, 0.0000, 156.3997); //Geam5 Et.st.int.
    g_Object[92] = CreateDynamicObject(1649, 875.0239, -22.3665, 68.1949, 0.0000, 0.0000, 156.3997); //Geam6 et.dr.int.
    g_Object[93] = CreateDynamicObject(1649, 866.0993, -18.4692, 67.5251, 0.0000, 0.0000, -23.5998); //Geam7 et.st.ext.
    g_Object[94] = CreateDynamicObject(1649, 875.0233, -22.3687, 67.5251, 0.0000, 0.0000, -23.5998); //Geam8 et.dr.ext.
    g_Object[95] = CreateDynamicObject(1649, 863.7683, -12.2847, 64.5836, 0.0000, 0.0000, -113.5998); //Geam9 ext.lat.st.
    g_Object[96] = CreateDynamicObject(1649, 879.6510, -20.0872, 64.5836, 0.0000, 0.0000, -113.5998); //Geam10 int.lat.dr.
    g_Object[97] = CreateDynamicObject(1649, 863.7683, -12.2847, 64.5836, 0.0000, 0.0000, 66.5998); //Geam11 int.lat.st.
    g_Object[98] = CreateDynamicObject(1649, 879.6956, -19.9727, 64.5836, 0.0000, 0.0000, 66.5998); //Geam12 ext.lat.dr.
    g_Object[99] = CreateDynamicObject(1649, 863.7500, -12.2770, 67.4934, 0.0000, 0.0000, -113.5998); //Geam13 ext.lat.st.
    g_Object[100] = CreateDynamicObject(1649, 863.7683, -12.2847, 68.1632, 0.0000, 0.0000, 66.5998); //Geam14 int.lat.st.
    g_Object[101] = CreateDynamicObject(19353, 878.7233, -22.1643, 68.1453, 0.0000, 0.0000, -23.6000); //Zid1 plin dr.lat.et.
    SetDynamicObjectMaterialText(g_Object[101], 0, "Villa", OBJECT_MATERIAL_SIZE_256x128, "Georgia", 60, 1, 0xFF8B4513, 0xFFF5F5F5, 2);
    g_Object[102] = CreateDynamicObject(1491, 870.0863, -20.1840, 62.9379, 0.0000, 0.0000, -23.5998); //Usa intrare
    SetDynamicObjectMaterial(g_Object[102], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
    SetDynamicObjectMaterial(g_Object[102], 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    SetDynamicObjectMaterial(g_Object[102], 2, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[102], 3, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
    g_Object[103] = CreateDynamicObject(19353, 878.7050, -22.1562, 68.1453, 0.0000, 0.0000, -23.6000); //Zid1 plin dr.lat.et.
    SetDynamicObjectMaterialText(g_Object[103], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[104] = CreateDynamicObject(19353, 879.9818, -19.2327, 68.1453, 0.0000, 0.0000, -23.6000); //Zid2 plin.dr.lat.et.
    SetDynamicObjectMaterialText(g_Object[104], 0, "Fern Ridge Catalina", OBJECT_MATERIAL_SIZE_256x128, "Arial Black", 32, 1, 0xFFF5F5F5, 0xFFF5F5F5, 1);
    g_Object[105] = CreateDynamicObject(2272, 866.7086, -19.3796, 62.0853, 0.0000, 0.0000, -23.2000); //Aerisire beci1
    SetDynamicObjectMaterial(g_Object[105], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    SetDynamicObjectMaterial(g_Object[105], 1, 13724, "docg01_lahills", "glassblock4_law", 0x00000000);
    g_Object[106] = CreateDynamicObject(2272, 874.2318, -22.6690, 62.0951, 0.0000, 0.0000, -23.2000); //Aerisire beci2
    SetDynamicObjectMaterial(g_Object[106], 0, 12855, "cunte_cop", "ws_bigstones", 0x00000000);
    SetDynamicObjectMaterial(g_Object[106], 1, 13724, "docg01_lahills", "glassblock4_law", 0x00000000);
    g_Object[107] = CreateDynamicObject(19353, 874.0598, -11.5143, 68.1445, 0.0000, 0.0000, 66.3999); //Zid3 plin spate.et.
    SetDynamicObjectMaterialText(g_Object[107], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[108] = CreateDynamicObject(19445, 890.9937, -19.0436, 64.1753, 0.0000, 0.0000, 66.2994); //Zid garaj spate
    SetDynamicObjectMaterialText(g_Object[108], 0, "Rosalife", OBJECT_MATERIAL_SIZE_256x128, "Arial", 70, 1, 0xFFF5F5F5, 0xFFF5F5F5, 1);
    g_Object[109] = CreateDynamicObject(367, 877.3673, -24.0417, 69.3843, 0.0000, 13.1000, -172.3000); //camera
    g_Object[110] = CreateDynamicObject(19376, 888.6505, -23.1861, 65.6620, 0.0000, 90.0998, -23.7000); //Acoperis garaj
    SetDynamicObjectMaterial(g_Object[110], 0, 1692, "moregenroofstuff", "solar_panel_1", 0x00000000);
    g_Object[111] = CreateDynamicObject(19445, 893.4483, -25.3409, 64.1651, 0.0000, 0.0000, -23.7000); //Zid dr.garaj.rosalif
    SetDynamicObjectMaterialText(g_Object[111], 0, "Rosalife", OBJECT_MATERIAL_SIZE_256x128, "Arial", 70, 1, 0xFF8B4513, 0xFFF5F5F5, 1);
    g_Object[112] = CreateDynamicObject(19353, 885.2133, -18.1641, 64.1752, 0.0000, 0.0000, -23.7999); //Zid1 stanga.garaj
    SetDynamicObjectMaterialText(g_Object[112], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[113] = CreateDynamicObject(19353, 882.6348, -24.0107, 64.1752, 0.0000, 0.0000, -23.7999); //Zid2 stanga.garaj
    SetDynamicObjectMaterialText(g_Object[113], 0, "Rosa Reloaded", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFF8B4513, 0xFFF5F5F5, 1);
    g_Object[114] = CreateDynamicObject(19383, 883.9315, -21.0939, 64.1731, 0.0000, 0.0000, -23.6998); //Zid stanga usa Garaj
    SetDynamicObjectMaterialText(g_Object[114], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[115] = CreateDynamicObject(19445, 890.1879, -18.6900, 64.1753, 0.0000, 0.0000, 66.2994); //Zid garaj spate
    SetDynamicObjectMaterialText(g_Object[115], 0, "Rosalife", OBJECT_MATERIAL_SIZE_256x128, "Arial", 70, 1, 0xFFF5F5F5, 0xFFF5F5F5, 1);
    g_Object[116] = CreateDynamicObject(19445, 893.4226, -25.2751, 64.1548, 0.0000, 0.0000, -23.7000); //Zid dreapta garaj
    SetDynamicObjectMaterialText(g_Object[116], 0, "Rosalife", OBJECT_MATERIAL_SIZE_256x128, "Arial", 70, 1, 0xFFF5F5F5, 0xFFF5F5F5, 1);
    g_Object[117] = CreateDynamicObject(19445, 886.4509, -27.4249, 64.1753, 0.0000, 0.0000, 66.2994); //Usa1 garaj
    SetDynamicObjectMaterial(g_Object[117], 0, 3603, "bevmans01_la", "garagedoor4_law", 0x00000000);
    g_Object[118] = CreateDynamicObject(19445, 887.0692, -27.7073, 64.1651, 0.0000, 0.0000, 66.2994); //Usa2 garaj
    SetDynamicObjectMaterial(g_Object[118], 0, 3603, "bevmans01_la", "garagedoor4_law", 0x00000000);
    g_Object[119] = CreateDynamicObject(11721, 883.3956, -22.8320, 63.0315, 0.0000, 0.0000, 66.1996); //Radiator1
    g_Object[120] = CreateDynamicObject(19353, 882.6118, -24.0879, 64.1752, 0.0000, 0.0000, -23.7999); //Zid3 stanga.garaj
    SetDynamicObjectMaterialText(g_Object[120], 0, "Life", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 2);
    g_Object[121] = CreateDynamicObject(19376, 888.6580, -23.1270, 62.3708, 0.0996, 89.5998, -23.5000); //Sapa Garaj
    SetDynamicObjectMaterial(g_Object[121], 0, 9301, "gazsfn2", "Bow_Smear_Cement", 0x00000000);
    g_Object[122] = CreateDynamicObject(19376, 888.6505, -23.1861, 65.5718, 0.0000, 90.0998, -23.7000); //Acoperis garaj int.
    SetDynamicObjectMaterial(g_Object[122], 0, 19004, "roundbuilding1", "stonewalltile4", 0xFFFFFAFA);
    g_Object[123] = CreateDynamicObject(1491, 884.2199, -20.3787, 62.4280, 0.0000, 0.0000, -112.8998); //Usa Garaj
    SetDynamicObjectMaterial(g_Object[123], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
    SetDynamicObjectMaterial(g_Object[123], 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    SetDynamicObjectMaterial(g_Object[123], 2, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[123], 3, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
    g_Object[124] = CreateDynamicObject(19627, 888.9030, -26.0505, 62.4719, 0.0000, 0.0000, 0.0000); //Wrench1
    g_Object[125] = CreateDynamicObject(2921, 877.9597, -23.7287, 69.0753, 0.0000, 0.0000, 45.0000); //Camera 1
    SetDynamicObjectMaterial(g_Object[125], 1, 10101, "2notherbuildsfe", "sl_vicwall02", 0x00000000);
    SetDynamicObjectMaterial(g_Object[125], 2, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
    g_Object[126] = CreateDynamicObject(1622, 862.2163, -17.3152, 69.2826, 0.0000, -24.3999, 100.3000); //nt_securecam2_01
    g_Object[127] = CreateDynamicObject(367, 862.1558, -17.5848, 69.0790, 0.0000, 31.3999, -47.5998); //camera
    g_Object[128] = CreateDynamicObject(19376, 881.0526, -30.2749, 61.7551, 6.8000, 89.5998, -23.5000); //sapa garaj ext.
    SetDynamicObjectMaterial(g_Object[128], 0, 9301, "gazsfn2", "Bow_Smear_Cement", 0x00000000);
    g_Object[129] = CreateDynamicObject(19376, 884.9199, -31.9612, 61.7887, 6.6999, 88.3000, -23.5000); //sapa2 garaj ext.
    SetDynamicObjectMaterial(g_Object[129], 0, 9301, "gazsfn2", "Bow_Smear_Cement", 0x00000000);
    g_Object[130] = CreateDynamicObject(19376, 884.8449, -21.4682, 62.3218, 0.0996, 89.5998, -23.5000); //Sapa Garaj
    SetDynamicObjectMaterial(g_Object[130], 0, 9301, "gazsfn2", "Bow_Smear_Cement", 0x00000000);
    g_Object[131] = CreateDynamicObject(19815, 882.9713, -23.5114, 64.3497, 0.0000, 0.0000, 66.1996); //ToolBoard1
    g_Object[132] = CreateDynamicObject(2063, 885.3424, -18.8082, 63.2876, 0.0000, 0.0000, 66.4000); //CJ_GREENSHELVES
    g_Object[133] = CreateDynamicObject(19899, 893.7946, -20.9227, 62.3843, 0.0000, 0.0000, -113.0000); //ToolCabinet1
    g_Object[134] = CreateDynamicObject(19900, 893.9171, -20.9552, 63.5638, 0.0000, 0.0000, -23.1000); //ToolCabinet2
    g_Object[135] = CreateDynamicObject(19900, 894.5795, -21.2376, 63.5638, 0.0000, 0.0000, -23.1000); //ToolCabinet2
    g_Object[136] = CreateDynamicObject(19872, 886.8023, -23.7306, 60.6805, 0.0000, 0.0000, -22.0998); //CarFixerRamp2
    g_Object[137] = CreateDynamicObject(2007, 887.1760, -18.0436, 62.4090, 0.0000, 0.0000, -23.8999); //filing_cab_nu01
    g_Object[138] = CreateDynamicObject(2007, 887.1760, -18.0436, 63.8087, 0.0000, 0.0000, -23.8999); //filing_cab_nu01
    g_Object[139] = CreateDynamicObject(2007, 888.0723, -18.4407, 63.8087, 0.0000, 0.0000, -23.8999); //filing_cab_nu01
    g_Object[140] = CreateDynamicObject(2007, 888.0723, -18.4407, 62.4090, 0.0000, 0.0000, -23.8999); //filing_cab_nu01
    g_Object[141] = CreateDynamicObject(1550, 886.1389, -17.2562, 62.7812, 0.0000, 0.0000, -122.5998); //CJ_MONEY_BAG
    g_Object[142] = CreateDynamicObject(1080, 892.1832, -27.5958, 64.0017, 0.0000, 0.0000, 156.2998); //wheel_sr5
    g_Object[143] = CreateDynamicObject(1080, 891.7055, -28.7077, 64.0017, 0.0000, 0.0000, 156.2998); //wheel_sr5
    g_Object[144] = CreateDynamicObject(1080, 892.6665, -26.4969, 64.0017, 0.0000, 0.0000, 156.2998); //wheel_sr5
    g_Object[145] = CreateDynamicObject(1080, 893.1453, -25.4074, 64.0017, 0.0000, 0.0000, 156.2998); //wheel_sr5
    g_Object[146] = CreateDynamicObject(19835, 891.0269, -22.9160, 63.6823, 0.0000, 0.0000, 0.0000); //CoffeeCup1
    g_Object[147] = CreateDynamicObject(14532, 888.6931, -25.4836, 63.4519, 0.0000, 0.0000, -175.5997); //tv_stand_driv
    g_Object[148] = CreateDynamicObject(19087, 888.7791, -25.1993, 63.9179, -0.4000, -60.7000, 44.8997); //Rope1
    SetDynamicObjectMaterial(g_Object[148], 0, 14805, "bdupsfurn", "blacksofa01", 0x00000000);
    g_Object[149] = CreateDynamicObject(1019, 885.0239, -18.8204, 63.2643, 0.0000, 0.0000, 0.0000); //exh_b_t
    g_Object[150] = CreateDynamicObject(19898, 889.4879, -26.7000, 62.4818, 0.0000, -0.5000, 7.1998); //OilFloorStain1
    g_Object[151] = CreateDynamicObject(18633, 888.7138, -26.5016, 62.4794, 0.3998, 93.0998, 0.0000); //GTASAWrench1
    g_Object[152] = CreateDynamicObject(18648, 889.9907, -24.6240, 62.6039, 0.0000, 0.0000, -23.7999); //BlueNeonTube1
    g_Object[153] = CreateDynamicObject(2181, 888.9915, -18.8036, 62.4569, 0.0000, 0.0000, -23.7000); //MED_OFFICE5_DESK_2
    g_Object[154] = CreateDynamicObject(1671, 889.1671, -19.5361, 62.8829, 0.0000, 0.0000, 164.3999); //swivelchair_A
    g_Object[155] = CreateDynamicObject(19917, 890.8682, -19.6413, 62.4398, 0.0000, 0.0000, -23.8999); //CutsceneEngine1
    g_Object[156] = CreateDynamicObject(2062, 892.2127, -20.3197, 63.0144, 0.0000, 0.0000, 0.0000); //CJ_OilDrum2
    g_Object[157] = CreateDynamicObject(19621, 892.1013, -20.2691, 63.6226, 0.0000, 0.0000, -88.6996); //OilCan1
    g_Object[158] = CreateDynamicObject(19898, 891.0521, -19.8038, 62.4808, 0.0000, -0.6000, -32.0998); //OilFloorStain1
    g_Object[159] = CreateDynamicObject(1010, 885.0039, -19.5687, 64.0858, 0.0000, 0.0000, 65.2994); //nto_b_tw
    g_Object[160] = CreateDynamicObject(1060, 885.3363, -18.9617, 63.6819, 0.0000, 0.0000, -114.5998); //spl_c_st_r
    g_Object[161] = CreateDynamicObject(1018, 884.8366, -18.1511, 64.1333, 0.0000, 0.0000, 105.0998); //exh_b_ts
    g_Object[162] = CreateDynamicObject(11736, 885.8073, -17.8358, 63.6828, 0.0000, 0.0000, -102.6996); //MedicalSatchel1
    g_Object[163] = CreateDynamicObject(2690, 885.5969, -18.3162, 62.8791, -90.3999, 3.9999, 153.4001); //CJ_FIRE_EXT
    g_Object[164] = CreateDynamicObject(2961, 884.4022, -20.2322, 63.8813, 0.0000, 0.0000, 68.4999); //fire_break
    g_Object[165] = CreateDynamicObject(2953, 888.7542, -19.0055, 63.2658, 0.0000, 0.0000, 0.0000); //kmb_paper_code
    g_Object[166] = CreateDynamicObject(18648, 891.6019, -25.3341, 62.6039, 0.0000, 0.0000, -23.7999); //BlueNeonTube1
    g_Object[167] = CreateDynamicObject(1115, 892.5357, -27.0263, 62.9514, 0.0000, 0.0000, 66.1996); //fbb_lr_slv1
    g_Object[168] = CreateDynamicObject(2267, 891.6021, -19.4489, 64.6623, 0.0000, 0.0000, -23.6998); //Tablou 1
    SetDynamicObjectMaterial(g_Object[168], 1, 11301, "carshow_sfse", "ws_Transfender_dirty", 0x00000000);
    g_Object[169] = CreateDynamicObject(3082, 891.7929, -19.8882, 62.6385, 0.0000, 0.0000, 0.0000); //ammo_capsule
    g_Object[170] = CreateDynamicObject(2559, 864.0650, -12.9420, 64.2356, 0.0000, 0.0000, 66.5998); //perdea geam lat et.
    g_Object[171] = CreateDynamicObject(1013, 892.5709, -27.0268, 63.2159, 0.0000, 0.0000, 67.1996); //lgt_b_rspt
    g_Object[172] = CreateDynamicObject(1182, 892.1599, -27.8390, 64.7042, 0.0000, 0.0000, 65.6996); //fbmp_lr_bl1
    g_Object[173] = CreateDynamicObject(1045, 893.8964, -22.7609, 64.7965, 91.4000, -89.9998, -25.2000); //exh_c_f
    g_Object[174] = CreateDynamicObject(11721, 863.9569, -12.2882, 63.5620, 0.0000, 0.0000, 66.5998); //Radiator buc.
    SetDynamicObjectMaterial(g_Object[174], 1, 7978, "vgssairport", "newall16white", 0x00000000);
    g_Object[175] = CreateDynamicObject(19383, 874.7186, -18.6494, 64.6451, 0.0000, 0.0000, 156.4998); //Perete usa interior
    SetDynamicObjectMaterialText(g_Object[175], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[176] = CreateDynamicObject(19426, 873.7666, -20.8525, 64.6651, 0.0000, 0.0000, 157.1000); //Perete scund int.cen
    SetDynamicObjectMaterialText(g_Object[176], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[177] = CreateDynamicObject(19426, 875.5935, -16.6082, 64.6752, 0.0000, 0.0000, 157.1000); //Perete scund int.cen
    SetDynamicObjectMaterialText(g_Object[177], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[178] = CreateDynamicObject(1491, 874.9791, -17.9636, 62.8978, 0.0000, 0.0000, -112.8998); //usa int.perter
    SetDynamicObjectMaterial(g_Object[178], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
    SetDynamicObjectMaterial(g_Object[178], 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    SetDynamicObjectMaterial(g_Object[178], 2, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[178], 3, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
    g_Object[179] = CreateDynamicObject(19383, 872.3441, -17.7912, 68.1452, 0.0000, 0.0000, 156.4998); //Zid usa.int.et.
    SetDynamicObjectMaterialText(g_Object[179], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[180] = CreateDynamicObject(19426, 873.2910, -15.6040, 68.1651, 0.0000, 0.0000, 157.1000); //Perete scund int.cen
    SetDynamicObjectMaterialText(g_Object[180], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[181] = CreateDynamicObject(19426, 871.4677, -19.8166, 68.1651, 0.0000, 0.0000, 157.1000); //zid scund int.et.
    SetDynamicObjectMaterialText(g_Object[181], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[182] = CreateDynamicObject(1491, 872.6237, -17.1105, 66.3980, 0.0000, 0.0000, -112.8998); //usa int.baie
    SetDynamicObjectMaterial(g_Object[182], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
    SetDynamicObjectMaterial(g_Object[182], 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    SetDynamicObjectMaterial(g_Object[182], 2, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(g_Object[182], 3, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
    g_Object[183] = CreateDynamicObject(2559, 864.0559, -12.9384, 67.7257, 0.0000, 0.0000, 66.5998); //perdea geam lat.et.
    g_Object[184] = CreateDynamicObject(2559, 867.0410, -18.2763, 67.7220, 0.0000, 0.0000, 156.6002); //Perdea geam fata.et.
    g_Object[185] = CreateDynamicObject(2559, 875.7974, -22.0874, 67.7220, 0.0000, 0.0000, 156.6002); //Perdea geam fata.et.
    g_Object[186] = CreateDynamicObject(2559, 875.8704, -22.1954, 64.2220, 0.0000, 0.0000, 156.6002); //Perdea geam.fata.par
    g_Object[187] = CreateDynamicObject(2559, 865.5802, -17.6763, 64.2220, 0.0000, 0.0000, 156.6002); //Perdea geam.fata.par
    g_Object[188] = CreateDynamicObject(2559, 879.7691, -18.5384, 64.2154, 0.0000, 0.0000, -113.5998); //Perdea.lat.dr.part.
    g_Object[189] = CreateDynamicObject(2559, 864.3225, -18.0739, 64.2123, 0.0000, 0.0000, -23.2996); //Perdea.ext.fata.
    g_Object[190] = CreateDynamicObject(2559, 874.6530, -22.5013, 64.2123, 0.0000, 0.0000, -23.2996); //Perdea.ext.fata.
    g_Object[191] = CreateDynamicObject(2559, 874.5603, -22.4395, 67.7220, 0.0000, 0.0000, -23.2996); //Perdea.ext.et.
    g_Object[192] = CreateDynamicObject(2559, 865.8170, -18.5755, 67.7123, 0.0000, 0.0000, -23.2996); //Perdea.ext.et.
    g_Object[193] = CreateDynamicObject(2559, 863.7404, -11.7152, 64.2356, 0.0000, 0.0000, -113.1996); //Perdea.ext.lat.st.
    g_Object[194] = CreateDynamicObject(2559, 863.7401, -11.7152, 67.7256, 0.0000, 0.0000, -113.1996); //Perdea.ext.lat.st.
    g_Object[195] = CreateDynamicObject(2559, 880.0833, -19.7658, 64.2154, 0.0000, 0.0000, 66.3999); //Perdea.lat.dr.part.
    g_Object[196] = CreateDynamicObject(18727, 877.7343, -13.6735, 61.5457, 0.0000, 0.0000, -20.8999); //smoke50lit
    g_Object[197] = CreateDynamicObject(19426, 879.8115, -17.4983, 64.6651, 0.0000, 0.0000, 66.3001); //Perete scund interio
    SetDynamicObjectMaterialText(g_Object[197], 0, "Mpower740", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFF5F5F5, 0xFFF5F5F5, 0);
    g_Object[198] = CreateDynamicObject(19776, 880.1024, -16.6958, 63.6557, 0.0000, 0.0000, 0.0000); //fbi terasa
    g_Object[199] = CreateDynamicObject(19831, 877.5761, -13.7461, 62.8987, 0.0000, 0.0000, 66.8000); //gratar terasa
    g_Object[200] = CreateDynamicObject(2805, 877.2625, -14.5206, 63.0623, 0.0000, 0.0000, 60.7000); //carne terasa
    g_Object[201] = CreateDynamicObject(1665, 879.8718, -16.7970, 63.6785, 0.0000, 0.0000, 0.0000); //tigari terasa
    g_Object[202] = CreateDynamicObject(19882, 877.4948, -13.9004, 63.7359, 0.0000, 0.0000, 0.0000); //carne terasa 2
    g_Object[203] = CreateDynamicObject(19882, 877.5750, -13.6702, 63.7359, 0.0000, 0.0000, 74.3999); //carne terasa 2
    g_Object[204] = CreateDynamicObject(19882, 877.7249, -13.8934, 63.7359, 0.0000, 0.0000, 133.2998); //carne terasa 2
    g_Object[205] = CreateDynamicObject(19573, 878.2075, -13.4019, 62.9458, 0.0000, 0.0000, -19.0000); //carbun terasa
    g_Object[206] = CreateDynamicObject(2263, 879.6361, -16.7831, 64.4959, 0.0000, 0.0000, 156.6000); //Tablou terasa
    g_Object[207] = CreateDynamicObject(11706, 876.7487, -15.7665, 62.9277, 0.0000, 0.0000, 157.7998); //cos terasa
    g_Object[208] = CreateDynamicObject(1664, 879.6323, -16.8474, 63.7994, 0.0000, 0.0000, 0.0000); //vin terasa
    g_Object[209] = CreateDynamicObject(1667, 879.7235, -16.9960, 63.7518, 0.0000, 0.0000, 0.0000); //pahar terasa
    g_Object[210] = CreateDynamicObject(2135, 877.7838, -22.9312, 62.9770, 0.0000, 0.0000, -113.5000); //buc.2
    g_Object[211] = CreateDynamicObject(2263, 877.3264, -14.5593, 64.4757, 0.0000, 0.0000, 66.6996); //Tablou2 terasa
    SetDynamicObjectMaterial(g_Object[211], 0, 14489, "carlspics", "AH_landscap1", 0x00000000);
    g_Object[212] = CreateDynamicObject(19830, 878.8206, -21.1721, 64.0149, 0.0000, 0.0000, -114.3998); //Blender1
    g_Object[213] = CreateDynamicObject(16779, 877.1834, -19.6322, 66.2360, 0.0000, 0.0000, 69.0998); //ventilator buc
    g_Object[214] = CreateDynamicObject(2136, 878.4605, -21.3514, 62.9696, 0.0000, 0.0000, -112.7994); //buc.3
    g_Object[215] = CreateDynamicObject(1968, 878.9893, -18.1380, 63.4859, 0.0000, 0.0000, -22.9999); //masa scaune buc.
    SetDynamicObjectMaterial(g_Object[215], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    SetDynamicObjectMaterial(g_Object[215], 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    g_Object[216] = CreateDynamicObject(2140, 878.8394, -20.4447, 62.9359, 0.0000, 0.0000, -113.4999); //buc.1
    g_Object[217] = CreateDynamicObject(11743, 878.6870, -21.5223, 64.0018, 0.0000, 0.0000, -115.1996); //MCoffeeMachine1
    g_Object[218] = CreateDynamicObject(11737, 870.5739, -20.9762, 62.9552, 0.0000, 0.0000, -18.8999); //covor usa intrare
    g_Object[219] = CreateDynamicObject(11735, 871.5772, -21.1986, 62.1753, 0.0000, 0.0000, -27.6998); //WBoot1
    g_Object[220] = CreateDynamicObject(11735, 871.4447, -21.1291, 62.1753, 0.0000, 0.0000, -27.6998); //WBoot1
    g_Object[221] = CreateDynamicObject(11728, 871.7536, -20.9340, 64.2920, 0.0000, 0.0000, -21.6000); //PaperChasePhone1
    g_Object[222] = CreateDynamicObject(1775, 874.2866, -21.0680, 64.0231, 0.0000, 0.0000, 66.0998); //CJ_SPRUNK1
    g_Object[223] = CreateDynamicObject(1808, 874.4688, -19.9354, 62.9384, 0.0000, 0.0000, 66.0000); //CJ_WATERCOOLER2
    g_Object[224] = CreateDynamicObject(11685, 865.6030, -9.7285, 62.9570, 0.0000, 0.0000, 66.4000); //CutsceneCouch4
    g_Object[225] = CreateDynamicObject(11721, 875.6016, -16.9790, 63.6920, 0.0000, 0.0000, 66.5998); //Radiator buc.
    SetDynamicObjectMaterial(g_Object[225], 1, 7978, "vgssairport", "newall16white", 0x00000000);
    g_Object[226] = CreateDynamicObject(1736, 870.6088, -20.8784, 66.7553, 0.0000, 0.0000, -21.8999); //CJ_Stags_head
    g_Object[227] = CreateDynamicObject(19829, 875.1657, -17.8483, 64.4960, 0.0000, 0.0000, 67.1996); //LightSwitch3On
    g_Object[228] = CreateDynamicObject(1817, 866.6240, -11.3170, 62.9407, 0.0000, 0.0000, -24.1000); //COFFEE_MED_2
    SetDynamicObjectMaterial(g_Object[228], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    g_Object[229] = CreateDynamicObject(11685, 867.0886, -9.1708, 62.9570, 0.0000, 0.0000, -23.4999); //CutsceneCouch4
    g_Object[230] = CreateDynamicObject(2292, 866.0484, -8.7107, 62.9471, 0.0000, 0.0000, -23.8999); //SWK_SINGLE_1b
    g_Object[231] = CreateDynamicObject(11685, 868.2719, -9.6850, 62.9570, 0.0000, 0.0000, -23.4999); //CutsceneCouch4
    g_Object[232] = CreateDynamicObject(2292, 865.1433, -10.7586, 62.9471, 0.0000, 0.0000, 66.0998); //SWK_SINGLE_1b
    g_Object[233] = CreateDynamicObject(2292, 869.2858, -10.1173, 62.9471, 0.0000, 0.0000, -112.5998); //SWK_SINGLE_1b
    g_Object[234] = CreateDynamicObject(2004, 875.3900, -12.1962, 63.5316, 0.0000, 0.0000, -24.0000); //cr_safe_door
    g_Object[235] = CreateDynamicObject(2059, 867.1165, -10.8332, 63.0657, 0.0000, 0.0000, -14.6997); //CJ_GUNSTUFF1
    g_Object[236] = CreateDynamicObject(2816, 867.5855, -11.1485, 63.0755, 0.0000, 0.0000, 146.7998); //gb_bedmags01
    g_Object[237] = CreateDynamicObject(2047, 867.9451, -8.9551, 64.7854, 0.0000, 0.0000, -23.5000); //CJ_FLAG1
    g_Object[238] = CreateDynamicObject(1828, 867.3986, -11.1976, 62.9356, 0.0000, 0.0000, 0.0000); //man_sdr_rug
    g_Object[239] = CreateDynamicObject(1670, 867.3848, -10.9673, 63.4729, 0.0000, 0.0000, 0.0000); //propcollecttable
    g_Object[240] = CreateDynamicObject(2295, 869.4193, -12.2524, 62.8278, 0.0000, 0.0000, -141.0001); //CJ_BEANBAG
    g_Object[241] = CreateDynamicObject(2295, 867.9151, -12.7999, 62.8278, 0.0000, 0.0000, -173.6002); //CJ_BEANBAG
    g_Object[242] = CreateDynamicObject(19632, 868.4003, -18.9533, 62.9846, 0.0000, 0.0000, -21.7999); //FireWood1
    g_Object[243] = CreateDynamicObject(11724, 868.3424, -19.0494, 63.4760, 0.0000, 0.0000, 155.9001); //FireplaceSurround1
    SetDynamicObjectMaterial(g_Object[243], 1, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
    SetDynamicObjectMaterial(g_Object[243], 2, 4811, "beach_las", "sandstonemixb", 0x00000000);
    g_Object[244] = CreateDynamicObject(2313, 865.8707, -17.5498, 62.9444, 0.2998, 0.0000, 157.0997); //CJ_TV_TABLE1
    SetDynamicObjectMaterial(g_Object[244], 2, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
    g_Object[245] = CreateDynamicObject(2232, 862.6840, -16.3183, 63.5339, 0.0000, 0.0000, 121.2995); //MED_SPEAKER_4
    g_Object[246] = CreateDynamicObject(19786, 865.1762, -17.4813, 64.1753, 0.0000, 0.0000, 161.9998); //LCDTVBig1
    SetDynamicObjectMaterial(g_Object[246], 1, 19173, "samppictures", "samppicture1", 0x00000000);
    g_Object[247] = CreateDynamicObject(19579, 865.1588, -17.3672, 63.5555, 0.0996, -178.7998, -18.2999); //BreadLoaf1
    SetDynamicObjectMaterial(g_Object[247], 0, 8391, "ballys01", "CJ_blackplastic", 0x00000000);
    g_Object[248] = CreateDynamicObject(2232, 873.1336, -20.8551, 63.5441, 0.0000, 0.0000, -160.9998); //MED_SPEAKER_4
    g_Object[249] = CreateDynamicObject(2232, 876.4141, -13.1555, 63.5541, 0.0000, 0.0000, -94.6996); //MED_SPEAKER_4
    g_Object[250] = CreateDynamicObject(3100, 871.0609, -13.9679, 63.8757, -14.8999, -71.2995, 4.4998); //k_poolballspt02
    g_Object[251] = CreateDynamicObject(1550, 874.8419, -13.8500, 63.3045, 0.0000, 0.0000, 36.7999); //CJ_MONEY_BAG
    g_Object[252] = CreateDynamicObject(1550, 875.3726, -13.9462, 63.3045, 0.0000, 0.0000, -154.3000); //CJ_MONEY_BAG
    g_Object[253] = CreateDynamicObject(2964, 871.1898, -13.6412, 62.9454, 0.0000, 0.0000, 64.5000); //k_pooltablesm
    SetDynamicObjectMaterial(g_Object[253], 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
    g_Object[254] = CreateDynamicObject(3104, 871.3743, -13.5288, 63.8759, 54.4000, 0.0000, 0.0000); //k_poolballspt06
    g_Object[255] = CreateDynamicObject(2083, 874.9688, -16.1382, 62.9262, 0.0000, 0.0000, -113.8998); //COFFEE_MED_4
    g_Object[256] = CreateDynamicObject(2995, 870.9489, -13.4602, 63.8757, 0.0000, 0.0000, 0.0000); //k_poolballstp01
    g_Object[257] = CreateDynamicObject(338, 871.1469, -14.0607, 63.8810, -94.0998, 0.0000, 0.0000); //poolcue
    g_Object[258] = CreateDynamicObject(338, 871.5432, -13.2658, 63.8987, -94.0998, 0.0000, 139.1000); //poolcue
    g_Object[259] = CreateDynamicObject(19793, 867.3858, -18.5711, 63.0357, 0.0000, 0.0000, 63.0998); //FireWoodLog1
    g_Object[260] = CreateDynamicObject(2101, 875.1002, -16.7656, 63.4215, 0.0000, 0.0000, -113.8000); //MED_HI_FI_3
    g_Object[261] = CreateDynamicObject(19174, 872.4577, -10.9181, 64.8852, 0.0000, 0.0000, -23.5998); //SAMPPicture3
    g_Object[262] = CreateDynamicObject(19172, 868.2221, -19.2849, 65.1358, 0.0000, 0.0000, 156.5995); //SAMPPicture1
    SetDynamicObjectMaterial(g_Object[262], 0, 14489, "carlspics", "AH_landscap1", 0x00000000);
    g_Object[263] = CreateDynamicObject(2164, 862.8499, -14.7424, 62.9289, 0.0000, 0.0000, 66.5000); //MED_OFFICE_UNIT_5
    g_Object[264] = CreateDynamicObject(19793, 867.2612, -18.4629, 63.0457, 0.0000, 0.0000, 63.0998); //FireWoodLog1
    g_Object[265] = CreateDynamicObject(19793, 867.0916, -18.4440, 63.0457, 0.0000, 0.0000, 63.0998); //FireWoodLog1
    g_Object[266] = CreateDynamicObject(19793, 867.3054, -18.5527, 63.1455, 0.0000, 0.0000, 63.0998); //FireWoodLog1
    g_Object[267] = CreateDynamicObject(19793, 867.1718, -18.4848, 63.1357, 0.0000, 0.0000, 63.0998); //FireWoodLog1
    g_Object[268] = CreateDynamicObject(19353, 862.5167, -15.2250, 64.6651, 0.0000, 0.0000, -23.6000); //Perete plin st.lat.
    SetDynamicObjectMaterialText(g_Object[268], 0, "Fern Ridge", OBJECT_MATERIAL_SIZE_256x128, "Arial", 49, 1, 0xFF8B4513, 0xFFF5F5F5, 2);
    g_Object[269] = CreateDynamicObject(1731, 872.5761, -21.0139, 64.9559, 0.0000, 0.0000, -113.9998); //CJ_MLIGHT3
    g_Object[270] = CreateDynamicObject(1731, 866.4392, -18.3253, 64.9559, 0.0000, 0.0000, -113.9998); //CJ_MLIGHT3
    g_Object[271] = CreateDynamicObject(1731, 869.7722, -19.7875, 64.9559, 0.0000, 0.0000, -113.9998); //CJ_MLIGHT3
    g_Object[272] = CreateDynamicObject(1731, 862.9373, -16.7991, 64.9559, 0.0000, 0.0000, -113.9998); //CJ_MLIGHT3
    g_Object[273] = CreateDynamicObject(1731, 874.3551, -11.9125, 64.9356, 0.0000, 0.0000, 69.1996); //CJ_MLIGHT3
    g_Object[274] = CreateDynamicObject(1731, 869.8508, -9.9448, 64.9356, 0.0000, 0.0000, 69.1996); //CJ_MLIGHT3
    g_Object[275] = CreateDynamicObject(1731, 866.3098, -8.3964, 64.9356, 0.0000, 0.0000, 69.1996); //CJ_MLIGHT3
    g_Object[276] = CreateDynamicObject(19121, 877.6118, -24.3407, 62.2257, 0.0000, 0.0000, -21.1998); //Lampa1 ext.
    g_Object[277] = CreateDynamicObject(2163, 873.5031, -14.8157, 66.4072, 0.0000, 0.0000, -112.1996); //MED_OFFICE_UNIT_2
    g_Object[278] = CreateDynamicObject(19121, 861.9000, -17.3577, 62.2257, 0.0000, 0.0000, -21.1998); //Lampa2 ext.
    g_Object[279] = CreateDynamicObject(19121, 868.2893, -20.0757, 62.2257, 0.0000, 0.0000, -24.2999); //Lampa3 ext.
    g_Object[280] = CreateDynamicObject(19121, 872.7553, -21.9715, 62.2257, 0.0000, 0.0000, -24.2999); //Lampa4 ext.
    g_Object[281] = CreateDynamicObject(19121, 881.6265, -26.0424, 62.4458, 0.0000, 0.0000, -24.2999); //Lampa5 garaj
    g_Object[282] = CreateDynamicObject(19121, 881.8615, -14.3199, 62.2957, 0.0000, 0.0000, -21.1998); //Lampa6 ext.spate
    g_Object[283] = CreateDynamicObject(19121, 877.4290, -12.4186, 62.2957, 0.0000, 0.0000, -21.1998); //Lampa7 ext.spate
    g_Object[284] = CreateDynamicObject(19121, 871.9849, -10.0818, 62.3258, 0.0000, 0.0000, -21.1998); //Lampa8 ext.spate
    g_Object[285] = CreateDynamicObject(19121, 866.1770, -7.6044, 62.3258, 0.0000, 0.0000, -21.1998); //Lampa9 ext.spate
    g_Object[286] = CreateDynamicObject(19121, 863.2442, -12.1513, 62.3258, 0.0000, 0.0000, -21.1998); //Lampa10 ext.spate
    g_Object[287] = CreateDynamicObject(19121, 880.5031, -19.4783, 62.3558, 0.0000, 0.0000, -21.1998); //Lampa11 ext.spate
    g_Object[288] = CreateDynamicObject(19121, 891.4545, -30.3264, 62.4458, 0.0000, 0.0000, -24.2999); //Lampa6 garaj
    g_Object[289] = CreateDynamicObject(16779, 868.0432, -14.3943, 69.8526, 0.0000, 0.0000, 0.0000); //ventilator et.
    g_Object[290] = CreateDynamicObject(19353, 873.2603, -19.6373, 66.3460, 0.0000, -90.0000, 66.3999); //Gresie1 baie
    SetDynamicObjectMaterial(g_Object[290], 0, 16136, "des_telescopestuff", "stoneclad1", 0x00000000);
    g_Object[291] = CreateDynamicObject(19353, 876.1834, -20.9144, 66.3460, 0.0000, -90.0000, 66.3999); //Gresie2 baie
    SetDynamicObjectMaterial(g_Object[291], 0, 16136, "des_telescopestuff", "stoneclad1", 0x00000000);
    g_Object[292] = CreateDynamicObject(19353, 877.2456, -21.3787, 66.3563, 0.0000, -90.0000, 66.3999); //Gresie3 baie
    SetDynamicObjectMaterial(g_Object[292], 0, 16136, "des_telescopestuff", "stoneclad1", 0x00000000);
    g_Object[293] = CreateDynamicObject(19353, 878.3468, -18.8588, 66.3460, 0.0000, -90.0000, 66.3999); //Gresie4 baie
    SetDynamicObjectMaterial(g_Object[293], 0, 16136, "des_telescopestuff", "stoneclad1", 0x00000000);
    g_Object[294] = CreateDynamicObject(19353, 874.3410, -17.1630, 66.3460, 0.0000, -90.0998, 66.3999); //Gresie5 baie
    SetDynamicObjectMaterial(g_Object[294], 0, 16136, "des_telescopestuff", "stoneclad1", 0x00000000);
    g_Object[295] = CreateDynamicObject(19353, 877.2766, -18.4123, 66.3460, 0.0000, -90.0998, 66.3999); //Gresie6 baie
    SetDynamicObjectMaterial(g_Object[295], 0, 16136, "des_telescopestuff", "stoneclad1", 0x00000000);
    g_Object[296] = CreateDynamicObject(19353, 878.6134, -22.1161, 68.1453, 0.0000, 0.0000, -23.6000); //Zid1 baie
    SetDynamicObjectMaterial(g_Object[296], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[297] = CreateDynamicObject(19353, 879.8875, -19.2021, 68.1453, 0.0000, 0.0000, -23.6000); //Zid2 baie
    SetDynamicObjectMaterial(g_Object[297], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[298] = CreateDynamicObject(19383, 872.4171, -17.8229, 68.1452, 0.0000, 0.0000, 156.4998); //Zid3 baie
    SetDynamicObjectMaterial(g_Object[298], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[299] = CreateDynamicObject(19426, 871.5061, -19.9305, 68.1651, 0.0000, 0.0000, 157.1000); //Zid4 baie
    SetDynamicObjectMaterial(g_Object[299], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[300] = CreateDynamicObject(19426, 873.3646, -15.6350, 68.1651, 0.0000, 0.0000, 157.1000); //Zid5 baie
    SetDynamicObjectMaterial(g_Object[300], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[301] = CreateDynamicObject(19353, 875.2108, -15.5516, 68.1945, 0.0000, 0.0000, 66.3999); //Zid6 baie
    SetDynamicObjectMaterial(g_Object[301], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[302] = CreateDynamicObject(19353, 878.9307, -17.1772, 68.1445, 0.0000, 0.0000, 66.3999); //Zid6 baie
    SetDynamicObjectMaterial(g_Object[302], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[303] = CreateDynamicObject(19353, 876.7044, -16.2042, 68.1744, 0.0000, 0.0000, 66.3999); //Zid7 baie
    SetDynamicObjectMaterial(g_Object[303], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[304] = CreateDynamicObject(19426, 876.9364, -23.1499, 68.1352, 0.0000, 0.0000, 66.3001); //Zid10 baie
    SetDynamicObjectMaterial(g_Object[304], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[305] = CreateDynamicObject(19426, 877.2832, -23.2803, 68.1352, 0.0000, 0.0000, 66.3001); //Zid11 baie
    SetDynamicObjectMaterial(g_Object[305], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[306] = CreateDynamicObject(19353, 872.7570, -21.3127, 68.1445, 0.0000, 0.0000, 66.3999); //Zid12 baie
    SetDynamicObjectMaterial(g_Object[306], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[307] = CreateDynamicObject(19399, 875.1389, -22.3348, 68.1651, 0.0000, 0.0000, 66.5000); //Zid2 geam.et.
    SetDynamicObjectMaterial(g_Object[307], 0, 18081, "cj_barb", "CJ_TILES_5", 0x00000000);
    g_Object[308] = CreateDynamicObject(2517, 879.1585, -19.0382, 66.4063, 0.0000, 0.0000, -24.4999); //CJ_SHOWER1
    g_Object[309] = CreateDynamicObject(2528, 878.6312, -20.7245, 66.4501, 0.0000, 0.0000, -113.6996); //CJ_TOILET3
    g_Object[310] = CreateDynamicObject(1208, 873.8795, -15.4854, 66.4272, 0.0000, 0.0000, -114.0000); //washer
    g_Object[311] = CreateDynamicObject(1208, 873.6068, -16.0974, 66.4272, 0.0000, 0.0000, -114.0000); //washer
    g_Object[312] = CreateDynamicObject(2519, 877.7207, -22.8484, 66.3880, 0.0000, 0.0000, 66.0998); //CJ_BATH2
    g_Object[313] = CreateDynamicObject(11732, 876.1209, -17.8078, 66.3899, 0.0000, 0.0000, -24.1000); //WHeartBath1
    SetDynamicObjectMaterial(g_Object[313], 2, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
    g_Object[314] = CreateDynamicObject(2523, 879.2628, -19.0317, 66.4291, 0.0000, 0.0000, -112.4000); //CJ_B_SINK3
    g_Object[315] = CreateDynamicObject(2843, 873.2489, -17.3701, 66.4319, 0.0000, 0.0000, 0.0000); //gb_bedclothes02
    g_Object[316] = CreateDynamicObject(2844, 872.9050, -17.5237, 66.4922, 0.0000, 0.0000, 0.0000); //gb_bedclothes03
    g_Object[317] = CreateDynamicObject(11706, 872.2158, -19.2157, 66.4140, 0.0000, 0.0000, 67.9000); //SmallWasteBin1
    g_Object[318] = CreateDynamicObject(630, 879.0725, -20.0809, 67.4567, 0.0000, 0.0000, 161.3997); //veg_palmkb8
    g_Object[319] = CreateDynamicObject(630, 878.2135, -17.7304, 67.4467, 0.0000, 0.0000, -116.6996); //veg_palmkb8
    g_Object[320] = CreateDynamicObject(630, 874.8988, -16.1305, 67.4365, 0.0000, 0.0000, -116.6996); //veg_palmkb8
    g_Object[321] = CreateDynamicObject(630, 872.0731, -20.3782, 67.4365, 0.0000, 0.0000, 8.3999); //veg_palmkb8
    g_Object[322] = CreateDynamicObject(14446, 866.6566, -10.4319, 66.9897, 0.0000, 0.0000, 66.2996); //Smokes_bed
    g_Object[323] = CreateDynamicObject(19174, 867.4677, -8.7391, 68.3823, 0.0000, 0.0000, -23.6000); //SAMPPicture3
    g_Object[324] = CreateDynamicObject(19786, 873.4384, -15.2040, 68.7024, 0.0000, 0.0000, -112.8999); //LCDTVBig1
    SetDynamicObjectMaterial(g_Object[324], 1, 14420, "dr_gsbits", "mp_apt1_pic6", 0x00000000);
    g_Object[325] = CreateDynamicObject(19174, 872.8562, -11.0935, 68.3823, 0.0000, 0.0000, -23.6000); //SAMPPicture3
    SetDynamicObjectMaterial(g_Object[325], 0, 14489, "carlspics", "AH_landscap3", 0x00000000);
    g_Object[326] = CreateDynamicObject(19174, 869.1229, -19.6438, 68.3823, 0.0000, 0.0000, 156.3995); //SAMPPicture3
    SetDynamicObjectMaterial(g_Object[326], 0, 14489, "carlspics", "AH_picture2", 0x00000000);
    g_Object[327] = CreateDynamicObject(19174, 863.7122, -17.2910, 68.3823, 0.0000, 0.0000, 156.3995); //SAMPPicture3
    SetDynamicObjectMaterial(g_Object[327], 0, 14420, "dr_gsbits", "mp_apt1_pic8", 0x00000000);
    g_Object[328] = CreateDynamicObject(11721, 872.8737, -11.1766, 67.0484, 0.0000, 0.0000, -23.3999); //Radiator1
    SetDynamicObjectMaterial(g_Object[328], 1, 7978, "vgssairport", "newall16white", 0x00000000);
    g_Object[329] = CreateDynamicObject(11721, 873.3720, -21.3978, 67.0981, 0.0000, 0.0000, 157.3997); //Radiator1
    SetDynamicObjectMaterial(g_Object[329], 1, 7978, "vgssairport", "newall16white", 0x00000000);
    g_Object[330] = CreateDynamicObject(11707, 876.8624, -16.4673, 67.7240, 0.0000, 0.0000, -24.9999); //TowelRack1
    g_Object[331] = CreateDynamicObject(2166, 863.5897, -16.7357, 66.3964, 0.0000, 0.0000, 67.0998); //MED_OFFICE_DESK_2
    g_Object[332] = CreateDynamicObject(2163, 865.9097, -18.2133, 66.4067, 0.0000, 0.0000, 156.5000); //MED_OFFICE_UNIT_2
    g_Object[333] = CreateDynamicObject(2163, 867.5153, -18.9113, 66.4067, 0.0000, 0.0000, 156.5000); //MED_OFFICE_UNIT_2
    g_Object[334] = CreateDynamicObject(2200, 869.5684, -9.8125, 66.3925, 0.0000, 0.0000, -23.7000); //MED_OFFICE5_UNIT_1
    SetDynamicObjectMaterialText(g_Object[334], 0, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
    g_Object[335] = CreateDynamicObject(654, 856.5933, -0.5497, 61.6972, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[336] = CreateDynamicObject(949, 873.5202, -13.6941, 67.0356, 0.0000, 0.0000, -22.9999); //Plant_Pot_4
    SetDynamicObjectMaterial(g_Object[336], 1, 14652, "ab_trukstpa", "wood01", 0x00000000);
    g_Object[337] = CreateDynamicObject(949, 872.3637, -16.4188, 67.0356, 0.0000, 0.0000, -22.9999); //Plant_Pot_4
    SetDynamicObjectMaterial(g_Object[337], 1, 14652, "ab_trukstpa", "wood01", 0x00000000);
    g_Object[338] = CreateDynamicObject(949, 870.8571, -19.9181, 67.0356, 0.0000, 0.0000, -22.9999); //Plant_Pot_4
    SetDynamicObjectMaterial(g_Object[338], 1, 14652, "ab_trukstpa", "wood01", 0x00000000);
    g_Object[339] = CreateDynamicObject(949, 864.4710, -17.1749, 67.0356, 0.0000, 0.0000, -22.9999); //Plant_Pot_4
    SetDynamicObjectMaterial(g_Object[339], 1, 14652, "ab_trukstpa", "wood01", 0x00000000);
    g_Object[340] = CreateDynamicObject(949, 863.3225, -14.5579, 67.0356, 0.0000, 0.0000, -22.9999); //Plant_Pot_4
    SetDynamicObjectMaterial(g_Object[340], 1, 14652, "ab_trukstpa", "wood01", 0x00000000);
    g_Object[341] = CreateDynamicObject(1714, 864.1256, -16.0585, 66.3880, 0.0000, 0.0000, -167.8999); //kb_swivelchair1
    g_Object[342] = CreateDynamicObject(2202, 869.9937, -19.4929, 66.3840, 0.0000, 0.0000, 157.3999); //PHOTOCOPIER_2
    g_Object[343] = CreateDynamicObject(1734, 875.5816, -18.8117, 69.8620, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT2
    g_Object[344] = CreateDynamicObject(2074, 868.0570, -14.3943, 69.1819, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT8
    g_Object[345] = CreateDynamicObject(18689, 861.2459, -23.4235, 60.6329, 0.0000, 0.0000, 0.0000); //fire_bike
    g_Object[346] = CreateDynamicObject(11721, 863.9935, -12.2802, 67.0281, 0.0000, 0.0000, 66.5998); //Radiator1
    SetDynamicObjectMaterial(g_Object[346], 1, 7978, "vgssairport", "newall16white", 0x00000000);
    g_Object[347] = CreateDynamicObject(654, 852.4481, -8.4137, 61.6972, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[348] = CreateDynamicObject(654, 848.7728, -15.3842, 61.9169, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[349] = CreateDynamicObject(654, 897.0031, -24.9407, 61.9169, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[350] = CreateDynamicObject(654, 892.8717, -32.7779, 61.9169, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[351] = CreateDynamicObject(654, 867.2349, -2.1926, 61.6972, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[352] = CreateDynamicObject(654, 878.5205, -7.4190, 61.6972, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[353] = CreateDynamicObject(654, 889.3164, -15.4393, 61.6972, 0.0000, 0.0000, -27.7999); //pinetree08
    g_Object[354] = CreateDynamicObject(8990, 875.0206, -11.0558, 62.6990, 0.0000, 0.0000, 156.4998); //bush11_lvs
    g_Object[355] = CreateDynamicObject(8990, 869.9981, -21.0659, 62.5680, 0.0000, 0.0000, -23.3999); //bush11_lvs
    g_Object[356] = CreateDynamicObject(8990, 850.2553, -12.5576, 63.8759, 0.0000, 0.0000, 63.3997); //bush11_lvs
    g_Object[357] = CreateDynamicObject(3930, 860.4035, -22.6061, 62.0373, 0.0000, 0.0000, 0.0000); //d_rock01
    g_Object[358] = CreateDynamicObject(3930, 860.4035, -23.0562, 62.1571, 0.0000, 0.0000, 66.0998); //d_rock01
    g_Object[359] = CreateDynamicObject(3276, 848.9445, -13.1805, 64.2051, 0.0000, 0.0000, -117.0998); //cxreffencesld
    g_Object[360] = CreateDynamicObject(3276, 854.2977, -2.7204, 64.2051, 0.0000, 0.0000, -117.0998); //cxreffencesld
    g_Object[361] = CreateDynamicObject(3276, 894.6630, -32.4081, 63.0349, 0.0000, 0.0000, 62.5998); //cxreffencesld
    g_Object[362] = CreateDynamicObject(3276, 882.3751, -43.5480, 62.7951, 0.0000, 0.0000, -18.3999); //cxreffencesld
    g_Object[363] = CreateDynamicObject(3276, 871.0734, -39.7886, 62.6450, 0.0000, 0.0000, -18.3999); //cxreffencesld
    g_Object[364] = CreateDynamicObject(3276, 859.8189, -36.0447, 62.4850, 0.0000, 0.0000, -18.3999); //cxreffencesld
    g_Object[365] = CreateDynamicObject(3276, 848.4973, -32.2793, 62.3390, 0.3998, -0.8999, -18.3999); //cxreffencesld
    g_Object[366] = CreateDynamicObject(1463, 861.3781, -23.2388, 62.3073, 0.0000, 0.0000, 0.0000); //DYN_WOODPILE2
    g_Object[367] = CreateDynamicObject(8990, 856.2915, -0.5044, 63.8759, 0.0000, 0.0000, 63.3997); //bush11_lvs
    g_Object[368] = CreateDynamicObject(8990, 850.5172, -32.1152, 62.1459, 0.0000, 0.0000, 161.5997); //bush11_lvs
    g_Object[369] = CreateDynamicObject(8990, 863.1834, -36.2658, 62.2560, -0.0996, 0.4999, 162.3997); //bush11_lvs
    g_Object[370] = CreateDynamicObject(8990, 876.3461, -40.7042, 62.3666, -0.0996, 0.4999, 161.7996); //bush11_lvs
    g_Object[371] = CreateDynamicObject(8990, 881.8756, -42.5219, 62.4174, -0.0996, 0.4999, 161.7996); //bush11_lvs
    g_Object[372] = CreateDynamicObject(8990, 894.5031, -31.1284, 62.7770, -0.0996, 1.7999, -117.0000); //bush11_lvs
    g_Object[373] = CreateDynamicObject(19473, 866.9920, -7.5191, 62.0349, 0.0000, 0.0000, -16.7999); //grassplant01
    g_Object[374] = CreateDynamicObject(19473, 868.1884, -7.8804, 62.0349, 0.0000, 0.0000, -16.7999); //grassplant01
    g_Object[375] = CreateDynamicObject(19473, 869.3562, -8.5144, 62.0349, 0.0000, 0.0000, -16.7999); //grassplant01
    g_Object[376] = CreateDynamicObject(1280, 862.3043, -19.7269, 62.5555, 0.0000, 0.0000, 66.1996); //parkbench1
    g_Object[377] = CreateDynamicObject(1280, 865.0313, -22.3710, 62.5555, 0.0000, 0.0000, 27.2999); //parkbench1
    g_Object[378] = CreateDynamicObject(1369, 859.6693, -19.8246, 62.8875, 0.0000, 0.0000, 25.2999); //CJ_WHEELCHAIR1
    g_Object[379] = CreateDynamicObject(3930, 860.4702, -23.6977, 62.0671, 0.0000, 0.0000, 116.3000); //d_rock01
    g_Object[380] = CreateDynamicObject(1366, 876.2611, -25.2527, 62.7350, 0.0000, 0.0000, 64.6997); //CJ_FIREHYDRANT
    g_Object[381] = CreateDynamicObject(2670, 861.2843, -21.9932, 62.2812, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_1
    g_Object[382] = CreateDynamicObject(2677, 862.9265, -21.6916, 62.4850, 0.0000, 0.0000, -104.2996); //PROC_RUBBISH_7
    g_Object[383] = CreateDynamicObject(3930, 861.1245, -23.9388, 61.9873, 0.0000, 0.0000, 38.7999); //d_rock01
    g_Object[384] = CreateDynamicObject(3930, 861.7559, -24.0216, 62.0872, -60.1999, 0.0000, 38.7999); //d_rock01
    g_Object[385] = CreateDynamicObject(3930, 862.1146, -23.7334, 62.0872, -60.1999, -26.1000, 38.7999); //d_rock01
    g_Object[386] = CreateDynamicObject(3930, 862.3264, -23.1368, 62.1735, -60.1999, -26.1000, 38.7999); //d_rock01
    g_Object[387] = CreateDynamicObject(3930, 861.7277, -22.6513, 62.2187, 177.3997, -26.1000, 38.7999); //d_rock01
    g_Object[388] = CreateDynamicObject(3930, 860.9829, -22.4398, 62.2312, 177.3997, 59.3997, 38.7999); //d_rock01
    g_Object[389] = CreateDynamicObject(1343, 879.7128, -21.4193, 63.0694, 0.0000, 0.0000, 65.9000); //CJ_Dumpster3
    g_Object[390] = CreateDynamicObject(19353, 862.5349, -15.2328, 64.6651, 0.0000, 0.0000, -23.6000); //Perete plin st.lat.
    SetDynamicObjectMaterialText(g_Object[390], 0, "Fern Ridge", OBJECT_MATERIAL_SIZE_256x128, "Arial", 49, 1, 0xFFF5F5F5, 0xFFF5F5F5, 2);
    g_Object[391] = CreateDynamicObject(19353, 862.5169, -15.2250, 63.3349, 0.0000, -0.2000, -23.6000); //Perete plin st.lat.
    SetDynamicObjectMaterialText(g_Object[391], 0, "2023", OBJECT_MATERIAL_SIZE_256x128, "Cambria", 30, 1, 0xFF8B4513, 0xFFF5F5F5, 2);
    g_Object[392] = CreateDynamicObject(660, 886.1591, -47.0479, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[393] = CreateDynamicObject(660, 880.3790, -44.9780, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[394] = CreateDynamicObject(660, 869.0797, -40.9328, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[395] = CreateDynamicObject(660, 874.6254, -42.9183, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[396] = CreateDynamicObject(660, 862.5457, -38.5933, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[397] = CreateDynamicObject(660, 856.7086, -36.5035, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[398] = CreateDynamicObject(660, 851.2000, -34.5315, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[399] = CreateDynamicObject(660, 846.0880, -32.7010, 60.9342, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[400] = CreateDynamicObject(660, 891.0177, -36.7425, 62.0843, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[401] = CreateDynamicObject(660, 847.0925, -19.2518, 63.1241, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[402] = CreateDynamicObject(660, 850.2722, -12.1484, 63.1241, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[403] = CreateDynamicObject(660, 853.7907, -4.7834, 63.1241, 0.0000, 0.0000, -19.6998); //pinetree03
    g_Object[404] = CreateDynamicObject(1372, 879.1019, -22.7115, 62.4905, 0.0000, 0.0000, 66.4000); //CJ_Dump2_LOW
    g_Object[405] = CreateDynamicObject(18720, 880.7736, -11.4877, 62.1997, 0.0000, 0.0000, -19.5998); //prt_watersplash
    g_Object[406] = CreateDynamicObject(18720, 873.2841, -8.0775, 62.3698, 0.0000, 0.0000, -19.5998); //prt_watersplash
    return 1;
}