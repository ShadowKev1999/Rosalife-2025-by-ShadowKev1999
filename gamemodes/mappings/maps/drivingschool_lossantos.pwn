

DrivingSchool_LosSantos_Init() 
{

    //Fahrschule von Mr.M
	static fs_Object[275];
	fs_Object[0] = CreateObjectEx(9131, 2120.7219, -1908.4350, 13.8493, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //shbbyhswall13_lvs
	SetObjectMaterialEx(fs_Object[0], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFFF4A460);
	fs_Object[1] = CreateObjectEx(18762, 2099.7270, -1904.9200, 12.8620, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[1], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[2] = CreateObjectEx(18981, 2104.0505, -1916.9012, 11.8838, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx25mx25m
	SetObjectMaterialEx(fs_Object[2], 0, 6284, "bev_law2", "concretebigb256", 0xFF696969);
	fs_Object[3] = CreateObjectEx(18981, 2104.0505, -1941.8814, 11.8838, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx25mx25m
	SetObjectMaterialEx(fs_Object[3], 0, 6284, "bev_law2", "concretebigb256", 0xFF696969);
	fs_Object[4] = CreateObjectEx(18981, 2129.0175, -1916.9012, 11.8838, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx25mx25m
	SetObjectMaterialEx(fs_Object[4], 0, 6284, "bev_law2", "concretebigb256", 0xFF696969);
	fs_Object[5] = CreateObjectEx(18981, 2129.0488, -1941.8814, 11.8838, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx25mx25m
	SetObjectMaterialEx(fs_Object[5], 0, 6284, "bev_law2", "concretebigb256", 0xFF696969);
	fs_Object[6] = CreateObjectEx(18762, 2121.3820, -1904.9200, 12.8620, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[6], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF6B8E23);
	fs_Object[7] = CreateObjectEx(18762, 2126.3610, -1904.9200, 12.8620, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[7], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF6B8E23);
	fs_Object[8] = CreateObjectEx(18762, 2116.3930, -1904.9200, 12.8620, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[8], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF6B8E23);
	fs_Object[9] = CreateObjectEx(18762, 2109.7280, -1904.9200, 12.8620, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[9], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF6B8E23);
	fs_Object[10] = CreateObjectEx(18762, 2113.0419, -1904.9210, 12.8610, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[10], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF6B8E23);
	fs_Object[11] = CreateObjectEx(18762, 2136.3630, -1904.9200, 12.8620, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[11], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[12] = CreateObjectEx(18762, 2136.4531, -1904.9210, 12.8610, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[12], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[13] = CreateObjectEx(19353, 2128.7651, -1907.0234, 10.7124, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[14] = CreateObjectEx(19353, 2107.3244, -1907.0234, 10.7124, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[15] = CreateObjectEx(19353, 2117.0881, -1912.0959, 10.7110, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[16] = CreateObjectEx(19353, 2108.3337, -1909.7999, 10.7110, 0.0000, 0.0000, 40.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[17] = CreateObjectEx(19353, 2127.7548, -1909.8028, 10.7110, 0.0000, 0.0000, -40.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[18] = CreateObjectEx(19353, 2125.2539, -1911.5539, 10.7100, 0.0000, 0.0000, -70.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[19] = CreateObjectEx(19353, 2110.8369, -1911.5528, 10.7100, 0.0000, 0.0000, 70.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[20] = CreateObjectEx(19353, 2113.9189, -1912.0959, 10.7110, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[21] = CreateObjectEx(19353, 2120.2966, -1912.0959, 10.7110, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[22] = CreateObjectEx(19353, 2108.9575, -1906.8059, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[22], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[23] = CreateObjectEx(19353, 2122.1699, -1912.0980, 10.7089, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	fs_Object[24] = CreateObjectEx(19353, 2112.1579, -1906.8059, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[24], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[25] = CreateObjectEx(19353, 2115.3581, -1906.8059, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[25], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[26] = CreateObjectEx(19353, 2118.5480, -1906.8059, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[26], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[27] = CreateObjectEx(19353, 2121.7587, -1906.8059, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[27], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[28] = CreateObjectEx(19353, 2124.9692, -1906.8059, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[28], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[29] = CreateObjectEx(19353, 2127.1408, -1906.8059, 12.3105, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[29], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[30] = CreateObjectEx(19353, 2115.3581, -1910.2957, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[30], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[31] = CreateObjectEx(19353, 2118.5668, -1910.2957, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[31], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[32] = CreateObjectEx(19353, 2121.7666, -1910.2957, 12.3109, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[32], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[33] = CreateObjectEx(19353, 2124.7065, -1909.9593, 12.3105, 0.0000, 90.0000, 110.4000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[33], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[34] = CreateObjectEx(19353, 2126.3898, -1908.7274, 12.3100, 0.0000, 90.0000, 140.1000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[34], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[35] = CreateObjectEx(19353, 2122.2949, -1910.3200, 12.3100, 0.0000, 90.0000, 90.5000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[35], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[36] = CreateObjectEx(19353, 2111.3986, -1910.0327, 12.3100, 0.0000, 90.0000, 159.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[36], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[37] = CreateObjectEx(19353, 2109.6093, -1908.7529, 12.3050, 0.0000, 90.0000, 130.0000, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[37], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[38] = CreateObjectEx(19353, 2113.5812, -1910.2802, 12.3050, 0.0000, 90.0000, -90.0998, .Kommentar = "Driving School Los Santos"); //wall001
	SetObjectMaterialEx(fs_Object[38], 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	fs_Object[39] = CreateObjectEx(19431, 2116.1313, -1908.4447, 12.4163, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //wall071
	SetObjectMaterialEx(fs_Object[39], 0, 1355, "break_s_bins", "marble1", 0x00000000);
	fs_Object[40] = CreateObjectEx(9131, 2115.0197, -1908.4350, 13.8493, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //shbbyhswall13_lvs
	SetObjectMaterialEx(fs_Object[40], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFFF4A460);
	fs_Object[41] = CreateObjectEx(19355, 2119.4462, -1908.4205, 12.9869, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall003
	SetObjectMaterialEx(fs_Object[41], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	fs_Object[42] = CreateObjectEx(19355, 2116.2551, -1908.4205, 12.9869, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall003
	SetObjectMaterialEx(fs_Object[42], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	fs_Object[43] = CreateObjectEx(19355, 2117.5541, -1908.4189, 13.2769, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall003
	SetObjectMaterialTextEx(fs_Object[43], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x512, "Arial", 90, 1, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	fs_Object[44] = CreateObjectEx(19355, 2115.8239, -1908.4189, 13.5868, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall003
	SetObjectMaterialTextEx(fs_Object[44], 0, "v", OBJECT_MATERIAL_SIZE_512x512, "Webdings", 120, 1, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	fs_Object[45] = CreateObjectEx(19355, 2119.9233, -1908.4189, 13.5669, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall003
	SetObjectMaterialTextEx(fs_Object[45], 0, "p", OBJECT_MATERIAL_SIZE_512x512, "Webdings", 120, 1, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	fs_Object[46] = CreateObjectEx(9131, 2120.7219, -1908.4350, 11.5810, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //shbbyhswall13_lvs
	SetObjectMaterialEx(fs_Object[46], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFFF4A460);
	fs_Object[47] = CreateObjectEx(9131, 2115.0197, -1908.4350, 11.5810, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //shbbyhswall13_lvs
	SetObjectMaterialEx(fs_Object[47], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFFF4A460);
	fs_Object[48] = CreateObjectEx(19355, 2118.4250, -1908.4189, 14.0868, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall003
	SetObjectMaterialTextEx(fs_Object[48], 0, "RosaLife", OBJECT_MATERIAL_SIZE_512x512, "Arial", 90, 1, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	fs_Object[49] = CreateObjectEx(19355, 2117.9045, -1908.4189, 13.0968, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //wall003
	SetObjectMaterialTextEx(fs_Object[49], 0, "________________________", OBJECT_MATERIAL_SIZE_512x512, "Candara", 90, 1, 0xFFFF4500, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	fs_Object[50] = CreateObjectEx(19431, 2119.6306, -1908.4447, 12.4163, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //wall071
	SetObjectMaterialEx(fs_Object[50], 0, 1355, "break_s_bins", "marble1", 0x00000000);
	fs_Object[51] = CreateObjectEx(18762, 2094.7265, -1904.9200, 12.8620, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[51], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[52] = CreateObjectEx(18762, 2094.1660, -1904.9210, 12.8610, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[52], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[53] = CreateObjectEx(618, 2110.2092, -1908.9013, 12.5798, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //veg_treea3
	fs_Object[54] = CreateObjectEx(1251, 2133.9992, -1908.8254, 12.3239, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[54], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[55] = CreateObjectEx(18762, 2092.1660, -1907.9200, 12.8610, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[55], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[56] = CreateObjectEx(18762, 2092.1660, -1912.9095, 12.8610, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[56], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[57] = CreateObjectEx(18762, 2092.1660, -1917.9086, 12.8610, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[57], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[58] = CreateObjectEx(19172, 2136.7104, -1913.2552, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[58], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[58], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[59] = CreateObjectEx(1251, 2133.9992, -1915.6660, 12.3239, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[59], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[60] = CreateObjectEx(1251, 2133.9992, -1916.5965, 12.3280, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[60], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[61] = CreateObjectEx(1251, 2137.3378, -1920.1262, 12.3229, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[61], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[62] = CreateObjectEx(1251, 2095.3217, -1923.8162, 12.3240, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[62], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[63] = CreateObjectEx(19172, 2136.4399, -1912.8848, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[63], 0, "LKW", OBJECT_MATERIAL_SIZE_512x256, "Arial", 60, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[63], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[64] = CreateObjectEx(19172, 2136.5800, -1913.2249, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[64], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[64], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[65] = CreateObjectEx(1251, 2137.3378, -1906.9757, 12.3229, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[65], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[66] = CreateObjectEx(19454, 2139.0085, -1910.1375, 10.9238, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //wall094
	SetObjectMaterialEx(fs_Object[66], 0, 6284, "bev_law2", "concretebigb256", 0xFF696969);
	fs_Object[67] = CreateObjectEx(19454, 2139.0085, -1919.7264, 10.9238, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //wall094
	SetObjectMaterialEx(fs_Object[67], 0, 6284, "bev_law2", "concretebigb256", 0xFF696969);
	fs_Object[68] = CreateObjectEx(18762, 2092.1660, -1922.9088, 12.8610, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[68], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[69] = CreateObjectEx(1280, 2114.8984, -1912.4721, 12.7464, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //parkbench1
	fs_Object[70] = CreateObjectEx(19172, 2104.6601, -1906.0855, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[70], 0, "Einfahrt", OBJECT_MATERIAL_SIZE_512x256, "Arial", 162, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[70], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[71] = CreateObjectEx(19425, 2106.3703, -1904.6221, 12.3560, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //speed_bump01
	fs_Object[72] = CreateObjectEx(19425, 2103.0708, -1904.6221, 12.3560, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //speed_bump01
	fs_Object[73] = CreateObjectEx(19425, 2133.0117, -1904.6221, 12.3560, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //speed_bump01
	fs_Object[74] = CreateObjectEx(19425, 2129.7224, -1904.6221, 12.3560, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //speed_bump01
	fs_Object[75] = CreateObjectEx(19172, 2131.3703, -1906.0855, 12.3692, 270.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[75], 0, "Ausfahrt", OBJECT_MATERIAL_SIZE_512x256, "Arial", 145, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[75], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[76] = CreateObjectEx(18762, 2092.1660, -1927.9089, 12.8610, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[76], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[77] = CreateObjectEx(18762, 2092.1660, -1932.8792, 12.8610, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //Concrete1mx1mx5m
	SetObjectMaterialEx(fs_Object[77], 0, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[78] = CreateObjectEx(970, 2138.9028, -1925.2833, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[78], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[78], 1, -1, "none", "none", 0xFF000000);
	fs_Object[79] = CreateObjectEx(19454, 2139.0085, -1929.2448, 10.9238, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //wall094
	SetObjectMaterialEx(fs_Object[79], 0, 6284, "bev_law2", "concretebigb256", 0xFF696969);
	fs_Object[80] = CreateObjectEx(1223, 2117.7514, -1912.4652, 12.2623, 0.0000, 0.0000, 270.0000, .Kommentar = "Driving School Los Santos"); //lampost_coast
	fs_Object[81] = CreateObjectEx(1280, 2120.7185, -1912.4721, 12.7464, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //parkbench1
	fs_Object[82] = CreateObjectEx(6134, 2119.1333, -1942.0197, 16.5048, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //gaz11_law
	SetObjectMaterialEx(fs_Object[82], 1, 16640, "a51", "concretegroundl1_256", 0x00000000);
	SetObjectMaterialEx(fs_Object[82], 5, 6094, "canalsg_law", "Bow_church_grass_gen", 0xFF556B2F);
	fs_Object[83] = CreateObjectEx(1251, 2096.0546, -1905.6568, 12.3229, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[83], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[84] = CreateObjectEx(1251, 2096.0546, -1909.0865, 12.3229, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[84], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[85] = CreateObjectEx(1251, 2096.0546, -1915.8760, 12.3229, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[85], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[86] = CreateObjectEx(1251, 2096.0546, -1912.4664, 12.3229, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[86], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[87] = CreateObjectEx(19172, 2095.2602, -1914.1751, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[87], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[87], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[88] = CreateObjectEx(1251, 2096.0546, -1919.2758, 12.3229, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[88], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[89] = CreateObjectEx(19172, 2095.2602, -1917.6049, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[89], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[89], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[90] = CreateObjectEx(19172, 2095.2602, -1910.7644, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[90], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[90], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[91] = CreateObjectEx(19172, 2095.2602, -1907.2846, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[91], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[91], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[92] = CreateObjectEx(19172, 2095.2802, -1914.4152, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[92], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[92], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[93] = CreateObjectEx(19172, 2095.2702, -1917.8457, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[93], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[93], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[94] = CreateObjectEx(19172, 2095.2802, -1910.9949, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[94], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[94], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[95] = CreateObjectEx(19172, 2095.2802, -1907.5246, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[95], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[95], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[96] = CreateObjectEx(19172, 2095.6394, -1917.4744, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[96], 0, "Besucher", OBJECT_MATERIAL_SIZE_512x256, "Arial", 48, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[96], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[97] = CreateObjectEx(19172, 2095.6394, -1914.0440, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[97], 0, "Besucher", OBJECT_MATERIAL_SIZE_512x256, "Arial", 48, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[97], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[98] = CreateObjectEx(19172, 2095.6394, -1910.6243, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[98], 0, "Besucher", OBJECT_MATERIAL_SIZE_512x256, "Arial", 48, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[98], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[99] = CreateObjectEx(19172, 2095.6394, -1907.1544, 12.3692, 270.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[99], 0, "Besucher", OBJECT_MATERIAL_SIZE_512x256, "Arial", 48, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[99], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[100] = CreateObjectEx(1251, 2092.7641, -1909.0765, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[100], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[101] = CreateObjectEx(1251, 2092.7641, -1915.9158, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[101], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[102] = CreateObjectEx(970, 2138.9028, -1935.7336, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[102], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[102], 1, -1, "none", "none", 0xFF000000);
	fs_Object[103] = CreateObjectEx(970, 2138.9028, -1921.1237, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[103], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[103], 1, -1, "none", "none", 0xFF000000);
	fs_Object[104] = CreateObjectEx(970, 2138.9089, -1916.9635, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[104], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[104], 1, -1, "none", "none", 0xFF000000);
	fs_Object[105] = CreateObjectEx(970, 2138.9028, -1931.5838, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[105], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[105], 1, -1, "none", "none", 0xFF000000);
	fs_Object[106] = CreateObjectEx(3928, 2145.2292, -1929.3648, 15.3990, 0.0000, -0.0999, 90.0000, .Kommentar = "Driving School Los Santos"); //helipad
	SetObjectMaterialEx(fs_Object[106], 0, 10765, "airportgnd_sfse", "white", 0xFF000000);
	fs_Object[107] = CreateObjectEx(970, 2138.9028, -1939.8940, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[107], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[107], 1, -1, "none", "none", 0xFF000000);
	fs_Object[108] = CreateObjectEx(970, 2151.7133, -1939.8940, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[108], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[108], 1, -1, "none", "none", 0xFF000000);
	fs_Object[109] = CreateObjectEx(970, 2151.7133, -1935.7447, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[109], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[109], 1, -1, "none", "none", 0xFF000000);
	fs_Object[110] = CreateObjectEx(970, 2151.7133, -1931.5944, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[110], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[110], 1, -1, "none", "none", 0xFF000000);
	fs_Object[111] = CreateObjectEx(970, 2151.7133, -1927.4343, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[111], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[111], 1, -1, "none", "none", 0xFF000000);
	fs_Object[112] = CreateObjectEx(970, 2151.7133, -1923.2937, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[112], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[112], 1, -1, "none", "none", 0xFF000000);
	fs_Object[113] = CreateObjectEx(970, 2151.7133, -1919.1433, 15.9164, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[113], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[113], 1, -1, "none", "none", 0xFF000000);
	fs_Object[114] = CreateObjectEx(970, 2149.6320, -1941.9744, 15.9164, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[114], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[114], 1, -1, "none", "none", 0xFF000000);
	fs_Object[115] = CreateObjectEx(970, 2140.9699, -1941.9720, 15.9164, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[115], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[115], 1, -1, "none", "none", 0xFF000000);
	fs_Object[116] = CreateObjectEx(970, 2145.4995, -1941.9744, 15.9164, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[116], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[116], 1, -1, "none", "none", 0xFF000000);
	fs_Object[117] = CreateObjectEx(970, 2141.3566, -1941.9744, 15.9164, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //fencesmallb
	SetObjectMaterialEx(fs_Object[117], 0, 6284, "bev_law2", "glass_fence_64hv", 0xFF000000);
	SetObjectMaterialEx(fs_Object[117], 1, -1, "none", "none", 0xFF000000);
	fs_Object[118] = CreateObjectEx(8572, 2137.9487, -1926.6110, 14.1561, 0.0000, 0.0000, 270.0000, .Kommentar = "Driving School Los Santos"); //vgsSstairs02_lvs
	SetObjectMaterialEx(fs_Object[118], 0, -1, "none", "none", 0xFF000000);
	SetObjectMaterialEx(fs_Object[118], 1, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	SetObjectMaterialEx(fs_Object[118], 2, -1, "none", "none", 0xFF000000);
	fs_Object[119] = CreateObjectEx(1251, 2110.7990, -1926.7500, 12.3229, 0.0000, 90.0000, -33.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[119], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[120] = CreateObjectEx(1251, 2109.1953, -1929.2966, 12.3240, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[120], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[121] = CreateObjectEx(1251, 2112.6850, -1927.2443, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[121], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[122] = CreateObjectEx(1251, 2107.4196, -1926.6441, 12.3229, 0.0000, 90.0000, -33.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[122], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[123] = CreateObjectEx(1251, 2103.9643, -1926.6422, 12.3229, 0.0000, 90.0000, -33.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[123], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[124] = CreateObjectEx(1251, 2100.5043, -1926.6485, 12.3229, 0.0000, 90.0000, -33.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[124], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[125] = CreateObjectEx(1251, 2096.9450, -1926.6386, 12.3229, 0.0000, 90.0000, -33.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[125], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[126] = CreateObjectEx(1251, 2102.3044, -1929.2966, 12.3240, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[126], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[127] = CreateObjectEx(1251, 2095.4118, -1929.2966, 12.3240, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[127], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[128] = CreateObjectEx(19172, 2098.5212, -1926.6889, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[128], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[128], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[129] = CreateObjectEx(19172, 2098.5646, -1927.1724, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[129], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[129], 1,"Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[130] = CreateObjectEx(19172, 2105.1367, -1927.4798, 12.3892, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[130], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[130], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[131] = CreateObjectEx(19172, 2098.3999, -1927.0753, 12.3892, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[131], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[131], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[132] = CreateObjectEx(19172, 2101.8100, -1927.2984, 12.3892, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[132], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[132], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[133] = CreateObjectEx(19172, 2108.4719, -1927.6668, 12.3892, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[133], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[133], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[134] = CreateObjectEx(19172, 2101.9829, -1927.4011, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[134], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[134], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[135] = CreateObjectEx(19172, 2105.3273, -1927.5936, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[135], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[135], 1,"Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[136] = CreateObjectEx(19172, 2108.6594, -1927.7893, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[136], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[136], 1,"Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[137] = CreateObjectEx(19172, 2101.9377, -1926.9167, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[137], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[137], 1,"Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[138] = CreateObjectEx(19172, 2105.2954, -1927.1063, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[138], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[138], 1, "Example Tex", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[139] = CreateObjectEx(19172, 2108.6320, -1927.2932, 12.3692, 270.0000, 0.0000, 147.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[139], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[139], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[140] = CreateObjectEx(2942, 2140.5793, -1904.0690, 13.2110, 0.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //kmb_atm1
	fs_Object[141] = CreateObjectEx(870, 2125.1437, -1908.5598, 12.5969, 0.0000, 0.0000, 64.5999, .Kommentar = "Driving School Los Santos"); //veg_Pflowers2wee
	fs_Object[142] = CreateObjectEx(617, 2124.8027, -1908.5766, 12.1579, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //veg_treeb1
	fs_Object[143] = CreateObjectEx(817, 2110.0195, -1908.4692, 12.7738, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //veg_Pflowers01
	fs_Object[144] = CreateObjectEx(3526, 2141.8547, -1925.6243, 15.4692, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //vegasairportlight
	fs_Object[145] = CreateObjectEx(1251, 2117.5161, -1928.6848, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[145], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[146] = CreateObjectEx(1251, 2120.0461, -1928.6848, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[146], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[147] = CreateObjectEx(19172, 2118.7810, -1927.5354, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[147], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[147], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[148] = CreateObjectEx(1251, 2122.6560, -1928.6848, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[148], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[149] = CreateObjectEx(19172, 2121.3906, -1927.5354, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[149], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[149], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[150] = CreateObjectEx(19172, 2123.9916, -1927.5354, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[150], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[150], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[151] = CreateObjectEx(1251, 2125.2673, -1928.6848, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[151], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[152] = CreateObjectEx(19172, 2126.6018, -1927.5354, 12.3892, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[152], 0, "c", OBJECT_MATERIAL_SIZE_512x256, "Webdings", 255, 0, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[152], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[153] = CreateObjectEx(1251, 2127.9184, -1928.6848, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[153], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[154] = CreateObjectEx(19172, 2126.8098, -1927.5356, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[154], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[154], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[155] = CreateObjectEx(19172, 2126.4987, -1927.1528, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[155], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[155], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[156] = CreateObjectEx(19172, 2124.1894, -1927.5356, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[156], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[156], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[157] = CreateObjectEx(19172, 2121.5888, -1927.5356, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[157], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[157], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[158] = CreateObjectEx(19172, 2118.9589, -1927.5356, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[158], 0, "P", OBJECT_MATERIAL_SIZE_512x256, "Arial", 255, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[158], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[159] = CreateObjectEx(19172, 2123.8784, -1927.1528, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[159], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[159], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[160] = CreateObjectEx(19172, 2121.2788, -1927.1528, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[160], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[160], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[161] = CreateObjectEx(19172, 2118.6591, -1927.1528, 12.3692, 270.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[161], 0, "Fahrschule", OBJECT_MATERIAL_SIZE_512x256, "Arial", 35, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[161], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[162] = CreateObjectEx(1232, 2092.1887, -1904.8919, 10.8616, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Streetlamp1
	fs_Object[163] = CreateObjectEx(1232, 2101.5895, -1904.8919, 10.8616, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Streetlamp1
	fs_Object[164] = CreateObjectEx(1232, 2107.9589, -1904.8919, 10.8616, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Streetlamp1
	fs_Object[165] = CreateObjectEx(1232, 2128.0805, -1904.8919, 10.8616, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Streetlamp1
	fs_Object[166] = CreateObjectEx(1232, 2134.6706, -1904.8919, 10.8616, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Streetlamp1
	fs_Object[167] = CreateObjectEx(1232, 2115.0292, -1908.4019, 12.5116, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Streetlamp1
	fs_Object[168] = CreateObjectEx(1232, 2120.7604, -1908.4019, 12.5116, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //Streetlamp1
	fs_Object[169] = CreateObjectEx(19952, 2108.0212, -1908.8897, 10.8656, 0.0000, 0.0000, -50.1999, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign5
	fs_Object[170] = CreateObjectEx(3526, 2148.7761, -1925.5943, 15.4692, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //vegasairportlight
	fs_Object[171] = CreateObjectEx(3526, 2148.7761, -1933.2547, 15.4792, 0.0000, 0.0000, 270.0000, .Kommentar = "Driving School Los Santos"); //vegasairportlight
	fs_Object[172] = CreateObjectEx(3526, 2141.8930, -1933.2747, 15.4992, 0.0000, 0.0000, 270.0000, .Kommentar = "Driving School Los Santos"); //vegasairportlight
	fs_Object[173] = CreateObjectEx(974, 2091.6674, -1921.1291, 11.4072, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //tall_fence
	SetObjectMaterialEx(fs_Object[173], 0, -1, "none", "none", 0xFF696969);
	SetObjectMaterialEx(fs_Object[173], 1, 4003, "cityhall_tr_lan", "sl_griddyfence_sml", 0xFF000000);
	fs_Object[174] = CreateObjectEx(19952, 2108.5974, -1909.5819, 10.8656, 0.0000, 0.0000, -50.1999, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign5
	fs_Object[175] = CreateObjectEx(19952, 2109.1489, -1910.2426, 10.8656, 0.0000, 0.0000, -50.1999, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign5
	fs_Object[176] = CreateObjectEx(19952, 2126.9023, -1910.2348, 10.8656, 0.0000, 0.0000, 48.8000, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign5
	fs_Object[177] = CreateObjectEx(19952, 2127.4230, -1909.6395, 10.8656, 0.0000, 0.0000, 48.8000, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign5
	fs_Object[178] = CreateObjectEx(19952, 2127.9306, -1909.0596, 10.8656, 0.0000, 0.0000, 48.8000, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign5
	fs_Object[179] = CreateObjectEx(1251, 2092.7641, -1927.3157, 12.3229, 0.0000, 90.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[179], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[180] = CreateObjectEx(19172, 2114.9655, -1929.9410, 15.5639, 0.0000, 0.0000, 180.0000, .Kommentar = "Driving School Los Santos"); //SAMPPicture1
	SetObjectMaterialTextEx(fs_Object[180], 0, "Willkommen", OBJECT_MATERIAL_SIZE_512x512, "Arial", 100, 1, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialTextEx(fs_Object[180], 1, "Example Text", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fs_Object[181] = CreateObjectEx(19565, 2097.9675, -1923.9532, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[181], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[182] = CreateObjectEx(19565, 2098.2097, -1924.3438, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[182], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[183] = CreateObjectEx(19565, 2096.8085, -1923.9282, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[183], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[184] = CreateObjectEx(19565, 2097.0559, -1924.3272, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[184], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[185] = CreateObjectEx(19565, 2097.3044, -1924.7269, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[185], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[186] = CreateObjectEx(19565, 2097.6635, -1925.3049, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[186], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[187] = CreateObjectEx(19565, 2097.4978, -1925.0404, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[187], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[188] = CreateObjectEx(19565, 2112.1882, -1924.8807, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[188], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[189] = CreateObjectEx(19565, 2112.5275, -1924.9692, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[189], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[190] = CreateObjectEx(19565, 2097.0344, -1926.1884, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[190], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[191] = CreateObjectEx(19565, 2096.7929, -1925.7978, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[191], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[192] = CreateObjectEx(19565, 2096.5468, -1925.3989, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[192], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[193] = CreateObjectEx(19565, 2096.2993, -1924.9997, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[193], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[194] = CreateObjectEx(19565, 2096.0520, -1924.6003, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[194], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[195] = CreateObjectEx(19565, 2095.8039, -1924.2004, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[195], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[196] = CreateObjectEx(19565, 2095.6289, -1923.9195, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[196], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[197] = CreateObjectEx(19565, 2112.4882, -1927.9564, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[197], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[198] = CreateObjectEx(19565, 2096.4287, -1927.0856, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[198], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[199] = CreateObjectEx(19565, 2096.1823, -1926.6868, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[199], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[200] = CreateObjectEx(19565, 2095.9450, -1926.3045, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[200], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[201] = CreateObjectEx(19565, 2095.7036, -1925.9140, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[201], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[202] = CreateObjectEx(19565, 2095.4614, -1925.5230, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[202], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[203] = CreateObjectEx(19565, 2095.2126, -1925.1232, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[203], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[204] = CreateObjectEx(19565, 2094.9658, -1924.7243, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[204], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[205] = CreateObjectEx(19565, 2094.7238, -1924.3336, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[205], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[206] = CreateObjectEx(19565, 2094.4968, -1923.9681, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[206], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[207] = CreateObjectEx(19565, 2093.3322, -1923.9487, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[207], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[208] = CreateObjectEx(19565, 2093.5734, -1924.3391, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[208], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[209] = CreateObjectEx(19565, 2093.8103, -1924.7211, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[209], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[210] = CreateObjectEx(19565, 2094.0527, -1925.1119, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[210], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[211] = CreateObjectEx(19565, 2094.2944, -1925.5023, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[211], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[212] = CreateObjectEx(19565, 2094.5310, -1925.8843, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[212], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[213] = CreateObjectEx(19565, 2094.7790, -1926.2838, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[213], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[214] = CreateObjectEx(19565, 2095.0256, -1926.6827, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[214], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[215] = CreateObjectEx(19565, 2095.2729, -1927.0817, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[215], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[216] = CreateObjectEx(19565, 2095.5097, -1927.4641, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[216], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[217] = CreateObjectEx(19565, 2095.7521, -1927.8548, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[217], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[218] = CreateObjectEx(19565, 2095.8591, -1928.0255, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[218], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[219] = CreateObjectEx(19565, 2092.9787, -1925.2602, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[219], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[220] = CreateObjectEx(19565, 2093.2094, -1925.6335, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[220], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[221] = CreateObjectEx(19565, 2093.4509, -1926.0241, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[221], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[222] = CreateObjectEx(19565, 2093.6916, -1926.4140, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[222], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[223] = CreateObjectEx(19565, 2093.9392, -1926.8132, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[223], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[224] = CreateObjectEx(19565, 2094.1872, -1927.2127, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[224], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[225] = CreateObjectEx(19565, 2094.4348, -1927.6119, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[225], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[226] = CreateObjectEx(19565, 2094.6718, -1927.9941, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[226], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[227] = CreateObjectEx(19565, 2094.9145, -1928.3850, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[227], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[228] = CreateObjectEx(19565, 2095.1623, -1928.7843, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[228], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[229] = CreateObjectEx(19565, 2095.4030, -1929.1741, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[229], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[230] = CreateObjectEx(19565, 2092.9750, -1927.1180, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[230], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[231] = CreateObjectEx(19565, 2093.2111, -1927.5001, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[231], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[232] = CreateObjectEx(19565, 2093.4577, -1927.8990, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[232], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[233] = CreateObjectEx(19565, 2093.7055, -1928.2985, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[233], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[234] = CreateObjectEx(19565, 2093.9526, -1928.6976, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[234], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[235] = CreateObjectEx(19565, 2094.1730, -1929.0539, 12.3538, 90.0000, 0.0000, -58.2000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[235], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[236] = CreateObjectEx(1228, 2133.1088, -1928.7058, 12.7527, 0.0000, 0.0000, 118.8999, .Kommentar = "Driving School Los Santos"); //roadworkbarrier1
	fs_Object[237] = CreateObjectEx(19565, 2111.6779, -1925.7612, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[237], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[238] = CreateObjectEx(19565, 2112.1130, -1925.8743, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[238], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[239] = CreateObjectEx(19565, 2112.4628, -1925.9658, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[239], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[240] = CreateObjectEx(19565, 2111.1184, -1926.6065, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[240], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[241] = CreateObjectEx(19565, 2111.5527, -1926.7194, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[241], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[242] = CreateObjectEx(19565, 2112.0063, -1926.8372, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[242], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[243] = CreateObjectEx(19565, 2112.4606, -1926.9554, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[243], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[244] = CreateObjectEx(974, 2091.6674, -1927.4399, 11.4072, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //tall_fence
	SetObjectMaterialEx(fs_Object[244], 0, -1, "none", "none", 0xFF696969);
	SetObjectMaterialEx(fs_Object[244], 1, 4003, "cityhall_tr_lan", "sl_griddyfence_sml", 0xFF000000);
	fs_Object[245] = CreateObjectEx(19565, 2112.0737, -1927.8491, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[245], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[246] = CreateObjectEx(19565, 2110.5632, -1927.4550, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[246], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[247] = CreateObjectEx(19565, 2111.6196, -1927.7310, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[247], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[248] = CreateObjectEx(19565, 2111.1743, -1927.6151, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[248], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[249] = CreateObjectEx(19565, 2110.8447, -1927.5291, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[249], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[250] = CreateObjectEx(19565, 2112.4426, -1928.9250, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[250], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[251] = CreateObjectEx(19565, 2111.9987, -1928.8096, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[251], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[252] = CreateObjectEx(19565, 2111.5634, -1928.6964, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[252], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[253] = CreateObjectEx(19565, 2111.1086, -1928.5778, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[253], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[254] = CreateObjectEx(19565, 2110.6645, -1928.4622, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[254], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[255] = CreateObjectEx(19565, 2110.2583, -1928.3563, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[255], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[256] = CreateObjectEx(19565, 2109.9965, -1928.2880, 12.3538, 90.0000, 40.2000, -54.8000, .Kommentar = "Driving School Los Santos"); //IceCreamBarsBox1
	SetObjectMaterialEx(fs_Object[256], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fs_Object[257] = CreateObjectEx(974, 2091.6674, -1914.4584, 11.4072, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //tall_fence
	SetObjectMaterialEx(fs_Object[257], 0, -1, "none", "none", 0xFF696969);
	SetObjectMaterialEx(fs_Object[257], 1, 4003, "cityhall_tr_lan", "sl_griddyfence_sml", 0xFF000000);
	fs_Object[258] = CreateObjectEx(974, 2091.6674, -1907.7680, 11.4072, 0.0000, 0.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //tall_fence
	SetObjectMaterialEx(fs_Object[258], 0, -1, "none", "none", 0xFF696969);
	SetObjectMaterialEx(fs_Object[258], 1, 4003, "cityhall_tr_lan", "sl_griddyfence_sml", 0xFF000000);
	fs_Object[259] = CreateObjectEx(19955, 2136.4399, -1928.5389, 12.2715, 0.0000, 0.0000, -120.6999, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign8
	fs_Object[260] = CreateObjectEx(19957, 2135.9348, -1928.8311, 12.3112, 0.0000, 0.0000, -123.7999, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign10
	fs_Object[261] = CreateObjectEx(19967, 2136.4313, -1927.8593, 12.2972, 0.0000, 0.0000, -130.8999, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign20
	fs_Object[262] = CreateObjectEx(19987, 2135.3376, -1929.0369, 12.0726, 0.0000, 0.0000, 176.8999, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign40
	fs_Object[263] = CreateObjectEx(19965, 2136.9318, -1927.3033, 12.2620, 0.0000, 0.0000, -104.7000, .Kommentar = "Driving School Los Santos"); //SAMPRoadSign18
	fs_Object[264] = CreateObjectEx(1228, 2131.9753, -1928.6008, 12.7527, 0.0000, 0.0000, 118.8999, .Kommentar = "Driving School Los Santos"); //roadworkbarrier1
	fs_Object[265] = CreateObjectEx(1228, 2134.3337, -1928.7153, 12.7527, 0.0000, 0.0000, 118.8999, .Kommentar = "Driving School Los Santos"); //roadworkbarrier1
	fs_Object[266] = CreateObjectEx(1423, 2129.5241, -1928.9644, 13.0957, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //DYN_ROADBARRIER_4
	fs_Object[267] = CreateObjectEx(1423, 2129.5241, -1928.3843, 13.0957, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //DYN_ROADBARRIER_4
	fs_Object[268] = CreateObjectEx(1423, 2129.5241, -1927.7947, 13.0957, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //DYN_ROADBARRIER_4
	fs_Object[269] = CreateObjectEx(1238, 2135.7185, -1927.6103, 12.6724, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //trafficcone
	fs_Object[270] = CreateObjectEx(1238, 2136.2890, -1927.0798, 12.6724, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //trafficcone
	fs_Object[271] = CreateObjectEx(1238, 2136.8007, -1925.5996, 12.7024, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //trafficcone
	fs_Object[272] = CreateObjectEx(1238, 2136.8007, -1926.3891, 12.6624, 0.0000, 0.0000, 0.0000, .Kommentar = "Driving School Los Santos"); //trafficcone
	fs_Object[273] = CreateObjectEx(1251, 2120.9643, -1929.2966, 12.3240, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[273], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fs_Object[274] = CreateObjectEx(1251, 2124.4555, -1929.2966, 12.3240, 0.0000, 90.0000, 90.0000, .Kommentar = "Driving School Los Santos"); //smashbar
	SetObjectMaterialEx(fs_Object[274], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);

    //Fahrschule
	RemoveBuildingEx(1308, 2089.8100, -1942.8900, 11.5156, 0.10, .kommentar = "Driving School Los Santos"); // telgrphpole02
	RemoveBuildingEx(1226, 2118.2900, -1939.4000, 16.3906, 0.10, .kommentar = "Driving School Los Santos"); // lamppost3
	RemoveBuildingEx(620, 2114.5500, -1928.1899, 5.0312, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
	RemoveBuildingEx(620, 2113.3999, -1925.0400, 10.8046, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
	RemoveBuildingEx(620, 2115.6699, -1922.7700, 10.8046, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
	RemoveBuildingEx(620, 2123.3601, -1928.0699, 6.8437, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
	RemoveBuildingEx(5182, 2115.0000, -1921.5200, 15.3906, 0.10, .kommentar = "Driving School Los Santos"); // nwspltbild4_las2
	RemoveBuildingEx(5208, 2115.0000, -1921.5200, 15.3906, 0.10, .kommentar = "Driving School Los Santos"); // LOD Model of nwspltbild4_las2
	RemoveBuildingEx(620, 2122.6599, -1916.7900, 10.8046, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
	RemoveBuildingEx(620, 2116.9299, -1916.0799, 10.8046, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
	RemoveBuildingEx(5231, 2085.2800, -1909.7099, 23.0000, 0.10, .kommentar = "Driving School Los Santos"); // snpedteew2_las2
	RemoveBuildingEx(5374, 2085.2800, -1909.7099, 23.0000, 1.10, .kommentar = "Driving School Los Santos"); // alphbrk9_las2
	RemoveBuildingEx(620, 2121.5100, -1909.5300, 10.8046, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
	RemoveBuildingEx(620, 2110.2700, -1906.5899, 5.0312, 0.10, .kommentar = "Driving School Los Santos"); // veg_palm04
    
    return 1;
}