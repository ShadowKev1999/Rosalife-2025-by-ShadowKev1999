BeachBar_Init() {
    //Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
    static tmpobjid, object_world = -1, object_int = -1;
    tmpobjid = CreateDynamicObject(3595, 326.353729, -1897.603271, -6.842575, -0.399998, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    SetDynamicObjectMaterial(tmpobjid, 3, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 18901, "matclothes", "bandanabluish", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 10, 16640, "a51", "ws_stationfloor", 0x00000000);
    tmpobjid = CreateDynamicObject(16000, 326.267120, -1912.088989, -2.241496, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 3, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 8, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 323.284851, -1886.715454, 4.670122, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 323.284851, -1886.715454, 5.840120, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(7313, 326.467437, -1886.991821, 0.752689, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "beretmap2", 0x00000000);
    tmpobjid = CreateDynamicObject(1814, 333.131835, -1874.002807, 1.437577, 3.699999, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(1814, 328.761779, -1874.002807, 1.437577, 3.699999, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(1814, 324.341766, -1874.002807, 1.387578, 3.699999, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(1814, 319.971710, -1874.002807, 1.387578, 3.699999, 0.000022, -0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(18765, 330.290130, -1907.061401, -0.904725, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10351, "beach_sfs", "ws_drysand", 0x00000000);
    tmpobjid = CreateDynamicObject(18765, 322.671752, -1907.512695, -0.901723, -0.400000, 0.000000, -3.699999, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10351, "beach_sfs", "ws_drysand", 0x00000000);
    tmpobjid = CreateDynamicObject(642, 338.489685, -1855.135375, 3.624177, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 338.542785, -1855.078491, 2.770560, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(3630, 334.760284, -1822.338134, 1.682227, 180.000000, 1.599998, 91.400001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3979, "civic01_lan", "airportwall_256128", 0x00000000);
    tmpobjid = CreateDynamicObject(3630, 334.994354, -1831.920898, 1.404664, 180.000000, 1.799998, 91.400001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3979, "civic01_lan", "airportwall_256128", 0x00000000);
    tmpobjid = CreateDynamicObject(3630, 335.228332, -1841.494628, 1.157328, 180.000000, 1.299999, 91.400001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 3979, "civic01_lan", "airportwall_256128", 0x00000000);
    tmpobjid = CreateDynamicObject(8991, 332.265502, -1832.508178, 3.313937, 0.000000, -1.799999, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14570, "traidaqua", "ab_aqua_anenome", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_kelp", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 14570, "traidaqua", "ab_aqua_kelp", 0x00000000);
    tmpobjid = CreateDynamicObject(8991, 338.955505, -1836.943603, 3.244060, 0.000000, -1.399999, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 14570, "traidaqua", "ab_aqua_anenome", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_kelp", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 14570, "traidaqua", "ab_aqua_kelp", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, 339.334472, -1821.223999, 0.413823, 0.000000, 90.000000, 33.899978, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, 339.145324, -1821.820922, -0.106175, 0.000000, 90.000000, 33.899978, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(642, 344.179656, -1860.675659, 3.594177, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 344.232757, -1860.618774, 2.740561, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(642, 333.389556, -1860.675659, 3.384177, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 333.442657, -1860.618774, 2.550560, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(642, 320.359771, -1855.135375, 3.484178, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 320.412872, -1855.078491, 2.640561, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(642, 326.049743, -1860.675659, 3.344177, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 326.102844, -1860.618774, 2.500560, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(642, 315.259643, -1860.675659, 3.374177, 0.000000, 0.000022, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 315.312744, -1860.618774, 2.430561, 0.000000, 0.000022, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(642, 348.949401, -1867.838623, 3.524178, 0.000007, 0.000022, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 348.892517, -1867.785400, 2.660561, 0.000007, 0.000022, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(642, 354.489685, -1862.148559, 3.774177, 0.000007, 0.000029, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 354.432800, -1862.095458, 2.940560, 0.000007, 0.000029, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(642, 354.489685, -1872.938720, 3.444178, 0.000007, 0.000037, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(643, 354.432800, -1872.885620, 2.580560, 0.000007, 0.000037, 89.999946, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 4, -1, "none", "none", 0xFF555555);
    tmpobjid = CreateDynamicObject(3038, 357.021240, -1868.403930, 7.584824, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 348.761230, -1868.403930, 7.524823, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 340.701263, -1868.403930, 7.524823, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 332.411224, -1868.403930, 7.524823, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 324.161163, -1868.403930, 7.524823, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 315.861114, -1868.403930, 7.524823, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 357.021240, -1859.244018, 7.584824, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 348.761230, -1859.244018, 7.524823, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 340.701263, -1859.244018, 7.524823, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 332.411224, -1859.244018, 7.524823, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 324.161163, -1859.244018, 7.524823, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 315.861114, -1859.244018, 7.524823, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 357.021240, -1877.373168, 7.584824, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 348.761230, -1877.373168, 7.524823, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 340.701263, -1877.373168, 7.524823, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 332.411224, -1877.373168, 7.524823, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 324.161163, -1877.373168, 7.524823, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 315.861114, -1877.373168, 7.524823, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 357.021240, -1886.383422, 7.584824, 0.000022, 0.000000, 89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 348.761230, -1886.383422, 7.524823, 0.000022, 0.000000, 89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 340.701263, -1886.383422, 7.524823, 0.000022, 0.000000, 89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 332.411224, -1886.383422, 7.524823, 0.000022, 0.000000, 89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 324.161163, -1886.383422, 7.524823, 0.000022, 0.000000, 89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 315.861114, -1886.383422, 7.524823, 0.000022, 0.000000, 89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 311.851531, -1877.314331, 0.228284, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 336.271484, -1877.314331, 0.228284, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 311.851531, -1868.233764, 0.228284, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 344.691467, -1868.233764, 0.228282, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 360.891571, -1868.233764, 0.398279, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 360.891571, -1859.233276, 0.398279, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 311.851531, -1859.313598, 0.228284, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 319.971557, -1859.313598, 0.228282, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3875, 344.731597, -1859.313598, 0.228278, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 16640, "a51", "ws_stationfloor", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 3, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 4, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 336.241210, -1908.333984, 8.044831, 0.000022, 0.000000, 179.999938, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 336.241210, -1900.653930, 8.044829, 0.000022, 0.000000, 179.999938, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 336.241210, -1892.583862, 8.044825, 0.000022, 0.000000, 179.999938, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 316.501251, -1908.333984, 8.044831, 0.000022, -0.000007, 179.999893, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 316.501251, -1900.653930, 8.044829, 0.000022, -0.000007, 179.999893, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3038, 316.501251, -1892.583862, 8.044825, 0.000022, -0.000007, 179.999893, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 1731, "cj_lighting", "CJ_WICKER1", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(1297, 337.324523, -1844.583496, 5.687410, 180.000000, -7.599998, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(1297, 333.484527, -1844.583496, 5.687410, 180.000000, -7.599998, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, 316.637939, -1868.023803, 0.289213, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(18766, 329.787902, -1868.023803, 0.289213, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(18766, 342.467956, -1868.023803, 0.289213, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(1826, 312.792053, -1868.813110, 1.561946, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 314.982116, -1868.813110, 1.561946, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 317.162109, -1868.813110, 1.561946, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 319.342102, -1868.813110, 1.561946, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 325.882110, -1868.813110, 1.561946, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 328.072174, -1868.813110, 1.561946, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 330.252166, -1868.813110, 1.561946, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 332.432159, -1868.813110, 1.561946, 0.000000, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 338.669342, -1868.813110, 1.633308, 0.000000, -1.200065, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 340.858917, -1868.813110, 1.679172, 0.000000, -1.200065, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 343.038421, -1868.813110, 1.724828, 0.000000, -1.200065, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(1826, 345.217926, -1868.813110, 1.770483, 0.000000, -1.200065, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF555555);
    tmpobjid = CreateDynamicObject(18766, 313.285614, -1911.929199, 1.560564, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "bandanaleaf", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, 339.335540, -1911.929199, 1.560564, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "bandanaleaf", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, 312.895660, -1912.489013, 2.060565, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, 339.895721, -1912.489013, 2.060565, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
    tmpobjid = CreateDynamicObject(19128, 339.275939, -1911.358642, 3.304451, 810.000000, 180.000000, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "hatmap3", 0x00000000);
    tmpobjid = CreateDynamicObject(19128, 313.245941, -1911.358642, 3.304451, 810.000000, 180.000000, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "hatmap3", 0x00000000);
    tmpobjid = CreateDynamicObject(8325, 325.930572, -1912.303588, 10.869069, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 1, "PLAYROOM", 120, "Century Gothic", 80, 1, 0xFF45B4EF, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(8325, 325.930572, -1912.613891, 10.869069, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 1, "PLAYROOM", 120, "Century Gothic", 80, 1, 0xFF45B4BB, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(18762, 313.295501, -1911.947631, 7.083130, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 310.305603, -1911.947631, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 316.295532, -1911.947631, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 339.405364, -1911.947631, 7.083130, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 336.415466, -1911.947631, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 342.405395, -1911.947631, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 326.375457, -1912.608032, 8.963125, 0.000000, 270.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 337.445526, -1912.608032, -4.046872, 0.000000, 360.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 338.415466, -1912.608032, -4.046872, 0.000000, 360.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 314.355682, -1912.608032, -4.046872, 0.000000, 360.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 315.325622, -1912.608032, -4.046872, 0.000000, 360.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(2232, 310.294982, -1911.444702, 2.160125, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 310.294982, -1911.444702, 3.360126, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 310.294982, -1911.444702, 4.540125, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 310.294982, -1911.444702, 5.740126, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 316.315063, -1911.444702, 2.160125, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 316.315063, -1911.444702, 3.360126, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 316.315063, -1911.444702, 4.540125, 0.000000, -0.000022, 179.999862, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 316.315063, -1911.444702, 5.740126, 0.000000, -0.000022, 179.999862, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 336.394927, -1911.444702, 2.160125, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 336.394927, -1911.444702, 3.360126, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 336.394927, -1911.444702, 4.540125, 0.000000, -0.000022, 179.999862, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 336.394927, -1911.444702, 5.740126, 0.000000, -0.000022, 179.999862, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 342.415008, -1911.444702, 2.160125, 0.000000, -0.000022, 179.999862, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 342.415008, -1911.444702, 3.360126, 0.000000, -0.000022, 179.999862, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 342.415008, -1911.444702, 4.540125, 0.000000, -0.000029, 179.999816, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 342.415008, -1911.444702, 5.740126, 0.000000, -0.000029, 179.999816, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(19129, 326.261901, -1912.097656, -1.610648, 90.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "bandanacloth4", 0x00000000);
    tmpobjid = CreateDynamicObject(18980, 329.575500, -1887.247680, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 329.575500, -1899.727905, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 334.845611, -1899.727905, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 323.305419, -1887.247680, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(2232, 323.284851, -1886.715454, 3.470124, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 323.284851, -1886.715454, 2.290121, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 329.574890, -1886.715454, 4.670122, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 329.574890, -1886.715454, 5.840120, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 329.574890, -1886.715454, 3.470124, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(2232, 329.574890, -1886.715454, 2.290121, 0.000000, -0.000014, 179.999908, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 2, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(18980, 323.255493, -1899.727905, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 317.825408, -1899.727905, -4.926869, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 329.394836, -1887.214843, -0.739820, 180.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(18762, 323.274963, -1887.214843, -0.739818, 180.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4BB);
    tmpobjid = CreateDynamicObject(14407, 332.155395, -1898.335937, -1.592221, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "bandanacloth1", 0x00000000);
    tmpobjid = CreateDynamicObject(19373, 334.202880, -1900.151367, -0.127828, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4EF);
    tmpobjid = CreateDynamicObject(19373, 330.122894, -1900.151367, -0.127828, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4EF);
    tmpobjid = CreateDynamicObject(14407, 320.535400, -1898.335937, -1.592221, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "bandanacloth1", 0x00000000);
    tmpobjid = CreateDynamicObject(19373, 322.582885, -1900.151367, -0.127829, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4EF);
    tmpobjid = CreateDynamicObject(19373, 318.502899, -1900.151367, -0.127829, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0xFF45B4EF);
    tmpobjid = CreateDynamicObject(18655, 334.043914, -1911.962280, 5.905531, -0.000007, 0.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 336.033874, -1911.962280, 5.905531, -0.000007, 0.000000, -89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 330.203918, -1911.962280, 5.905531, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 332.193878, -1911.962280, 5.905531, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 326.403930, -1911.962280, 5.905531, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 328.393890, -1911.962280, 5.905531, -0.000014, 0.000000, -89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 322.563934, -1911.962280, 5.905531, -0.000022, 0.000000, -89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 324.553894, -1911.962280, 5.905531, -0.000022, 0.000000, -89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 320.814025, -1911.962280, 5.905531, -0.000022, 0.000000, -89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 318.974090, -1911.962280, 5.905531, -0.000022, 0.000000, -89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(18655, 317.024108, -1911.962280, 5.905531, -0.000022, 0.000000, -89.999931, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(640, 331.241363, -1868.060913, 3.108572, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
    tmpobjid = CreateDynamicObject(640, 328.331390, -1868.060913, 3.118571, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
    tmpobjid = CreateDynamicObject(640, 317.981506, -1868.060913, 3.108572, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
    tmpobjid = CreateDynamicObject(640, 315.071533, -1868.060913, 3.118571, 0.000007, 0.000000, 89.999977, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
    tmpobjid = CreateDynamicObject(640, 344.111633, -1868.060913, 3.108572, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
    tmpobjid = CreateDynamicObject(640, 341.201660, -1868.060913, 3.118571, 0.000014, 0.000000, 89.999954, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
    tmpobjid = CreateDynamicObject(18762, 332.345520, -1899.717773, 7.083130, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 320.545501, -1899.717773, 7.083131, 0.000000, 90.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(1297, 338.897308, -1867.358398, 5.132040, 180.000000, -7.599998, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(1297, 335.185394, -1867.358398, 5.062341, 180.000000, -7.599998, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(1297, 326.115600, -1867.358398, 5.061869, 180.000000, -7.599998, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(1297, 321.889648, -1867.358398, 5.070855, 180.000000, -7.599998, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(1297, 313.004394, -1867.358398, 5.015519, 180.000000, -7.599998, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(1297, 347.946441, -1867.358398, 5.357193, 180.000000, -7.599998, 360.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19480, "signsurf", "sign", 0x00000000);
    tmpobjid = CreateDynamicObject(3354, 339.034027, -1820.846435, 4.810366, 0.000000, 0.000000, -56.300006, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterialText(tmpobjid, 0, "Playroom", 130, "Century Gothic", 80, 1, 0xFF45B4EF, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(3354, 339.034027, -1820.846435, 4.330366, 0.000000, 0.000000, -56.300006, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterialText(tmpobjid, 0, "Bar & Cafe", 130, "Calibri", 50, 0, 0xFF45B4BB, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(18762, 328.305450, -1912.917724, 10.983126, 0.000000, 90.000015, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 323.295410, -1912.917724, 10.983126, 0.000000, 90.000015, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 320.335723, -1912.907104, -1.026870, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18980, 331.325775, -1912.907104, -1.026870, 0.000000, 180.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(13649, 433.941375, -1841.842163, 2.711061, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(13649, 433.941375, -1842.112426, 2.861059, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF45B4EF);
    tmpobjid = CreateDynamicObject(13649, 433.941375, -1842.522827, 3.221060, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0xFF555555);
    SetDynamicObjectMaterial(tmpobjid, 1, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
    tmpobjid = CreateDynamicObject(19427, 430.998626, -1843.046142, 3.725506, 0.000000, 90.000000, -15.500001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0xFF555555);
    tmpobjid = CreateDynamicObject(19427, 431.366821, -1842.691162, 3.025506, 90.000000, 180.000000, 74.500000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(19427, 431.120941, -1843.577880, 3.025506, 90.000000, 180.000000, 74.500000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(19427, 431.191131, -1842.351928, 2.975507, 90.000000, 90.000000, -15.500001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0xFF555555);
    tmpobjid = CreateDynamicObject(19427, 430.808898, -1843.730102, 2.975507, 90.000000, 90.000000, -15.500001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0xFF555555);
    tmpobjid = CreateDynamicObject(19427, 429.517120, -1842.624023, 1.995507, 180.000000, 180.000000, -15.500000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(19427, 436.962524, -1842.017578, 3.725506, -0.000003, 89.999992, -144.200012, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0xFF555555);
    tmpobjid = CreateDynamicObject(19427, 437.009368, -1842.526733, 3.025506, 89.999992, 575.225097, -89.425132, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(19427, 436.471038, -1841.780395, 3.025506, 89.999992, 575.225097, -89.425132, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(19427, 437.383911, -1842.601806, 2.975507, 89.999992, 402.220977, -96.421020, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0xFF555555);
    tmpobjid = CreateDynamicObject(19427, 436.547393, -1841.441528, 2.975507, 89.999992, 402.220977, -96.421020, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0xFF555555);
    tmpobjid = CreateDynamicObject(19427, 438.212341, -1841.116943, 1.995507, 0.000001, 360.000000, 35.799938, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(13649, 433.941375, -1842.322631, 3.051059, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0xFF40C4FF);
    tmpobjid = CreateDynamicObject(19128, 434.447052, -1844.627563, 4.830430, 90.000000, 0.000000, -171.699966, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 18901, "matclothes", "bandanataidai", 0x00000000);
    tmpobjid = CreateDynamicObject(18762, 436.856872, -1843.964721, 5.390436, 0.000000, 0.000000, 8.899999, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 431.946685, -1844.734130, 5.390436, 0.000000, 0.000000, 8.899999, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 434.456146, -1844.340576, 7.380436, 0.000000, 90.000000, 8.899999, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 431.645690, -1842.746704, 7.380436, 0.000000, 90.000000, 98.900001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 436.536071, -1841.980834, 7.380436, 0.000000, 90.000000, 98.900001, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(18762, 433.835784, -1840.378295, 7.380436, 0.000000, 90.000000, 8.899999, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10396, "countryclbtnis_sfs", "golf_pylon", 0xFF333333);
    tmpobjid = CreateDynamicObject(19373, 434.095123, -1842.406127, 7.803783, 180.000000, 90.000000, 8.399999, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    tmpobjid = CreateDynamicObject(19609, 434.184753, -1842.616210, 3.830434, 0.000000, 0.000000, -169.800048, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFBBBBBB);
    tmpobjid = CreateDynamicObject(2125, 332.263916, -1905.198974, 1.922479, 0.000000, 0.000007, 29.199993, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19936, 331.239959, -1903.798095, 1.532466, 0.000000, 0.000029, 29.199993, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19936, 332.034454, -1903.354125, 1.532466, -0.000029, 0.000000, -60.799919, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(3431, 331.811798, -1903.931640, 1.762446, 0.000020, 0.000000, 119.199928, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19939, 331.466979, -1903.394653, 2.820825, -14.999939, 359.999969, 119.199859, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19938, 332.048767, -1903.069458, 2.999475, -0.000023, 375.000000, -150.800247, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19938, 330.875793, -1903.724975, 2.639429, 14.999955, 360.000000, -60.799861, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 331.744140, -1903.732421, 2.841516, -14.999939, 359.999969, 119.199859, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19940, 331.877502, -1903.955566, 2.382379, 0.000029, 360.000000, 119.199928, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10973, "mall_sfse", "ws_grilleshade", 0x00000000);
    tmpobjid = CreateDynamicObject(19934, 332.814239, -1903.358154, 2.566247, 0.000000, -179.999984, 29.199966, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(19934, 330.828521, -1904.479248, 2.566247, 0.000000, -179.999984, 29.199966, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    tmpobjid = CreateDynamicObject(1805, 434.118408, -1843.485961, 4.110434, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
    SetDynamicObjectMaterial(tmpobjid, 1, 14812, "lee_studhall", "carpet", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObject(19279, 328.293945, -1886.903686, 1.794440, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19279, 324.484039, -1886.903686, 1.794440, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(745, 332.709472, -1910.583129, 1.599835, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(822, 319.811706, -1908.097900, 2.471817, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(902, 329.148803, -1910.285400, 1.525516, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 340.526855, -1911.358398, 6.996785, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 339.746948, -1911.358398, 6.996785, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2404, 341.296936, -1911.358398, 6.996785, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 332.137023, -1874.258056, 1.683747, 2.799998, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 335.067016, -1874.258544, 1.693735, 2.799998, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 327.766967, -1874.256103, 1.643793, 2.799998, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 330.696960, -1874.256591, 1.653782, 2.799998, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 323.346954, -1874.258056, 1.633746, 2.799998, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 326.276947, -1874.258544, 1.643735, 2.799998, 0.000014, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 318.976898, -1874.258056, 1.633746, 2.799998, 0.000022, -0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1643, 321.906890, -1874.258544, 1.643735, 2.799998, 0.000022, -0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 338.986938, -1911.358398, 6.996785, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 338.226959, -1911.358398, 6.996785, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 337.376953, -1911.358398, 6.996785, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(620, 344.877319, -1848.767578, -5.221061, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(620, 331.347320, -1848.767578, -5.221061, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(747, 343.412536, -1848.379760, 2.624437, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(745, 328.828247, -1848.690917, 2.232501, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 347.047027, -1848.908935, 3.029510, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 351.206970, -1848.908935, 3.029510, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 355.386962, -1848.908935, 3.029510, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 323.366943, -1848.908935, 3.029510, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 319.216979, -1848.908935, 3.029510, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(970, 315.056976, -1848.908935, 3.029510, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(822, 329.385467, -1821.485473, 2.779196, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(822, 339.515533, -1825.185668, 2.779196, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(745, 340.548248, -1822.640502, 3.012501, 0.000000, 0.000000, 48.100009, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19279, 336.583129, -1820.683593, 3.300153, 0.000000, 0.000000, -123.599990, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19279, 339.355285, -1818.410156, 3.300153, 0.000000, 0.000000, -172.500000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2073, 334.238372, -1867.997314, 2.459228, 180.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2073, 325.528350, -1867.997314, 2.459228, 180.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2073, 320.958343, -1867.997314, 2.459228, 0.000000, 179.999984, -179.999984, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2073, 312.248321, -1867.997314, 2.459228, 0.000000, 179.999984, -179.999984, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2073, 346.948272, -1867.997314, 2.459228, 0.000000, 179.999984, -179.999938, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2073, 338.238250, -1867.997314, 2.459228, 0.000000, 179.999984, -179.999938, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 314.496765, -1911.358398, 6.996785, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 313.716857, -1911.358398, 6.996785, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2404, 315.266845, -1911.358398, 6.996785, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 312.956848, -1911.358398, 6.996785, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 312.196868, -1911.358398, 6.996785, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2406, 311.346862, -1911.358398, 6.996785, 0.000000, -0.000007, 179.999954, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(8874, 342.381805, -1824.536621, 4.713216, -51.899997, -19.099998, -0.599986, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(8874, 330.466522, -1904.406127, 2.420316, 0.000000, 0.000000, -70.899986, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(8874, 323.698791, -1903.817749, 1.370318, 0.000000, 0.000000, 16.500017, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(8874, 325.685394, -1893.057250, 1.370318, 0.000000, 0.000000, -12.799982, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(8874, 327.292114, -1892.839233, 1.820317, 0.000000, 0.000000, -58.599979, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2232, 431.886444, -1844.488525, 4.699367, 0.000000, 0.000000, -173.299957, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2232, 431.886444, -1844.488525, 5.839366, 0.000000, 0.000000, -173.299957, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2232, 436.800659, -1843.721069, 5.839366, 0.000000, 0.000000, -173.299957, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(2232, 436.800659, -1843.721069, 4.659366, 0.000000, 0.000000, -173.299957, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(8874, 433.857330, -1839.833618, 1.550611, 18.400001, 0.000000, 126.599983, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19611, 326.343841, -1889.035278, 1.717170, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19610, 326.348144, -1889.006713, 3.347464, 170.499984, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19609, 323.684387, -1904.214721, 1.584738, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 329.540283, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19614, 328.639556, -1905.722167, 1.598009, 0.000000, 0.000000, -163.099990, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 323.300292, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19613, 327.813110, -1905.828979, 1.617537, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 321.320220, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19612, 327.817382, -1905.774658, 2.321970, 0.000000, 0.000000, -164.799987, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 319.120300, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 317.860229, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 331.370300, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 331.370300, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 333.360290, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 334.860321, -1899.239135, 7.243745, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19317, 328.053527, -1905.450683, 2.336126, -15.699999, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19613, 328.593078, -1899.439086, 1.617537, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19318, 328.236297, -1899.438110, 2.311523, -16.200000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19614, 433.663696, -1844.263305, 3.810434, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19613, 434.493957, -1844.141601, 3.830434, 0.000000, 0.000000, -172.500015, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19611, 434.034912, -1840.685180, 3.825284, 0.000000, 0.000007, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19610, 434.039215, -1840.656616, 5.455576, 9.500014, 179.999984, -179.999984, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 433.731140, -1840.298461, 7.037150, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 435.791229, -1840.298461, 7.037150, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19150, 431.501251, -1840.298461, 7.037150, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19611, 332.336334, -1903.534912, 1.362300, 0.000000, 0.000036, 29.199993, object_world, object_int, -1, 300.00, 300.00); 


    playroomArea = CreateDynamicRectangle(playroomRectangle[0], playroomRectangle[1], playroomRectangle[2], playroomRectangle[3], object_world, object_int);

    new actorModel = 171;
    for(new i = 0; i < MAX_PLAYER_BAR_ACTOR; i++) {
        switch(i) {
            case 0: actorModel = 217;
            case 1..3: actorModel = playroomBeachSkins[random(sizeof(playroomBeachSkins))];
            case 4: actorModel = 171;
            default: actorModel = 171;
        }
        playroomBarActors[i] = CreateDynamicActor(actorModel, playroomBarCoords[i][0], playroomBarCoords[i][1], playroomBarCoords[i][2], playroomBarCoords[i][3], .worldid = object_world, .interiorid = object_int);
    }
    for(new i = 0; i < MAX_PLAYER_BAR_ACTOR; i++) {
        switch(i) {
            case 1..3: {
                ApplyDynamicActorAnimation(playroomBarActors[i], "BEACH", "bather", 4.0, true, false, false, false, 0);
            }
        }
    }
    playroomLabel = CreateDynamic3DTextLabel("-", COLOR_WHITE, playroomBarCoords[4][0], playroomBarCoords[4][1], playroomBarCoords[4][2] + 1.5, 15.0);
    playroomBeachActor();
    SetTimerEx("playroomBeachActor", 120000, true);
    CreateDynamic3DTextLabel("{0066FF}Playroom Beachbar\n{FFFFFF}Nutze /playroom", COLOR_WHITE, playroomBarCoords[0][0], playroomBarCoords[0][1], playroomBarCoords[0][2] + 1.5, 15.0);

    BeachRadioId = -1;
    return 1;
}

forward playroomBeachActor();
public playroomBeachActor() {
    new randMsg = random(sizeof(playroomMessages)), string[128];
    ApplyDynamicActorAnimation(playroomBarActors[4], "PED", "IDLE_CHAT", 4.1, false, false, false, true, 5);

    format(string, sizeof(string), "{0066FF}Franky: {FFFFFF}%s", playroomMessages[randMsg]);
    ProxDetectorDynActor(20.0, playroomBarActors[4], string, 0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF);

    UpdateDynamic3DTextLabelText(playroomLabel, COLOR_WHITE, string);
    return 1;
}

BeachBar_PlayerEnterDynamicArea(playerid, areaid) {
    if(areaid == playroomArea) {
        SendClientMessage(playerid, -1, "{0066FF}Playroom Beachbar{FFFFFF} betreten!");
        if(BeachRadioId != -1) {
            startBeachMusicForPlayer(playerid, BeachRadioId);
        }
    }
    return 1;
}

BeachBar_PlayerLeaveDynamicArea(playerid, areaid) {
    if(areaid == playroomArea) {
        StopAudioStreamForPlayer(playerid);
        SendClientMessage(playerid, -1, "{0066FF}Playroom Beachbar{FFFFFF} verlassen!");
    }
    return 1;
}

BeachBar_PlayerConnect(playerid) {
    RemoveBuildingForPlayer(playerid, 3615, 337.453, -1875.000, 3.406, 0.250);
    RemoveBuildingForPlayer(playerid, 3778, 337.453, -1875.000, 3.406, 0.250);
    return 1;
}

startBeachMusicForPlayer(playerid, listitem) {
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `vehicle_radios` WHERE `id` = %i", listitem);
    mysql_tquery(sqlHandle, query, "onSelectedBeachRadioForPlayer", "ii", playerid, listitem);
    return 1;
}

forward onSelectedBeachRadioForPlayer(playerid, listitem);
public onSelectedBeachRadioForPlayer(playerid, listitem) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der ausgewählte Sender wurde nicht gefunden.");
    new tempRadioUrl[128];
    cache_get_value_name(0, "radioUrl", tempRadioUrl);
    PlayAudioStreamForPlayer(playerid, tempRadioUrl);
    return 1;
}

SelectBeachRadio(playerid, listitem) {
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `vehicle_radios` WHERE `id` = %i", playerRadioBeachList[playerid][listitem]);
    mysql_tquery(sqlHandle, query, "onSelectedBeachRadio", "ii", playerid, playerRadioBeachList[playerid][listitem]);
    return 1;
}

forward onSelectedBeachRadio(playerid, listitem);
public onSelectedBeachRadio(playerid, listitem) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der ausgewählte Sender wurde nicht gefunden.");
    new tempRadioUrl[128], tempRadioName[64];
    cache_get_value_name_int(0, "id", BeachRadioId);
    cache_get_value_name(0, "radioUrl", tempRadioUrl);
    cache_get_value_name(0, "radioName", tempRadioName);

    foreach(new i : Player) {
        if(IsPlayerInDynamicArea(i, playroomArea)) {
            PlayAudioStreamForPlayer(i, tempRadioUrl);
            SendClientMessage(i, -1, "{0066FF}Playroom Beachbar: {FFFFFF}%s hat %s als Musik ausgewählt.", GetName(playerid), tempRadioName);
        }
    }
    BeachRadioBlocker = gettime() + 30;
    return 1;
}


OpenBeachRadios(playerid) {
    mysql_tquery(sqlHandle, "SELECT * FROM `vehicle_radios` WHERE `radioActive` = 1 LIMIT "#MAX_RADIOS"", "onLoadBeachRadios", "i", playerid);
    return 1;
}

CancelBeachRadio(playerid) {
    foreach(new i : Player) {
        if(IsPlayerInDynamicArea(i, playroomArea)) {
            StopAudioStreamForPlayer(i);
            SendClientMessage(i, -1, "{0066FF}Playroom Beachbar: {FFFFFF}%s hat die Musik ausgeschaltet.", GetName(playerid));
        }
    }
    BeachRadioId = -1;
    return 1;
}

forward onLoadBeachRadios(playerid);
public onLoadBeachRadios(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es wurden keine Radiosender gefunden.");
    new string[512], tempCarRadio[MAX_RADIOS][2][128];
    for(new i = 0; i < rows; i++) {
        if(i >= MAX_RADIOS) continue;
        cache_get_value_name_int(i, "id", playerRadioBeachList[playerid][i]);
        cache_get_value_name(i, "radioName", tempCarRadio[i][0]);
        cache_get_value_name(i, "radioColor", tempCarRadio[i][1]);

        format(string, sizeof(string), "%s\n%s%s", string, tempCarRadio[i][1], tempCarRadio[i][0]);
    }
    playerRadioBeachMax[playerid] = rows;
    strcat(string, "\n{FFFFFF}Eigene Sender URL eingeben");
    strcat(string, "\n{FFFFFF}Musik ausschalten");
    ShowPlayerDialog(playerid, DIALOG_BEACHBAR_RADIO, DIALOG_STYLE_LIST, "{007DFF}"SERV_NAME": {0066FF}Playroom", string, "Auswählen", "Abbrechen");
    return 1;
}

BeachBar_DialogResponse(playerid, dialogid, response, listitem, const inputtext[]) {
    switch(dialogid) {
        case DIALOG_BEACHBAR_RADIO: {
		    if(!response){}//Abbrchen

            if(listitem < playerRadioBeachMax[playerid]) {
                SelectBeachRadio(playerid, listitem);
            } else if(listitem == playerRadioBeachMax[playerid]) {
                ShowPlayerDialog(playerid,DIALOG_BEACHBAR_RADIO_URL, DIALOG_STYLE_INPUT,"{007DFF}"SERV_NAME": {0066FF}Playroom","Gib deine eigene URL deines gewünschten Radiosenders ein:", "Auswählen", "Abbrechen");
            } else {
                CancelBeachRadio(playerid);
            }
			return 1;
		}
        case DIALOG_BEACHBAR_RADIO_URL: {
            if(!response) return 1;
            format(BeachRadioUrl, sizeof(BeachRadioUrl), "%s", inputtext);
            return SendClientMessage(playerid, -1, "Wird noch fertig gestellt!");
        }
    }
    return 1;
}