#include <open.mp>
#include <streamer>

//Map Texturen - German Samplife
#define Gehweg(%0) SetDynamicObjectMaterial(%0,0, 13691, "bevcunto2_lahills","crazypave",0)
#define Parkplatz(%0) SetDynamicObjectMaterial(%0,0, 9514, "711_sfw","ws_carpark2",0)
#define groovewand(%0) SetDynamicObjectMaterial(%0,0, 4828, "airport3_las","gnhotelwall02_128",0)
#define groovehaus(%0) SetDynamicObjectMaterial(%0,1, 4828, "airport3_las","gnhotelwall02_128",0)
#define aztecaswand(%0) SetDynamicObjectMaterial(%0,0, 5706, "ci_studio5","tw@t_wall1",0)
#define aztecashaus(%0) SetDynamicObjectMaterial(%0,1, 5706, "ci_studio5","tw@t_wall1",0)
#define rifafenster(%0) SetDynamicObjectMaterial(%0,0, 3278, "des_breakwin1","des_warewin",0)
#define rifawand(%0) SetDynamicObjectMaterial(%0,0, 11010, "crackfact_sfse","ws_altz_wall8_top",0)
#define LSPDboden(%0) SetDynamicObjectMaterial(%0,0, 13007,"sw_bankint","woodfloor1",0)
#define LSPDwand(%0) SetDynamicObjectMaterial(%0,0, 8399,"vgs_shops","vgsclubwall05_128",0)
#define LSPDdecke(%0) SetDynamicObjectMaterial(%0,0, 4568,"skyscrap2_lan2","sl_marblewall2",0)
#define LSPDzellboden(%0) SetDynamicObjectMaterial(%0,0, 13701,"lahillshilhs1c","man_cellarfloor128",0)
#define LSPD_Zaun(%0) SetDynamicObjectMaterial(%0,1, 10837, "airroadsigns_sfse","CJ_LAMPPOST1",0)
#define M_Mauer(%0) SetDynamicObjectMaterial(%0,0, 4552, "ammu_lan2","sl_lavicdtwall1",0)
#define M_Gboden(%0) SetDynamicObjectMaterial(%0,0, 10765, "airportgnd_sfse","ws_airpt_concrete",0)
#define M_Gwand(%0) SetDynamicObjectMaterial(%0,0, 18202, "w_towncs_t","ahoodfence2",0)
#define M_Gdecke(%0) SetDynamicObjectMaterial(%0,0, 13691, "bevcunto2_lahills","Bow_Abattoir_Floor_Clean",0)
#define M_Pweg(%0) SetDynamicObjectMaterial(%0,0, 10938, "skyscrap_sfse","ws_floortiles2",0)
#define M_Iboden(%0) SetDynamicObjectMaterial(%0,0, 3961, "lee_kitch","dinerfloor01_128",0)
#define M_Iwand(%0) SetDynamicObjectMaterial(%0,0, 8391, "ballys01","ballywall02_128",0)
#define M_Idecke(%0) SetDynamicObjectMaterial(%0,0, 3975, "lanbloke","p_floor3",0)
#define M_Ibetten(%0) SetDynamicObjectMaterial(%0,0, 1794, "cj_beds","CJ_TARTAN",0)
#define Zollwand(%0) SetDynamicObjectMaterial(%0,0, 18337, "cs_town","GB_sandstwall01",0)
#define Zolldecke(%0) SetDynamicObjectMaterial(%0,0, 3975, "lanbloke","p_floor3",0)
#define Zollboden(%0) SetDynamicObjectMaterial(%0,0, 5986, "chateau_lawn","backstagefloor1_256",0)
#define Zollbecken(%0) SetDynamicObjectMaterial(%0,0, 10837, "airroadsigns_sfse","CJ_LAMPPOST1",0)
#define Zaun(%0) SetDynamicObjectMaterial(%0,1, 10837, "airroadsigns_sfse","CJ_LAMPPOST1",0) // Alle Z?une ID 970
#define Scheiben_LSPD(%0) SetDynamicObjectMaterial(%0,0, 1649, "wglass", "carshowwin2", 0) //Scheiben LSPD
#define MauerScheiben_LSPD(%0) SetDynamicObjectMaterial(%0,0, 3975, "lanbloke", "lasbevcit8", 0) //Mauer an Scheiben LSPD
#define Mauer_LSPD(%0) SetDynamicObjectMaterial(%0,0, 18202, "w_towncs_t", "wall256hi", 0) //Mauer LSPDhof
#define Mauer_FBI(%0) SetDynamicObjectMaterial(%0,0, 8839, "vgsecarshow","sw_wallbrick_06",0) //FBI
#define Decke_FBI(%0) SetDynamicObjectMaterial(%0,0, 12954, "sw_furniture","CJ_WOOD5",0) //FBI
#define Boden_FBI(%0) SetDynamicObjectMaterial(%0,0, 13007, "sw_bankint","woodfloor1",0) //FBI
#define Wand_FBI(%0) SetDynamicObjectMaterial(%0,0, 4600, "theatrelan2","gm_labuld2_b",0) //FBI
#define Plattform_Knast(%0) SetDynamicObjectMaterial(%0,1, 18202, "w_towncs_t","plaintarmac1",0) //Knast
#define Geb_Knast(%0) SetDynamicObjectMaterial(%0,0, 9495, "vict_sfw","newall10_seamless",0) //Knast
#define Treppe_Knast(%0) SetDynamicObjectMaterial(%0,1, 10837, "airroadsigns_sfse","CJ_LAMPPOST1",0) // Alle Z?une ID 970
#define Geb?ude_Knast(%0) SetDynamicObjectMaterial(%0,0, 8463, "vgseland","luxorwall01_128",0) //Knast
#define Etage_Knast(%0) SetDynamicObjectMaterial(%0,0, 11006, "mission3ground_sfse","Was_scrpyd_floor_hangar",0) //Knast
#define Weg_Knast(%0) SetDynamicObjectMaterial(%0,0, 8565, "vgsebuild01","ws_stonewall",0) //Knast
#define Gras_Knast(%0) SetDynamicObjectMaterial(%0,0, 8678, "wddngchplgrnd01","Grass",0) //Knast
#define Wand_ASF(%0) SetDynamicObjectMaterial(%0,0, 8463, "vgseland","luxorwall01_128",0) //AutohausSF
#define Boden_ASF(%0) SetDynamicObjectMaterial(%0,0, 10941, "silicon2_sfse","ws_stationfloor",0) //AutohausSF
#define Decke_ALV(%0) SetDynamicObjectMaterial(%0,0, 3975, "lanbloke", "p_floor3", 0) //Decke AutohausLV
#define Scheiben(%0) SetDynamicObjectMaterial(%0,0, 1649, "wglass", "carshowwin2", 0)

new ServerObjects[64];


public OnFilterScriptExit()
{
    for(new object; object<sizeof(ServerObjects); object++)
    {
        DestroyObject(ServerObjects[object]);
    }

    for(new playerid; playerid<sizeof(ServerObjects); playerid++)
    {
	    CreateDynamicObject(playerid, 1297, 881.2969, -1673.0078, 16.2344, 0.25, 0);
		CreateDynamicObject(playerid, 1297, 869.5469, -1673.0078, 16.2344, 0.25, 0);
		CreateDynamicObject(playerid, 1297, 892.2500, -1673.0078, 16.2344, 0.25, 0);
		CreateDynamicObject(playerid, 1297, 869.0859, -1654.2031, 16.2344, 0.25, 0);
		CreateDynamicObject(playerid, 1297, 891.3594, -1654.2031, 16.2344, 0.25, 0);
		CreateDynamicObject(playerid, 1297, 881.4531, -1654.2031, 16.2344, 0.25, 0);
		CreateDynamicObject(playerid, 6204, 880.6016, -1653.7656, 14.1797, 0.25, 0);
	}
	return 1;
}


public OnPlayerConnect(playerid)
{
	RemoveBuildings(playerid);

//Fahrschule
	RemoveBuildingForPlayer(playerid, 1308, 2089.8100, -1942.8900, 11.5156, 0.10); // telgrphpole02
	RemoveBuildingForPlayer(playerid, 1226, 2118.2900, -1939.4000, 16.3906, 0.10); // lamppost3
	RemoveBuildingForPlayer(playerid, 620, 2114.5500, -1928.1899, 5.0312, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 2113.3999, -1925.0400, 10.8046, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 2115.6699, -1922.7700, 10.8046, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 2123.3601, -1928.0699, 6.8437, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 5182, 2115.0000, -1921.5200, 15.3906, 0.10); // nwspltbild4_las2
	RemoveBuildingForPlayer(playerid, 5208, 2115.0000, -1921.5200, 15.3906, 0.10); // LOD Model of nwspltbild4_las2
	RemoveBuildingForPlayer(playerid, 620, 2122.6599, -1916.7900, 10.8046, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 2116.9299, -1916.0799, 10.8046, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 5231, 2085.2800, -1909.7099, 23.0000, 0.10); // snpedteew2_las2
	RemoveBuildingForPlayer(playerid, 5374, 2085.2800, -1909.7099, 23.0000, 1.10); // alphbrk9_las2
	RemoveBuildingForPlayer(playerid, 620, 2121.5100, -1909.5300, 10.8046, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 2110.2700, -1906.5899, 5.0312, 0.10); // veg_palm04
//Noobspawn
	RemoveBuildingForPlayer(playerid, 1350, 820.5859, -1763.8800, 12.3984, 0.10); // CJ_TRAFFIC_LIGHT4
	RemoveBuildingForPlayer(playerid, 6098, 836.5859, -1743.3000, 19.6093, 0.10); // gzbuild2_law
	RemoveBuildingForPlayer(playerid, 6076, 836.5859, -1743.3000, 19.6093, 0.10); // LOD Model of gzbuild2_law


//Sprunk, Snack & andere Automaten entfernen - by GangstaSunny
	RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 956, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1775, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1977, 0.0, 0.0, 0.0, 6000.0);

    //Langstreckenfahrer Strecke - Map by GangstaSunny
    RemoveBuildingForPlayer(playerid, 3688, 2450.8750, -2680.4531, 17.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 3746, 2519.8047, -2701.8750, 25.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 3758, 2454.8281, -2702.9141, 3.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 3753, 2454.8281, -2702.9141, 3.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 3620, 2519.8047, -2701.8750, 25.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 3621, 2450.8750, -2680.4531, 17.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2470.1406, -2628.2656, 13.1719, 0.25);

    //Ordnungsamt Base - Map by Risq
    RemoveBuildingForPlayer(playerid, 6071, 1087.9844, -1682.3281, 19.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1051.8750, -1680.5156, 14.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 615, 1051.2500, -1678.0234, 13.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 1072.5859, -1707.1719, 15.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 1108.0625, -1707.1719, 15.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1055.6172, -1692.6484, 14.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1058.3125, -1695.7656, 14.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 6063, 1087.9844, -1682.3281, 19.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1097.4297, -1699.4219, 14.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 1101.6563, -1699.5625, 14.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 1130.5391, -1684.3203, 15.8906, 0.25);

    //Burger Shot North - Map by Risq
    RemoveBuildingForPlayer(playerid, 5843, 1196.8438, -914.8672, 41.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 5858, 1214.1484, -913.4453, 43.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 5741, 1196.8438, -914.8672, 41.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 1522, 1199.9688, -917.6406, 42.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 5844, 1206.1406, -900.9766, 42.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 6010, 1214.1484, -913.4453, 43.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 5742, 1197.3203, -899.2109, 45.0938, 0.25);

    //Interglobal Television Interior Base - Map byZehoax
    RemoveBuildingForPlayer(playerid, 14795, 1388.880, -20.882, 1005.200, 0.250);

    //Flugzeug Autohaus LS - Map by Maximun
    RemoveBuildingForPlayer(playerid, 6340, 588.179, -1530.469, 25.593, 0.250);

/*	//Stadthalle Exterior - Map by BarbaNegra
	RemoveBuildingForPlayer(playerid, 4024, 1479.8672, -1790.3984, 56.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 4044, 1481.1875, -1785.0703, 22.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 4045, 1479.3359, -1802.2891, 12.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 1527, 1448.2344, -1755.8984, 14.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 4002, 1479.8672, -1790.3984, 56.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3980, 1481.1875, -1785.0703, 22.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 4003, 1481.0781, -1747.0313, 33.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 713, 1407.1953, -1749.3125, 13.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 713, 1405.2344, -1821.1172, 13.1016, 0.25);*/

	//M?llmann Base - by Ramin
	RemoveBuildingForPlayer(playerid, 3573, 1798.6484, -2057.9141, 14.9844, 0.25);

    //Zeitprison - .RaVe.
    RemoveBuildingForPlayer(playerid, 14878, 302.2422, 312.7578, 998.5781, 0.25);

	//Laufprison - .RaVe.
	RemoveBuildingForPlayer(playerid, 1458, 1313.0000, 618530304.0000, 2119.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1458, 1333.0000, 290161120.0000, 2142.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1458, 1325.0000, 797973632.0000, 2126.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 922, 1323.0000, 743530304.0000, 2144.0000, 0.25);

	//Werbetafeln
	RemoveBuildingForPlayer(playerid,1266,1475.6016,-990.9453,55.6250,0.25);
    RemoveBuildingForPlayer(playerid,1260,1475.6016,-990.9453,55.6250,0.25);
    RemoveBuildingForPlayer(playerid,4229,1597.9063,-1699.7500,30.2109,0.25);
    RemoveBuildingForPlayer(playerid,4230,1597.9063,-1699.7500,30.2109,0.25);
    RemoveBuildingForPlayer(playerid,4239,1407.9063,-1407.3984,33.9844,0.25);
    RemoveBuildingForPlayer(playerid,4753,1451.6172,-966.3828,57.4453,0.25);
    RemoveBuildingForPlayer(playerid,4757,1404.1406,-1309.1328,43.2891,0.25);
    RemoveBuildingForPlayer(playerid,4736,1404.1406,-1309.1328,43.2891,0.25);
    RemoveBuildingForPlayer(playerid,4734,1451.6172,-966.3828,57.4453,0.25);
    RemoveBuildingForPlayer(playerid,5854,992.5313,-962.7344,60.7813,0.25);
    RemoveBuildingForPlayer(playerid,6004,1351.8359,-914.4375,46.9922,0.25);
    RemoveBuildingForPlayer(playerid,5846,1351.8359,-914.4375,46.9922,0.25);
    RemoveBuildingForPlayer(playerid,6349,426.6875,-1360.1484,37.8906,0.25);
    RemoveBuildingForPlayer(playerid,13890,790.1328,-963.3281,59.4766,0.25);
    RemoveBuildingForPlayer(playerid,17916,2366.8125,-1537.5391,39.4688,0.25);
    RemoveBuildingForPlayer(playerid, 785, 2303.3281, -612.6953, 127.6406, 0.25);
    RemoveBuildingForPlayer(playerid, 785, 2431.3750, -657.0859, 119.6094, 0.25);
    RemoveBuildingForPlayer(playerid, 791, 2303.3281, -612.6953, 127.6406, 0.25);
    RemoveBuildingForPlayer(playerid, 693, 2309.4063, -564.2969, 132.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 694, 2358.8984, -616.1172, 130.6719, 0.25);
    RemoveBuildingForPlayer(playerid, 790, 2357.9141, -559.9063, 122.9141, 0.25);
    RemoveBuildingForPlayer(playerid, 696, 2373.8750, -740.6172, 130.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 696, 2375.3047, -666.7266, 131.8828, 0.25);
    RemoveBuildingForPlayer(playerid, 696, 2387.2656, -581.7813, 123.2656, 0.25);
    RemoveBuildingForPlayer(playerid, 790, 2389.1172, -728.3281, 126.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 693, 2408.1172, -556.9141, 111.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 791, 2431.3750, -657.0859, 119.6094, 0.25);

	//OBI Baumarkt - Map by Rocky_Balboa
	RemoveBuildingForPlayer(playerid, 17863, 2467.4609, -1538.2500, 27.6016, 0.25);

	//Parkplatz Zivispawn + Busfahrer Base - Map by Shirayama
	RemoveBuildingForPlayer(playerid, 712, 1568.5781, -2364.1484, 21.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1569.3125, -2342.1094, 11.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 671, 1530.8906, -2251.4219, 12.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1531.0859, -2250.3828, 11.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1531.0859, -2329.1406, 11.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1534.2344, -2273.9375, 21.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1533.6406, -2301.7188, 21.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1569.8359, -2234.6016, 11.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1570.5625, -2213.3359, 21.6484, 0.25);

	//Zoll Schranken - by Daniel_LeMarc
	RemoveBuildingForPlayer(playerid, 4521, -84.6797, -909.3438, 18.2422, 0.25);

	//San Fierro Nobel Autohaus - Map Niklas.B
	RemoveBuildingForPlayer(playerid, 9965, -1535.4219, 1168.6641, 18.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, -1567.0547, 1125.5781, 8.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, -1567.0547, 1153.6641, 8.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 3875, -1588.9531, 1205.9141, 13.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, -1552.7578, 1231.6094, 8.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 9951, -1535.4219, 1168.6641, 18.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, -1507.7656, 1179.3047, 8.8047, 0.25);

	//LSPD Base - Map by Daniel_LeMarc
 	RemoveBuildingForPlayer(playerid, 1266, 1538.5234, -1609.8047, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 4229, 1597.9063, -1699.7500, 30.2109, 0.25);
    RemoveBuildingForPlayer(playerid, 4230, 1597.9063, -1699.7500, 30.2109, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4453, -1713.3047, 14.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1709.6406, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.2969, -1702.6016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1693.3906, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1689.9844, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1687.1016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 646, 1545.5234, -1678.8438, 14.0000, 0.25);
    RemoveBuildingForPlayer(playerid, 646, 1553.8672, -1677.7266, 16.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 646, 1553.8672, -1673.4609, 16.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 646, 1545.5625, -1672.2188, 14.0000, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1664.6250, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1658.3438, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1661.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4766, -1648.4531, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1642.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.7422, -1638.9141, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1538.5234, -1609.8047, 19.8438, 0.25);

	//FBI Base - Map by Daniel_LeMarc
	RemoveBuildingForPlayer(playerid, 11025, -2199.3281, 264.3281, 42.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 11402, -2199.3281, 252.0078, 53.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2245.7734, 305.9141, 34.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2229.4688, 314.2500, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2245.7891, 236.8984, 34.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2245.4219, 265.6875, 34.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 956, -2229.1875, 286.4141, 34.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2197.0547, 214.2656, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 10973, -2199.3281, 264.3281, 42.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 10974, -2199.3281, 252.0078, 53.2500, 0.25);
	//RemoveBuildingForPlayer(playerid, 16094, 191.1406, 1870.0391, 21.4766, 0.25);
	//RemoveBuildingForPlayer(playerid, 16660, 215.9219, 1865.1797, 13.0234, 0.25);

	//Los Santos Rettungsdienst - Map by Blacktrax
	RemoveBuildingForPlayer(playerid, 4579, 1666.492, -1246.179, 123.085, 0.250);
	RemoveBuildingForPlayer(playerid, 1525, 1687.226, -1239.125, 15.812, 0.250);
	RemoveBuildingForPlayer(playerid, 4717, 1666.492, -1246.179, 123.085, 0.250);
	RemoveBuildingForPlayer(playerid, 1232, 1628.578, -1260.796, 16.445, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1670.695, -1282.117, 14.343, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1681.718, -1282.117, 14.343, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1691.859, -1282.117, 14.343, 0.250);
	RemoveBuildingForPlayer(playerid, 1232, 1646.101, -1259.578, 16.445, 0.250);
	RemoveBuildingForPlayer(playerid, 4564, 1666.492, -1246.179, 123.085, 0.250);
	RemoveBuildingForPlayer(playerid, 1232, 1646.101, -1233.320, 16.445, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1700.718, -1282.117, 14.343, 0.250);
	RemoveBuildingForPlayer(playerid, 717, 1698.195, -1270.359, 13.968, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1700.718, -1270.398, 14.343, 0.250);
	RemoveBuildingForPlayer(playerid, 717, 1698.648, -1258.359, 13.968, 0.250);
	RemoveBuildingForPlayer(playerid, 717, 1698.789, -1246.359, 14.265, 0.250);
	RemoveBuildingForPlayer(playerid, 717, 1698.757, -1233.820, 14.265, 0.250);
	RemoveBuildingForPlayer(playerid, 717, 1698.757, -1221.351, 14.265, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1700.718, -1258.414, 14.343, 0.250);
	RemoveBuildingForPlayer(playerid, 1215, 1700.718, -1246.570, 14.343, 0.250);

	//Los Santos Airport Tankstelle - Map by Blacktrax
	RemoveBuildingForPlayer(playerid, 3663, 1882.265, -2395.781, 14.468, 0.250);

	//Los Santos - Pay#N Spray Weg machen
	RemoveBuildingForPlayer(playerid, 5422, 2071.4766, -1831.4219, 14.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 5856, 1024.9844, -1029.3516, 33.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 6400, 488.2813, -1734.6953, 12.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 10575, -2716.3516, 217.4766, 5.3828, 0.25);

	//Los Santos - Busstation
	RemoveBuildingForPlayer(playerid, 712, 1568.5781, -2364.1484, 21.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1569.3125, -2342.1094, 11.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1531.0859, -2329.1406, 11.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1533.6406, -2301.7188, 21.6484, 0.25);

	//LSStra?en Breit
	RemoveBuildingForPlayer(playerid, 713, 1304.7734, -1729.9375, 12.4375, 0.25);

	//San News
	RemoveBuildingForPlayer(playerid, 1689, 745.5859, -1381.1094, 25.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 1689, 751.3359, -1368.0313, 25.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 1415, 732.8516, -1332.8984, 12.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1439, 732.7266, -1341.7734, 12.6328, 0.25);

	//Los Santos - Offroad Autohaus
	RemoveBuildingForPlayer(playerid, 5517, 1883.5234, -1576.4453, 20.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 5634, 1931.3125, -1574.8438, 16.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 740, 1887.1953, -1565.8984, 9.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 740, 1863.3125, -1568.6484, 11.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1832.8203, -1622.0000, 12.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1891.9688, -1622.0000, 12.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1857.5469, -1608.1172, 16.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1870.2578, -1602.8047, 12.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1883.8203, -1616.4297, 16.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1908.2813, -1608.1172, 16.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1943.8672, -1602.8047, 12.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1831.8906, -1600.3125, 12.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 645, 1835.1406, -1600.1797, 12.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1842.4219, -1569.4609, 12.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 5476, 1883.5234, -1576.4453, 20.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 5630, 1928.4922, -1575.9688, 20.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1307, 1931.7422, -1569.8828, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1951.5391, -1616.5078, 12.7813, 0.25);

	//Los Santos - PNS + Firmengeb?ude
	RemoveBuildingForPlayer(playerid, 5551, 2140.5156, -1735.1406, 15.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 5410, 2140.5156, -1735.1406, 15.8906, 0.25);

	//Los Santos - PNS + Cluckinbell
	RemoveBuildingForPlayer(playerid, 1283, 1373.4609, -1872.2266, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 4901, 1391.5703, -1891.5859, 18.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 5058, 1457.5625, -1895.9297, 22.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 4880, 1391.5703, -1891.5859, 18.5234, 0.25);

	//Los Santos - PNS n?he BSN
	RemoveBuildingForPlayer(playerid, 3685, 1230.5859, -1013.5859, 34.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 727, 1213.5469, -1075.0000, 29.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 732, 1212.9063, -1065.9063, 29.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3684, 1230.5859, -1013.5859, 34.7656, 0.25);

	//Los Santos - Trucker Base
	RemoveBuildingForPlayer(playerid, 3686, 2195.0859, -2216.8438, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2193.2578, -2286.2891, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2183.1719, -2237.2734, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2174.6406, -2215.6563, 15.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2193.0625, -2196.6406, 15.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 5305, 2198.8516, -2213.9219, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2234.3906, -2244.8281, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2226.9688, -2252.1406, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2219.4219, -2259.5234, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2212.0938, -2267.0703, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2204.6328, -2274.4141, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2165.0703, -2288.9688, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2193.2578, -2286.2891, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2204.6328, -2274.4141, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2212.0938, -2267.0703, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2219.4219, -2259.5234, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2194.4766, -2242.8750, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2217.2188, -2250.3594, 16.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2226.9688, -2252.1406, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2234.3906, -2244.8281, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2183.1719, -2237.2734, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2235.1641, -2231.8516, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2174.6406, -2215.6563, 15.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 3627, 2195.0859, -2216.8438, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 5244, 2198.8516, -2213.9219, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2193.0625, -2196.6406, 15.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2215.8047, -2199.2188, 16.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2207.8750, -2191.2500, 16.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2223.7422, -2207.1875, 16.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2240.7813, -2240.8984, 16.3672, 0.25);

	//LSPD Gef?ngnis T?ren
	RemoveBuildingForPlayer(playerid, 14843, 266.3516, 81.1953, 1001.2813, 0.25);

	//Los Santos - Bank
	RemoveBuildingForPlayer(playerid, 4075, 1791.796, -1716.984, 12.523, 0.250);
	RemoveBuildingForPlayer(playerid, 4076, 1783.101, -1702.304, 14.351, 0.250);
	RemoveBuildingForPlayer(playerid, 1531, 1799.132, -1708.765, 14.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1266, 1805.023, -1692.445, 25.148, 0.250);
	RemoveBuildingForPlayer(playerid, 4018, 1791.796, -1716.984, 12.523, 0.250);
	RemoveBuildingForPlayer(playerid, 4027, 1783.101, -1702.304, 14.351, 0.250);
	RemoveBuildingForPlayer(playerid, 1260, 1805.023, -1692.445, 25.148, 0.250);
	return 1;
}

public OnFilterScriptInit()
{
    print("Server Objecte werden geladen");


	for(new playerid; playerid<GetMaxPlayers(); playerid++)
    {
        if(IsPlayerConnected(playerid))
        {
			RemoveBuildings(playerid);
		}
	}
	ServerObjects[1] = CreateDynamicObject(3578, 907.21643, -1679.38257, 11.79901,   0.00000, 0.00000, 90.00000);
	ServerObjects[2] = CreateDynamicObject(970, 905.34497, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[3] = CreateDynamicObject(970, 907.46033, -1667.83215, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[4] = CreateDynamicObject(970, 907.46033, -1663.55176, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[5] = CreateDynamicObject(970, 907.46033, -1659.26819, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[6] = CreateDynamicObject(970, 907.46033, -1654.98694, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[7] = CreateDynamicObject(970, 907.46033, -1650.72437, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[8] = CreateDynamicObject(970, 907.46033, -1646.44202, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[9] = CreateDynamicObject(970, 907.46033, -1642.19836, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[10] = CreateDynamicObject(970, 907.46033, -1672.13428, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[11] = CreateDynamicObject(970, 901.11963, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[12] = CreateDynamicObject(970, 896.89941, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[13] = CreateDynamicObject(970, 892.67889, -1684.57861, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[14] = CreateDynamicObject(970, 888.45770, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[15] = CreateDynamicObject(970, 884.25342, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[16] = CreateDynamicObject(970, 880.05182, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[17] = CreateDynamicObject(970, 875.82971, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[18] = CreateDynamicObject(970, 871.60571, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[19] = CreateDynamicObject(970, 867.38208, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[20] = CreateDynamicObject(970, 863.15900, -1684.58008, 12.99970,   0.00000, 0.00000, 0.00000);
	ServerObjects[21] = CreateDynamicObject(870, 893.63629, -1653.31116, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[22] = CreateDynamicObject(870, 891.63672, -1653.25916, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[23] = CreateDynamicObject(870, 889.67517, -1653.24902, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[24] = CreateDynamicObject(870, 887.51520, -1653.26941, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[25] = CreateDynamicObject(870, 885.35522, -1653.27002, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[26] = CreateDynamicObject(870, 883.15540, -1653.29004, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[27] = CreateDynamicObject(870, 880.93518, -1653.31030, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[28] = CreateDynamicObject(870, 878.79535, -1653.31030, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[29] = CreateDynamicObject(870, 876.57458, -1653.30945, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[30] = CreateDynamicObject(870, 874.27399, -1653.28784, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[31] = CreateDynamicObject(870, 872.11322, -1653.28882, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[32] = CreateDynamicObject(870, 869.89319, -1653.27429, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[33] = CreateDynamicObject(870, 868.73462, -1653.19763, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[34] = CreateDynamicObject(870, 893.52966, -1673.82239, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[35] = CreateDynamicObject(870, 891.66968, -1673.83801, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[36] = CreateDynamicObject(870, 889.72986, -1673.81311, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[37] = CreateDynamicObject(870, 887.88983, -1673.78882, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[38] = CreateDynamicObject(870, 885.88611, -1673.78345, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[39] = CreateDynamicObject(870, 883.80536, -1673.82678, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[40] = CreateDynamicObject(870, 881.80609, -1673.76929, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[41] = CreateDynamicObject(870, 879.66614, -1673.77026, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[42] = CreateDynamicObject(870, 877.50616, -1673.78394, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[43] = CreateDynamicObject(870, 875.50446, -1673.72034, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[44] = CreateDynamicObject(870, 873.38501, -1673.77856, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[45] = CreateDynamicObject(870, 871.26428, -1673.73999, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[46] = CreateDynamicObject(870, 868.96442, -1673.78259, 13.45733,   0.00000, 0.00000, -62.04000);
	ServerObjects[47] = CreateDynamicObject(8324, 852.98090, -1664.07019, 13.35439,   0.00000, 0.00000, 90.00000);
	ServerObjects[48] = CreateDynamicObject(8324, 853.14526, -1647.12012, 13.35440,   0.00000, 0.00000, 90.00000);
	ServerObjects[49] = CreateDynamicObject(8324, 853.31427, -1630.14783, 13.35440,   0.00000, 0.00000, 90.00000);
	ServerObjects[50] = CreateDynamicObject(1232, 895.63544, -1653.33997, 15.12592,   0.00000, 0.00000, 0.00000);
	ServerObjects[51] = CreateDynamicObject(1232, 895.60046, -1673.94983, 15.12592,   0.00000, 0.00000, 0.00000);
	ServerObjects[52] = CreateDynamicObject(1232, 866.90369, -1673.87000, 15.12590,   0.00000, 0.00000, 180.00000);
	ServerObjects[53] = CreateDynamicObject(1232, 866.89844, -1653.37036, 15.12590,   0.00000, 0.00000, 180.00000);
	ServerObjects[54] = CreateDynamicObject(1297, 907.12708, -1674.71387, 15.79240,   0.00000, 0.00000, 90.00000);
	ServerObjects[55] = CreateDynamicObject(970, 889.22894, -1643.40454, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[56] = CreateDynamicObject(970, 895.30750, -1643.40454, 12.99970,   0.00000, 0.00000, 90.00000);
	ServerObjects[57] = CreateDynamicObject(2256, 890.76715, -1635.41052, 16.45063,   0.00000, 0.00000, 0.00000);
	ServerObjects[58] = CreateDynamicObject(1256, 885.68420, -1644.46033, 13.11500,   0.00000, 0.00000, 90.00000);
	ServerObjects[59] = CreateDynamicObject(1257, 909.64941, -1662.03772, 13.78871,   0.00000, 0.00000, 180.00000);
	ServerObjects[60] = CreateDynamicObject(1256, 882.66193, -1644.46033, 13.11500,   0.00000, 0.00000, 90.00000);
	ServerObjects[61] = CreateDynamicObject(19121, 890.56708, -1645.37463, 13.07624,   0.00000, 0.00000, 0.00000);
	ServerObjects[62] = CreateDynamicObject(19121, 892.25079, -1645.37463, 13.07620,   0.00000, 0.00000, 0.00000);
	ServerObjects[63] = CreateDynamicObject(19121, 894.04089, -1645.37463, 13.07620,   0.00000, 0.00000, 0.00000);

	//Fahrschul Interior
	new fsinterior_Object[174];
	new fsinterior_Actor[2];
	fsinterior_Object[0] = CreateObject(19450, 2111.1801, -3871.1828, 817.0493, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[0], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[1] = CreateObject(2737, 2106.8076, -3875.8103, 820.4622, 0.0000, 0.0000, 90.0000); //POLICE_NB_car
	SetObjectMaterial(fsinterior_Object[1], 0, 1381, "cranes_dyn2", "ws_sheetsteel", 0xFF696969);
	SetObjectMaterial(fsinterior_Object[1], 1, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[2] = CreateObject(19450, 2106.6589, -3875.5439, 817.0493, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[2], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[3] = CreateObject(18981, 2118.8879, -3883.5812, 818.1503, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(fsinterior_Object[3], 0, 14479, "skuzzy_motelmain", "mp_CJ_Laminate1", 0xFFFFF5EE);
	fsinterior_Object[4] = CreateObject(19450, 2111.1801, -3871.1828, 820.5499, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[4], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[5] = CreateObject(19450, 2120.7897, -3871.1828, 820.5499, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[5], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[6] = CreateObject(19450, 2106.6589, -3875.5439, 820.5499, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[6], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[7] = CreateObject(19450, 2111.1801, -3871.1828, 824.0488, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[7], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	SetObjectMaterial(fsinterior_Object[7], 1, 10398, "countryclub_sfs", "hc_brickwall2", 0x00000000);
	fsinterior_Object[8] = CreateObject(19450, 2106.6589, -3875.5439, 824.0488, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[8], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[9] = CreateObject(2162, 2106.7553, -3876.3647, 818.6312, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_1
	fsinterior_Object[10] = CreateObject(18981, 2118.2683, -3882.8256, 822.9594, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(fsinterior_Object[10], 0, 14789, "ab_sfgymmain", "ab_panelWall1", 0xFFFFFAFA);
	fsinterior_Object[11] = CreateObject(19450, 2120.7993, -3871.1828, 817.0493, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[11], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[12] = CreateObject(19450, 2120.8022, -3871.1828, 824.0488, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[12], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	SetObjectMaterial(fsinterior_Object[12], 1, 10398, "countryclub_sfs", "hc_brickwall2", 0x00000000);
	fsinterior_Object[13] = CreateObject(19325, 2114.2648, -3878.9726, 820.5095, 0.0000, 0.0000, 90.0000); //lsmall_window01
	SetObjectMaterial(fsinterior_Object[13], 0, 1419, "break_fence3", "CJ_FRAME_Glass", 0x00000000);
	fsinterior_Object[14] = CreateObject(2737, 2106.8076, -3873.8984, 820.4622, 0.0000, 0.0000, 90.0000); //POLICE_NB_car
	SetObjectMaterial(fsinterior_Object[14], 0, 1381, "cranes_dyn2", "ws_sheetsteel", 0xFF696969);
	SetObjectMaterial(fsinterior_Object[14], 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[15] = CreateObject(19450, 2111.1801, -3878.9729, 817.0493, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[15], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[16] = CreateObject(19450, 2111.1801, -3878.9729, 820.5499, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[16], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[17] = CreateObject(19450, 2111.1801, -3878.9729, 824.0488, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[17], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	SetObjectMaterial(fsinterior_Object[17], 1, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[18] = CreateObject(19089, 2106.7473, -3878.8857, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[18], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[19] = CreateObject(19089, 2106.7473, -3871.2644, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[19], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[20] = CreateDynamicObject(2163, 2106.7697, -3874.5783, 818.6242, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_2
	fsinterior_Object[21] = CreateObject(19434, 2116.7922, -3878.9729, 824.0499, 0.0000, 0.0000, 90.0000); //wall074
	SetObjectMaterial(fsinterior_Object[21], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[22] = CreateObject(19325, 2122.4277, -3878.9726, 820.5095, 0.0000, 0.0000, 90.0000); //lsmall_window01
	SetObjectMaterial(fsinterior_Object[22], 0, 1419, "break_fence3", "CJ_FRAME_Glass", 0x00000000);
	fsinterior_Object[23] = CreateObject(19434, 2116.7922, -3878.9729, 817.0493, 0.0000, 0.0000, 90.0000); //wall074
	SetObjectMaterial(fsinterior_Object[23], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[24] = CreateObject(19089, 2117.5712, -3878.9699, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[24], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[25] = CreateObject(19089, 2117.5712, -3878.9699, 820.6126, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[25], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[26] = CreateObject(19434, 2119.8913, -3878.9729, 817.0493, 0.0000, 0.0000, 90.0000); //wall074
	SetObjectMaterial(fsinterior_Object[26], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[27] = CreateObject(19089, 2119.1027, -3878.9699, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[27], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[28] = CreateObject(19089, 2126.4938, -3878.9699, 820.6126, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[28], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[29] = CreateObject(19434, 2121.3024, -3878.5280, 817.0493, 0.0000, 0.0000, 125.0000); //wall074
	SetObjectMaterial(fsinterior_Object[29], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[30] = CreateObject(19434, 2121.3024, -3878.5280, 820.5499, 0.0000, 0.0000, 125.0000); //wall074
	SetObjectMaterial(fsinterior_Object[30], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[31] = CreateObject(19089, 2115.9997, -3878.9699, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[31], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[32] = CreateObject(19434, 2119.8913, -3878.9729, 824.0499, 0.0000, 0.0000, 90.0000); //wall074
	SetObjectMaterial(fsinterior_Object[32], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[33] = CreateObject(19089, 2120.6242, -3878.9699, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[33], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[34] = CreateObject(19450, 2121.9411, -3875.5439, 817.0493, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[34], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[35] = CreateObject(19450, 2121.9411, -3875.5429, 820.5499, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[35], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[36] = CreateObject(19450, 2121.9411, -3875.5439, 824.0488, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[36], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[37] = CreateObject(19434, 2121.3024, -3878.5280, 824.0488, 0.0000, 0.0000, 125.0000); //wall074
	SetObjectMaterial(fsinterior_Object[37], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[38] = CreateObject(19089, 2121.8479, -3871.2644, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[38], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[39] = CreateObject(19089, 2121.8479, -3878.0576, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[39], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[40] = CreateObject(19434, 2118.3137, -3878.9721, 824.0499, 0.0000, 0.0000, 90.0000); //wall074
	SetObjectMaterial(fsinterior_Object[40], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[41] = CreateObject(19089, 2126.4938, -3878.9699, 820.3322, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[41], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[42] = CreateObject(19089, 2117.5532, -3878.9699, 820.3322, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[42], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[43] = CreateObject(19172, 2116.8190, -3878.9665, 820.4702, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[43], "Theorie", 0, OBJECT_MATERIAL_SIZE_512x512, "Arial", 40, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[43], " ", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[44] = CreateObject(19172, 2119.8796, -3878.9665, 820.4702, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[44], "Theorie", 0, OBJECT_MATERIAL_SIZE_512x512, "Arial", 40, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[44], " ", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[45] = CreateObject(19450, 2120.7099, -3883.7368, 817.0493, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[45], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[46] = CreateObject(19450, 2120.7099, -3883.7368, 824.0488, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[46], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[47] = CreateObject(19450, 2120.7099, -3883.7368, 820.5499, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[47], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[48] = CreateDynamicObject(2167, 2106.7343, -3877.9902, 818.6264, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_7
	fsinterior_Object[49] = CreateDynamicObject(18075, 2114.2109, -3875.1064, 822.4904, 0.0000, 0.0000, 90.0000); //lightD
	fsinterior_Object[50] = CreateDynamicObject(1806, 2108.6486, -3874.9191, 818.5940, 2.5000, 0.0000, -108.5000); //MED_OFFICE_CHAIR
	fsinterior_Object[51] = CreateObject(1721, 2112.3381, -3872.8369, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[51], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[51], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[52] = CreateObject(19450, 2116.2304, -3892.9826, 817.0493, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[52], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[53] = CreateObject(1721, 2112.3381, -3873.9575, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[53], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[53], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[54] = CreateObject(1721, 2112.3381, -3875.0795, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[54], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[54], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[55] = CreateObject(19962, 2110.9426, -3878.9047, 818.1503, 0.0000, 0.0000, 180.0000); //SAMPRoadSign15
	SetObjectMaterialText(fsinterior_Object[55], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[56] = CreateObject(2185, 2109.8002, -3875.8896, 818.6453, 0.0000, 0.0000, 90.0000); //MED_OFFICE6_DESK_1
	SetObjectMaterial(fsinterior_Object[56], 2, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	SetObjectMaterial(fsinterior_Object[56], 3, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0x00000000);
	fsinterior_Object[57] = CreateObject(19950, 2107.9992, -3878.9047, 818.1989, 0.0000, 0.0000, 180.0000); //SAMPRoadSign3
	SetObjectMaterialText(fsinterior_Object[57], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[58] = CreateObject(19955, 2109.4196, -3878.9023, 818.2089, 0.0000, 0.0000, 180.0000); //SAMPRoadSign8
	SetObjectMaterialText(fsinterior_Object[58], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[59] = CreateDynamicObject(2010, 2107.1367, -3872.2404, 818.6101, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	fsinterior_Object[60] = CreateObject(19964, 2114.5087, -3878.8842, 818.1503, 0.0000, 0.0000, 180.0000); //SAMPRoadSign17
	SetObjectMaterialText(fsinterior_Object[60], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[61] = CreateObject(19973, 2112.6469, -3878.8937, 818.1301, 0.0000, 0.0000, 180.0000); //SAMPRoadSign26
	SetObjectMaterialText(fsinterior_Object[61], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[62] = CreateObject(19172, 2106.7924, -3876.3498, 820.7805, 0.0000, 0.0000, 90.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[62], "- ? 1 Grundregeln", 0, OBJECT_MATERIAL_SIZE_512x256, "Segoe Print", 30, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[62], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[63] = CreateObject(19172, 2106.7924, -3876.4499, 820.5803, 0.0000, 0.0000, 90.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[63], "- ? 4 Abstand", 0, OBJECT_MATERIAL_SIZE_512x256, "Segoe Print", 30, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[63], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[64] = CreateObject(1721, 2113.4892, -3873.9575, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[64], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[64], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[65] = CreateObject(19172, 2106.7924, -3876.4399, 820.3701, 0.0000, 0.0000, 90.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[65], "- ? 8 Vorfahrt", 0, OBJECT_MATERIAL_SIZE_512x256, "Segoe Print", 30, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[65], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[66] = CreateObject(19172, 2106.7924, -3876.0192, 821.1104, 0.0000, 0.0000, 90.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[66], "Stra?enverkehrs-Ordnung (StVO)", 0, OBJECT_MATERIAL_SIZE_512x256, "Segoe Print", 30, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[66], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[67] = CreateObject(1721, 2114.6596, -3872.8369, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[67], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[67], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[68] = CreateObject(1721, 2113.4992, -3872.8369, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[68], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[68], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[69] = CreateObject(1721, 2115.8308, -3872.8369, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[69], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[69], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[70] = CreateObject(1721, 2116.9819, -3872.8369, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[70], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[70], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[71] = CreateObject(1721, 2112.3381, -3876.1796, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[71], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[71], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[72] = CreateObject(1721, 2114.6701, -3873.9575, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[72], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[72], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[73] = CreateObject(1721, 2115.8413, -3873.9575, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[73], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[73], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[74] = CreateObject(1721, 2116.9821, -3873.9575, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[74], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[74], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[75] = CreateObject(1721, 2113.4980, -3875.0795, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[75], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[75], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[76] = CreateObject(1721, 2114.6682, -3875.0795, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[76], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[76], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[77] = CreateObject(1721, 2115.8483, -3875.0795, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[77], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[77], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[78] = CreateObject(1721, 2116.9587, -3875.0795, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[78], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[78], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[79] = CreateObject(1721, 2113.5092, -3876.1796, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[79], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[79], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[80] = CreateObject(1721, 2114.6604, -3876.1796, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[80], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[80], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[81] = CreateObject(1721, 2115.8405, -3876.1796, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[81], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[81], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[82] = CreateObject(1721, 2116.9506, -3876.1796, 818.6362, 0.0000, 0.0000, 90.0000); //est_chair1
	SetObjectMaterial(fsinterior_Object[82], 0, -1, "none", "none", 0xFF8B0000);
	SetObjectMaterial(fsinterior_Object[82], 1, 10765, "airportgnd_sfse", "white", 0xFF808080);
	fsinterior_Object[83] = CreateDynamicObject(19825, 2112.9873, -3883.0961, 821.4899, 0.0000, 0.0000, 0.0000); //SprunkClock1
	fsinterior_Object[84] = CreateDynamicObject(3034, 2109.3481, -3871.2817, 820.8380, 0.0000, 0.0000, 0.0000); //bd_window
	fsinterior_Object[85] = CreateDynamicObject(3034, 2119.3901, -3871.2817, 820.8380, 0.0000, 0.0000, 0.0000); //bd_window
	fsinterior_Object[86] = CreateDynamicObject(3034, 2114.5200, -3871.2817, 820.8380, 0.0000, 0.0000, 0.0000); //bd_window
	fsinterior_Object[87] = CreateObject(19450, 2106.6589, -3885.1560, 817.0493, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[87], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[88] = CreateObject(19450, 2106.6589, -3885.1735, 820.5499, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[88], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[89] = CreateObject(19450, 2106.6589, -3885.1660, 824.0488, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[89], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[90] = CreateObject(19089, 2106.7473, -3879.0559, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[90], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[91] = CreateObject(2180, 2109.1728, -3882.5451, 818.6303, 0.0000, 0.0000, 0.0000); //MED_OFFICE5_DESK_3
	SetObjectMaterial(fsinterior_Object[91], 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	fsinterior_Object[92] = CreateObject(19354, 2119.6931, -3891.9206, 817.0493, 0.0000, 0.0000, -45.0000); //wall002
	SetObjectMaterial(fsinterior_Object[92], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[93] = CreateObject(2180, 2111.1225, -3882.5451, 818.6303, 0.0000, 0.0000, 0.0000); //MED_OFFICE5_DESK_3
	SetObjectMaterial(fsinterior_Object[93], 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	fsinterior_Object[94] = CreateObject(2180, 2107.2128, -3882.5451, 818.6303, 0.0000, 0.0000, 0.0000); //MED_OFFICE5_DESK_3
	SetObjectMaterial(fsinterior_Object[94], 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	fsinterior_Object[95] = CreateObject(18762, 2112.9963, -3882.5625, 820.3300, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(fsinterior_Object[95], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[96] = CreateObject(19089, 2112.4980, -3883.0483, 822.5039, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[96], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[97] = CreateObject(19089, 2113.4890, -3883.0483, 822.5039, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[97], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[98] = CreateObject(19089, 2113.4890, -3882.0673, 822.5039, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[98], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[99] = CreateObject(19089, 2112.4980, -3882.0673, 822.5039, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[99], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[100] = CreateObject(19450, 2107.6689, -3882.9619, 817.6699, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[100], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[101] = CreateObject(19089, 2106.7473, -3883.0476, 819.4144, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[101], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[102] = CreateObject(19089, 2112.4807, -3883.0476, 819.4146, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[102], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[103] = CreateObject(19172, 2109.6008, -3883.0458, 819.0363, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[103], "Anmeldung", 0, OBJECT_MATERIAL_SIZE_512x512, "Arial", 100, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[103], " ", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[104] = CreateObject(19172, 2111.3312, -3883.0458, 819.0363, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[104], "/", 0, OBJECT_MATERIAL_SIZE_512x512, "Webdings", 100, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[104], " ", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[105] = CreateObject(19172, 2107.8415, -3883.0458, 819.0363, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[105], " ! ", 0, OBJECT_MATERIAL_SIZE_512x512, "Webdings", 100, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[105], " ", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[106] = CreateObject(2011, 2113.0354, -3883.4030, 818.6300, 0.0000, 0.0000, 0.0000); //nu_plant2_ofc
	fsinterior_Object[107] = CreateObject(19450, 2120.9201, -3883.7368, 820.5499, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[107], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[108] = CreateObject(19450, 2120.7099, -3893.3691, 817.0493, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[108], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[109] = CreateObject(19450, 2120.7099, -3893.3674, 820.5499, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[109], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[110] = CreateObject(19450, 2120.7099, -3893.3579, 824.0488, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[110], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[111] = CreateObject(19450, 2116.2304, -3892.9826, 820.5499, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[111], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[112] = CreateObject(1522, 2119.1123, -3892.4426, 818.6143, 0.0000, 0.0000, 45.0000); //Gen_doorSHOP3
	SetObjectMaterial(fsinterior_Object[112], 0, 1569, "adam_v_doort", "ws_guardhousedoor", 0x00000000);
	fsinterior_Object[113] = CreateObject(19450, 2116.2304, -3892.9826, 824.0501, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[113], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[114] = CreateObject(19450, 2106.6027, -3892.9826, 820.5499, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[114], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[115] = CreateObject(19450, 2106.6589, -3894.7937, 820.5499, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[115], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[116] = CreateObject(19450, 2106.6589, -3894.7575, 817.0493, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[116], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[117] = CreateObject(19450, 2106.6589, -3894.7973, 824.0488, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(fsinterior_Object[117], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[118] = CreateObject(19450, 2106.6098, -3892.9826, 824.0501, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[118], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[119] = CreateObject(19450, 2106.6066, -3892.9826, 817.0493, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(fsinterior_Object[119], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFAFA);
	fsinterior_Object[120] = CreateObject(19354, 2119.6931, -3891.9206, 824.0501, 0.0000, 0.0000, -45.0000); //wall002
	SetObjectMaterial(fsinterior_Object[120], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[121] = CreateObject(19354, 2119.6931, -3891.9206, 820.5499, 0.0000, 0.0000, -45.0000); //wall002
	SetObjectMaterial(fsinterior_Object[121], 0, 10398, "countryclub_sfs", "hc_wall1", 0xFFB22222);
	fsinterior_Object[122] = CreateObject(19089, 2120.6242, -3890.8798, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[122], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[123] = CreateObject(19089, 2118.6022, -3892.8911, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[123], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[124] = CreateObject(19089, 2106.7607, -3892.8911, 822.3338, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(fsinterior_Object[124], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	fsinterior_Object[125] = CreateObject(19172, 2119.6259, -3891.8469, 821.6212, 0.0000, 0.0000, -135.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[125], "Auf", 0, OBJECT_MATERIAL_SIZE_512x512, "Arial", 50, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[125], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[126] = CreateObject(19172, 2119.6259, -3891.8469, 821.3510, 0.0000, 0.0000, -135.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[126], "Wiedersehen", 0, OBJECT_MATERIAL_SIZE_512x512, "Arial", 50, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[126], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[127] = CreateObject(19173, 2106.7587, -3880.7778, 820.8198, 0.0000, 0.0000, 90.0000); //SAMPPicture2
	SetObjectMaterial(fsinterior_Object[127], 0, 2266, "picture_frame", "CJ_PAINTING35", 0x00000000);
	fsinterior_Object[128] = CreateObject(1703, 2109.9526, -3892.3842, 818.6112, 0.0000, 0.0000, 180.0000); //kb_couch02
	SetObjectMaterial(fsinterior_Object[128], 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	fsinterior_Object[129] = CreateObject(2370, 2121.2551, -3873.3779, 818.6015, 0.0000, 0.0000, 0.0000); //Shop_set_1_Table
	SetObjectMaterial(fsinterior_Object[129], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	fsinterior_Object[130] = CreateDynamicObject(2011, 2113.2778, -3892.3979, 818.6389, 0.0000, 0.0000, 0.0000); //nu_plant2_ofc
	fsinterior_Object[131] = CreateObject(2370, 2121.2551, -3875.9980, 818.6015, 0.0000, 0.0000, 0.0000); //Shop_set_1_Table
	SetObjectMaterial(fsinterior_Object[131], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	fsinterior_Object[132] = CreateDynamicObject(1049, 2121.6613, -3873.0275, 819.4486, 0.0000, 0.0000, 90.0000); //spl_a_f_r
	fsinterior_Object[133] = CreateDynamicObject(1163, 2121.7155, -3872.9838, 821.0432, 270.0000, 0.0000, 90.0000); //spl_c_u_b
	fsinterior_Object[134] = CreateDynamicObject(1080, 2121.8481, -3875.1674, 820.2470, 0.0000, 0.0000, 180.0000); //wheel_sr5
	fsinterior_Object[135] = CreateDynamicObject(1085, 2121.7978, -3876.2446, 821.2135, 0.0000, 0.0000, 180.0000); //wheel_gn2
	fsinterior_Object[136] = CreateDynamicObject(1098, 2121.7565, -3877.1315, 819.7224, 0.0000, 0.0000, 180.0000); //wheel_gn5
	fsinterior_Object[137] = CreateDynamicObject(1019, 2121.8806, -3874.5458, 819.4982, 0.0000, 0.0000, -35.7000); //exh_b_t
	fsinterior_Object[138] = CreateDynamicObject(1018, 2122.1704, -3876.6972, 819.4694, 0.0000, 0.0000, -130.0997); //exh_b_ts
	fsinterior_Object[139] = CreateDynamicObject(1116, 2121.8537, -3873.0439, 820.0723, 0.0000, 0.0000, 90.0000); //fbb_lr_slv2
	fsinterior_Object[140] = CreateDynamicObject(19976, 2121.2370, -3878.4038, 818.5698, 0.0000, 0.0000, -145.1999); //SAMPRoadSign29
	fsinterior_Object[141] = CreateDynamicObject(1734, 2111.7001, -3882.6198, 822.4627, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT2
	fsinterior_Object[142] = CreateDynamicObject(1734, 2107.6364, -3882.6198, 822.4627, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT2
	fsinterior_Object[143] = CreateDynamicObject(1734, 2109.6867, -3882.6198, 822.4627, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT2
	fsinterior_Object[144] = CreateObject(2108, 2121.4299, -3871.7363, 818.5974, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT13
	SetObjectMaterial(fsinterior_Object[144], 1, -1, "none", "none", 0xFF696969);
	fsinterior_Object[145] = CreateDynamicObject(19814, 2113.5029, -3882.5451, 819.0999, 0.0000, 0.0000, 90.0000); //ElectricalOutlet2
	fsinterior_Object[146] = CreateObject(1703, 2107.2519, -3891.6943, 818.6112, 0.0000, 0.0000, 90.0000); //kb_couch02
	SetObjectMaterial(fsinterior_Object[146], 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	fsinterior_Object[147] = CreateObject(19893, 2110.1015, -3882.5895, 819.4196, 0.0000, 0.0000, -170.1999); //LaptopSAMP1
	SetObjectMaterial(fsinterior_Object[147], 1, 14489, "carlspics", "AH_picture3", 0x00000000);
	fsinterior_Object[148] = CreateObject(2069, 2107.1789, -3892.5134, 818.6677, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT7
	SetObjectMaterial(fsinterior_Object[148], 1, 4833, "airprtrunway_las", "policeha02black_128", 0x00000000);
	fsinterior_Object[149] = CreateDynamicObject(2011, 2107.3281, -3889.0068, 818.6494, 0.0000, 0.0000, 0.0000); //nu_plant2_ofc
	fsinterior_Object[150] = CreateObject(1703, 2112.5520, -3892.3842, 818.6112, 0.0000, 0.0000, 180.0000); //kb_couch02
	SetObjectMaterial(fsinterior_Object[150], 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	fsinterior_Object[151] = CreateDynamicObject(1775, 2120.1647, -3881.3098, 819.7374, 0.0000, 0.0000, -90.0000); //CJ_SPRUNK1
	fsinterior_Object[152] = CreateDynamicObject(1808, 2120.4321, -3882.6901, 818.5822, 0.0000, 0.0000, -90.0000); //CJ_WATERCOOLER2
	fsinterior_Object[153] = CreateObject(19173, 2110.2553, -3892.8964, 820.8801, 0.0000, 0.0000, 0.0000); //SAMPPicture2
	SetObjectMaterial(fsinterior_Object[153], 0, 2266, "picture_frame", "CJ_PAINTING11", 0x00000000);
	fsinterior_Object[154] = CreateDynamicObject(2286, 2120.5844, -3885.2180, 820.9500, 0.0000, 0.0000, -90.0000); //Frame_5
	fsinterior_Object[155] = CreateDynamicObject(2167, 2107.2324, -3879.0895, 818.6264, 0.0000, 0.0000, 0.0000); //MED_OFFICE_UNIT_7
	fsinterior_Object[156] = CreateDynamicObject(2163, 2108.1484, -3879.0859, 818.6243, 0.0000, 0.0000, 0.0000); //MED_OFFICE_UNIT_2
	fsinterior_Object[157] = CreateDynamicObject(2163, 2109.9191, -3879.0859, 818.6243, 0.0000, 0.0000, 0.0000); //MED_OFFICE_UNIT_2
	fsinterior_Object[158] = CreateDynamicObject(2257, 2114.1950, -3879.0947, 820.6102, 0.0000, 0.0000, 0.0000); //Frame_Clip_4
	fsinterior_Object[159] = CreateObject(19172, 2109.0817, -3879.0480, 821.3502, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[159], "RosaLife", 0, OBJECT_MATERIAL_SIZE_512x512, "Arial", 100, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[159], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[160] = CreateObject(19172, 2110.0615, -3879.0480, 820.7902, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(fsinterior_Object[160], "Fahrschule", 0, OBJECT_MATERIAL_SIZE_512x512, "Arial", 100, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(fsinterior_Object[160], "", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	fsinterior_Object[161] = CreateDynamicObject(1671, 2107.6633, -3881.3615, 819.0897, 0.0000, 0.0000, 0.0000); //swivelchair_A
	fsinterior_Object[162] = CreateDynamicObject(1671, 2111.5668, -3881.3615, 819.0897, 0.0000, 0.0000, 0.0000); //swivelchair_A
	fsinterior_Object[163] = CreateDynamicObject(19807, 2108.1909, -3882.6225, 819.5100, 0.0000, 0.0000, -148.3999); //Telephone1
	fsinterior_Object[164] = CreateObject(19893, 2112.0227, -3882.6127, 819.4196, 0.0000, 0.0000, -163.1999); //LaptopSAMP1
	SetObjectMaterial(fsinterior_Object[164], 1, 14489, "carlspics", "AH_landscap1", 0x00000000);
	fsinterior_Object[165] = CreateObject(19893, 2107.0732, -3882.5954, 819.4196, 0.0000, 0.0000, 150.5997); //LaptopSAMP1
	SetObjectMaterial(fsinterior_Object[165], 1, 18081, "cj_barb", "barberspic2", 0x00000000);
	fsinterior_Object[166] = CreateDynamicObject(19807, 2110.8913, -3882.6059, 819.5100, 0.0000, 0.0000, 173.5997); //Telephone1
	fsinterior_Object[167] = CreateDynamicObject(2894, 2109.3830, -3882.6103, 819.4401, 0.0000, 0.0000, 151.5997); //kmb_rhymesbook
	fsinterior_Object[168] = CreateDynamicObject(2485, 2110.3430, -3879.3520, 819.5802, 0.0000, 0.0000, -36.2999); //MODEL_CAR_1
	fsinterior_Object[169] = CreateObject(2311, 2120.1406, -3886.5725, 818.6030, 0.0000, 0.0000, 90.0000); //CJ_TV_TABLE2
	SetObjectMaterial(fsinterior_Object[169], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	fsinterior_Object[170] = CreateDynamicObject(2266, 2120.1264, -3888.7185, 820.1502, 0.0000, 0.0000, 270.0000); //Frame_WOOD_5
	fsinterior_Object[171] = CreateDynamicObject(2261, 2116.0803, -3892.3759, 820.3801, 0.0000, 0.0000, 180.0000); //Frame_SLIM_2
	fsinterior_Object[172] = CreateDynamicObject(18075, 2113.3134, -3885.9428, 822.4544, 0.0000, 0.0000, 0.0000); //lightD
	fsinterior_Object[173] = CreateDynamicObject(1671, 2109.7551, -3881.4216, 819.0897, 0.0000, 0.0000, 0.0000); //swivelchair_A
	fsinterior_Actor[0] = CreateActor(20, 2109.2729, -3874.9594, 819.6503, -91.9999); //Rich Guy (Madd Dogg'
	ApplyActorAnimation(fsinterior_Actor[0], "MISC", "SEAT_TALK_01", 4.0999, true, false, false, false, 0);
	fsinterior_Actor[1] = CreateActor(17, 2109.8166, -3882.0361, 819.6503, -179.6000); //Businessman
	ApplyActorAnimation(fsinterior_Actor[1], "MISC", "SEAT_TALK_01", 4.0999, true, false, false, false, 0);


	//Orangen Feld
	new ob_Object[133];
	new ob_Actor[1];
	ob_Actor[0] = CreateActor(161, 301.2251, 1143.3342, 8.7459+0.5000, -138.4001); //Farmer
	ApplyActorAnimation(ob_Actor[0], "PED", "SEAT_IDLE", 4.0998, true, false, false, false, 0);
	ob_Object[0] = CreateDynamicObject(792, 261.7289, 1124.4781, 7.9520, 0.0000, 0.0000, 0.0000); //aw_streettree1
	ob_Object[1] = CreateDynamicObject(19574, 262.7593, 1125.6157, 11.0297, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[2] = CreateDynamicObject(19574, 263.6293, 1124.6446, 12.0095, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[3] = CreateDynamicObject(19574, 262.6495, 1124.6247, 10.6795, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[4] = CreateDynamicObject(19574, 262.9295, 1125.4648, 11.7797, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[5] = CreateDynamicObject(19574, 262.9295, 1125.4648, 12.5095, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[6] = CreateDynamicObject(792, 250.5489, 1124.4781, 8.6621, 0.0000, 0.0000, -64.5000); //aw_streettree1
	ob_Object[7] = CreateDynamicObject(19574, 261.8693, 1126.3437, 11.7797, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[8] = CreateDynamicObject(19574, 261.8693, 1125.4133, 13.3196, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[9] = CreateDynamicObject(19574, 260.8093, 1125.4133, 12.6295, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[10] = CreateDynamicObject(19574, 261.4295, 1126.2928, 12.3495, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[11] = CreateDynamicObject(19574, 260.3294, 1125.1318, 11.3296, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[12] = CreateDynamicObject(19574, 261.0994, 1123.5128, 10.6996, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[13] = CreateDynamicObject(19574, 260.3493, 1123.5128, 11.8495, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[14] = CreateDynamicObject(19574, 260.1097, 1124.5229, 12.2796, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[15] = CreateDynamicObject(19574, 261.4892, 1123.1024, 12.5696, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[16] = CreateDynamicObject(19574, 262.3793, 1123.7525, 12.5696, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[17] = CreateDynamicObject(19574, 262.9992, 1123.7525, 11.2295, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[18] = CreateDynamicObject(19574, 263.5094, 1124.0628, 12.0095, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[19] = CreateDynamicObject(792, 238.6224, 1126.5561, 8.6621, 0.0000, 0.0000, -64.5000); //aw_streettree1
	ob_Object[20] = CreateDynamicObject(792, 248.5738, 1140.9530, 8.6621, 0.0000, 0.0000, -64.5000); //aw_streettree1
	ob_Object[21] = CreateDynamicObject(792, 254.7221, 1147.5749, 8.6621, 0.0000, 0.0000, -64.5000); //aw_streettree1
	ob_Object[22] = CreateDynamicObject(792, 237.5991, 1148.5166, 9.5321, 0.0000, 0.0000, -64.5000); //aw_streettree1
	ob_Object[23] = CreateDynamicObject(792, 256.8882, 1134.6500, 8.4121, 0.0000, 0.0000, -64.5000); //aw_streettree1
	ob_Object[24] = CreateDynamicObject(792, 227.7895, 1136.7026, 9.5321, 0.0000, 0.0000, 39.0000); //aw_streettree1
	ob_Object[25] = CreateDynamicObject(792, 241.9660, 1133.1811, 8.6621, 0.0000, 0.0000, -64.5000); //aw_streettree1
	ob_Object[26] = CreateDynamicObject(19574, 251.9396, 1123.9930, 11.6196, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[27] = CreateDynamicObject(19574, 251.4696, 1123.4830, 13.1895, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[28] = CreateDynamicObject(19574, 250.1896, 1123.0224, 12.1196, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[29] = CreateDynamicObject(19574, 249.5895, 1123.5423, 13.1295, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[30] = CreateDynamicObject(19574, 249.1994, 1124.8426, 11.6895, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[31] = CreateDynamicObject(19574, 249.0995, 1124.3725, 12.7396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[32] = CreateDynamicObject(19574, 250.1195, 1125.8526, 11.6895, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[33] = CreateDynamicObject(19574, 249.5496, 1125.8530, 12.6695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[34] = CreateDynamicObject(19574, 252.2295, 1124.6436, 12.9195, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[35] = CreateDynamicObject(19574, 251.7895, 1125.0638, 11.3395, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[36] = CreateDynamicObject(19574, 252.1195, 1125.5244, 12.5796, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[37] = CreateDynamicObject(19574, 251.4396, 1125.8144, 13.1597, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[38] = CreateDynamicObject(19574, 250.6296, 1126.0743, 12.7096, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[39] = CreateDynamicObject(19574, 256.0794, 1133.7818, 13.0895, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[40] = CreateDynamicObject(19574, 255.4994, 1134.6325, 12.1295, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[41] = CreateDynamicObject(19574, 255.4895, 1135.7321, 12.6895, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[42] = CreateDynamicObject(19574, 256.0093, 1133.5014, 11.4695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[43] = CreateDynamicObject(19574, 256.9894, 1133.6319, 13.3395, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[44] = CreateDynamicObject(19574, 256.9894, 1132.9813, 12.0396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[45] = CreateDynamicObject(19574, 255.8894, 1136.0218, 11.7396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[46] = CreateDynamicObject(19574, 256.7594, 1136.2121, 12.2695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[47] = CreateDynamicObject(19574, 257.4595, 1135.8518, 13.1996, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[48] = CreateDynamicObject(19574, 258.5696, 1135.0617, 11.3296, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[49] = CreateDynamicObject(19574, 258.3096, 1135.4322, 13.0396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[50] = CreateDynamicObject(19574, 258.3096, 1134.1518, 12.2396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[51] = CreateDynamicObject(19574, 257.5596, 1133.4215, 11.4195, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[52] = CreateDynamicObject(19574, 258.0494, 1134.1518, 13.1295, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[53] = CreateDynamicObject(19574, 243.4691, 1133.8719, 11.6795, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[54] = CreateDynamicObject(19574, 243.6692, 1133.6217, 12.9896, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[55] = CreateDynamicObject(19574, 242.6194, 1134.3719, 13.3996, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[56] = CreateDynamicObject(19574, 242.1293, 1134.8022, 12.2396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[57] = CreateDynamicObject(19574, 241.1293, 1134.5821, 12.7697, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[58] = CreateDynamicObject(19574, 240.7996, 1133.4010, 11.4397, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[59] = CreateDynamicObject(19574, 240.5496, 1133.8912, 12.0896, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[60] = CreateDynamicObject(19574, 243.0493, 1132.6412, 13.4896, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[61] = CreateDynamicObject(19574, 243.3493, 1132.6412, 11.6695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[62] = CreateDynamicObject(19574, 241.9293, 1131.7408, 11.9097, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[63] = CreateDynamicObject(19574, 241.9194, 1131.9912, 13.4397, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[64] = CreateDynamicObject(19574, 241.2595, 1132.4915, 13.1395, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[65] = CreateDynamicObject(19574, 241.3995, 1133.3122, 13.5797, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[66] = CreateDynamicObject(19574, 238.4396, 1127.8706, 11.4397, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[67] = CreateDynamicObject(19574, 239.3695, 1127.7705, 13.3796, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[68] = CreateDynamicObject(19574, 237.9295, 1128.0207, 12.5396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[69] = CreateDynamicObject(19574, 237.7696, 1126.6601, 13.1796, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[70] = CreateDynamicObject(19574, 237.4398, 1126.6601, 11.5197, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[71] = CreateDynamicObject(19574, 238.6697, 1125.1092, 11.8297, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[72] = CreateDynamicObject(19574, 237.9696, 1126.2503, 13.5197, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[73] = CreateDynamicObject(19574, 238.6697, 1125.5196, 13.6597, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[74] = CreateDynamicObject(19574, 239.4797, 1125.5603, 12.4596, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[75] = CreateDynamicObject(19574, 239.7895, 1126.1809, 13.3896, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[76] = CreateDynamicObject(19574, 239.9895, 1125.9608, 11.5297, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[77] = CreateDynamicObject(19574, 240.2295, 1127.4012, 11.8796, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[78] = CreateDynamicObject(19574, 250.1595, 1140.5924, 12.2695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[79] = CreateDynamicObject(19574, 250.0296, 1141.5627, 11.5696, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[80] = CreateDynamicObject(2096, 300.9367, 1143.6102, 8.1073, 0.0000, 0.0000, 41.7999); //CJ_RockingChair
	ob_Object[81] = CreateDynamicObject(19574, 250.0095, 1141.3625, 13.4295, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[82] = CreateDynamicObject(19574, 249.9895, 1142.2934, 12.2995, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[83] = CreateDynamicObject(19574, 248.4795, 1142.2055, 11.3596, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[84] = CreateDynamicObject(19574, 249.0594, 1142.4259, 12.9395, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[85] = CreateDynamicObject(19574, 247.6694, 1142.1258, 13.2995, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[86] = CreateDynamicObject(19574, 247.2196, 1142.0759, 11.6695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[87] = CreateDynamicObject(19574, 247.1996, 1140.9455, 12.3095, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[88] = CreateDynamicObject(19574, 248.0796, 1140.3249, 13.4996, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[89] = CreateDynamicObject(19574, 247.9696, 1141.1351, 13.4996, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[90] = CreateDynamicObject(19574, 247.9696, 1139.6944, 11.8095, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[91] = CreateDynamicObject(19574, 249.0296, 1139.1540, 12.4195, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[92] = CreateDynamicObject(19574, 248.8596, 1140.1148, 13.7295, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[93] = CreateDynamicObject(19574, 238.7792, 1149.2426, 12.2396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[94] = CreateDynamicObject(19574, 239.2192, 1148.6522, 13.9795, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[95] = CreateDynamicObject(19574, 238.7194, 1149.6131, 14.4695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[96] = CreateDynamicObject(19574, 237.8193, 1149.9835, 13.7896, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[97] = CreateDynamicObject(19574, 237.1694, 1149.8752, 12.5396, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[98] = CreateDynamicObject(19574, 237.0393, 1149.1245, 14.6197, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[99] = CreateDynamicObject(19574, 236.1694, 1148.5842, 13.1097, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[100] = CreateDynamicObject(19574, 237.2093, 1147.4537, 14.3197, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[101] = CreateDynamicObject(19574, 237.4394, 1147.2235, 12.4696, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[102] = CreateDynamicObject(19574, 238.2592, 1147.6336, 14.2397, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[103] = CreateDynamicObject(19574, 236.4694, 1149.8653, 13.6097, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[104] = CreateDynamicObject(19574, 239.0393, 1148.0422, 12.5696, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[105] = CreateDynamicObject(19574, 253.3695, 1147.5863, 11.7496, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[106] = CreateDynamicObject(19574, 253.3195, 1148.4168, 12.6395, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[107] = CreateDynamicObject(19574, 254.1795, 1147.7569, 13.5696, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[108] = CreateDynamicObject(19574, 253.7097, 1147.1971, 13.3296, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[109] = CreateDynamicObject(19574, 254.9295, 1146.3863, 13.3296, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[110] = CreateDynamicObject(19574, 254.9295, 1146.1059, 11.8095, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[111] = CreateDynamicObject(19574, 254.1497, 1146.1960, 12.3996, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[112] = CreateDynamicObject(19574, 255.5995, 1147.1965, 13.8795, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[113] = CreateDynamicObject(19574, 256.2495, 1147.1965, 12.2796, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[114] = CreateDynamicObject(19574, 256.5097, 1148.0163, 12.8296, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[115] = CreateDynamicObject(19574, 255.9096, 1148.6665, 13.5595, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[116] = CreateDynamicObject(19574, 255.0095, 1148.9868, 13.1695, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[117] = CreateDynamicObject(19574, 255.0095, 1149.2269, 11.8795, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[118] = CreateDynamicObject(19574, 255.9897, 1148.3665, 11.5095, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[119] = CreateDynamicObject(19574, 226.8793, 1137.7650, 12.2196, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[120] = CreateDynamicObject(19574, 226.2796, 1137.3452, 14.0797, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[121] = CreateDynamicObject(19574, 226.2095, 1136.4050, 13.3197, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[122] = CreateDynamicObject(19574, 226.8695, 1136.0545, 14.1097, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[123] = CreateDynamicObject(19574, 226.8695, 1135.2437, 12.6296, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[124] = CreateDynamicObject(19574, 228.0494, 1135.3338, 12.7096, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[125] = CreateDynamicObject(19574, 227.8195, 1136.0445, 14.2896, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[126] = CreateDynamicObject(19574, 228.5594, 1135.4641, 13.1897, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[127] = CreateDynamicObject(19574, 229.3094, 1136.6546, 13.1897, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[128] = CreateDynamicObject(19574, 229.0493, 1137.3651, 12.3297, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[129] = CreateDynamicObject(19574, 228.6894, 1137.3651, 14.4897, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[130] = CreateDynamicObject(19574, 227.5993, 1138.4156, 13.8997, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[131] = CreateDynamicObject(19574, 228.0993, 1138.1555, 12.4797, 0.0000, 0.0000, 0.0000); //Orange1
	ob_Object[132] = CreateDynamicObject(19574, 227.0894, 1137.5549, 14.6497, 0.0000, 0.0000, 0.0000); //Orange1


	//Noobspawn von Mr.M.
 	new noob_Object[227];
	new noob_Actor[4];
	noob_Object[0] = CreateObject(18981, 832.7542, -1722.2347, 12.0500, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(noob_Object[0], 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	noob_Object[1] = CreateObject(18762, 852.6339, -1759.1695, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[1], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[2] = CreateObject(18981, 832.7542, -1747.1434, 12.0500, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(noob_Object[2], 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	noob_Object[3] = CreateObject(18981, 840.5841, -1722.2347, 12.0500, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(noob_Object[3], 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	noob_Object[4] = CreateObject(18762, 820.7340, -1726.1789, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[4], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[5] = CreateObject(18762, 852.6339, -1756.1798, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[5], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[6] = CreateObject(18762, 852.6339, -1753.1997, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[6], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[7] = CreateObject(18762, 852.6339, -1750.2093, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[7], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[8] = CreateObject(18762, 852.6339, -1747.2097, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[8], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[9] = CreateObject(18762, 852.6339, -1744.2099, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[9], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[10] = CreateObject(18762, 852.6339, -1741.2397, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[10], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[11] = CreateObject(18762, 852.6339, -1738.2397, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[11], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[12] = CreateObject(18981, 840.5748, -1747.1434, 12.0501, 0.0000, 90.0000, 0.0000); //Concrete1mx25mx25m
	SetObjectMaterial(noob_Object[12], 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	noob_Object[13] = CreateObject(18762, 852.6339, -1735.2396, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[13], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[14] = CreateObject(18762, 852.6339, -1732.2795, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[14], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[15] = CreateObject(18762, 852.6339, -1729.2998, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[15], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[16] = CreateObject(18762, 852.6339, -1726.5891, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[16], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[17] = CreateObject(18762, 852.6546, -1726.1789, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[17], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[18] = CreateObject(18762, 851.6851, -1726.1789, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[18], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[19] = CreateObject(18762, 850.7052, -1726.1789, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[19], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[20] = CreateObject(19454, 852.6530, -1744.3735, 13.6927, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(noob_Object[20], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[21] = CreateObject(19454, 852.6530, -1753.9947, 13.6927, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(noob_Object[21], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[22] = CreateObject(19454, 852.6530, -1734.7435, 13.6927, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(noob_Object[22], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[23] = CreateObject(18766, 832.1405, -1733.7041, 12.0677, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[23], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[24] = CreateObject(19360, 852.6530, -1728.3232, 13.6927, 0.0000, 0.0000, 0.0000); //wall008
	SetObjectMaterial(noob_Object[24], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[25] = CreateObject(18762, 821.6779, -1726.1793, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[25], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[26] = CreateObject(18762, 822.5540, -1726.1789, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[26], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[27] = CreateObject(18762, 827.2431, -1731.0859, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[27], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[28] = CreateObject(18766, 831.7346, -1726.2027, 14.9666, 0.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[28], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[29] = CreateObject(18762, 827.2431, -1726.0699, 14.9715, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[29], 0, 8391, "ballys01", "ballywall02_128", 0x00000000);
	noob_Object[30] = CreateObject(18766, 841.6843, -1726.2027, 14.9666, 0.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[30], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[31] = CreateObject(18762, 827.2431, -1734.0550, 16.9717, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[31], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[32] = CreateObject(18762, 827.2431, -1736.0561, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[32], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[33] = CreateObject(18762, 827.2431, -1729.0849, 16.9717, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[33], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[34] = CreateObject(18762, 846.1832, -1736.0561, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[34], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[35] = CreateObject(18762, 832.2346, -1736.0561, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[35], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[36] = CreateObject(18762, 846.1832, -1729.0849, 16.9717, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[36], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[37] = CreateObject(18762, 840.6931, -1736.1308, 17.1016, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[37], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[38] = CreateObject(18762, 843.1939, -1736.0555, 16.9717, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[38], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[39] = CreateObject(18762, 841.1931, -1736.0561, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[39], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[40] = CreateObject(18762, 838.2139, -1736.0555, 16.9727, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[40], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[41] = CreateObject(18762, 834.6055, -1736.0561, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[41], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[42] = CreateObject(18762, 838.6054, -1736.0561, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[42], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[43] = CreateObject(18762, 834.6849, -1736.0555, 16.9717, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[43], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[44] = CreateDynamicObject(19325, 830.8723, -1736.2049, 14.4300, 0.0000, 0.0000, 90.0000); //lsmall_window01
	noob_Object[45] = CreateObject(18762, 834.6049, -1739.0157, 16.9717, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[45], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[46] = CreateObject(18762, 838.6049, -1741.0118, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[46], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[47] = CreateObject(18762, 838.6049, -1739.0157, 16.9717, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[47], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[48] = CreateObject(18762, 836.6035, -1741.0107, 16.9717, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[48], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[49] = CreateObject(18763, 837.1928, -1737.6887, 10.0719, 0.0000, 0.0000, 0.0000); //Concrete3mx3mx5m
	SetObjectMaterial(noob_Object[49], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[50] = CreateObject(18766, 846.1832, -1730.5533, 13.9764, 0.0000, 0.0000, 90.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[50], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[51] = CreateObject(18766, 832.1405, -1728.7342, 12.0670, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[51], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[52] = CreateObject(18766, 841.2410, -1733.7041, 12.0698, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[52], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[53] = CreateObject(18766, 841.2410, -1728.7248, 12.0698, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[53], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[54] = CreateObject(18763, 837.1928, -1739.9895, 10.0690, 0.0000, 0.0000, 0.0000); //Concrete3mx3mx5m
	SetObjectMaterial(noob_Object[54], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[55] = CreateObject(18763, 836.0330, -1739.9895, 10.0656, 0.0000, 0.0000, 0.0000); //Concrete3mx3mx5m
	SetObjectMaterial(noob_Object[55], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[56] = CreateObject(18763, 836.0330, -1737.6887, 10.0698, 0.0000, 0.0000, 0.0000); //Concrete3mx3mx5m
	SetObjectMaterial(noob_Object[56], 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	noob_Object[57] = CreateDynamicObject(19325, 827.1389, -1732.8149, 14.4300, 0.0000, 0.0000, 0.0000); //lsmall_window01
	noob_Object[58] = CreateDynamicObject(19325, 827.1389, -1726.1717, 14.4300, 0.0000, 0.0000, 0.0000); //lsmall_window01
	noob_Object[59] = CreateObject(18762, 834.6055, -1741.0118, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[59], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[60] = CreateDynamicObject(19325, 842.3826, -1736.2049, 14.4300, 0.0000, 0.0000, 90.0000); //lsmall_window01
	noob_Object[61] = CreateDynamicObject(19325, 834.5327, -1738.4941, 13.4600, 90.0000, 0.0000, 0.0000); //lsmall_window01
	noob_Object[62] = CreateDynamicObject(19325, 838.6931, -1738.4941, 13.4600, 90.0000, 0.0000, 0.0000); //lsmall_window01
	noob_Object[63] = CreateObject(18766, 836.6060, -1746.4541, 12.0698, 90.0000, 0.0000, 90.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[63], 0, 3980, "cityhall_lan", "man_cellarfloor128", 0x00000000);
	noob_Object[64] = CreateObject(18762, 835.3958, -1741.0140, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[64], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[65] = CreateDynamicObject(18762, 838.6049, -1741.0118, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	noob_Object[66] = CreateObject(18762, 837.8950, -1741.0140, 14.0817, 0.0000, 0.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[66], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[67] = CreateObject(18766, 836.6060, -1754.6650, 12.0726, 90.0000, 0.0000, 90.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[67], 0, 3980, "cityhall_lan", "man_cellarfloor128", 0x00000000);
	noob_Object[68] = CreateObject(18762, 839.5933, -1759.1695, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[68], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[69] = CreateObject(18762, 842.5733, -1759.1695, 12.9308, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[69], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[70] = CreateObject(18762, 846.2133, -1759.1688, 13.0208, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[70], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[71] = CreateObject(18762, 849.7036, -1759.1695, 12.9308, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[71], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[72] = CreateObject(18762, 845.9238, -1759.1711, 12.9308, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[72], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[73] = CreateObject(19454, 847.3228, -1759.1446, 13.6927, 0.0000, 0.0000, 90.0000); //wall094
	SetObjectMaterial(noob_Object[73], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[74] = CreateObject(19454, 844.7528, -1759.1447, 13.6927, 0.0000, 0.0000, 90.0000); //wall094
	SetObjectMaterial(noob_Object[74], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[75] = CreateDynamicObject(1232, 839.6218, -1759.1488, 13.0247, 0.0000, 0.0000, 0.0000); //Streetlamp1
	noob_Object[76] = CreateDynamicObject(1319, 835.7282, -1759.5920, 13.0943, 0.0000, 0.0000, 0.0000); //ws_ref_bollard
	noob_Object[77] = CreateObject(19449, 839.0202, -1754.8509, 10.9238, 0.0000, 0.0000, 0.0000); //wall089
	SetObjectMaterial(noob_Object[77], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	noob_Object[78] = CreateObject(19449, 839.0202, -1746.3260, 10.9270, 0.0000, 0.0000, 0.0000); //wall089
	SetObjectMaterial(noob_Object[78], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	noob_Object[79] = CreateObject(18762, 833.6134, -1759.1695, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[79], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[80] = CreateObject(18762, 833.6143, -1756.1798, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[80], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[81] = CreateObject(18762, 833.6149, -1753.1997, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[81], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[82] = CreateObject(18762, 830.6135, -1753.1993, 12.9308, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[82], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[83] = CreateObject(18762, 827.1655, -1753.1997, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[83], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[84] = CreateObject(18762, 823.7133, -1753.1993, 12.9308, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[84], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[85] = CreateObject(18762, 820.7453, -1753.1997, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[85], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[86] = CreateObject(18762, 827.6132, -1753.1988, 12.9308, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[86], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[87] = CreateObject(18762, 820.7435, -1750.2093, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[87], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[88] = CreateObject(18762, 820.7453, -1747.2099, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[88], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[89] = CreateObject(18762, 820.7435, -1744.2198, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[89], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[90] = CreateObject(18762, 820.7453, -1741.2301, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[90], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[91] = CreateObject(18762, 820.7435, -1738.2397, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[91], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[92] = CreateObject(18762, 820.7453, -1735.2602, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[92], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[93] = CreateObject(18762, 820.7435, -1732.2899, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[93], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[94] = CreateObject(18762, 820.7453, -1729.3103, 13.0207, 0.0000, 0.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[94], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[95] = CreateObject(18762, 820.7479, -1728.3099, 12.9308, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[95], 0, 3979, "civic01_lan", "crazy paving", 0x00000000);
	noob_Object[96] = CreateObject(19454, 820.7924, -1747.8752, 13.6927, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(noob_Object[96], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[97] = CreateObject(19454, 820.7924, -1738.2749, 13.6927, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(noob_Object[97], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[98] = CreateObject(19454, 820.7924, -1730.5738, 13.6927, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(noob_Object[98], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[99] = CreateObject(19454, 826.0421, -1753.1955, 13.6927, 0.0000, 0.0000, 90.0000); //wall094
	SetObjectMaterial(noob_Object[99], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[100] = CreateObject(19454, 829.2531, -1753.1955, 13.6927, 0.0000, 0.0000, 90.0000); //wall094
	SetObjectMaterial(noob_Object[100], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[101] = CreateObject(19360, 833.6729, -1757.0732, 13.6927, 0.0000, 0.0000, 0.0000); //wall008
	SetObjectMaterial(noob_Object[101], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[102] = CreateObject(19360, 833.6729, -1755.1628, 13.6927, 0.0000, 0.0000, 0.0000); //wall008
	SetObjectMaterial(noob_Object[102], 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	noob_Object[103] = CreateObject(18766, 825.2454, -1755.9056, 12.0698, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[103], 0, 10755, "airportrminl_sfse", "ws_rotten_concrete1", 0xFF696969);
	noob_Object[104] = CreateObject(18766, 828.4357, -1755.9056, 12.0698, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[104], 0, 10755, "airportrminl_sfse", "ws_rotten_concrete1", 0xFF696969);
	noob_Object[105] = CreateObject(18766, 825.2454, -1757.1561, 12.0710, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[105], 0, 10755, "airportrminl_sfse", "ws_rotten_concrete1", 0xFF696969);
	noob_Object[106] = CreateDynamicObject(19893, 833.2271, -1751.3620, 13.3275, 0.0000, 0.0000, -115.0000); //LaptopSAMP1
	noob_Object[107] = CreateObject(19449, 834.1936, -1754.8509, 10.9238, 0.0000, 0.0000, 0.0000); //wall089
	SetObjectMaterial(noob_Object[107], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	noob_Object[108] = CreateObject(18762, 846.1832, -1734.0566, 16.9717, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[108], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[109] = CreateDynamicObject(19466, 836.6259, -1741.0559, 16.0058, 0.0000, 0.0000, 90.0000); //window001
	noob_Object[110] = CreateDynamicObject(2001, 845.2301, -1731.4520, 12.5212, 0.0000, 0.0000, 0.0000); //nu_plant_ofc
	noob_Object[111] = CreateObject(18766, 832.1405, -1733.7041, 16.9720, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[111], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[112] = CreateDynamicObject(2714, 833.8062, -1726.7347, 14.6892, 0.0000, 0.0000, 0.0000); //CJ_OPEN_SIGN_2
	noob_Object[113] = CreateObject(18766, 841.3809, -1733.7041, 16.9734, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[113], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[114] = CreateObject(18766, 841.3809, -1728.7158, 16.9729, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[114], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[115] = CreateObject(18762, 836.6035, -1740.0517, 16.9720, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[115], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[116] = CreateObject(18762, 836.6035, -1739.1120, 16.9722, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[116], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[117] = CreateObject(18762, 836.6035, -1738.2125, 16.9724, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[117], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[118] = CreateObject(18762, 836.6035, -1737.3226, 16.9726, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[118], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[119] = CreateObject(18762, 836.6035, -1736.6124, 16.9724, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[119], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[120] = CreateObject(18762, 844.2841, -1736.1308, 17.1016, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[120], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[121] = CreateObject(18762, 838.6900, -1739.1108, 17.1016, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[121], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[122] = CreateObject(18762, 834.5194, -1739.1108, 17.1016, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[122], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[123] = CreateObject(18762, 836.6035, -1741.1108, 17.1016, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[123], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[124] = CreateObject(18762, 846.2808, -1733.2209, 17.1016, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[124], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[125] = CreateObject(18762, 846.2808, -1728.3115, 17.1016, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[125], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[126] = CreateObject(18762, 827.1699, -1728.3115, 17.1016, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[126], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[127] = CreateObject(18762, 827.1699, -1733.2209, 17.1016, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[127], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[128] = CreateObject(18762, 829.1724, -1736.1308, 17.1016, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[128], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[129] = CreateObject(18762, 832.5230, -1736.1308, 17.1016, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[129], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF696969);
	noob_Object[130] = CreateObject(18762, 830.2335, -1736.0555, 16.9717, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx5m
	SetObjectMaterial(noob_Object[130], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[131] = CreateObject(3521, 841.7186, -1755.8120, 14.0565, 0.0000, 0.0000, -136.6000); //vgsn_RBStiff
	SetObjectMaterial(noob_Object[131], 0, 4829, "airport_las", "Grass_128HV", 0x00000000);
	SetObjectMaterial(noob_Object[131], 1, 3979, "civic01_lan", "crazy paving", 0x00000000);
	SetObjectMaterial(noob_Object[131], 2, 3979, "civic01_lan", "crazy paving", 0x00000000);
	SetObjectMaterial(noob_Object[131], 3, 1381, "cranes_dyn2", "ws_sheetsteel", 0x00000000);
	SetObjectMaterial(noob_Object[131], 4, 1381, "cranes_dyn2", "ws_sheetsteel", 0x00000000);
	noob_Object[132] = CreateObject(19172, 841.9765, -1755.4079, 14.1506, 0.0000, 0.0000, -136.6000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[132], "_________________", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 39, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[132], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[133] = CreateDynamicObject(669, 848.4824, -1755.3159, 12.6990, 0.0000, 0.0000, 0.0000); //sm_venoob_tree4
	noob_Object[134] = CreateDynamicObject(2011, 838.2365, -1741.9366, 12.5528, 0.0000, 0.0000, 0.0000); //nu_plant2_ofc
	noob_Object[135] = CreateDynamicObject(647, 848.7218, -1728.4599, 13.3297, 0.0000, 0.0000, 0.0000); //new_bushsm
	noob_Object[136] = CreateObject(19449, 834.1936, -1746.3100, 10.9238, 0.0000, 0.0000, 0.0000); //wall089
	SetObjectMaterial(noob_Object[136], 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	noob_Object[137] = CreateObject(2599, 833.4616, -1748.3736, 13.0059, 0.0000, 0.0000, -44.9000); //CJ_SEX_SHOP_SIGN
	SetObjectMaterial(noob_Object[137], 0, 16093, "a51_ext", "ws_whitewall2_top", 0xFF0000CD);
	noob_Object[138] = CreateObject(3861, 832.7359, -1750.6483, 13.6976, 0.0000, 0.0000, 90.0000); //marketstall01_SFXRF
	SetObjectMaterial(noob_Object[138], 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	SetObjectMaterial(noob_Object[138], 1, 14786, "ab_sfgymbeams", "knot_wood128", 0x00000000);
	noob_Object[139] = CreateObject(19172, 833.6333, -1748.2381, 12.9181, -17.3999, 0.3998, 134.9996); //SAMPPicture1
	SetObjectMaterialText(noob_Object[139], "Verleih", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 19, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[139], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[140] = CreateObject(1251, 829.8767, -1756.2220, 12.5101, 0.0000, 90.0000, 0.0000); //smashbar
	SetObjectMaterial(noob_Object[140], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	noob_Object[141] = CreateObject(19172, 841.9765, -1755.4127, 14.3704, 0.0000, 0.0000, -136.6000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[141], "RosaLife Reloaded", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 35, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[141], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[142] = CreateDynamicObject(1232, 833.6416, -1759.1488, 13.0247, 0.0000, 0.0000, 0.0000); //Streetlamp1
	noob_Object[143] = CreateDynamicObject(1232, 833.6416, -1753.1883, 13.0247, 0.0000, 0.0000, 0.0000); //Streetlamp1
	noob_Object[144] = CreateDynamicObject(1232, 820.7813, -1753.1883, 13.0247, 0.0000, 0.0000, 0.0000); //Streetlamp1
	noob_Object[145] = CreateDynamicObject(1232, 820.7813, -1726.1579, 13.0247, 0.0000, 0.0000, 0.0000); //Streetlamp1
	noob_Object[146] = CreateDynamicObject(1232, 852.7517, -1726.1579, 13.0247, 0.0000, 0.0000, 0.0000); //Streetlamp1
	noob_Object[147] = CreateObject(19174, 828.2672, -1755.7735, 12.5783, 270.0000, 0.0000, 0.0000); //SAMPPicture3
	SetObjectMaterialText(noob_Object[147], "P", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 90, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[147], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[148] = CreateObject(1251, 833.0274, -1756.2220, 12.5101, 0.0000, 90.0000, 0.0000); //smashbar
	SetObjectMaterial(noob_Object[148], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	noob_Object[149] = CreateObject(1251, 826.6668, -1756.2220, 12.5101, 0.0000, 90.0000, 0.0000); //smashbar
	SetObjectMaterial(noob_Object[149], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	noob_Object[150] = CreateObject(1251, 823.4865, -1756.2220, 12.5101, 0.0000, 90.0000, 0.0000); //smashbar
	SetObjectMaterial(noob_Object[150], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	noob_Object[151] = CreateObject(1251, 820.3565, -1756.2220, 12.5101, 0.0000, 90.0000, 0.0000); //smashbar
	SetObjectMaterial(noob_Object[151], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	noob_Object[152] = CreateObject(1251, 823.8466, -1753.7823, 12.5101, 0.0000, 90.0000, 90.0000); //smashbar
	SetObjectMaterial(noob_Object[152], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	noob_Object[153] = CreateObject(1251, 829.6572, -1753.7823, 12.5101, 0.0000, 90.0000, 90.0000); //smashbar
	SetObjectMaterial(noob_Object[153], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	noob_Object[154] = CreateObject(19172, 841.9765, -1755.4127, 15.0305, 0.0000, 0.0000, -136.6000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[154], "Willkommen auf", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 39, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[154], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[155] = CreateObject(19174, 831.5874, -1755.7735, 12.5783, 270.0000, 0.0000, 0.0000); //SAMPPicture3
	SetObjectMaterialText(noob_Object[155], "P", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 90, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[155], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[156] = CreateObject(19174, 825.0673, -1755.7735, 12.5783, 270.0000, 0.0000, 0.0000); //SAMPPicture3
	SetObjectMaterialText(noob_Object[156], "P", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 90, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[156], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[157] = CreateObject(19174, 821.9876, -1755.7735, 12.5783, 270.0000, 0.0000, 0.0000); //SAMPPicture3
	SetObjectMaterialText(noob_Object[157], "P", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 90, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[157], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[158] = CreateObject(19087, 837.4370, -1741.0589, 15.0495, 0.0000, 90.0000, 0.0000); //Rope1
	SetObjectMaterial(noob_Object[158], 0, 3980, "cityhall_lan", "man_cellarfloor128", 0x00000000);
	noob_Object[159] = CreateObject(19172, 836.5457, -1741.5998, 17.1273, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[159], "Neulings-Spawn", 0, OBJECT_MATERIAL_SIZE_256x256, "Arial", 38, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[159], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[160] = CreateDynamicObject(671, 843.1372, -1739.4000, 12.4586, 0.0000, 0.0000, 0.0000); //sm_bushytree
	noob_Object[161] = CreateDynamicObject(673, 849.4301, -1732.6363, 12.0078, 0.0000, 0.0000, 0.0000); //sm_bevhiltree
	noob_Object[162] = CreateDynamicObject(1280, 838.7213, -1745.1617, 12.9497, 0.0000, 0.0000, 0.0000); //parkbench1
	noob_Object[163] = CreateDynamicObject(647, 849.6463, -1729.2485, 13.3297, 0.0000, 0.0000, 95.5000); //new_bushsm
	noob_Object[164] = CreateDynamicObject(715, 824.7871, -1750.8553, 20.6490, 0.0000, 0.0000, 0.0000); //venoob_bevtree3
	noob_Object[165] = CreateDynamicObject(1280, 838.7213, -1752.4526, 12.9497, 0.0000, 0.0000, 0.0000); //parkbench1
	noob_Object[166] = CreateDynamicObject(3694, 845.3206, -1744.7789, 12.8872, 0.0000, 0.0000, 124.5998); //ryder_holes
	noob_Object[167] = CreateDynamicObject(2011, 835.0363, -1741.9366, 12.5528, 0.0000, 0.0000, 0.0000); //nu_plant2_ofc
	noob_Object[168] = CreateDynamicObject(1281, 826.7437, -1745.8966, 13.3218, 0.0000, 0.0000, -49.4999); //parktable1
	noob_Object[169] = CreateDynamicObject(2964, 829.9741, -1733.5316, 12.5389, 0.0000, 0.0000, 0.0000); //k_pooltablesm
	noob_Object[170] = CreateDynamicObject(1281, 830.0993, -1739.4045, 13.3218, 0.0000, 0.0000, 22.0000); //parktable1
	noob_Object[171] = CreateDynamicObject(2942, 835.1901, -1740.1793, 13.2145, 0.0000, 0.0000, 180.0000); //kmb_atm1
	noob_Object[172] = CreateObject(1340, 844.5407, -1745.5461, 13.6625, 0.0000, 0.0000, -150.5000); //chillidogcart
	SetObjectMaterial(noob_Object[172], 5, 19853, "mihouse1", "window1edited", 0x00000000);
	SetObjectMaterial(noob_Object[172], 6, -1, "none", "none", 0xFFFFFAFA);
	noob_Object[173] = CreateObject(18763, 844.5999, -1745.4858, 10.0899, 0.0000, 0.0000, 28.6998); //Concrete3mx3mx5m
	SetObjectMaterial(noob_Object[173], 0, 3980, "cityhall_lan", "man_cellarfloor128", 0x00000000);
	noob_Object[174] = CreateObject(19087, 837.6439, -1741.0589, 16.7187, 0.0000, 46.5998, 0.0000); //Rope1
	SetObjectMaterial(noob_Object[174], 0, 3980, "cityhall_lan", "man_cellarfloor128", 0x00000000);
	noob_Object[175] = CreateObject(19172, 833.5581, -1748.3109, 13.2523, -17.3999, 0.3998, 134.9996); //SAMPPicture1
	SetObjectMaterialText(noob_Object[175], "Roller", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, false, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[175], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_LEFT);
	noob_Object[176] = CreateObject(19172, 845.6873, -1729.1667, 14.4897, 0.0000, 0.0000, 270.0000); //SAMPPicture1
	SetObjectMaterial(noob_Object[176], 0, 1414, "break_street1", "CJ_TV_SCREEN", 0x00000000);
	noob_Object[177] = CreateObject(19087, 835.8461, -1741.0589, 16.5200, 0.0000, 46.5998, 180.0000); //Rope1
	SetObjectMaterial(noob_Object[177], 0, 3980, "cityhall_lan", "man_cellarfloor128", 0x00000000);
	noob_Object[178] = CreateObject(19172, 845.6873, -1733.9272, 14.4897, 0.0000, 0.0000, 270.0000); //SAMPPicture1
	SetObjectMaterial(noob_Object[178], 0, 1414, "break_street1", "CJ_TV_SCREEN", 0x00000000);
	noob_Object[179] = CreateObject(19172, 845.6699, -1733.9270, 14.2496, 0.0000, 0.0000, 270.0000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[179], "www.rosalife.de", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 23, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[179], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	noob_Object[180] = CreateObject(19172, 845.6699, -1733.0560, 14.7594, 0.0000, 0.0000, 270.0000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[180], "Forum:", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[180], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	noob_Object[181] = CreateObject(18766, 832.1405, -1728.7143, 16.9710, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[181], 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0x00000000);
	noob_Object[182] = CreateObject(19172, 845.6699, -1729.1771, 14.2496, 0.0000, 0.0000, 270.0000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[182], "ts.rosalife.de", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 23, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[182], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	noob_Object[183] = CreateObject(19172, 845.6699, -1729.1466, 14.7594, 0.0000, 0.0000, 270.0000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[183], "Teamspeak:", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[183], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	noob_Object[184] = CreateObject(1703, 845.1762, -1728.1793, 12.5334, 0.0000, 0.0000, 270.0000); //kb_couch02
	SetObjectMaterial(noob_Object[184], 0, 18010, "genintrestrest2", "kbsofa333c", 0xFF696969);
	noob_Object[185] = CreateObject(1703, 845.1762, -1732.9293, 12.5334, 0.0000, 0.0000, 270.0000); //kb_couch02
	SetObjectMaterial(noob_Object[185], 0, 18010, "genintrestrest2", "kbsofa333c", 0xFF696969);
	noob_Object[186] = CreateDynamicObject(1775, 839.7736, -1727.0985, 13.6541, 0.0000, 0.0000, 0.0000); //CJ_SPRUNK1
	noob_Object[187] = CreateDynamicObject(18075, 831.9030, -1729.1313, 16.5114, 0.0000, 0.0000, 0.0000); //lightD
	noob_Object[188] = CreateObject(19172, 842.5999, -1726.7556, 14.2496, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[188], "/support", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 23, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[188], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	noob_Object[189] = CreateDynamicObject(18075, 841.2432, -1729.1313, 16.5200, 0.0000, 0.0000, 0.0000); //lightD
	noob_Object[190] = CreateObject(13649, 841.6815, -1731.4952, 11.9658, 0.0000, 0.0000, 0.0000); //ramplandpad01
	SetObjectMaterial(noob_Object[190], 0, 14415, "carter_block_2", "mp_motel_carpet1", 0xFF1E90FF);
	SetObjectMaterial(noob_Object[190], 1, 17933, "carter_mainmap", "mp_carter_carpet", 0xFFFFFF00);
	noob_Object[191] = CreateObject(19172, 842.6101, -1726.7458, 14.7594, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterialText(noob_Object[191], "Hilfe ben?tigt ?", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, true, 0xFF000000, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	SetObjectMaterialText(noob_Object[191], ".", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 1, true, 0xFFFFFFFF, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	noob_Object[192] = CreateObject(19172, 842.5972, -1726.7259, 14.4897, 0.0000, 0.0000, 0.0000); //SAMPPicture1
	SetObjectMaterial(noob_Object[192], 0, 1414, "break_street1", "CJ_TV_SCREEN", 0x00000000);
	noob_Object[193] = CreateObject(1703, 841.5562, -1727.1988, 12.5334, 0.0000, 0.0000, 0.0000); //kb_couch02
	SetObjectMaterial(noob_Object[193], 0, 18010, "genintrestrest2", "kbsofa333c", 0xFF696969);
	noob_Object[194] = CreateDynamicObject(2069, 844.8237, -1727.2480, 12.6070, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT7
	noob_Object[195] = CreateDynamicObject(16151, 831.9995, -1727.7215, 12.8865, 0.0000, 0.0000, 90.0000); //ufo_bar
	noob_Object[196] = CreateDynamicObject(2011, 838.6004, -1735.1916, 12.5396, 0.0000, 0.0000, 0.0000); //nu_plant2_ofc
	noob_Object[197] = CreateDynamicObject(2011, 834.6201, -1735.1916, 12.5396, 0.0000, 0.0000, 0.0000); //nu_plant2_ofc
	noob_Object[198] = CreateDynamicObject(1235, 838.7005, -1727.0572, 13.0705, 0.0000, 0.0000, 0.0000); //wastebin
	noob_Object[199] = CreateDynamicObject(19969, 839.5402, -1763.8419, 12.4635, 0.0000, 0.0000, 0.0000); //SAMPRoadSign22
	noob_Object[200] = CreateDynamicObject(1216, 838.0249, -1740.2331, 13.3452, 0.0000, 0.0000, 180.0000); //phonebooth1
	noob_Object[201] = CreateDynamicObject(1808, 841.2094, -1735.3863, 12.5078, 0.0000, 0.0000, 180.0000); //CJ_WATERCOOLER2
	noob_Object[202] = CreateDynamicObject(1319, 837.4776, -1759.5920, 13.0943, 0.0000, 0.0000, 0.0000); //ws_ref_bollard
	noob_Object[203] = CreateDynamicObject(672, 824.0717, -1733.1291, 13.2517, 0.0000, 0.0000, 0.0000); //sm_venoob_tree5
	noob_Object[204] = CreateDynamicObject(1569, 835.9060, -1741.4543, 12.5635, -0.3998, 0.0000, -113.5000); //ADAM_V_DOOR
	noob_Object[205] = CreateDynamicObject(19825, 827.7919, -1731.0921, 15.2882, 0.0000, 0.0000, 90.0000); //SprunkClock1
	noob_Object[206] = CreateObject(13649, 833.0510, -1732.1252, 11.9658, 0.0000, 0.0000, 0.0000); //ramplandpad01
	SetObjectMaterial(noob_Object[206], 0, 14415, "carter_block_2", "mp_motel_carpet1", 0xFF1E90FF);
	SetObjectMaterial(noob_Object[206], 1, 17933, "carter_mainmap", "mp_carter_carpet", 0xFFFFFF00);
	noob_Object[207] = CreateObject(949, 837.0299, -1726.9864, 13.1647, 0.0000, 0.0000, 0.0000); //Plant_Pot_4
	SetObjectMaterial(noob_Object[207], 1, 10850, "bakerybit2_sfse", "GB_truckdepot29", 0x00000000);
	noob_Object[208] = CreateDynamicObject(2596, 832.2843, -1735.2513, 15.2896, 0.0000, 0.0000, 179.6999); //CJ_SEX_TV
	noob_Object[209] = CreateObject(18766, 828.1964, -1757.1561, 12.0710, 90.0000, 0.0000, 0.0000); //Concrete10mx1mx5m
	SetObjectMaterial(noob_Object[209], 0, 10755, "airportrminl_sfse", "ws_rotten_concrete1", 0xFF696969);
	noob_Object[210] = CreateDynamicObject(1886, 827.6672, -1727.2496, 16.5458, 13.8999, 0.0000, 40.3000); //shop_sec_cam
	noob_Object[211] = CreateDynamicObject(2076, 836.6375, -1738.2923, 15.8757, 0.0000, 0.0000, 0.0000); //CJ_MLIGHT10
	noob_Object[212] = CreateObject(19173, 837.0431, -1726.7075, 14.8297, 0.0000, 0.0000, 0.0000); //SAMPPicture2
	SetObjectMaterial(noob_Object[212], 0, 2266, "picture_frame", "CJ_PAINTING29", 0x00000000);
	noob_Object[213] = CreateDynamicObject(1744, 828.9903, -1726.5294, 14.8230, 0.0000, 0.0000, 0.0000); //MED_SHELF
	noob_Object[214] = CreateDynamicObject(19821, 828.7973, -1726.8995, 15.1531, 0.0000, 0.0000, 0.0000); //AlcoholBottle2
	noob_Object[215] = CreateDynamicObject(19824, 829.1979, -1726.8129, 15.1513, 0.0000, 0.0000, 0.0000); //AlcoholBottle5
	noob_Object[216] = CreateDynamicObject(19823, 829.6134, -1726.9260, 15.1534, 0.0000, 0.0000, 0.0000); //AlcoholBottle4
	noob_Object[217] = CreateDynamicObject(19822, 829.9561, -1726.8050, 15.1631, 0.0000, 0.0000, 0.0000); //AlcoholBottle3
	noob_Object[218] = CreateDynamicObject(16779, 841.7773, -1731.3812, 16.6351, 0.0000, 0.0000, 0.0000); //ufo_light02
	noob_Object[219] = CreateDynamicObject(16779, 833.0792, -1732.1442, 16.6551, 0.0000, 0.0000, 0.0000); //ufo_light02
	noob_Object[220] = CreateObject(19089, 845.6896, -1726.7141, 16.8998, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(noob_Object[220], 0, -1, "none", "none", 0xFF000000);
	noob_Object[221] = CreateObject(19089, 827.1598, -1726.7141, 16.8998, 0.0000, 0.0000, 0.0000); //Rope3
	SetObjectMaterial(noob_Object[221], 0, -1, "none", "none", 0xFF000000);
	noob_Object[222] = CreateObject(19089, 834.5203, -1726.7141, 16.4498, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(noob_Object[222], 0, -1, "none", "none", 0xFF000000);
	noob_Object[223] = CreateObject(19089, 841.8903, -1726.7141, 16.4498, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(noob_Object[223], 0, -1, "none", "none", 0xFF000000);
	noob_Object[224] = CreateObject(19089, 845.7705, -1726.7141, 16.4498, 0.0000, 90.0000, 0.0000); //Rope3
	SetObjectMaterial(noob_Object[224], 0, -1, "none", "none", 0xFF000000);
	noob_Object[225] = CreateObject(19089, 845.6705, -1728.8449, 16.4498, 0.0000, 90.0000, 90.0000); //Rope3
	SetObjectMaterial(noob_Object[225], 0, -1, "none", "none", 0xFF000000);
	noob_Object[226] = CreateObject(19089, 845.6705, -1725.5936, 16.4498, 0.0000, 90.0000, 90.0000); //Rope3
	SetObjectMaterial(noob_Object[226], 0, -1, "none", "none", 0xFF000000);
	noob_Actor[0] = CreateActor(20, 832.3812, -1750.7093, 13.3781, -90.1996); //Rich Guy (Madd Dogg'
	noob_Actor[1] = CreateActor(209, 845.3703, -1745.1035, 13.5500, 124.2995); //Oriental Noodle stan
	noob_Actor[2] = CreateActor(1, 844.7000, -1728.6965, 13.7496, 87.6996); //The Truth
	ApplyActorAnimation(noob_Actor[2], "PED", "SEAT_IDLE", 4.0998, true, false, false, true, 1);
	noob_Actor[3] = CreateActor(11, 831.6901, -1728.0538, 13.5698, 178.8999); //Casino croupier
	noob_Actor[0] = CreateActor(20, 832.3812, -1750.7093, 13.3781, -90.1996); //Rich Guy (Madd Dogg'
	noob_Actor[1] = CreateActor(209, 845.3703, -1745.1035, 13.5500, 124.2997); //Oriental Noodle stan
	noob_Actor[2] = CreateActor(1, 844.7000, -1728.6965, 13.7497, 87.6998); //The Truth
	ApplyActorAnimation(noob_Actor[2], "PED", "SEAT_IDLE", 4.0998, true, false, false, true, 1);
	noob_Actor[3] = CreateActor(11, 831.6901, -1728.0538, 13.5698, 178.8999); //Casino croupier


	//Langstreckenfahrer Strecke - Map by GangstaSunny
	CreateDynamicObject(19532, 2479.00977, -2759.56641, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -2884.49536, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3009.46021, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3134.40234, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3259.36963, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3384.33203, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3509.30908, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3634.23706, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3759.19751, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -3884.12988, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4009.08032, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4134.04590, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4259.00342, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4383.95703, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4508.92383, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4633.88330, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4758.79492, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -4883.71094, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5008.65332, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5133.61279, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5258.54346, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5383.54834, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5508.47021, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5633.38184, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5758.30420, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -5883.26660, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateObject(19538, 2441.73950, -5883.22803, 12.84300,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8397, 2463.26416, -5828.46338, 2.34090,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2421.46729, -5828.46338, 2.34090,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2421.46729, -5934.23779, 2.34090,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2463.26416, -5934.23779, 2.34090,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(6257, 2427.00537, -5926.36670, 20.12570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2644, 2435.23340, -5918.02930, 13.22958,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2644, 2435.23340, -5915.57227, 13.22960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2644, 2435.23340, -5913.17236, 13.22960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2840, 2435.24268, -5913.26465, 13.65228,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2456, 2472.32324, -5820.97559, 12.83651,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2456, 2472.38892, -5945.14355, 12.83932,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2410.57153, -5833.63232, 13.51251,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2410.57153, -5859.27881, 13.51250,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2410.57153, -5884.94873, 13.51250,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2410.57153, -5910.58545, 13.51250,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2410.57153, -5932.86914, 13.51250,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2458.65430, -5945.67139, 13.51250,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2433.03052, -5945.67139, 13.51250,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 2417.02441, -5945.68213, 13.51810,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 2413.80103, -5945.68213, 13.51810,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2458.65430, -5820.85449, 13.51250,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2433.03052, -5820.85449, 13.51250,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 2413.80103, -5820.85254, 13.51810,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 2416.98926, -5820.85254, 13.51810,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 2474.66504, -5820.56201, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2477.96753, -5820.56152, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2481.27075, -5820.56152, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2484.57129, -5820.56152, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2474.62744, -5945.47803, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2477.92285, -5945.47803, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2481.22852, -5945.47803, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2484.53174, -5945.47803, 12.64760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6008.20947, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6133.17334, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6258.16553, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6383.11182, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6508.09277, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6633.01074, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6757.94629, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -6882.92383, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -7007.83789, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -7132.80518, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -7257.66553, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -7382.59180, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -7507.57227, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -7632.54932, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -8382.01758, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3255, 2424.99658, -8428.85547, 0.24593,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3255, 2424.99658, -8459.74902, 0.24590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3255, 2424.99658, -8489.66016, 0.24590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3255, 2424.99658, -8521.64453, 0.24590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2479.00977, -8506.96289, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateObject(19538, 2547.88281, -8538.18359, 12.83009,   0.00000, 0.00000, 0.00000);
	CreateObject(19538, 2547.88281, -8475.70215, 12.83010,   0.00000, 0.00000, 0.00000);
	CreateObject(19538, 2547.88281, -8413.25098, 12.83010,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10966, 2557.06543, -8441.71973, 26.44113,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11290, 2590.74878, -8512.64648, 18.01717,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11290, 2579.39160, -8512.64648, 18.01720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11290, 2569.27417, -8512.64648, 18.01720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, 2565.01709, -8504.26074, 17.42799,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, 2565.01709, -8518.66602, 17.42800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11081, 2551.24829, -8493.25488, 19.35580,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(12913, 2557.80981, -8483.75098, 15.23785,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1348, 2554.22388, -8483.74902, 13.46941,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11295, 2502.91650, -8400.45898, 18.65760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11295, 2502.91650, -8417.30664, 18.65760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10829, 2551.91602, -8504.40527, 12.84124,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10775, 2544.62671, -8548.98926, 34.06200,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8397, 2493.09839, -8391.47168, 2.28550,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2521.04443, -8391.47168, 2.28550,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2549.20337, -8391.47168, 2.28550,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2579.33496, -8391.47168, 2.28550,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2602.31665, -8391.47168, 2.28550,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2506.56812, -8407.69434, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2490.01172, -8450.27539, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2503.45093, -8438.12695, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2490.01172, -8422.70605, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(19532, 2409.00854, -8312.02930, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19534, 2479.00073, -8312.04492, 12.61610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19534, 2479.00073, -8297.05469, 12.61610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2409.00854, -8297.05176, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateObject(19538, 2284.05249, -8303.68262, 12.65010,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2159.15894, -8303.37305, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8397, 2490.01172, -8476.52734, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2490.01172, -8501.44727, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2490.01172, -8526.33691, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2490.01172, -8549.46973, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2489.99170, -8562.15820, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2503.45093, -8463.34082, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2503.45093, -8489.49023, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2503.45093, -8513.53711, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2503.45093, -8537.72461, 2.07770,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8843, 2230.93433, -8306.67773, 12.66020,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(8843, 2254.60840, -8307.03711, 12.66020,   0.00000, 0.00000, 268.08008);
	CreateDynamicObject(8843, 2276.30103, -8308.09766, 12.66020,   0.00000, 0.00000, 266.82013);
	CreateDynamicObject(8843, 2298.66260, -8309.36426, 12.66020,   0.00000, 0.00000, 266.82013);
	CreateDynamicObject(8843, 2321.14600, -8310.71094, 12.66020,   0.00000, 0.00000, 266.82013);
	CreateDynamicObject(8843, 2336.42627, -8297.10840, 12.66020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8843, 2313.89600, -8297.19629, 12.66020,   0.00000, 0.00000, 91.25997);
	CreateDynamicObject(8843, 2290.11060, -8297.96582, 12.66020,   0.00000, 0.00000, 92.75995);
	CreateDynamicObject(8843, 2266.02197, -8299.05957, 12.66020,   0.00000, 0.00000, 92.75995);
	CreateDynamicObject(8843, 2243.97168, -8299.80566, 12.66020,   0.00000, 0.00000, 91.43998);
	CreateDynamicObject(7191, 2323.58423, -8303.69238, 12.63270,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(7191, 2278.66138, -8303.69238, 12.63270,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(7191, 2244.03931, -8303.70215, 12.63400,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2486.46167, -8305.17773, 13.29450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 2473.65747, -8289.59180, 13.29450,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19972, 2486.32251, -8291.61328, 11.00354,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(984, 2477.95532, -8533.07324, 13.26710,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19913, 2321.52197, -8334.84570, 18.08790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 2271.67798, -8334.84570, 18.08790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 2321.52197, -8334.84570, 18.08790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 2246.62915, -8334.84570, 18.08790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 2246.62915, -8272.57129, 18.08790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 2271.67798, -8272.57129, 18.08790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19913, 2321.52197, -8272.57129, 18.08790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2346.41260, -8325.96094, 13.33537,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2346.41260, -8283.02734, 13.33540,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, 2343.79150, -8329.34082, 17.37920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, 2343.79150, -8274.64746, 17.37920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, 2223.54224, -8274.70215, 17.37920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3287, 2223.54224, -8328.97559, 17.37920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2221.66895, -8318.95703, 13.33537,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 2221.66895, -8287.93750, 13.33540,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 2034.20459, -8303.37305, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1909.26855, -8303.37305, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1784.36450, -8303.37305, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1659.48438, -8303.37305, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1534.51465, -8303.37305, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1464.53442, -8248.36426, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1464.47290, -8310.81055, 13.26063,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 1458.08984, -8304.41504, 13.46340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 1464.53442, -8123.46338, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 1464.53442, -7998.52002, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 1464.53442, -7873.75537, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 1464.53442, -7748.81055, 12.63150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19532, 1519.53345, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 1457.18701, -7678.69580, 13.24983,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1463.58911, -7672.31543, 13.46980,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1644.38745, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1769.33582, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 1894.29639, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 2019.23669, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 2144.10645, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 2269.05908, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19532, 2393.99609, -7678.82227, 12.63150,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19535, 2463.99463, -7678.81982, 12.63170,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 2471.36572, -7674.45752, 12.62420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 2471.36572, -7677.76025, 12.62420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 2471.36572, -7681.06348, 12.62420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 2471.36572, -7684.36768, 12.62420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 2479.01221, -7694.95947, 13.26389,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 2485.39697, -7682.09375, 13.52050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19972, 2475.92676, -7694.65820, 11.50662,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19972, 2481.67285, -7694.65820, 11.50660,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19956, 2479.00220, -7694.34180, 12.47299,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19955, 2484.92090, -7678.75928, 12.16628,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(8397, 2478.62305, -7687.56592, 2.12990,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2478.62305, -7617.64941, 2.12990,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2478.62305, -7525.98438, 2.12990,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2478.62305, -7448.75781, 2.12990,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2478.62305, -7373.43652, 2.12990,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2444.76367, -7678.91260, 2.12990,   0.00000, 180.00000, 270.00000);
	CreateDynamicObject(8397, 2382.60181, -7678.91260, 2.12990,   0.00000, 180.00000, 270.00000);
	CreateDynamicObject(8397, 2321.89697, -7678.91260, 2.12990,   0.00000, 180.00000, 270.00000);
	CreateDynamicObject(8397, 2256.61377, -7678.91260, 2.12990,   0.00000, 180.00000, 270.00000);
	CreateDynamicObject(8397, 2184.09521, -7678.91260, 2.12990,   0.00000, 180.00000, 270.00000);
	CreateDynamicObject(8397, 1464.44421, -7698.08691, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1464.44421, -7761.52686, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1464.44421, -7821.91309, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1464.44421, -7887.87061, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1496.33411, -7678.74170, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 1557.60254, -7678.74170, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 1616.41882, -7678.74170, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 1679.69800, -7678.74170, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 1464.44421, -8282.37207, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1464.44421, -8185.81201, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1464.44421, -8090.88086, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1499.63257, -8303.46680, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 1590.54443, -8303.46680, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 1675.27966, -8303.46680, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 1772.59875, -8303.46680, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 2230.90918, -8321.20313, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 2230.90918, -8283.90723, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 2338.30957, -8281.02539, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 2452.18433, -8304.89551, 2.12300,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(8397, 2479.03760, -8342.17188, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.03760, -8438.25977, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.03760, -8517.32715, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.03760, -8560.39258, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 1464.44421, -7988.02100, 2.12300,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(1342, 2548.24243, -8483.94336, 13.82334,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8674, 2397.01978, -2697.04614, 14.07907,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8674, 2407.35156, -2697.04614, 14.07910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8674, 2409.94995, -2697.04614, 14.07910,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8674, 2415.09961, -2691.86719, 14.07910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8674, 2391.86621, -2691.86719, 14.07910,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8397, 2479.45068, -2705.81128, 2.13380,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.45068, -2766.70996, 2.13380,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.45068, -2822.27588, 2.13380,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.45068, -2878.23853, 2.13380,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.45068, -2927.68774, 2.13380,   0.00000, 180.00000, 0.00000);
	CreateDynamicObject(8397, 2479.45068, -2978.33472, 2.13380,   0.00000, 180.00000, 0.00000);

 	//Parkplatz vor LSPD - Map by GangstaSunny
 	new owngsparkmap;
	owngsparkmap = CreateDynamicObject(19327, 1506.90894, -1657.27283, 15.01840,   0.00000, 0.00000, 81.30001);
	SetDynamicObjectMaterialText(owngsparkmap, 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	owngsparkmap = CreateDynamicObject(19327, 1509.14246, -1651.69360, 15.01840,   0.00000, 0.00000, 63.06001);
	SetDynamicObjectMaterialText(owngsparkmap, 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	owngsparkmap = CreateDynamicObject(19327, 1512.23975, -1647.12805, 15.01840,   0.00000, 0.00000, 52.32002);
	SetDynamicObjectMaterialText(owngsparkmap, 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	CreateDynamicObject(983, 1510.97717, -1663.75293, 13.22520,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 1517.37329, -1663.75293, 13.22520,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1361, 1506.88660, -1663.57568, 13.53302,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1509.96375, -1659.53027, 12.54278,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1510.71899, -1655.46301, 12.54280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1511.49817, -1651.44788, 12.54280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19121, 1520.76526, -1663.72803, 13.09686,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19121, 1516.03186, -1641.90869, 13.58379,   0.00000, 0.00000, 0.00000);

	//Ordnungsamt Base - Map by Risq
	new oamtbasemap[407];
	oamtbasemap[0] = CreateDynamicObject(3976, 1571.6014, -1675.7500, 35.6795, 0.0000, 0.0000, 0.0000); //PoliceSt02_LAn
	SetDynamicObjectMaterial(oamtbasemap[0], 0, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 1, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 2, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 3, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 4, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 5, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 6, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 7, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 8, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 9, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 10, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 11, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 12, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 13, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 14, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[0], 15, 0, "INVALID", "INVALID", 0x00000000);
	oamtbasemap[1] = CreateDynamicObject(3976, 1571.6014, -1675.7500, 35.6795, 0.0000, 0.0000, 0.0000); //PoliceSt02_LAn
	SetDynamicObjectMaterial(oamtbasemap[1], 0, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 1, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 2, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 3, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 4, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 5, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 6, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 7, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 8, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 9, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 10, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 11, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 12, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 13, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 14, 0, "INVALID", "INVALID", 0x00000000);
	SetDynamicObjectMaterial(oamtbasemap[1], 15, 0, "INVALID", "INVALID", 0x00000000);
	oamtbasemap[2] = CreateObject(19531, 1105.2009, -1644.6402, 12.2602, 0.0000, 0.0000, 0.0000); //Plane125x125Conc1
	SetObjectMaterial(oamtbasemap[2], 0, 3967, "cj_airprt", "Road_blank256HV", 0xFF9F9D94);
	oamtbasemap[3] = CreateDynamicObject(18980, 1047.9121, -1689.7364, 13.3493, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[3], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[4] = CreateDynamicObject(18980, 1047.9221, -1674.7563, 13.3394, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[4], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[5] = CreateDynamicObject(18980, 1077.6938, -1701.7561, 12.3493, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[5], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[6] = CreateDynamicObject(18980, 1127.5144, -1701.7661, 12.3592, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[6], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[7] = CreateDynamicObject(18980, 1059.9217, -1701.7458, 13.3394, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[7], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[8] = CreateDynamicObject(18980, 1127.5144, -1701.7661, 13.3591, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[8], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[9] = CreateDynamicObject(18980, 1077.6938, -1701.7561, 13.3493, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[9], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[10] = CreateDynamicObject(18980, 1118.2446, -1701.7561, 12.3592, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[10], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[11] = CreateDynamicObject(18980, 1118.2446, -1701.7561, 13.3493, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[11], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[12] = CreateDynamicObject(18980, 1059.9217, -1701.7458, 12.3395, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[12], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[13] = CreateDynamicObject(18980, 1047.9221, -1674.7563, 12.3394, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[13], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[14] = CreateDynamicObject(18980, 1047.9121, -1689.7364, 12.3493, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[14], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[15] = CreateDynamicObject(18980, 1060.9211, -1662.4752, 13.3394, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[15], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[16] = CreateDynamicObject(18980, 1060.9211, -1662.4752, 12.3394, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[16], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[17] = CreateDynamicObject(19355, 1059.7777, -1679.6805, 17.4517, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[17], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[18] = CreateDynamicObject(19417, 1051.8437, -1697.2281, 13.9652, 0.0000, 0.0000, 90.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[18], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[19] = CreateDynamicObject(19355, 1058.2567, -1678.1617, 17.4416, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[19], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[20] = CreateDynamicObject(19377, 1050.2867, -1692.4704, 13.9756, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[20], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[21] = CreateDynamicObject(19377, 1055.0373, -1692.0506, 15.6456, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[21], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFF);
	oamtbasemap[22] = CreateDynamicObject(19417, 1055.0533, -1697.2281, 17.4654, 0.0000, 0.0000, 90.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[22], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[23] = CreateDynamicObject(19417, 1055.0533, -1678.1676, 13.9652, 0.0000, 0.0000, 90.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[23], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[24] = CreateDynamicObject(19355, 1058.2567, -1697.2320, 17.4617, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[24], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[25] = CreateDynamicObject(19417, 1055.0533, -1697.2281, 13.9652, 0.0000, 0.0000, 90.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[25], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[26] = CreateDynamicObject(19355, 1059.7777, -1695.7121, 13.9617, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[26], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[27] = CreateDynamicObject(19417, 1051.8437, -1697.2281, 17.4654, 0.0000, 0.0000, 90.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[27], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[28] = CreateDynamicObject(19394, 1059.7845, -1686.0975, 13.9645, 0.0000, 0.0000, 0.0000); //wall042
	SetDynamicObjectMaterial(oamtbasemap[28], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[29] = CreateDynamicObject(19355, 1059.7777, -1695.7121, 17.4517, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[29], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[30] = CreateDynamicObject(19355, 1059.7777, -1692.5013, 17.4517, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[30], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[31] = CreateDynamicObject(19417, 1059.7944, -1689.3077, 13.9652, 0.0000, 0.0000, 0.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[31], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[32] = CreateDynamicObject(19417, 1059.7944, -1682.8973, 17.4554, 0.0000, 0.0000, 0.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[32], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[33] = CreateDynamicObject(19417, 1059.7944, -1679.6871, 13.9652, 0.0000, 0.0000, 0.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[33], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[34] = CreateDynamicObject(19355, 1058.2567, -1678.1617, 13.9617, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[34], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[35] = CreateDynamicObject(19417, 1059.7944, -1692.5174, 13.9652, 0.0000, 0.0000, 0.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[35], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[36] = CreateDynamicObject(19355, 1059.7777, -1686.1009, 17.4517, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[36], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[37] = CreateDynamicObject(19417, 1055.0533, -1678.1676, 17.4454, 0.0000, 0.0000, 90.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[37], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[38] = CreateDynamicObject(19355, 1057.2303, -1680.6250, 12.2017, 0.0000, 90.0000, -130.1999); //wall003
	SetDynamicObjectMaterial(oamtbasemap[38], 0, 14569, "traidman", "darkgrey_carpet_256", 0xFFFFFFFF);
	oamtbasemap[39] = CreateDynamicObject(19417, 1051.8426, -1678.1676, 13.9652, 0.0000, 0.0000, 90.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[39], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[40] = CreateDynamicObject(19355, 1051.8459, -1678.1617, 17.4416, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[40], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[41] = CreateDynamicObject(19377, 1050.2767, -1682.8900, 13.9756, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[41], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[42] = CreateDynamicObject(19355, 1058.2567, -1697.2320, 13.9617, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[42], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[43] = CreateDynamicObject(1753, 1059.1949, -1680.3465, 12.2650, 0.0000, 0.0000, -90.0000); //SWANK_COUCH_1
	SetDynamicObjectMaterial(oamtbasemap[43], 0, 1714, "cj_office", "est_chair", 0xFFFFFFFF);
	oamtbasemap[44] = CreateDynamicObject(19377, 1055.0373, -1692.0506, 19.1655, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[44], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[45] = CreateDynamicObject(19460, 1055.0172, -1683.0465, 15.6310, 0.0000, 90.0000, 0.0000); //wall100
	SetDynamicObjectMaterial(oamtbasemap[45], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFF);
	oamtbasemap[46] = CreateDynamicObject(19377, 1055.0373, -1683.4593, 12.1856, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[46], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFF);
	oamtbasemap[47] = CreateDynamicObject(19460, 1058.0770, -1683.0465, 15.6210, 0.0000, 90.0000, 0.0000); //wall100
	SetDynamicObjectMaterial(oamtbasemap[47], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFF);
	oamtbasemap[48] = CreateDynamicObject(14877, 1051.7645, -1686.1284, 13.6422, 0.0000, 0.0000, -90.0000); //michelle-stairs
	SetDynamicObjectMaterial(oamtbasemap[48], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFF);
	oamtbasemap[49] = CreateDynamicObject(19417, 1059.7944, -1689.3077, 17.4554, 0.0000, 0.0000, 0.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[49], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[50] = CreateDynamicObject(19355, 1051.8354, -1691.6534, 13.9617, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[50], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[51] = CreateDynamicObject(19460, 1053.3360, -1686.9068, 13.8010, 0.0000, 0.0000, 0.0000); //wall100
	SetDynamicObjectMaterial(oamtbasemap[51], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[52] = CreateDynamicObject(19355, 1058.2054, -1691.1120, 13.9617, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[52], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[53] = CreateDynamicObject(19377, 1055.0373, -1683.3292, 19.1756, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[53], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[54] = CreateDynamicObject(19377, 1055.0373, -1692.0506, 12.1756, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[54], 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0xFFFFFFFF);
	oamtbasemap[55] = CreateDynamicObject(1502, 1055.7425, -1691.0570, 12.2124, 0.0000, 0.0000, 180.0000); //Gen_doorINT04
	SetDynamicObjectMaterial(oamtbasemap[55], 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFFFFFFFF);
	oamtbasemap[56] = CreateDynamicObject(1491, 1059.8564, -1686.8382, 12.2304, 0.0000, 0.0000, 90.0000); //Gen_doorINT01
	SetDynamicObjectMaterial(oamtbasemap[56], 0, 14666, "genintintsex", "CJ_BLUE_DOOR", 0xFFFFFFFF);
	oamtbasemap[57] = CreateDynamicObject(19460, 1053.3360, -1683.0351, 17.3012, 0.0000, 0.0000, 0.0000); //wall100
	SetDynamicObjectMaterial(oamtbasemap[57], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[58] = CreateDynamicObject(19325, 1054.1224, -1697.2048, 17.0678, 0.0000, 0.0000, 90.0000); //lsmall_window01
	oamtbasemap[59] = CreateDynamicObject(19417, 1059.7944, -1682.8873, 13.9652, 0.0000, 0.0000, 0.0000); //wall065
	SetDynamicObjectMaterial(oamtbasemap[59], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFF166CB3);
	oamtbasemap[60] = CreateDynamicObject(1753, 1056.1838, -1678.8664, 12.2650, 0.0000, 0.0000, 0.0000); //SWANK_COUCH_1
	SetDynamicObjectMaterial(oamtbasemap[60], 0, 1714, "cj_office", "est_chair", 0xFFFFFFFF);
	oamtbasemap[61] = CreateDynamicObject(1775, 1058.7147, -1690.5151, 13.3710, 0.0000, 0.0000, 180.0000); //CJ_SPRUNK1
	oamtbasemap[62] = CreateDynamicObject(1827, 1057.2025, -1680.9504, 12.2419, 0.0000, 0.0000, 0.0000); //man_sdr_tables
	SetDynamicObjectMaterial(oamtbasemap[62], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[63] = CreateDynamicObject(956, 1057.3535, -1690.5937, 12.6666, 0.0000, 0.0000, 180.0000); //CJ_EXT_CANDY
	oamtbasemap[64] = CreateDynamicObject(19394, 1055.0040, -1691.1068, 13.9645, 0.0000, 0.0000, 90.0000); //wall042
	SetDynamicObjectMaterial(oamtbasemap[64], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[65] = CreateDynamicObject(19325, 1054.1224, -1697.2048, 13.0578, 0.0000, 0.0000, 90.0000); //lsmall_window01
	oamtbasemap[66] = CreateDynamicObject(19325, 1054.1224, -1678.1545, 13.0578, 0.0000, 0.0000, 90.0000); //lsmall_window01
	oamtbasemap[67] = CreateDynamicObject(19325, 1054.1224, -1678.1545, 17.0578, 0.0000, 0.0000, 90.0000); //lsmall_window01
	oamtbasemap[68] = CreateDynamicObject(19325, 1059.8120, -1681.7148, 17.0578, 0.0000, 0.0000, 0.0000); //lsmall_window01
	oamtbasemap[69] = CreateDynamicObject(19325, 1059.8120, -1681.7148, 12.9076, 0.0000, 0.0000, 0.0000); //lsmall_window01
	oamtbasemap[70] = CreateDynamicObject(19325, 1059.8120, -1691.5052, 12.9076, 0.0000, 0.0000, 0.0000); //lsmall_window01
	oamtbasemap[71] = CreateDynamicObject(19325, 1059.8120, -1691.5052, 17.0478, 0.0000, 0.0000, 0.0000); //lsmall_window01
	oamtbasemap[72] = CreateDynamicObject(19327, 1059.9273, -1695.8481, 18.3565, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[72], 0, "RosaLife Reloaded", OBJECT_MATERIAL_SIZE_256x128, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[73] = CreateDynamicObject(19327, 1059.9273, -1694.8283, 17.6364, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[73], 0, "Ordnungs", OBJECT_MATERIAL_SIZE_256x128, "Calibri", 75, 1, 0xFF221918, 0x0, 0);
	//oamtbasemap[74] = CreateDynamicObject(19327, 1059.9273, -1693.7882, 18.3565, 0.0000, 0.0000, 90.0000); //7_11_sign02
	//SetDynamicObjectMaterialText(oamtbasemap[74], 0, " ", 90, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[75] = CreateDynamicObject(19327, 1059.9273, -1692.5651, 17.6364, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[75], 0, "amt", 90, "Calibri", 75, 1, 0xFF221918, 0x0, 0);
	oamtbasemap[76] = CreateDynamicObject(19327, 1059.9273, -1693.6606, 17.4365, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[76], 0, "_________", 90, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[77] = CreateDynamicObject(19327, 1059.9273, -1693.7506, 18.8864, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[77], 0, "_________", 90, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[78] = CreateDynamicObject(19327, 1059.9273, -1696.0688, 18.8864, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[78], 0, "_________", 90, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[79] = CreateDynamicObject(19327, 1059.9273, -1695.9793, 17.4365, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[79], 0, "_________", 90, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[80] = CreateDynamicObject(19327, 1059.9273, -1692.0897, 18.8864, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[80], 0, "_________", 90, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[81] = CreateDynamicObject(19327, 1059.9273, -1692.0897, 17.4365, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[81], 0, "_________", 90, "Calibri", 75, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[82] = CreateDynamicObject(19377, 1053.2158, -1676.4211, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[82], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[83] = CreateDynamicObject(19377, 1065.8062, -1686.8619, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[83], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[84] = CreateDynamicObject(19377, 1065.8062, -1681.3214, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[84], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[85] = CreateDynamicObject(19377, 1065.8062, -1696.4322, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[85], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[86] = CreateDynamicObject(19377, 1061.0764, -1676.4211, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[86], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[87] = CreateDynamicObject(19377, 1061.0764, -1663.1606, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[87], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[88] = CreateDynamicObject(19377, 1053.0642, -1663.1606, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[88], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[89] = CreateDynamicObject(19377, 1070.7055, -1701.1606, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[89], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[90] = CreateDynamicObject(19377, 1080.0957, -1701.1606, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[90], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[91] = CreateDynamicObject(19377, 1085.3758, -1701.1606, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[91], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[92] = CreateDynamicObject(19377, 1087.5561, -1694.8901, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[92], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[93] = CreateDynamicObject(19377, 1077.9858, -1694.8901, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[93], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[94] = CreateDynamicObject(19377, 1073.2572, -1690.0218, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[94], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[95] = CreateDynamicObject(19377, 1073.2561, -1681.1512, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[95], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[96] = CreateDynamicObject(19377, 1077.9858, -1676.4189, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[96], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[97] = CreateDynamicObject(19377, 1087.7760, -1689.5400, 12.1955, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[97], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	oamtbasemap[98] = CreateDynamicObject(19377, 1078.1560, -1689.5400, 12.1955, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[98], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	oamtbasemap[99] = CreateDynamicObject(19377, 1078.1560, -1681.7497, 12.1754, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[99], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	oamtbasemap[100] = CreateDynamicObject(19377, 1087.7861, -1681.7497, 12.1754, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[100], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	oamtbasemap[101] = CreateDynamicObject(19377, 1091.5368, -1694.8901, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[101], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[102] = CreateDynamicObject(19377, 1087.5753, -1676.4189, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[102], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[103] = CreateDynamicObject(19377, 1091.5760, -1676.4189, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[103], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[104] = CreateDynamicObject(19377, 1092.6959, -1681.1485, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[104], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[105] = CreateDynamicObject(19377, 1092.6959, -1690.1590, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[105], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[106] = CreateDynamicObject(672, 1077.6955, -1680.4775, 12.9467, 0.0000, 0.0000, 0.0000); //sm_veg_tree5
	oamtbasemap[107] = CreateDynamicObject(713, 1078.4666, -1691.0666, 12.1744, 0.0000, 0.0000, 0.0000); //veg_bevtree1
	oamtbasemap[108] = CreateDynamicObject(737, 1090.5958, -1680.3055, 12.2642, 0.0000, 0.0000, 0.0000); //aw_streettree3
	oamtbasemap[109] = CreateDynamicObject(672, 1089.7397, -1690.9471, 12.9467, 0.0000, 0.0000, -76.9999); //sm_veg_tree5
	oamtbasemap[110] = CreateDynamicObject(647, 1076.2119, -1691.3214, 12.5701, 0.0000, 0.0000, 0.0000); //new_bushsm
	oamtbasemap[111] = CreateDynamicObject(647, 1079.8216, -1689.7707, 12.5701, 0.0000, 0.0000, 0.0000); //new_bushsm
	oamtbasemap[112] = CreateDynamicObject(647, 1090.3415, -1679.5810, 12.5701, 0.0000, 0.0000, 0.0000); //new_bushsm
	oamtbasemap[113] = CreateDynamicObject(19461, 1078.1668, -1685.1916, 12.1981, 0.0000, 90.0000, 90.0000); //wall101
	SetDynamicObjectMaterial(oamtbasemap[113], 0, 6487, "councl_law2", "rodeo3sjm", 0xFFFFFFFF);
	oamtbasemap[114] = CreateDynamicObject(19461, 1087.7877, -1685.1916, 12.1981, 0.0000, 90.0000, 90.0000); //wall101
	SetDynamicObjectMaterial(oamtbasemap[114], 0, 6487, "councl_law2", "rodeo3sjm", 0xFFFFFFFF);
	oamtbasemap[115] = CreateDynamicObject(19327, 1091.2224, -1693.3138, 14.0609, 0.0000, 0.0000, 38.3998); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[115], 0, "_________________", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[116] = CreateDynamicObject(19327, 1091.2924, -1693.2578, 13.9808, 0.0000, 0.0000, 38.3998); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[116], 0, "Herzlich Willkommen", 90, "Arial", 23, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[117] = CreateDynamicObject(19377, 1111.1254, -1696.4304, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[117], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[118] = CreateDynamicObject(19377, 1105.8454, -1696.4304, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[118], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[119] = CreateDynamicObject(19327, 1091.3239, -1693.2330, 13.6408, 0.0000, 0.0000, 38.3998); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[119], 0, "German", 90, "Times new Roman", 40, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[120] = CreateDynamicObject(19327, 1091.7629, -1692.8850, 13.3309, 0.0000, 0.0000, 38.3998); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[120], 0, "Ordnungsamt", 90, "Times new Roman", 32, 1, 0xFF166CB3, 0x0, 0);
	oamtbasemap[121] = CreateDynamicObject(19327, 1093.0406, -1691.8717, 14.0609, 0.0000, 0.0000, 38.3998); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[121], 0, "_", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[122] = CreateDynamicObject(19377, 1110.6153, -1691.6997, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[122], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[123] = CreateDynamicObject(19377, 1120.1953, -1691.6997, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[123], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[124] = CreateDynamicObject(19377, 1110.6350, -1684.0593, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[124], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[125] = CreateDynamicObject(19377, 1105.8454, -1679.3302, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[125], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[126] = CreateDynamicObject(19377, 1120.2550, -1684.0593, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[126], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[127] = CreateDynamicObject(19377, 1105.8454, -1669.7005, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[127], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[128] = CreateDynamicObject(18980, 1085.9105, -1662.4752, 13.3394, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[128], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[129] = CreateDynamicObject(18980, 1085.9105, -1662.4752, 12.3394, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[129], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[130] = CreateDynamicObject(19355, 1065.8071, -1667.9913, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[130], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[131] = CreateDynamicObject(19355, 1065.8071, -1664.8016, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[131], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[132] = CreateDynamicObject(19377, 1070.6755, -1669.5085, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[132], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[133] = CreateDynamicObject(19377, 1080.2352, -1669.5085, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[133], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[134] = CreateDynamicObject(19377, 1089.8349, -1669.5085, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[134], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[135] = CreateDynamicObject(19377, 1099.4547, -1669.5085, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[135], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[136] = CreateDynamicObject(19377, 1100.9947, -1669.5085, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[136], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[137] = CreateDynamicObject(1256, 1085.8885, -1681.9851, 12.9238, 0.0000, 0.0000, 90.0000); //Stonebench1
	SetDynamicObjectMaterial(oamtbasemap[137], 0, 3119, "cs_ry_props", "lightgrey", 0xFF166CB3);
	SetDynamicObjectMaterial(oamtbasemap[137], 1, 16640, "a51", "concretemanky", 0xFFFFFFFF);
	oamtbasemap[138] = CreateDynamicObject(1256, 1081.3083, -1681.9851, 12.9238, 0.0000, 0.0000, 90.0000); //Stonebench1
	SetDynamicObjectMaterial(oamtbasemap[138], 0, 3119, "cs_ry_props", "lightgrey", 0xFF166CB3);
	SetDynamicObjectMaterial(oamtbasemap[138], 1, 16640, "a51", "concretemanky", 0xFFFFFFFF);
	oamtbasemap[139] = CreateDynamicObject(1256, 1084.8481, -1688.0744, 12.9238, 0.0000, 0.0000, -90.0000); //Stonebench1
	SetDynamicObjectMaterial(oamtbasemap[139], 0, 3119, "cs_ry_props", "lightgrey", 0xFF166CB3);
	SetDynamicObjectMaterial(oamtbasemap[139], 1, 16640, "a51", "concretemanky", 0xFFFFFFFF);
	oamtbasemap[140] = CreateDynamicObject(1328, 1083.7287, -1681.9414, 12.7959, 0.0000, 0.0000, 0.0000); //BinNt10_LA
	oamtbasemap[141] = CreateDynamicObject(19450, 1078.1501, -1681.7113, 12.1914, 0.0000, 90.0000, 90.0000); //wall090
	SetDynamicObjectMaterial(oamtbasemap[141], 0, 12871, "ce_ground01", "sw_stonesgrass", 0xFFFFFFFF);
	oamtbasemap[142] = CreateDynamicObject(19450, 1078.1501, -1681.7113, 12.1914, 0.0000, 90.0000, 90.0000); //wall090
	SetDynamicObjectMaterial(oamtbasemap[142], 0, 12871, "ce_ground01", "sw_stonesgrass", 0xFFFFFFFF);
	oamtbasemap[143] = CreateDynamicObject(19450, 1078.1701, -1688.6914, 12.2014, 0.0000, 90.0000, -90.0000); //wall090
	SetDynamicObjectMaterial(oamtbasemap[143], 0, 12871, "ce_ground01", "sw_stonesgrass", 0xFFFFFFFF);
	oamtbasemap[144] = CreateDynamicObject(19450, 1087.7900, -1688.6914, 12.2014, 0.0000, 90.0000, -90.0000); //wall090
	SetDynamicObjectMaterial(oamtbasemap[144], 0, 12871, "ce_ground01", "sw_stonesgrass", 0xFFFFFFFF);
	oamtbasemap[145] = CreateDynamicObject(19967, 1090.0996, -1701.1644, 12.0924, 0.0000, 0.0000, 90.0000); //SAMPRoadSign20
	oamtbasemap[146] = CreateDynamicObject(19967, 1074.2801, -1676.5644, 12.0924, 0.0000, 0.0000, -90.0000); //SAMPRoadSign20
	oamtbasemap[147] = CreateDynamicObject(19956, 1065.4046, -1676.6020, 11.5932, 0.0000, 0.0000, -90.0000); //SAMPRoadSign9
	oamtbasemap[148] = CreateDynamicObject(19450, 1087.7896, -1681.7113, 12.1914, 0.0000, 90.0000, 90.0000); //wall090
	SetDynamicObjectMaterial(oamtbasemap[148], 0, 12871, "ce_ground01", "sw_stonesgrass", 0xFFFFFFFF);
	oamtbasemap[149] = CreateDynamicObject(19952, 1073.6041, -1678.1285, 10.6246, 0.0000, 0.0000, -90.0000); //SAMPRoadSign5
	oamtbasemap[150] = CreateDynamicObject(19952, 1073.6041, -1678.8790, 10.6246, 0.0000, 0.0000, -90.0000); //SAMPRoadSign5
	oamtbasemap[151] = CreateDynamicObject(19952, 1073.6041, -1679.6595, 10.6246, 0.0000, 0.0000, -90.0000); //SAMPRoadSign5
	oamtbasemap[152] = CreateDynamicObject(19976, 1065.4173, -1676.5987, 12.2875, 0.0000, 0.0000, -90.0000); //SAMPRoadSign29
	oamtbasemap[153] = CreateDynamicObject(19951, 1071.0539, -1701.1499, 10.7335, 0.0000, 0.0000, -180.0000); //SAMPRoadSign4
	oamtbasemap[154] = CreateDynamicObject(19951, 1069.7436, -1701.1499, 10.7335, 0.0000, 0.0000, -180.0000); //SAMPRoadSign4
	oamtbasemap[155] = CreateDynamicObject(19951, 1068.4133, -1701.1499, 10.7335, 0.0000, 0.0000, -180.0000); //SAMPRoadSign4
	oamtbasemap[156] = CreateDynamicObject(19966, 1090.0208, -1701.1805, 12.1058, 0.0000, 0.0000, -90.0000); //SAMPRoadSign19
	oamtbasemap[157] = CreateDynamicObject(19450, 1100.9300, -1700.5688, 12.1139, 0.0000, -79.0999, 90.0000); //wall090
	SetDynamicObjectMaterial(oamtbasemap[157], 0, 3967, "cj_airprt", "Road_blank256HV", 0xFF9F9D94);
	oamtbasemap[158] = CreateDynamicObject(19450, 1094.9989, -1700.5671, 12.1238, 0.0000, -79.0999, 90.0000); //wall090
	SetDynamicObjectMaterial(oamtbasemap[158], 0, 3967, "cj_airprt", "Road_blank256HV", 0xFF9F9D94);
	oamtbasemap[159] = CreateDynamicObject(19377, 1096.3166, -1681.1485, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[159], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[160] = CreateDynamicObject(19327, 1095.2601, -1679.6062, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[160], 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[161] = CreateDynamicObject(19327, 1105.9201, -1689.7359, 12.2857, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[161], 0, "platz", 90, "Arial", 70, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[162] = CreateDynamicObject(19377, 1096.3160, -1690.1590, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[162], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[163] = CreateDynamicObject(19357, 1094.6826, -1687.0394, 10.5179, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[163], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[164] = CreateDynamicObject(19357, 1094.2623, -1687.0394, 10.5179, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[164], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[165] = CreateDynamicObject(19357, 1094.2321, -1683.3488, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[165], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[166] = CreateDynamicObject(19357, 1094.6826, -1683.3488, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[166], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[167] = CreateDynamicObject(19357, 1093.8601, -1684.5417, 10.5279, 0.0000, 0.0000, 45.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[167], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[168] = CreateDynamicObject(19357, 1095.1190, -1685.8006, 10.5279, 0.0000, 0.0000, 45.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[168], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[169] = CreateDynamicObject(19357, 1093.8388, -1685.8358, 10.5279, 0.0000, 0.0000, -45.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[169], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[170] = CreateDynamicObject(19357, 1095.1329, -1684.5417, 10.5279, 0.0000, 0.0000, -45.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[170], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[171] = CreateDynamicObject(19327, 1105.9201, -1687.5461, 12.2857, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[171], 0, "Verwahr", 90, "Arial", 70, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[172] = CreateDynamicObject(19327, 1095.2601, -1690.6461, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[172], 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[173] = CreateDynamicObject(19355, 1061.7767, -1664.8016, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[173], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[174] = CreateDynamicObject(19355, 1058.5963, -1664.8016, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[174], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[175] = CreateDynamicObject(19355, 1055.2960, -1664.8016, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[175], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[176] = CreateDynamicObject(19355, 1052.0162, -1664.8016, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[176], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[177] = CreateDynamicObject(19377, 1048.4948, -1671.5413, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[177], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[178] = CreateDynamicObject(19355, 1061.7770, -1667.9913, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[178], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[179] = CreateDynamicObject(19355, 1058.5971, -1667.9913, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[179], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[180] = CreateDynamicObject(19355, 1055.2967, -1667.9913, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[180], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[181] = CreateDynamicObject(19355, 1052.0162, -1667.9913, 10.5315, 0.0000, 0.0000, 0.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[181], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[182] = CreateDynamicObject(19377, 1048.4948, -1668.0411, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[182], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[183] = CreateDynamicObject(19327, 1064.6203, -1665.5458, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[183], 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[184] = CreateDynamicObject(19327, 1060.8699, -1665.5458, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[184], 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[185] = CreateDynamicObject(19327, 1057.6098, -1665.5458, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[185], 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[186] = CreateDynamicObject(19327, 1054.3795, -1665.5458, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[186], 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[187] = CreateDynamicObject(19327, 1050.9392, -1665.5458, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[187], 0, "P", 90, "Arial", 170, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[188] = CreateDynamicObject(19327, 1051.2395, -1666.4758, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[188], 0, "Personal", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[189] = CreateDynamicObject(19327, 1054.6889, -1666.4758, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[189], 0, "Personal", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[190] = CreateDynamicObject(19327, 1057.9191, -1666.4758, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[190], 0, "Personal", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[191] = CreateDynamicObject(19327, 1061.1796, -1666.4758, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[191], 0, "Besucher", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[192] = CreateDynamicObject(19327, 1064.9299, -1666.4758, 12.2857, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[192], 0, "Besucher", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[193] = CreateDynamicObject(19377, 1110.6350, -1663.0573, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[193], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[194] = CreateDynamicObject(19971, 1065.9500, -1668.9855, 12.1406, 0.0000, 0.0000, 90.0000); //SAMPRoadSign24
	SetDynamicObjectMaterial(oamtbasemap[194], 2, 3119, "cs_ry_props", "lightgrey", 0xFF0E316D);
	oamtbasemap[195] = CreateDynamicObject(19327, 1065.9847, -1668.0447, 14.5512, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[195], 0, "P", 90, "Arial", 90, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[196] = CreateDynamicObject(19377, 1105.8454, -1665.2404, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[196], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[197] = CreateDynamicObject(19357, 1109.8222, -1682.4188, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[197], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[198] = CreateDynamicObject(19357, 1113.9027, -1682.4188, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[198], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[199] = CreateDynamicObject(19357, 1117.4630, -1682.4188, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[199], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[200] = CreateDynamicObject(19357, 1121.2832, -1682.4188, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[200], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[201] = CreateDynamicObject(19357, 1124.9832, -1682.4188, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[201], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[202] = CreateDynamicObject(19357, 1124.9832, -1679.2291, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[202], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[203] = CreateDynamicObject(19357, 1121.2829, -1679.2291, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[203], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[204] = CreateDynamicObject(19357, 1117.4632, -1679.2291, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[204], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[205] = CreateDynamicObject(19357, 1113.9124, -1679.2291, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[205], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[206] = CreateDynamicObject(19357, 1109.8221, -1679.2291, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[206], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[207] = CreateDynamicObject(18980, 1139.5139, -1688.7664, 13.3591, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[207], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[208] = CreateDynamicObject(18980, 1139.5139, -1688.7664, 12.3592, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[208], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[209] = CreateDynamicObject(18980, 1139.5139, -1663.7663, 13.3591, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[209], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[210] = CreateDynamicObject(18980, 1139.5139, -1663.7663, 12.3592, 0.0000, 90.0000, 90.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[210], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[211] = CreateDynamicObject(18980, 1110.9095, -1662.4752, 13.3394, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[211], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[212] = CreateDynamicObject(18980, 1110.9095, -1662.4752, 12.3394, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[212], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[213] = CreateDynamicObject(18980, 1126.5603, -1662.4652, 13.3294, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[213], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[214] = CreateDynamicObject(18980, 1126.5603, -1662.4652, 12.3293, 0.0000, 90.0000, 0.0000); //Concrete1mx1mx25m
	SetDynamicObjectMaterial(oamtbasemap[214], 0, 17541, "eastbeach2a_lae2", "hedge1", 0xFFFFFFFF);
	oamtbasemap[215] = CreateDynamicObject(19377, 1120.2344, -1663.0573, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[215], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[216] = CreateDynamicObject(19377, 1129.8043, -1663.0573, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[216], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[217] = CreateDynamicObject(19377, 1134.2742, -1663.0573, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[217], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[218] = CreateDynamicObject(19377, 1138.9344, -1667.9368, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[218], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[219] = CreateDynamicObject(19377, 1138.9344, -1677.5472, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[219], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[220] = CreateDynamicObject(19377, 1138.9344, -1687.1170, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[220], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[221] = CreateDynamicObject(19377, 1138.9344, -1696.5373, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[221], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[222] = CreateDynamicObject(19377, 1134.0645, -1701.1876, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[222], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[223] = CreateDynamicObject(19377, 1124.5648, -1701.1876, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[223], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[224] = CreateDynamicObject(19377, 1115.0048, -1701.1876, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[224], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[225] = CreateDynamicObject(19377, 1110.7542, -1701.1876, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[225], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[226] = CreateDynamicObject(19357, 1113.9124, -1664.7486, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[226], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[227] = CreateDynamicObject(19357, 1113.9124, -1667.9384, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[227], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[228] = CreateDynamicObject(19357, 1109.8221, -1664.7285, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[228], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[229] = CreateDynamicObject(19357, 1109.8221, -1667.9289, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[229], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[230] = CreateDynamicObject(19357, 1117.4632, -1664.7385, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[230], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[231] = CreateDynamicObject(19357, 1117.4632, -1667.9281, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[231], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[232] = CreateDynamicObject(19357, 1121.2829, -1664.7387, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[232], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[233] = CreateDynamicObject(19357, 1121.2829, -1667.8790, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[233], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[234] = CreateDynamicObject(19357, 1124.9832, -1664.7486, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[234], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[235] = CreateDynamicObject(19357, 1124.9832, -1667.9588, 10.5480, 0.0000, 0.0000, 0.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[235], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[236] = CreateDynamicObject(19377, 1129.8352, -1691.6997, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[236], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[237] = CreateDynamicObject(19377, 1134.0655, -1691.6997, 7.0356, 0.0000, 0.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[237], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[238] = CreateDynamicObject(19357, 1137.2532, -1687.4788, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[238], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[239] = CreateDynamicObject(19357, 1137.2532, -1683.8483, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[239], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[240] = CreateDynamicObject(19357, 1137.2532, -1680.3881, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[240], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[241] = CreateDynamicObject(19357, 1137.2532, -1677.1279, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[241], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[242] = CreateDynamicObject(19357, 1137.2532, -1673.8276, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[242], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[243] = CreateDynamicObject(19357, 1137.2532, -1670.4372, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[243], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[244] = CreateDynamicObject(19357, 1137.2532, -1666.8468, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[244], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[245] = CreateDynamicObject(19357, 1134.3330, -1666.8468, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[245], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[246] = CreateDynamicObject(19357, 1134.3330, -1670.4370, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[246], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[247] = CreateDynamicObject(19357, 1134.3330, -1673.8276, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[247], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[248] = CreateDynamicObject(19357, 1134.3330, -1677.1276, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[248], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[249] = CreateDynamicObject(19357, 1134.3330, -1680.3880, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[249], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[250] = CreateDynamicObject(19357, 1134.3330, -1683.8481, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[250], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[251] = CreateDynamicObject(19357, 1134.3330, -1687.4779, 10.5480, 0.0000, 0.0000, 90.0000); //wall005
	SetDynamicObjectMaterial(oamtbasemap[251], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[252] = CreateDynamicObject(19327, 1133.1999, -1685.9956, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[252], 0, "A-02", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[253] = CreateDynamicObject(19948, 1138.7978, -1673.8273, 12.2567, 0.0000, 0.0000, -90.0000); //SAMPRoadSign1
	SetDynamicObjectMaterial(oamtbasemap[253], 2, 3119, "cs_ry_props", "lightgrey", 0xFFD78E10);
	oamtbasemap[254] = CreateDynamicObject(19327, 1133.1999, -1689.9161, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[254], 0, "A-01", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[255] = CreateDynamicObject(19327, 1133.1999, -1665.2132, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[255], 0, "A-08", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[256] = CreateDynamicObject(19327, 1133.1999, -1682.3948, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[256], 0, "A-03", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[257] = CreateDynamicObject(19327, 1133.1999, -1679.0546, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[257], 0, "A-04", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[258] = CreateDynamicObject(19327, 1133.1999, -1675.7139, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[258], 0, "A-05", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[259] = CreateDynamicObject(19327, 1133.1999, -1672.4538, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[259], 0, "A-06", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[260] = CreateDynamicObject(19327, 1133.1999, -1668.9533, 12.2858, -90.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[260], 0, "A-07", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[261] = CreateDynamicObject(19948, 1138.9078, -1691.7174, 12.2567, 0.0000, 0.0000, -90.0000); //SAMPRoadSign1
	SetDynamicObjectMaterial(oamtbasemap[261], 2, 3119, "cs_ry_props", "lightgrey", 0xFFD78E10);
	oamtbasemap[262] = CreateDynamicObject(19948, 1125.0172, -1677.8073, 12.0967, 0.0000, 0.0000, 90.0000); //SAMPRoadSign1
	SetDynamicObjectMaterial(oamtbasemap[262], 2, 3119, "cs_ry_props", "lightgrey", 0xFFD78E10);
	oamtbasemap[263] = CreateDynamicObject(19948, 1124.9971, -1677.8073, 12.0967, 0.0000, 0.0000, -90.0000); //SAMPRoadSign1
	SetDynamicObjectMaterial(oamtbasemap[263], 2, 3119, "cs_ry_props", "lightgrey", 0xFFD78E10);
	oamtbasemap[264] = CreateDynamicObject(19948, 1124.9971, -1669.4669, 12.0967, 0.0000, 0.0000, -90.0000); //SAMPRoadSign1
	SetDynamicObjectMaterial(oamtbasemap[264], 2, 3119, "cs_ry_props", "lightgrey", 0xFFD78E10);
	oamtbasemap[265] = CreateDynamicObject(19948, 1125.0072, -1669.4669, 12.0967, 0.0000, 0.0000, 90.0000); //SAMPRoadSign1
	SetDynamicObjectMaterial(oamtbasemap[265], 2, 3119, "cs_ry_props", "lightgrey", 0xFFD78E10);
	oamtbasemap[266] = CreateDynamicObject(19327, 1138.8774, -1692.6761, 14.6237, 0.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[266], 0, "A", 90, "Arial", 80, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[267] = CreateDynamicObject(19327, 1138.7574, -1674.7662, 14.6237, 0.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[267], 0, "A", 90, "Arial", 80, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[268] = CreateDynamicObject(19327, 1125.0477, -1676.8657, 14.4637, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[268], 0, "B", 90, "Arial", 80, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[269] = CreateDynamicObject(19327, 1124.9676, -1670.4061, 14.4637, 0.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[269], 0, "C", 90, "Arial", 80, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[270] = CreateDynamicObject(19327, 1124.9676, -1678.7459, 14.4637, 0.0000, 0.0000, -90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[270], 0, "B", 90, "Arial", 80, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[271] = CreateDynamicObject(8674, 1105.7291, -1696.8192, 13.6680, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[271], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[272] = CreateDynamicObject(19327, 1125.0477, -1668.5157, 14.4637, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[272], 0, "C", 90, "Arial", 80, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[273] = CreateDynamicObject(966, 1106.0567, -1691.2637, 12.1798, 0.0000, 0.0000, -90.0000); //bar_gatebar01
	SetDynamicObjectMaterial(oamtbasemap[273], 0, 16640, "a51", "redmetal", 0xFFFFFFFF);
	oamtbasemap[275] = CreateDynamicObject(8674, 1105.7291, -1668.6905, 13.6680, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[275], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[276] = CreateDynamicObject(8674, 1105.7291, -1678.9698, 13.6680, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[276], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[277] = CreateDynamicObject(8674, 1105.7291, -1658.4006, 13.6680, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[277], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[278] = CreateDynamicObject(8674, 1105.7291, -1657.8703, 12.4280, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[278], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[279] = CreateDynamicObject(8674, 1105.7291, -1657.1297, 13.5980, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[279], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[280] = CreateDynamicObject(8674, 1140.0290, -1666.2398, 13.5980, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[280], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[281] = CreateDynamicObject(8674, 1140.0290, -1676.5297, 13.5980, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[281], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[282] = CreateDynamicObject(8674, 1140.0290, -1697.0999, 13.5980, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[282], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[283] = CreateDynamicObject(19966, 1105.6306, -1691.6801, 12.1058, 0.0000, 0.0000, -90.0000); //SAMPRoadSign19
	oamtbasemap[284] = CreateDynamicObject(8674, 1140.0290, -1686.8198, 13.5980, 0.0000, 0.0000, 90.0000); //csrsfence02_lvs
	SetDynamicObjectMaterial(oamtbasemap[284], 0, 13659, "8bars", "Upt_Fence_Mesh", 0xFF000000);
	oamtbasemap[285] = CreateDynamicObject(19951, 1102.4643, -1669.3692, 10.7335, 0.0000, 0.0000, 0.0000); //SAMPRoadSign4
	oamtbasemap[286] = CreateDynamicObject(19966, 1105.7607, -1684.1202, 12.1058, 0.0000, 0.0000, 90.0000); //SAMPRoadSign19
	oamtbasemap[287] = CreateDynamicObject(19951, 1101.3342, -1669.3692, 10.7335, 0.0000, 0.0000, 0.0000); //SAMPRoadSign4
	oamtbasemap[288] = CreateDynamicObject(19951, 1100.1740, -1669.3692, 10.7335, 0.0000, 0.0000, 0.0000); //SAMPRoadSign4
	oamtbasemap[289] = CreateDynamicObject(3335, 1091.1827, -1693.1612, 11.8309, 0.0000, 0.0000, 38.4000); //CE_roadsign1
	SetDynamicObjectMaterial(oamtbasemap[289], 0, 10756, "airportroads_sfse", "stones256128", 0xFFFFFFFF);
	SetDynamicObjectMaterial(oamtbasemap[289], 1, 3440, "airportpillar", "metalic_64", 0xFFFFFFFF);
	SetDynamicObjectMaterial(oamtbasemap[289], 2, 16093, "a51_ext", "ws_whitewall2_top", 0xFFFFFFFF);
	oamtbasemap[290] = CreateDynamicObject(19327, 1122.7601, -1678.1243, 12.2858, -90.0000, 0.0000, 180.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[290], 0, "B-01", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[291] = CreateDynamicObject(19327, 1119.0102, -1678.1243, 12.2858, -90.0000, 0.0000, 180.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[291], 0, "B-02", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[292] = CreateDynamicObject(19327, 1115.3801, -1678.1243, 12.2858, -90.0000, 0.0000, 180.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[292], 0, "B-03", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[293] = CreateDynamicObject(19327, 1111.5196, -1678.1243, 12.2858, -90.0000, 0.0000, 180.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[293], 0, "B-04", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[294] = CreateDynamicObject(19327, 1107.4893, -1678.1243, 12.2858, -90.0000, 0.0000, 180.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[294], 0, "B-05", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[295] = CreateDynamicObject(19327, 1108.0894, -1669.1343, 12.2858, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[295], 0, "C-05", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[296] = CreateDynamicObject(19327, 1112.1895, -1669.1343, 12.2858, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[296], 0, "C-04", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[297] = CreateDynamicObject(19327, 1115.9398, -1669.1343, 12.2858, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[297], 0, "C-03", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[298] = CreateDynamicObject(19327, 1119.5502, -1669.1343, 12.2858, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[298], 0, "C-02", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[299] = CreateDynamicObject(19327, 1123.4108, -1669.1343, 12.2858, -90.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[299], 0, "C-01", 90, "Arial", 100, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[300] = CreateDynamicObject(19377, 1115.4257, -1696.4304, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[300], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[301] = CreateDynamicObject(19377, 1119.8861, -1696.4304, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[301], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[302] = CreateDynamicObject(19377, 1124.1959, -1696.4304, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[302], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[303] = CreateDynamicObject(19377, 1128.6058, -1696.4304, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[303], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[304] = CreateDynamicObject(19377, 1133.1760, -1696.4304, 7.0356, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[304], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[305] = CreateDynamicObject(2059, 1057.1282, -1680.6494, 12.6966, 0.0000, 0.0000, 0.0000); //CJ_GUNSTUFF1
	oamtbasemap[306] = CreateDynamicObject(19835, 1057.5739, -1681.2138, 12.7721, 0.0000, 0.0000, 0.0000); //CoffeeCup1
	oamtbasemap[307] = CreateDynamicObject(19786, 1053.4072, -1684.8500, 14.5393, 0.0000, 0.0000, 90.0000); //LCDTVBig1
	SetDynamicObjectMaterial(oamtbasemap[307], 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	SetDynamicObjectMaterial(oamtbasemap[307], 1, 2813, "gb_books01", "GB_magazine06", 0xFFFFFFFF);
	oamtbasemap[308] = CreateDynamicObject(19786, 1053.4072, -1687.7895, 14.5393, 0.0000, 0.0000, 90.0000); //LCDTVBig1
	SetDynamicObjectMaterial(oamtbasemap[308], 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	SetDynamicObjectMaterial(oamtbasemap[308], 1, 3119, "cs_ry_props", "GB_magazine07", 0xFFFFFFFF);
	oamtbasemap[309] = CreateDynamicObject(19327, 1053.5722, -1686.8377, 13.3766, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[309], 0, "IT - TV", 130, "Arial", 22, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[310] = CreateDynamicObject(19327, 1053.5722, -1683.8776, 13.3766, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[310], 0, "IT - TV", 130, "Arial", 22, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[311] = CreateDynamicObject(19327, 1053.5800, -1682.7172, 13.5466, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[311], 0, ".", 90, "Arial", 30, 1, 0xFF2E5B20, 0x0, 0);
	oamtbasemap[312] = CreateDynamicObject(19327, 1053.5800, -1685.6680, 13.5466, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[312], 0, ".", 90, "Arial", 30, 1, 0xFF2E5B20, 0x0, 0);
	oamtbasemap[313] = CreateDynamicObject(19327, 1053.5086, -1682.2249, 14.6845, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[313], 0, "B?ro im 1. OG", 90, "Arial", 22, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[314] = CreateDynamicObject(19355, 1058.0769, -1687.7626, 17.4416, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[314], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[315] = CreateDynamicObject(19327, 1053.5086, -1682.2349, 14.6745, 0.0000, 0.0000, 90.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[315], 0, "____________", 90, "Arial", 22, 1, 0xFF000000, 0x0, 0);
	oamtbasemap[316] = CreateDynamicObject(19355, 1058.0769, -1690.9134, 17.4416, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[316], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[317] = CreateDynamicObject(19389, 1054.8651, -1687.7691, 17.4299, 0.0000, 0.0000, 90.0000); //wall037
	SetDynamicObjectMaterial(oamtbasemap[317], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[318] = CreateDynamicObject(19389, 1054.8651, -1690.9091, 17.4299, 0.0000, 0.0000, 90.0000); //wall037
	SetDynamicObjectMaterial(oamtbasemap[318], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[319] = CreateDynamicObject(19355, 1051.8574, -1690.9134, 17.4416, 0.0000, 0.0000, 90.0000); //wall003
	SetDynamicObjectMaterial(oamtbasemap[319], 0, 3979, "civic01_lan", "sl_concretewall1", 0xFFFFFFFF);
	oamtbasemap[320] = CreateDynamicObject(1502, 1055.6124, -1690.8305, 15.6605, 0.0000, 0.0000, 180.0000); //Gen_doorINT04
	SetDynamicObjectMaterial(oamtbasemap[320], 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFFFFFFFF);
	oamtbasemap[321] = CreateDynamicObject(1502, 1054.0825, -1687.8304, 15.6605, 0.0000, 0.0000, 0.0000); //Gen_doorINT04
	SetDynamicObjectMaterial(oamtbasemap[321], 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0xFFFFFFFF);
	oamtbasemap[322] = CreateDynamicObject(2184, 1056.8448, -1681.2755, 15.7209, 0.0000, 0.0000, 0.0000); //MED_OFFICE6_DESK_2
	oamtbasemap[323] = CreateDynamicObject(2184, 1058.9747, -1684.7058, 15.7209, 0.0000, 0.0000, 180.0000); //MED_OFFICE6_DESK_2
	oamtbasemap[324] = CreateDynamicObject(19565, 1058.8474, -1681.0742, 16.3435, 0.0000, 0.0000, -10.9999); //IceCreamBarsBox1
	SetDynamicObjectMaterial(oamtbasemap[324], 0, 3440, "airportpillar", "metalic_64", 0xFFFFFFFF);
	oamtbasemap[325] = CreateDynamicObject(19565, 1058.8243, -1684.8088, 16.3435, 0.0000, 0.0000, 8.5000); //IceCreamBarsBox1
	SetDynamicObjectMaterial(oamtbasemap[325], 0, 3440, "airportpillar", "metalic_64", 0xFFFFFFFF);
	oamtbasemap[326] = CreateDynamicObject(19377, 1055.0373, -1683.3292, 19.1255, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[326], 0, 10023, "bigwhitesfe", "sfe_arch8", 0xFFFFFFFF);
	oamtbasemap[327] = CreateDynamicObject(19327, 1059.8248, -1681.3149, 15.9868, 0.0000, 0.0000, -10.6999); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[327], 0, "Leader", 130, "Arial", 20, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[328] = CreateDynamicObject(19327, 1057.8199, -1684.9262, 15.9868, 0.0000, 0.0000, -170.9999); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[328], 0, "Manager", 130, "Arial", 20, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[329] = CreateDynamicObject(1714, 1057.7919, -1678.9840, 15.6894, 0.0000, 0.0000, 11.1999); //kb_swivelchair1
	oamtbasemap[330] = CreateDynamicObject(19377, 1055.0373, -1692.0506, 19.1455, 0.0000, 90.0000, 90.0000); //wall025
	SetDynamicObjectMaterial(oamtbasemap[330], 0, 10023, "bigwhitesfe", "sfe_arch8", 0xFFFFFFFF);
	oamtbasemap[331] = CreateDynamicObject(1714, 1057.5270, -1686.8601, 15.6894, 0.0000, 0.0000, 154.5000); //kb_swivelchair1
	oamtbasemap[332] = CreateDynamicObject(1721, 1057.8374, -1683.0447, 15.7459, 0.0000, 0.0000, 162.6999); //est_chair1
	oamtbasemap[333] = CreateDynamicObject(1721, 1056.4985, -1683.1394, 15.7459, 0.0000, 0.0000, -163.5000); //est_chair1
	oamtbasemap[334] = CreateDynamicObject(1721, 1058.8198, -1682.8594, 15.7459, 0.0000, 0.0000, 15.0999); //est_chair1
	oamtbasemap[335] = CreateDynamicObject(1721, 1056.4183, -1688.0429, 15.7459, 0.0000, 0.0000, 180.0000); //est_chair1
	oamtbasemap[336] = CreateDynamicObject(1721, 1057.2083, -1688.0429, 15.7459, 0.0000, 0.0000, 180.0000); //est_chair1
	oamtbasemap[337] = CreateDynamicObject(1721, 1057.9587, -1688.0429, 15.7459, 0.0000, 0.0000, 180.0000); //est_chair1
	oamtbasemap[338] = CreateDynamicObject(1721, 1057.9587, -1690.6931, 15.7459, 0.0000, 0.0000, 0.0000); //est_chair1
	oamtbasemap[339] = CreateDynamicObject(1721, 1057.0885, -1690.6931, 15.7459, 0.0000, 0.0000, 0.0000); //est_chair1
	oamtbasemap[340] = CreateDynamicObject(1721, 1056.1083, -1690.6931, 15.7459, 0.0000, 0.0000, 0.0000); //est_chair1
	oamtbasemap[341] = CreateDynamicObject(1808, 1059.3232, -1690.4515, 15.6875, 0.0000, 0.0000, -106.5999); //CJ_WATERCOOLER2
	oamtbasemap[342] = CreateDynamicObject(2010, 1058.7941, -1688.3730, 15.9453, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	SetDynamicObjectMaterial(oamtbasemap[342], 1, 16322, "a51_stores", "des_ghotwood1", 0xFFFFFFFF);
	oamtbasemap[343] = CreateDynamicObject(2010, 1058.9343, -1687.1127, 15.9453, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	SetDynamicObjectMaterial(oamtbasemap[343], 1, 16322, "a51_stores", "des_ghotwood1", 0xFFFFFFFF);
	oamtbasemap[344] = CreateDynamicObject(2010, 1059.0301, -1678.7038, 15.9453, 0.0000, 0.0000, 43.3999); //nu_plant3_ofc
	SetDynamicObjectMaterial(oamtbasemap[344], 1, 16322, "a51_stores", "des_ghotwood1", 0xFFFFFFFF);
	oamtbasemap[345] = CreateDynamicObject(2180, 1055.0375, -1696.5484, 15.7102, 0.0000, 0.0000, 90.0000); //MED_OFFICE5_DESK_3
	oamtbasemap[346] = CreateDynamicObject(2180, 1052.5671, -1696.5484, 15.7102, 0.0000, 0.0000, 90.0000); //MED_OFFICE5_DESK_3
	oamtbasemap[347] = CreateDynamicObject(2180, 1052.4963, -1692.6182, 15.7102, 0.0000, 0.0000, 90.0000); //MED_OFFICE5_DESK_3
	oamtbasemap[348] = CreateDynamicObject(2180, 1056.5667, -1692.6182, 15.7102, 0.0000, 0.0000, 90.0000); //MED_OFFICE5_DESK_3
	oamtbasemap[349] = CreateDynamicObject(14532, 1058.9344, -1691.8669, 16.7037, 0.0000, 0.0000, 127.6999); //tv_stand_driv
	oamtbasemap[350] = CreateDynamicObject(19805, 1059.7120, -1694.0124, 17.6182, 0.0000, 0.0000, -90.0000); //Whiteboard1
	SetDynamicObjectMaterial(oamtbasemap[350], 0, 14530, "estate2", "ab_dsWhiteboard", 0xFFFFFFFF);
	oamtbasemap[351] = CreateDynamicObject(1721, 1055.1761, -1692.5017, 15.7359, 0.0000, 0.0000, -81.4999); //est_chair1
	oamtbasemap[352] = CreateDynamicObject(1721, 1051.0850, -1691.6607, 15.7359, 0.0000, 0.0000, -94.0999); //est_chair1
	oamtbasemap[353] = CreateDynamicObject(1721, 1051.0673, -1692.7449, 15.7359, 0.0000, 0.0000, -87.0000); //est_chair1
	oamtbasemap[354] = CreateDynamicObject(1721, 1051.1129, -1696.4782, 15.7359, 0.0000, 0.0000, -87.0000); //est_chair1
	oamtbasemap[355] = CreateDynamicObject(1721, 1053.6092, -1696.3475, 15.7359, 0.0000, 0.0000, -87.0000); //est_chair1
	oamtbasemap[356] = CreateDynamicObject(1721, 1051.1394, -1695.5147, 15.7359, 0.0000, 0.0000, -94.0999); //est_chair1
	oamtbasemap[357] = CreateDynamicObject(1721, 1053.6072, -1695.4425, 15.7359, 0.0000, 0.0000, -88.7000); //est_chair1
	oamtbasemap[358] = CreateDynamicObject(2184, 1057.6105, -1694.6877, 15.7283, 0.0000, 0.0000, -109.7000); //MED_OFFICE6_DESK_2
	oamtbasemap[359] = CreateDynamicObject(1714, 1059.3300, -1696.4654, 15.7238, 0.0000, 0.0000, -107.8999); //kb_swivelchair1
	oamtbasemap[360] = CreateDynamicObject(1290, 1125.4543, -1682.1436, 18.1754, 0.0000, 0.0000, 90.0000); //lamppost2
	oamtbasemap[361] = CreateDynamicObject(1232, 1076.1729, -1687.7235, 13.4806, 0.0000, 0.0000, 0.0000); //Streetlamp1
	oamtbasemap[362] = CreateDynamicObject(1232, 1083.1529, -1682.0329, 13.4806, 0.0000, 0.0000, 0.0000); //Streetlamp1
	oamtbasemap[363] = CreateDynamicObject(1232, 1078.2725, -1682.0329, 13.4806, 0.0000, 0.0000, 0.0000); //Streetlamp1
	oamtbasemap[364] = CreateDynamicObject(1232, 1088.3835, -1687.7235, 13.4806, 0.0000, 0.0000, 0.0000); //Streetlamp1
	oamtbasemap[365] = CreateDynamicObject(1223, 1060.2863, -1681.0742, 11.9874, 0.0000, 0.0000, 0.0000); //lampost_coast
	oamtbasemap[366] = CreateDynamicObject(1223, 1060.2863, -1691.2242, 11.9874, 0.0000, 0.0000, 0.0000); //lampost_coast
	oamtbasemap[367] = CreateDynamicObject(1223, 1063.6756, -1662.6241, 11.9874, 0.0000, 0.0000, -90.0000); //lampost_coast
	oamtbasemap[368] = CreateDynamicObject(1223, 1053.2855, -1662.6241, 11.9874, 0.0000, 0.0000, -90.0000); //lampost_coast
	oamtbasemap[369] = CreateDynamicObject(1223, 1081.3660, -1662.6241, 11.9874, 0.0000, 0.0000, -90.0000); //lampost_coast
	oamtbasemap[370] = CreateDynamicObject(2161, 1053.5250, -1680.5364, 15.7250, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_4
	oamtbasemap[371] = CreateDynamicObject(2161, 1053.5250, -1681.8961, 15.7250, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_4
	oamtbasemap[372] = CreateDynamicObject(2167, 1053.5386, -1682.9512, 15.7085, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_7
	oamtbasemap[373] = CreateDynamicObject(1223, 1093.4663, -1662.6241, 11.9874, 0.0000, 0.0000, -90.0000); //lampost_coast
	oamtbasemap[374] = CreateDynamicObject(2167, 1053.5386, -1683.8811, 15.7085, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_7
	oamtbasemap[375] = CreateDynamicObject(2167, 1053.5386, -1684.8115, 15.7085, 0.0000, 0.0000, 90.0000); //MED_OFFICE_UNIT_7
	oamtbasemap[376] = CreateDynamicObject(2202, 1055.1140, -1678.7492, 15.7014, 0.0000, 0.0000, 0.0000); //PHOTOCOPIER_2
	oamtbasemap[377] = CreateDynamicObject(2190, 1057.1325, -1681.3236, 16.4861, 0.0000, 0.0000, 157.9000); //PC_1
	oamtbasemap[378] = CreateDynamicObject(2190, 1057.1072, -1684.5369, 16.4861, 0.0000, 0.0000, 21.8000); //PC_1
	oamtbasemap[379] = CreateDynamicObject(2190, 1057.7384, -1694.9461, 16.4861, 0.0000, 0.0000, 21.8000); //PC_1
	oamtbasemap[380] = CreateDynamicObject(19808, 1057.7730, -1695.9204, 16.5333, 0.0000, 0.0000, 76.1999); //Keyboard1
	oamtbasemap[381] = CreateDynamicObject(19808, 1057.4464, -1685.2847, 16.5333, 0.0000, 0.0000, 8.9999); //Keyboard1
	oamtbasemap[382] = CreateDynamicObject(19808, 1057.6175, -1680.6873, 16.5033, 0.0000, 0.0000, 170.2999); //Keyboard1
	oamtbasemap[383] = CreateDynamicObject(19807, 1058.7774, -1680.7097, 16.5580, 0.0000, 0.0000, -152.3999); //Telephone1
	oamtbasemap[384] = CreateDynamicObject(19807, 1058.8653, -1685.0648, 16.5580, 0.0000, 0.0000, -21.9999); //Telephone1
	oamtbasemap[385] = CreateDynamicObject(19327, 1056.9475, -1687.8823, 17.5187, 0.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[385], 0, "B?ro/", 130, "Arial", 25, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[386] = CreateDynamicObject(19327, 1052.8175, -1690.8023, 17.5187, 0.0000, 0.0000, 180.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[386], 0, "?bungs", 130, "Arial", 23, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[387] = CreateDynamicObject(19565, 1055.8894, -1687.8395, 17.8982, 0.0000, 0.0000, 0.0000); //IceCreamBarsBox1
	SetDynamicObjectMaterial(oamtbasemap[387], 0, 10765, "airportgnd_sfse", "white", 0xFF166CB3);
	oamtbasemap[388] = CreateDynamicObject(19565, 1053.8088, -1690.8403, 17.8982, 0.0000, 0.0000, 0.0000); //IceCreamBarsBox1
	SetDynamicObjectMaterial(oamtbasemap[388], 0, 10765, "airportgnd_sfse", "white", 0xFF166CB3);
	oamtbasemap[389] = CreateDynamicObject(19327, 1052.7574, -1690.8023, 17.4087, 0.0000, 0.0000, 180.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[389], 0, "Raum", 130, "Arial", 23, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[390] = CreateDynamicObject(19327, 1056.8374, -1687.8823, 17.4187, 0.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[390], 0, "Abholung", 130, "Arial", 25, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[391] = CreateDynamicObject(2010, 1059.3345, -1687.7125, 12.2453, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	SetDynamicObjectMaterial(oamtbasemap[391], 1, 16322, "a51_stores", "des_ghotwood1", 0xFFFFFFFF);
	oamtbasemap[392] = CreateDynamicObject(1753, 1059.1949, -1693.5562, 12.2650, 0.0000, 0.0000, -90.0000); //SWANK_COUCH_1
	SetDynamicObjectMaterial(oamtbasemap[392], 0, 1714, "cj_office", "est_chair", 0xFFFFFFFF);
	oamtbasemap[393] = CreateDynamicObject(2010, 1059.1441, -1679.0018, 12.2453, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	SetDynamicObjectMaterial(oamtbasemap[393], 1, 16322, "a51_stores", "des_ghotwood1", 0xFFFFFFFF);
	oamtbasemap[394] = CreateDynamicObject(1753, 1058.0948, -1696.5466, 12.2650, 0.0000, 0.0000, 180.0000); //SWANK_COUCH_1
	SetDynamicObjectMaterial(oamtbasemap[394], 0, 1714, "cj_office", "est_chair", 0xFFFFFFFF);
	oamtbasemap[395] = CreateDynamicObject(2010, 1059.0843, -1696.5324, 12.2453, 0.0000, 0.0000, 0.0000); //nu_plant3_ofc
	SetDynamicObjectMaterial(oamtbasemap[395], 1, 16322, "a51_stores", "des_ghotwood1", 0xFFFFFFFF);
	oamtbasemap[396] = CreateDynamicObject(19327, 1058.4226, -1691.3282, 13.3766, 0.0000, 0.0000, 0.0000); //7_11_sign02
	SetDynamicObjectMaterialText(oamtbasemap[396], 0, "IT - TV", 130, "Arial", 22, 1, 0xFFFFFFFF, 0x0, 0);
	oamtbasemap[397] = CreateDynamicObject(19786, 1057.4475, -1691.1693, 14.5393, 0.0000, 0.0000, 0.0000); //LCDTVBig1
	SetDynamicObjectMaterial(oamtbasemap[397], 0, 10765, "airportgnd_sfse", "black64", 0xFFFFFFFF);
	oamtbasemap[398] = CreateDynamicObject(1753, 1050.9844, -1692.3970, 12.2650, 0.0000, 0.0000, 0.0000); //SWANK_COUCH_1
	SetDynamicObjectMaterial(oamtbasemap[398], 0, 1714, "cj_office", "est_chair", 0xFFFFFFFF);
	oamtbasemap[399] = CreateDynamicObject(1753, 1053.0151, -1696.5270, 12.2650, 0.0000, 0.0000, 180.0000); //SWANK_COUCH_1
	SetDynamicObjectMaterial(oamtbasemap[399], 0, 1714, "cj_office", "est_chair", 0xFFFFFFFF);
	oamtbasemap[400] = CreateDynamicObject(1827, 1057.2025, -1694.5806, 12.2419, 0.0000, 0.0000, 0.0000); //man_sdr_tables
	SetDynamicObjectMaterial(oamtbasemap[400], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[401] = CreateDynamicObject(1827, 1051.7220, -1694.5806, 12.2419, 0.0000, 0.0000, 0.0000); //man_sdr_tables
	SetDynamicObjectMaterial(oamtbasemap[401], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	oamtbasemap[402] = CreateDynamicObject(2059, 1057.1282, -1694.5192, 12.6966, 0.0000, 0.0000, 0.0000); //CJ_GUNSTUFF1
	oamtbasemap[403] = CreateDynamicObject(19835, 1051.4838, -1694.1737, 12.7721, 0.0000, 0.0000, 0.0000); //CoffeeCup1
	oamtbasemap[404] = CreateDynamicObject(19835, 1051.7541, -1695.0737, 12.7721, 0.0000, 0.0000, 0.0000); //CoffeeCup1
	oamtbasemap[405] = CreateDynamicObject(19355, 1057.7066, -1694.9671, 12.2017, 0.0000, 90.0000, -178.0999); //wall003
	SetDynamicObjectMaterial(oamtbasemap[405], 0, 14569, "traidman", "darkgrey_carpet_256", 0xFFFFFFFF);
	oamtbasemap[406] = CreateDynamicObject(19355, 1052.2283, -1694.4989, 12.2017, 0.0000, 90.0000, -178.0999); //wall003
	SetDynamicObjectMaterial(oamtbasemap[406], 0, 14569, "traidman", "darkgrey_carpet_256", 0xFFFFFFFF);


 	//M?llmann Base - by Ramin
 	new Garb;
	Garb = CreateDynamicObject(6929, 1750.10242, -2033.65625, 17.70020,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(Garb,4,4873,"railway_las","newall1-1",0);
	SetDynamicObjectMaterial(Garb,5,6929,"vgnpwroutbld1","Metal3_128",0);
 	CreateDynamicObject(934, 1765.04407, -2040.68359, 13.84180,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1689, 1742.63306, -2033.83594, 21.84476,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(16337, 1810.80688, -2065.43701, 12.70260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1362, 1811.89954, -2062.02026, 13.12365,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1358, 1765.36511, -2022.60022, 14.32420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1264, 1764.92639, -2025.36560, 13.47966,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1264, 1766.02820, -2024.64490, 13.47966,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1439, 1731.09131, -2054.02710, 12.67050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1449, 1812.35974, -2060.31714, 13.06576,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2890, 1727.09985, -2069.80469, 12.40164,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19127, 1812.61646, -2077.28516, 13.08030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1812.74146, -2067.73315, 13.08030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1745.68323, -2054.03149, 13.08030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1780.79309, -2025.89905, 13.38331,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1780.80273, -2019.47095, 13.38331,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8167, 1766.75684, -2053.40234, 12.72391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8167, 1766.65515, -2044.99731, 12.72391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8167, 1766.78418, -2036.29858, 12.72391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8167, 1766.73706, -2027.91943, 12.72391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8167, 1770.37891, -2026.01782, 12.72391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8167, 1777.79016, -2026.00769, 12.72391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8167, 1762.97095, -2026.00317, 12.72391,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8167, 1755.52307, -2055.97485, 12.72390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8167, 1747.20679, -2055.89258, 12.72390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1764.21204, -2053.98438, 13.08030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1756.18665, -2034.11914, 21.29277,   0.00000, 0.00000, 0.00000);

 	//Geldlieferant Abholung - by Ramin
 	CreateDynamicObject(1622, 1619.39319, -1897.53101, 17.24504,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(19305, 1610.48511, -1892.61060, 13.90530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18646, 1610.60315, -1894.61243, 15.02330,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19127, 1610.97961, -1897.57410, 13.03054,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3763, 1605.88013, -1895.24768, 9.87578,   0.00000, 0.00000, 357.15521);

 	//Buslinie 4 Neue Haltestellen - Map by Marshmellow
 	CreateDynamicObject(1257, 1995.27087, -1715.49622, 13.78790,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1257, 1496.53772, -1726.02136, 13.80984,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1257, 1397.56506, -955.03046, 35.14288,   0.00000, 0.00000, 260.00000);
	CreateDynamicObject(1257, 2790.59326, -1303.98682, 38.67430,   -13.00000, 0.00000, 180.00000);
	CreateDynamicObject(1257, 2852.71631, -1547.44580, 11.31211,   0.00000, 0.00000, 160.00000);
	CreateDynamicObject(1257, 2233.67627, -2191.86890, 13.66204,   0.00000, 0.00000, 45.00000);

	//Burger Shot North BSN - by Risq
	new g_Object[209];
	g_Object[0] = CreateDynamicObject(19450, 1198.9029, -888.8919, 40.6795, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[0], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[1] = CreateDynamicObject(5741, 1196.7191, -914.9680, 41.9687, 0.0000, 0.0000, 9.6077); //lawnstuff21
	SetDynamicObjectMaterial(g_Object[1], 0, 7509, "vgwestretail1", "hedge2_256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[1], 1, 17547, "eastbeach4a_lae2", "dryhedge_128", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[1], 2, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[1], 3, 16008, "des_n", "drvin_ground1", 0xFFBDBEC6);
	g_Object[2] = CreateDynamicObject(19450, 1189.8199, -890.1981, 40.7859, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[2], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[3] = CreateDynamicObject(19450, 1202.7895, -888.3258, 40.6206, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[3], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[4] = CreateDynamicObject(19450, 1208.1738, -892.3106, 40.5153, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[4], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[5] = CreateDynamicObject(19450, 1182.2075, -909.0969, 40.8829, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[5], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[6] = CreateDynamicObject(19791, 1180.5495, -896.7266, 32.6250, 0.0000, 0.6998, 8.3078); //Cube10mx10m
	SetDynamicObjectMaterial(g_Object[6], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	g_Object[7] = CreateDynamicObject(19791, 1181.6157, -904.0288, 32.6240, 0.0000, 0.6998, 8.3078); //Cube10mx10m
	SetDynamicObjectMaterial(g_Object[7], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	g_Object[8] = CreateDynamicObject(18981, 1193.5849, -910.3784, 41.9780, 0.0000, 90.6996, 8.1997); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[8], 0, 13081, "ce_ground13", "dustyconcrete", 0xFFFFFFFF);
	g_Object[9] = CreateDynamicObject(19450, 1198.4239, -922.3416, 40.6571, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[9], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[10] = CreateDynamicObject(19450, 1187.7878, -923.8870, 40.8114, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[10], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[11] = CreateDynamicObject(19450, 1191.7397, -923.3195, 40.7401, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[11], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[12] = CreateDynamicObject(19450, 1182.2971, -919.9207, 40.8754, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[12], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[13] = CreateDynamicObject(19450, 1207.9410, -920.9522, 40.5567, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[13], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[14] = CreateDynamicObject(18981, 1198.1130, -909.7282, 41.9249, 0.0000, 90.6996, 8.1997); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[14], 0, 13081, "ce_ground13", "dustyconcrete", 0xFFFFFFFF);
	g_Object[15] = CreateDynamicObject(19450, 1175.6494, -897.0723, 40.9365, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[15], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[16] = CreateDynamicObject(19450, 1181.4344, -913.9937, 40.8673, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[16], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[17] = CreateDynamicObject(19450, 1209.5682, -901.8385, 40.5153, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[17], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[18] = CreateDynamicObject(19450, 1210.8172, -910.3645, 40.5175, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[18], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[19] = CreateDynamicObject(19450, 1211.0141, -911.7000, 40.5195, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[19], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[20] = CreateDynamicObject(1825, 1179.6966, -906.4119, 42.5956, 0.0000, 0.0000, 8.3078); //kb_table_chairs1
	SetDynamicObjectMaterial(g_Object[20], 0, 3080, "adjumpx", "gen_chrome", 0xFFFFFFFF);
	g_Object[21] = CreateDynamicObject(14407, 1213.9918, -918.1621, 39.0041, 0.0000, 0.0000, -82.6078); //carter-stairs01
	SetDynamicObjectMaterial(g_Object[21], 0, 18056, "mp_diner1", "mp_cj_sheetmetal", 0xFFFFFFFF);
	g_Object[22] = CreateDynamicObject(19450, 1207.4532, -917.0000, 40.4495, 0.0000, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[22], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[23] = CreateDynamicObject(19464, 1208.2829, -913.5070, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[23], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[24] = CreateDynamicObject(19464, 1202.4150, -914.3637, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[24], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[25] = CreateDynamicObject(19464, 1196.5688, -915.2271, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[25], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[26] = CreateDynamicObject(19464, 1226.7735, -913.4500, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[26], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[27] = CreateDynamicObject(19464, 1226.2126, -910.2390, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[27], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[28] = CreateDynamicObject(19464, 1225.6595, -907.0673, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[28], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[29] = CreateDynamicObject(19464, 1225.0655, -903.6599, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[29], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[30] = CreateDynamicObject(19464, 1224.4554, -900.1630, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[30], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[31] = CreateDynamicObject(19464, 1223.8160, -896.4987, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[31], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[32] = CreateDynamicObject(19464, 1223.1427, -892.6375, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[32], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[33] = CreateDynamicObject(19464, 1222.4790, -888.8352, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[33], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[34] = CreateDynamicObject(19464, 1221.8774, -885.3875, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[34], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[35] = CreateDynamicObject(19464, 1221.2486, -881.7822, 39.3544, 0.1999, 0.0000, 99.8999); //wall104
	SetDynamicObjectMaterial(g_Object[35], 0, 3119, "cs_ry_props", "lightgrey", 0xFFFFFFFF);
	g_Object[36] = CreateDynamicObject(19450, 1179.6645, -891.7025, 40.8833, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[36], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[37] = CreateDynamicObject(18981, 1192.4594, -902.4429, 41.9761, 0.0000, 90.6996, 8.1997); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[37], 0, 13081, "ce_ground13", "dustyconcrete", 0xFFFFFFFF);
	g_Object[38] = CreateDynamicObject(18981, 1196.9726, -901.7926, 41.9183, 0.0000, 90.6996, 8.1997); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[38], 0, 13081, "ce_ground13", "dustyconcrete", 0xFFFFFFFF);
	g_Object[39] = CreateDynamicObject(673, 1218.2768, -920.0410, 39.5592, 0.0000, 0.0000, 0.0000); //sm_bevhiltree
	g_Object[40] = CreateDynamicObject(19450, 1182.8878, -891.2310, 40.8390, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[40], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[41] = CreateDynamicObject(19450, 1176.8243, -905.1165, 40.9370, 0.0000, 0.0000, 8.3078); //wall090
	SetDynamicObjectMaterial(g_Object[41], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[42] = CreateDynamicObject(19952, 1218.5777, -921.5009, 40.6529, 0.0000, 0.0000, 98.3078); //SAMPRoadSign5
	g_Object[43] = CreateDynamicObject(19952, 1218.5482, -921.5053, 40.6529, 0.0000, 0.0000, 278.3078); //SAMPRoadSign5
	g_Object[44] = CreateDynamicObject(19952, 1218.7043, -922.5739, 40.6529, 0.0000, 0.0000, 278.3078); //SAMPRoadSign5
	g_Object[45] = CreateDynamicObject(19952, 1218.7330, -922.5593, 40.6529, 0.0000, 0.0000, 98.3078); //SAMPRoadSign5
	g_Object[46] = CreateDynamicObject(19464, 1190.7008, -916.0844, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[46], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[47] = CreateDynamicObject(19464, 1190.6898, -916.1370, 40.1679, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[47], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[48] = CreateDynamicObject(19464, 1196.5672, -915.2788, 40.1058, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[48], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[49] = CreateDynamicObject(19464, 1202.4344, -914.4223, 40.0437, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[49], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[50] = CreateDynamicObject(19464, 1208.2524, -913.5827, 39.9808, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[50], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[51] = CreateDynamicObject(19464, 1187.4759, -913.6546, 44.5918, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[51], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[52] = CreateDynamicObject(19464, 1186.6191, -907.7866, 44.5918, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[52], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[53] = CreateDynamicObject(19464, 1210.6699, -910.2678, 44.5918, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[53], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[54] = CreateDynamicObject(19464, 1209.8131, -904.4003, 44.5918, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[54], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[55] = CreateDynamicObject(19464, 1208.9565, -898.5322, 44.5918, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[55], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[56] = CreateDynamicObject(19464, 1185.7635, -901.9287, 44.5918, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[56], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[57] = CreateDynamicObject(19464, 1188.1610, -898.6994, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[57], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[58] = CreateDynamicObject(19464, 1194.0284, -897.8430, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[58], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[59] = CreateDynamicObject(19464, 1199.8962, -896.9860, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[59], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[60] = CreateDynamicObject(19464, 1205.6048, -896.1519, 44.5918, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[60], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[61] = CreateDynamicObject(19464, 1205.7120, -896.1068, 39.9821, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[61], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[62] = CreateDynamicObject(19464, 1199.8442, -896.9636, 40.0442, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[62], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[63] = CreateDynamicObject(19464, 1193.9664, -897.8217, 40.1063, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[63], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[64] = CreateDynamicObject(19464, 1188.1269, -898.6644, 40.1702, 0.5999, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[64], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[65] = CreateDynamicObject(19464, 1185.7583, -901.9619, 40.2000, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[65], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[66] = CreateDynamicObject(19464, 1186.6147, -907.8297, 40.2000, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[66], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[67] = CreateDynamicObject(19464, 1187.4719, -913.6975, 40.2000, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[67], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[68] = CreateDynamicObject(19464, 1210.6922, -910.2863, 39.9500, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[68], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[69] = CreateDynamicObject(19464, 1209.8343, -904.4086, 39.9500, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[69], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[70] = CreateDynamicObject(19464, 1208.9759, -898.5311, 39.9500, 0.0000, 0.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[70], 0, 10765, "airportgnd_sfse", "white", 0xFF4D322F);
	g_Object[71] = CreateDynamicObject(19325, 1197.6297, -915.2520, 43.1777, 0.0000, 0.0000, 98.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[71], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[72] = CreateDynamicObject(19325, 1191.0686, -916.2100, 43.1777, 0.0000, 0.0000, 98.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[72], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[73] = CreateDynamicObject(19464, 1198.0023, -915.0081, 45.3418, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[73], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[74] = CreateDynamicObject(19464, 1192.1335, -915.8649, 45.3418, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[74], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[75] = CreateDynamicObject(19464, 1188.6125, -916.3892, 45.3409, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[75], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[76] = CreateDynamicObject(19464, 1187.8758, -911.3427, 45.3409, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[76], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[77] = CreateDynamicObject(19464, 1187.1385, -906.2965, 45.3409, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[77], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[78] = CreateDynamicObject(19464, 1186.4348, -901.4071, 45.3400, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[78], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[79] = CreateDynamicObject(19325, 1185.6821, -902.3026, 43.1777, 0.0000, 0.0000, 8.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[79], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[80] = CreateDynamicObject(18766, 1187.9077, -914.1633, 43.7901, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[80], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[81] = CreateDynamicObject(19325, 1186.6335, -908.8237, 43.1777, 0.0000, 0.0000, 8.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[81], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[82] = CreateDynamicObject(19430, 1188.0869, -913.3942, 43.5690, 0.0000, 0.0000, 98.3078); //wall070
	SetDynamicObjectMaterial(g_Object[82], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[83] = CreateDynamicObject(1536, 1187.6041, -915.0797, 42.5269, 0.0000, 0.0000, 98.3078); //Gen_doorEXT15
	SetDynamicObjectMaterial(g_Object[83], 0, 6095, "shops01_law", "GB_shopdoor01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[83], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	g_Object[84] = CreateDynamicObject(19430, 1188.3275, -915.0363, 43.5690, 0.0000, 0.0000, 98.3078); //wall070
	SetDynamicObjectMaterial(g_Object[84], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[85] = CreateDynamicObject(19430, 1189.1446, -914.0686, 45.1189, 0.0000, 90.0000, 8.3000); //wall070
	SetDynamicObjectMaterial(g_Object[85], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[86] = CreateDynamicObject(18766, 1191.0616, -915.6939, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[86], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[87] = CreateDynamicObject(18766, 1196.0299, -914.9683, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[87], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[88] = CreateDynamicObject(18766, 1199.3376, -914.4953, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[88], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[89] = CreateDynamicObject(18766, 1206.5216, -913.4464, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[89], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[90] = CreateDynamicObject(1536, 1205.2441, -914.1414, 42.2569, 0.0000, 0.0000, 8.3078); //Gen_doorEXT15
	SetDynamicObjectMaterial(g_Object[90], 0, 6095, "shops01_law", "GB_shopdoor01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[90], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	g_Object[91] = CreateDynamicObject(1536, 1208.1767, -913.6727, 42.2569, 0.0000, 0.0000, 188.3078); //Gen_doorEXT15
	SetDynamicObjectMaterial(g_Object[91], 0, 6095, "shops01_law", "GB_shopdoor01", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[91], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	g_Object[92] = CreateDynamicObject(19464, 1206.5611, -913.7583, 45.3418, 0.0000, 90.0000, 8.3078); //wall104
	SetDynamicObjectMaterial(g_Object[92], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[93] = CreateDynamicObject(19430, 1206.2535, -913.9240, 43.5690, 0.0000, 0.0000, 98.3078); //wall070
	SetDynamicObjectMaterial(g_Object[93], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[94] = CreateDynamicObject(18766, 1187.2004, -909.2340, 42.1501, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[94], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[95] = CreateDynamicObject(19430, 1207.5600, -913.7332, 43.5690, 0.0000, 0.0000, 98.3078); //wall070
	SetDynamicObjectMaterial(g_Object[95], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[96] = CreateDynamicObject(19430, 1205.8386, -913.9846, 43.5690, 0.0000, 0.0000, 98.3078); //wall070
	SetDynamicObjectMaterial(g_Object[96], 0, 10765, "airportgnd_sfse", "white", 0xFF58595A);
	g_Object[97] = CreateDynamicObject(18762, 1185.7524, -899.4406, 42.9589, 0.0000, 0.0000, 8.3078); //Concrete1mx1mx5m
	SetDynamicObjectMaterial(g_Object[97], 0, 17324, "cwsbarn", "des_bullboards", 0xFF473532);
	g_Object[98] = CreateDynamicObject(18766, 1186.4786, -904.2860, 42.1501, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[98], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[99] = CreateDynamicObject(18766, 1186.0616, -901.4368, 42.1501, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[99], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[100] = CreateDynamicObject(18766, 1187.7259, -899.1325, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[100], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[101] = CreateDynamicObject(18766, 1192.6634, -898.4113, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[101], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[102] = CreateDynamicObject(18766, 1197.5821, -897.6931, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[102], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[103] = CreateDynamicObject(18766, 1202.5295, -896.9708, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[103], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[104] = CreateDynamicObject(18766, 1206.2596, -896.4262, 42.1501, 0.0000, 90.0000, 8.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[104], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[105] = CreateDynamicObject(19325, 1189.4925, -898.3604, 43.1777, 0.0000, 0.0000, 98.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[105], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[106] = CreateDynamicObject(19325, 1197.0627, -897.2553, 43.1777, 0.0000, 0.0000, 98.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[106], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[107] = CreateDynamicObject(19325, 1204.5240, -896.1663, 43.1777, 0.0000, 0.0000, 98.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[107], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[108] = CreateDynamicObject(19464, 1186.1025, -899.1414, 45.3390, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[108], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[109] = CreateDynamicObject(19464, 1191.9707, -898.2844, 45.3390, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[109], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[110] = CreateDynamicObject(19464, 1197.8382, -897.4276, 45.3390, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[110], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[111] = CreateDynamicObject(19464, 1203.7070, -896.5714, 45.3390, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[111], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[112] = CreateDynamicObject(19464, 1207.2999, -896.0567, 45.3400, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[112], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[113] = CreateDynamicObject(19464, 1208.0322, -901.0736, 45.3400, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[113], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[114] = CreateDynamicObject(19464, 1208.7674, -906.1102, 45.3400, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[114], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[115] = CreateDynamicObject(19464, 1209.4631, -910.8695, 45.3390, 0.0000, 90.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[115], 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	g_Object[116] = CreateDynamicObject(19325, 1209.2922, -899.8256, 43.1777, 0.0000, 0.0000, 8.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[116], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[117] = CreateDynamicObject(19325, 1210.6466, -909.0968, 43.1777, 0.0000, 0.0000, 8.3078); //lsmall_window01
	SetDynamicObjectMaterial(g_Object[117], 0, 10763, "airport1_sfse", "airportwind03", 0xFFFFFFFF);
	g_Object[118] = CreateDynamicObject(18762, 1210.7071, -912.8858, 44.6688, 0.0000, 0.0000, 8.3078); //Concrete1mx1mx5m
	SetDynamicObjectMaterial(g_Object[118], 0, 17324, "cwsbarn", "des_bullboards", 0xFF473532);
	g_Object[119] = CreateDynamicObject(2642, 1203.0660, -914.4016, 43.8967, 0.0000, 0.0000, 8.3078); //CJ_BURGER_POSTER2
	g_Object[120] = CreateDynamicObject(19175, 1187.6634, -915.9276, 47.5988, 0.0000, 0.0000, 278.3078); //SAMPPicture4
	SetDynamicObjectMaterialText(g_Object[120], 0, "Shot", 90, "Arial", 70, 1, 0xFFFFFFFF, 0x0, 0);
	SetDynamicObjectMaterial(g_Object[120], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	g_Object[121] = CreateDynamicObject(19175, 1187.3266, -913.6220, 47.5988, 0.0000, 0.0000, 278.3078); //SAMPPicture4
	SetDynamicObjectMaterialText(g_Object[121], 0, "Burger", 90, "Arial", 70, 1, 0xFFFFFFFF, 0x0, 0);
	SetDynamicObjectMaterial(g_Object[121], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	g_Object[122] = CreateDynamicObject(19464, 1191.5716, -915.8153, 45.0419, 0.0000, 0.0000, 98.3078); //wall104
	SetDynamicObjectMaterial(g_Object[122], 0, 10765, "airportgnd_sfse", "white", 0xFFD78E10);
	g_Object[123] = CreateDynamicObject(19087, 1207.6112, -913.6560, 46.9598, -49.4999, 0.0000, 8.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[123], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[124] = CreateDynamicObject(19087, 1205.6031, -913.9494, 46.9598, -49.4999, 0.0000, 8.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[124], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[125] = CreateDynamicObject(19087, 1199.1811, -914.8870, 46.9598, -49.4999, 0.0000, 8.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[125], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[126] = CreateDynamicObject(19087, 1196.0743, -915.3410, 46.9598, -49.4999, 0.0000, 8.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[126], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[127] = CreateDynamicObject(19087, 1192.8686, -915.8090, 46.9598, -49.4999, 0.0000, 8.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[127], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[128] = CreateDynamicObject(19087, 1189.9006, -916.2423, 46.9598, -49.4999, 0.0000, 8.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[128], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[129] = CreateDynamicObject(19087, 1187.8653, -915.7813, 47.0391, -49.4999, 0.0000, 278.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[129], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[130] = CreateDynamicObject(19087, 1187.4139, -912.6942, 47.0391, -49.4999, 0.0000, 278.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[130], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[131] = CreateDynamicObject(19087, 1187.0510, -910.2105, 47.0391, -49.4999, 0.0000, 278.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[131], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[132] = CreateDynamicObject(19087, 1186.6538, -907.4896, 47.0391, -49.4999, 0.0000, 278.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[132], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[133] = CreateDynamicObject(19087, 1186.1650, -904.1453, 47.0391, -49.4999, 0.0000, 278.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[133], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[134] = CreateDynamicObject(19087, 1185.7473, -901.2855, 47.0391, -49.4999, 0.0000, 278.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[134], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[135] = CreateDynamicObject(19087, 1187.6252, -898.6458, 47.0391, -49.4999, 0.0000, 188.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[135], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[136] = CreateDynamicObject(19087, 1190.6927, -898.1981, 47.0391, -49.4999, 0.0000, 188.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[136], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[137] = CreateDynamicObject(19087, 1195.6003, -897.4813, 47.0391, -49.4999, 0.0000, 188.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[137], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[138] = CreateDynamicObject(19087, 1198.3907, -897.0739, 47.0391, -49.4999, 0.0000, 188.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[138], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[139] = CreateDynamicObject(19087, 1203.1500, -896.3789, 47.0391, -49.4999, 0.0000, 188.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[139], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[140] = CreateDynamicObject(19087, 1205.9698, -895.9669, 47.0391, -49.4999, 0.0000, 188.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[140], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[141] = CreateDynamicObject(19087, 1208.3548, -897.9835, 47.0283, -49.4999, 0.0000, 98.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[141], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[142] = CreateDynamicObject(19087, 1208.8347, -901.2686, 47.0283, -49.4999, 0.0000, 98.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[142], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[143] = CreateDynamicObject(19087, 1209.7060, -907.2354, 47.0283, -49.4999, 0.0000, 98.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[143], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[144] = CreateDynamicObject(19087, 1210.2021, -910.6292, 47.0283, -49.4999, 0.0000, 98.3078); //Rope1
	SetDynamicObjectMaterial(g_Object[144], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
	g_Object[145] = CreateDynamicObject(18766, 1208.6699, -899.0961, 42.1501, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[145], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[146] = CreateDynamicObject(18766, 1209.3922, -904.0438, 42.1501, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[146], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[147] = CreateDynamicObject(18766, 1210.1108, -908.9716, 42.1501, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[147], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[148] = CreateDynamicObject(18766, 1210.2845, -910.1580, 42.1501, 0.0000, 90.0000, 98.3078); //Concrete10mx1mx5m
	SetDynamicObjectMaterial(g_Object[148], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[149] = CreateDynamicObject(18981, 1198.9111, -905.9229, 47.3963, 0.0000, 90.6996, 8.1997); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[149], 0, 17324, "cwsbarn", "des_bullboards", 0xFF4D322F);
	g_Object[150] = CreateDynamicObject(19791, 1193.3282, -894.6994, 32.4681, 0.0000, 0.6998, 8.3078); //Cube10mx10m
	SetDynamicObjectMaterial(g_Object[150], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	g_Object[151] = CreateDynamicObject(19791, 1203.1335, -893.2677, 32.3470, 0.0000, 0.6998, 8.3078); //Cube10mx10m
	SetDynamicObjectMaterial(g_Object[151], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	g_Object[152] = CreateDynamicObject(19791, 1183.4343, -896.1439, 32.5903, 0.0000, 0.6998, 8.3078); //Cube10mx10m
	SetDynamicObjectMaterial(g_Object[152], 0, 10765, "airportgnd_sfse", "desgreengrass", 0xFFFFFFFF);
	g_Object[153] = CreateDynamicObject(19175, 1187.4466, -914.4437, 47.2388, 0.6000, -5.8000, 278.3078); //SAMPPicture4
	SetDynamicObjectMaterialText(g_Object[153], 0, "Mmmm lecker...", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 1);
	SetDynamicObjectMaterial(g_Object[153], 1, 0, "INVALID", "INVALID", 0xFFFFFFFF);
	g_Object[154] = CreateDynamicObject(1825, 1183.9713, -905.7879, 42.5956, 0.0000, 0.0000, 8.3078); //kb_table_chairs1
	SetDynamicObjectMaterial(g_Object[154], 0, 3080, "adjumpx", "gen_chrome", 0xFFFFFFFF);
	g_Object[155] = CreateDynamicObject(1825, 1183.3990, -901.8696, 42.5956, 0.0000, 0.0000, 8.3078); //kb_table_chairs1
	SetDynamicObjectMaterial(g_Object[155], 0, 3080, "adjumpx", "gen_chrome", 0xFFFFFFFF);
	g_Object[156] = CreateDynamicObject(1825, 1178.9184, -902.6043, 42.5956, 0.0000, 0.0000, 8.3078); //kb_table_chairs1
	SetDynamicObjectMaterial(g_Object[156], 0, 3080, "adjumpx", "gen_chrome", 0xFFFFFFFF);
	g_Object[157] = CreateDynamicObject(970, 1177.1477, -907.5263, 43.1310, 0.0000, 0.0000, 98.3078); //fencesmallb
	SetDynamicObjectMaterial(g_Object[157], 0, 10806, "airfence_sfse", "ws_leccyfncetop", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[157], 1, 10765, "airportgnd_sfse", "white", 0xFF473532);
	g_Object[158] = CreateDynamicObject(970, 1176.5133, -903.1823, 43.1310, 0.0000, 0.0000, 98.3078); //fencesmallb
	SetDynamicObjectMaterial(g_Object[158], 0, 10806, "airfence_sfse", "ws_leccyfncetop", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[158], 1, 10765, "airportgnd_sfse", "white", 0xFF473532);
	g_Object[159] = CreateDynamicObject(970, 1186.5607, -908.4662, 43.1310, 0.0000, 0.0000, 8.3078); //fencesmallb
	SetDynamicObjectMaterial(g_Object[159], 0, 10806, "airfence_sfse", "ws_leccyfncetop", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[159], 1, 10765, "airportgnd_sfse", "white", 0xFF473532);
	g_Object[160] = CreateDynamicObject(19450, 1180.8918, -900.0822, 40.9229, 0.5999, 0.0000, 98.3078); //wall090
	SetDynamicObjectMaterial(g_Object[160], 0, 7488, "vegasdwntwn1", "vgnstonewall1_256", 0xFFFFFFFF);
	g_Object[161] = CreateDynamicObject(970, 1178.2207, -900.4871, 43.1310, 0.0000, 0.0000, 8.3078); //fencesmallb
	SetDynamicObjectMaterial(g_Object[161], 0, 10806, "airfence_sfse", "ws_leccyfncetop", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[161], 1, 10765, "airportgnd_sfse", "white", 0xFF473532);
	g_Object[162] = CreateDynamicObject(970, 1182.8116, -899.8167, 43.1310, 0.0000, 0.0000, 8.3078); //fencesmallb
	SetDynamicObjectMaterial(g_Object[162], 0, 10806, "airfence_sfse", "ws_leccyfncetop", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[162], 1, 10765, "airportgnd_sfse", "white", 0xFF473532);
	g_Object[163] = CreateDynamicObject(738, 1203.2076, -891.7266, 42.4149, 0.0000, 1.3997, 8.3078); //aw_streettree2
	g_Object[164] = CreateDynamicObject(738, 1195.0931, -892.9113, 42.4953, 0.0000, 1.3997, 8.3078); //aw_streettree2
	g_Object[165] = CreateDynamicObject(870, 1198.7696, -892.3184, 42.6599, 0.0000, 0.0000, 8.3078); //veg_Pflowers2wee
	g_Object[166] = CreateDynamicObject(738, 1187.1877, -894.0659, 42.6002, 0.0000, 1.3997, 8.3078); //aw_streettree2
	g_Object[167] = CreateDynamicObject(738, 1180.3115, -895.0701, 42.6902, 0.0000, 1.3997, 8.3078); //aw_streettree2
	g_Object[168] = CreateDynamicObject(870, 1190.6955, -893.4973, 42.7000, 0.0000, 0.0000, 8.3078); //veg_Pflowers2wee
	g_Object[169] = CreateDynamicObject(870, 1183.2148, -894.5897, 42.7000, 0.0000, 0.0000, 8.3078); //veg_Pflowers2wee
	g_Object[170] = CreateDynamicObject(19967, 1205.3830, -921.3449, 41.3399, 0.0000, 0.0000, 98.3078); //SAMPRoadSign20
	g_Object[171] = CreateDynamicObject(19966, 1210.7187, -924.9154, 41.6049, 0.0000, 0.0000, 188.3078); //SAMPRoadSign19
	g_Object[172] = CreateDynamicObject(8991, 1230.9344, -912.1917, 42.5853, 0.0000, 0.0000, 98.3078); //bush12_lvs
	g_Object[173] = CreateDynamicObject(8991, 1228.5992, -896.2014, 42.5853, 0.0000, 0.0000, 98.3078); //bush12_lvs
	g_Object[174] = CreateDynamicObject(8991, 1225.7961, -878.9458, 42.5853, 0.0000, 0.0000, 98.3078); //bush12_lvs
	g_Object[175] = CreateDynamicObject(8991, 1168.2473, -887.3493, 42.8754, 0.0000, 0.0000, 94.9076); //bush12_lvs
	g_Object[176] = CreateDynamicObject(8991, 1169.8199, -905.6715, 42.8754, 0.0000, 0.0000, 94.9076); //bush12_lvs
	g_Object[177] = CreateDynamicObject(8991, 1171.2137, -921.9019, 42.8754, 0.0000, 0.0000, 94.9076); //bush12_lvs
	g_Object[178] = CreateDynamicObject(8991, 1175.8375, -877.5784, 42.8754, 0.0000, 0.0000, 8.3078); //bush12_lvs
	g_Object[179] = CreateDynamicObject(8991, 1193.8094, -874.4896, 42.8754, 0.0000, 0.0000, 8.3078); //bush12_lvs
	g_Object[180] = CreateDynamicObject(8991, 1210.8363, -871.1544, 42.8754, 0.0000, 0.0000, 8.3078); //bush12_lvs
	g_Object[181] = CreateDynamicObject(673, 1229.4128, -904.3878, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[182] = CreateDynamicObject(673, 1226.9812, -887.7349, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[183] = CreateDynamicObject(673, 1223.2103, -869.1749, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[184] = CreateDynamicObject(673, 1202.2843, -872.3114, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[185] = CreateDynamicObject(673, 1184.6944, -875.4555, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[186] = CreateDynamicObject(673, 1167.1988, -878.6973, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[187] = CreateDynamicObject(673, 1168.6246, -896.6187, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[188] = CreateDynamicObject(673, 1169.9809, -913.8637, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[189] = CreateDynamicObject(673, 1171.4477, -930.1425, 39.5592, 0.0000, 0.0000, 8.3078); //sm_bevhiltree
	g_Object[190] = CreateDynamicObject(19953, 1171.7430, -879.8582, 41.9141, 0.0000, 0.0000, 50.9999); //SAMPRoadSign6
	g_Object[191] = CreateDynamicObject(19953, 1170.5156, -882.4000, 41.9141, 0.0000, 0.0000, 81.5998); //SAMPRoadSign6
	g_Object[192] = CreateDynamicObject(19953, 1172.4007, -927.1052, 41.9141, 0.0000, 0.0000, 131.7998); //SAMPRoadSign6
	g_Object[193] = CreateDynamicObject(19953, 1174.6064, -928.8220, 41.9141, 0.0000, 0.0000, 163.8000); //SAMPRoadSign6
	g_Object[194] = CreateDynamicObject(1226, 1229.0196, -910.9937, 45.0852, 0.0000, 0.0000, 8.3078); //lamppost3
	g_Object[195] = CreateDynamicObject(1226, 1227.0328, -897.3883, 45.0852, 0.0000, 0.0000, 8.3078); //lamppost3
	g_Object[196] = CreateDynamicObject(1226, 1224.3940, -879.3201, 45.0852, 0.0000, 0.0000, 8.3078); //lamppost3
	g_Object[197] = CreateDynamicObject(1226, 1193.5992, -875.6414, 45.0852, 0.0000, 0.0000, 98.3078); //lamppost3
	g_Object[198] = CreateDynamicObject(1226, 1176.9952, -878.0659, 45.0852, 0.0000, 0.0000, 98.3078); //lamppost3
	g_Object[199] = CreateDynamicObject(1226, 1169.6534, -887.4450, 45.0852, 0.0000, 0.0000, 188.3078); //lamppost3
	g_Object[200] = CreateDynamicObject(1226, 1170.9636, -903.9588, 45.0852, 0.0000, 0.0000, 188.3078); //lamppost3
	g_Object[201] = CreateDynamicObject(1226, 1172.0511, -920.4744, 45.0852, 0.0000, 0.0000, 188.3078); //lamppost3
	g_Object[202] = CreateDynamicObject(1226, 1179.5482, -928.2127, 45.0852, 0.0000, 0.0000, 278.3078); //lamppost3
	g_Object[203] = CreateDynamicObject(1226, 1191.6429, -926.0526, 45.0852, 0.0000, 0.0000, 278.3078); //lamppost3
	g_Object[204] = CreateDynamicObject(1226, 1205.2320, -923.7448, 45.0852, 0.0000, 0.0000, 278.3078); //lamppost3
	g_Object[205] = CreateDynamicObject(2230, 1209.4724, -904.4882, 43.0083, 0.0000, 0.0000, 98.3078); //SWANK_SPEAKER_2
	g_Object[206] = CreateDynamicObject(2230, 1209.4261, -904.1718, 43.0083, 0.0000, 0.0000, 98.3078); //SWANK_SPEAKER_2
	g_Object[207] = CreateDynamicObject(2230, 1209.3797, -903.8549, 43.0083, 0.0000, 0.0000, 98.3078); //SWANK_SPEAKER_2
	g_Object[208] = CreateDynamicObject(970, 1179.5355, -909.4918, 43.1310, 0.0000, 0.0000, 8.3078); //fencesmallb
	SetDynamicObjectMaterial(g_Object[208], 0, 10806, "airfence_sfse", "ws_leccyfncetop", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_Object[208], 1, 10765, "airportgnd_sfse", "white", 0xFF473532);
	//Ab hier Zusatz (Drive-In) bei GangstaSunny
	CreateDynamicObject(2233, 1209.78589, -904.40875, 41.91924,   0.00000, 0.00000, 99.35997);
	CreateDynamicObject(983, 1215.50183, -908.53271, 42.57207,   0.00000, 0.00000, 7.61999);
	CreateDynamicObject(19425, 1210.96265, -912.29657, 41.91430,   0.00000, 0.00000, 9.72000);
	CreateDynamicObject(19425, 1214.21667, -911.73511, 41.91430,   0.00000, 0.00000, 9.72000);
	CreateDynamicObject(983, 1214.64905, -902.19012, 42.57210,   0.00000, 0.00000, 7.62000);
	CreateDynamicObject(19425, 1212.61902, -899.58893, 41.91430,   0.00000, 0.00000, 9.72000);
	CreateDynamicObject(19425, 1209.36316, -900.14502, 41.91430,   0.00000, 0.00000, 9.72000);
	new driveinbsnschild = CreateDynamicObject(19175, 1198.98621, -915.05798, 43.88370,   0.60000, -5.80000, 368.27979);
	SetDynamicObjectMaterialText(driveinbsnschild, 0, "rosalife.de", 90, "Arial", 35, 1, 0xFFFFFFFF, 0x0, 1);

 	//Grove Street Base - Map by GangstaSunny
 	CreateDynamicObject(10244, 2532.48413, -1686.18652, 15.08444,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(669, 2534.86890, -1695.36499, 12.70695,   0.00000, 0.00000, -58.50000);
	CreateDynamicObject(3263, 2463.58057, -1664.03625, 12.20777,   0.00000, 0.00000, 270.00000);

	//Zeitprison - .RaVe.
	CreateDynamicObject(1728, 305.71738, 306.14539, 998.13208,   0.00000, 0.00000, -89.00000);
	CreateDynamicObject(1729, 302.53015, 311.60272, 998.15277,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1729, 304.11597, 311.58441, 998.15277,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1497, 299.48175, 312.07861, 998.14282,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(852, 300.22800, 309.64844, 998.02356,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(854, 305.65778, 302.68768, 998.31415,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(854, 302.64700, 306.28662, 998.31415,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1462, 298.56006, 310.88046, 998.14758,   0.00000, 0.00000, 25.00000);
	CreateDynamicObject(1347, 298.97507, 300.83527, 998.64331,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1347, 305.24210, 311.47308, 998.64331,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2673, 300.05371, 302.19815, 998.26514,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2673, 302.21970, 303.16486, 998.26514,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2674, 300.45407, 304.83569, 998.17749,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2673, 303.68213, 308.12024, 998.26514,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2674, 301.95062, 308.61865, 998.17749,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 304.30771, 300.79520, 998.62231,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 299.58783, 306.75745, 998.62231,   0.00000, 0.00000, 55.00000);
	CreateDynamicObject(854, 304.96500, 308.92987, 998.31415,   0.00000, 0.00000, -0.06000);
	CreateDynamicObject(852, 299.75867, 303.29016, 998.02612,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 301.34363, 301.37460, 998.62231,   0.00000, 0.00000, 22.00000);
	CreateDynamicObject(816, 304.42303, 304.91922, 997.98810,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(816, 301.24210, 307.09363, 997.98810,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(905, 304.50400, 306.64301, 997.83447,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(905, 305.83624, 306.63425, 997.83447,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18659, 304.29330, 300.40234, 1000.04181,   0.00000, 0.00000, -99.00000);
	CreateDynamicObject(18659, 301.34143, 300.17542, 1000.64435,   0.00000, 0.00000, -99.00000);
	CreateDynamicObject(18666, 302.33438, 311.97354, 1000.50452,   0.00000, 0.00000, -269.00000);
	CreateDynamicObject(18666, 304.92230, 311.97821, 1000.50452,   -20.00000, 0.00000, -269.00000);
	CreateDynamicObject(2672, 302.47943, 305.00476, 998.42877,   0.00000, 0.00000, 0.00000);

	//Laufprison - .RaVe.
	CreateDynamicObject(987, 1339.84314, 2152.16309, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1327.84265, 2152.08130, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1315.83838, 2152.06445, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1351.79626, 2152.16870, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1363.50378, 2140.03174, 9.92870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, 1363.49487, 2128.05908, 9.92870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, 1363.50134, 2116.12012, 9.92870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, 1351.55945, 2116.18066, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1339.62024, 2116.05786, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1327.64771, 2116.04492, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1315.63977, 2116.01685, 9.92871,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 1315.58093, 2115.96802, 9.92870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, 1315.56604, 2127.91772, 9.92870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, 1315.54565, 2139.89600, 9.92870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(922, 1356.43103, 2126.92139, 10.93773,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(922, 1321.39465, 2144.18750, 10.94291,   0.00000, 0.00000, 62.00000);
	CreateDynamicObject(922, 1323.91150, 2125.18994, 10.96728,   0.00000, 0.00000, 113.00000);
	CreateDynamicObject(922, 1339.71741, 2135.33765, 10.96728,   0.00000, 0.00000, 113.00000);
	CreateDynamicObject(923, 1350.97107, 2140.35718, 10.91675,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(923, 1321.49768, 2133.24292, 10.91675,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(923, 1352.13489, 2120.91260, 10.83335,   0.00000, 0.00000, 127.00000);
	CreateDynamicObject(944, 1336.91296, 2143.77930, 10.86955,   0.00000, 0.00000, 62.00000);
	CreateDynamicObject(944, 1336.69592, 2121.89136, 10.86950,   0.00000, 0.00000, 127.00000);
	CreateDynamicObject(944, 1356.43848, 2145.41455, 10.86955,   0.00000, 0.00000, 62.00000);
	CreateDynamicObject(3512, 1324.73914, 2141.34937, 9.98556,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3512, 1342.55957, 2125.49902, 9.98556,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3512, 1322.80859, 2119.12598, 9.98556,   0.00000, 0.00000, 0.18000);
	CreateDynamicObject(3512, 1345.50659, 2143.29468, 9.98556,   0.00000, 0.00000, 0.18000);
	CreateDynamicObject(3594, 1326.93091, 2132.46191, 10.64353,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3594, 1353.56787, 2132.83984, 10.64350,   0.00000, 0.00000, 186.00000);
	CreateDynamicObject(3594, 1330.00562, 2146.74609, 10.57647,   0.00000, 0.00000, 207.00000);
	CreateDynamicObject(2932, 1334.09119, 2131.52197, 11.59790,   0.00000, 0.00000, -302.00000);
	CreateDynamicObject(2932, 1358.09094, 2140.91699, 11.59790,   0.00000, 0.00000, -33.00000);
	CreateDynamicObject(3512, 1357.38550, 2123.46924, 9.98556,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(944, 1345.82837, 2132.21191, 10.86950,   0.00000, 0.00000, 215.00000);
	CreateDynamicObject(3594, 1344.06824, 2120.56958, 10.66349,   0.00000, 0.00000, 127.00000);

 	//Fraktionskiste
 	CreateDynamicObject(964, 2493.24243, -1707.50134, 1014.58276, 0.00000, 0.00000, 90.00000);

 	//Bombem Garage - Los Santos
    CreateDynamicObject(969, 1843.24280, -1859.12170, 12.37560,   0.00000, 0.00000, 90.00000);

    //Bomben System
    CreateDynamicObject(980, 270.42242, 1884.12329, 16.47049,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(980, 264.87231, 1884.38757, 16.47050,   90.00000, 0.00000, 90.00000);
	//CreateDynamicObject(971, 283.05493, 1868.84778, 7.75518,   0.00000, 0.00000, 269.82675);//Zu
	//CreateDynamicObject(971, 283.05493, 1868.84778, 3.58456,   0.00000, 0.00000, 269.82675);//Auf

	//Interglobal Television Interior Base - Map by Zehoax
	static tmpobjjid;
	tmpobjjid = CreateDynamicObject(19354, 1412.104858, -13.510915, 1007.480102, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1401.605346, -11.280911, 1007.480102, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1405.966552, -5.410933, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1402.776611, -5.410933, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1401.605346, -14.500906, 1007.480102, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1406.495971, -14.900959, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1409.686767, -14.900959, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1409.175659, -5.410933, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1412.385131, -5.410933, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1412.104858, -7.100928, 1007.480102, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1412.104858, -10.300916, 1007.480102, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1412.876831, -14.900959, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(2446, 1407.050415, -14.318703, 1005.689636, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	SetDynamicObjectMaterial(tmpobjjid, 1, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
	tmpobjjid = CreateDynamicObject(19427, 1405.021972, -8.329236, 1007.479980, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19427, 1405.021972, -14.029243, 1007.479980, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1404.985961, -15.024025, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19354, 1401.619018, -4.030930, 1007.480102, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1399.466918, -15.204039, 1012.419128, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19379, 1396.448852, -10.132431, 1009.273803, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	tmpobjjid = CreateDynamicObject(14409, 1408.559448, -5.401331, 1006.029541, 0.000000, 0.000000, 90.900001, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19379, 1406.938842, -21.302433, 1009.273498, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1410.057739, -7.510945, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1413.259033, -7.510944, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(11714, 1412.000610, -10.984786, 1006.979736, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 10101, "2notherbuildsfe", "flatdoor01_law", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1405.106079, -7.344026, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19354, 1406.857299, -7.510944, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1412.148681, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19354, 1401.619018, -7.240930, 1007.480102, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -8.924039, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -9.064043, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -9.234044, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19354, 1403.285888, -14.900959, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -9.524047, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.216796, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(1649, 1405.338256, -17.221353, 1010.959533, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(1649, 1411.018310, -15.031343, 1010.959533, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1408.787719, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1408.787719, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19379, 1406.938842, -11.672415, 1009.273498, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	tmpobjjid = CreateDynamicObject(19450, 1396.621582, -19.731176, 1010.919433, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18901, "matclothes", "bowlerred", 0x00000000);
	tmpobjjid = CreateDynamicObject(19450, 1400.164306, -24.501129, 1010.919433, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18901, "matclothes", "bowlerred", 0x00000000);
	SetDynamicObjectMaterial(tmpobjjid, 1, 18901, "matclothes", "bowlerred", 0x00000000);
	tmpobjjid = CreateDynamicObject(2257, 1410.388793, -20.210811, 1011.139587, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 2254, "picture_frame_clip", "CJ_PAINTING12", 0x00000000);
	SetDynamicObjectMaterial(tmpobjjid, 1, 2254, "picture_frame_clip", "CJ_PAINTING12", 0x00000000);
	tmpobjjid = CreateDynamicObject(2257, 1398.851196, -6.928262, 1011.109497, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 2266, "picture_frame", "CJ_PAINTING34", 0x00000000);
	SetDynamicObjectMaterial(tmpobjjid, 1, 2254, "picture_frame_clip", "CJ_PAINTING24", 0x00000000);
	tmpobjjid = CreateDynamicObject(19866, 1404.178344, -6.974123, 1009.367675, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjjid = CreateDynamicObject(19866, 1407.929321, -6.964124, 1009.367675, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjjid = CreateDynamicObject(19866, 1401.598632, -4.574120, 1009.367675, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1398.735107, -11.604041, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.735107, -12.554055, 1012.540283, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.735107, -6.184048, 1009.230285, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.735107, -13.884061, 1009.230285, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.735107, -8.594035, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19379, 1396.448852, -10.132431, 1012.624389, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1401.816406, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1411.208862, -15.244038, 1009.489013, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1402.817504, -15.244038, 1009.489013, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1402.817504, -15.244038, 1012.488769, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1411.167724, -15.244038, 1012.579345, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.735107, -7.794053, 1012.540283, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1406.967163, -15.254038, 1012.579345, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19379, 1406.952392, -10.132431, 1012.624389, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjjid = CreateDynamicObject(19379, 1406.952392, -20.322425, 1012.624389, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjjid = CreateDynamicObject(19813, 1399.829345, -5.490589, 1009.669677, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjjid = CreateDynamicObject(1649, 1411.098388, -15.401349, 1010.959533, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(1649, 1402.928222, -14.971346, 1010.959533, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1405.216796, -19.174068, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.216796, -21.764068, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.216796, -24.454074, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19379, 1396.448974, -19.752418, 1009.273498, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	tmpobjjid = CreateDynamicObject(19379, 1396.469848, -20.322425, 1012.624389, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1400.455810, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19431, 1401.142089, -15.319526, 1010.929626, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18901, "matclothes", "bowlerred", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1398.067626, -15.244038, 1009.489013, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1399.155517, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19431, 1399.671508, -15.319526, 1010.929626, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18901, "matclothes", "bowlerred", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1398.056762, -15.244038, 1012.478820, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19431, 1398.101318, -15.329526, 1010.929626, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18901, "matclothes", "bowlerred", 0x00000000);
	tmpobjjid = CreateDynamicObject(19431, 1396.631103, -15.329526, 1010.929626, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18901, "matclothes", "bowlerred", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1397.954345, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1396.773925, -15.244038, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(1649, 1402.928222, -15.401349, 1010.959533, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(1649, 1405.338256, -24.081367, 1010.959533, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(1649, 1405.198120, -17.221353, 1010.959533, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(1649, 1405.138183, -24.081367, 1010.959533, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1405.266113, -17.464040, 1012.579345, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.266113, -22.224054, 1012.579345, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19786, 1399.272338, -15.448390, 1011.039123, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	SetDynamicObjectMaterial(tmpobjjid, 1, 4992, "airportdetail", "diderSachs01", 0x00000000);
	tmpobjjid = CreateDynamicObject(2257, 1398.851196, -13.378260, 1011.109497, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 1, 2254, "picture_frame_clip", "CJ_PAINTING26", 0x00000000);
	tmpobjjid = CreateDynamicObject(2206, 1399.646850, -19.560054, 1009.329406, 0.000000, 0.000000, -89.699966, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14385, "trailerkb", "tr_wall2", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1403.396728, -24.524044, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.674194, -24.524044, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1396.785278, -24.524044, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1400.013793, -24.524044, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.413452, -24.524044, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.056762, -24.524047, 1012.478820, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1402.787231, -24.524047, 1012.478820, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1402.787231, -24.524047, 1009.358581, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.056762, -24.524047, 1009.358764, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3034, 1396.717041, -20.462694, 1011.469543, 0.000000, 0.099999, 90.300003, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 3979, "civic01_lan", "sl_dwntwnshpfrnt1", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1399.466918, -15.204039, 1009.338867, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1395.196777, -15.204039, 1009.338867, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1396.296752, -15.084038, 1009.268798, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1391.566040, -15.084038, 1009.268798, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1396.296752, -5.424024, 1009.218750, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1396.296752, -15.084038, 1012.518920, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1391.536132, -15.084038, 1012.518920, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1396.296752, -5.424024, 1012.549072, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1391.536132, -5.424024, 1012.549072, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19354, 1406.857299, -7.140941, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19354, 1410.067260, -7.140941, 1007.480102, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	tmpobjjid = CreateDynamicObject(19476, 1405.361572, -18.532020, 1011.189270, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjjid = CreateDynamicObject(19476, 1405.371582, -18.442018, 1011.189270, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjjid, 0, "{000000}Leader", 40, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	tmpobjjid = CreateDynamicObject(19475, 1405.350463, -18.207857, 1011.179504, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19475, 1405.350463, -18.667865, 1011.179504, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19475, 1409.120483, -14.967856, 1011.179504, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19475, 1409.580444, -14.967856, 1011.179504, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19476, 1409.261840, -14.962019, 1011.189270, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjjid = CreateDynamicObject(19476, 1409.342529, -14.952022, 1011.189270, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjjid, 0, "{000000}Stellv.", 40, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	tmpobjjid = CreateDynamicObject(3440, 1408.757202, -20.534063, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19358, 1410.481201, -20.694463, 1010.919494, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	tmpobjjid = CreateDynamicObject(19358, 1412.152099, -22.394481, 1010.919494, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	tmpobjjid = CreateDynamicObject(19358, 1412.152099, -25.574478, 1010.919494, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	tmpobjjid = CreateDynamicObject(19358, 1410.481201, -24.494470, 1010.919494, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1408.627075, -24.534059, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19388, 1408.902099, -21.851949, 1010.909179, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	tmpobjjid = CreateDynamicObject(19358, 1408.901977, -25.044464, 1010.909484, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 11100, "bendytunnel_sfse", "Bow_sub_walltiles", 0x00000000);
	tmpobjjid = CreateDynamicObject(19866, 1410.829223, -23.664110, 1008.337158, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjjid = CreateDynamicObject(19866, 1410.829223, -22.914096, 1008.337158, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18646, "matcolours", "grey-50-percent", 0x00000000);
	tmpobjjid = CreateDynamicObject(2755, 1406.947265, -24.397523, 1010.919799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1398.764526, -5.344037, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1412.194580, -5.344037, 1011.369750, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1398.764526, -15.024042, 1011.709777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19477, 1401.698364, -11.134115, 1008.239624, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjjid = CreateDynamicObject(19477, 1401.698364, -11.134115, 1006.849792, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1411.027587, -14.594038, 1009.039794, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1406.296997, -14.594038, 1009.039550, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.567260, -14.594038, 1008.989624, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1402.557861, -14.494039, 1008.989685, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1407.487792, -7.474029, 1009.019531, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1412.248901, -7.474029, 1009.019531, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.106079, -9.304031, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.106079, -12.984030, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -12.684055, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -12.814053, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -12.974057, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -13.114059, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.136718, -14.384032, 1009.039611, 90.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1405.136718, -9.634002, 1009.039550, 90.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(3440, 1401.405395, -13.194060, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19425, 1405.233764, -16.746191, 1009.359436, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19425, 1405.233764, -17.556188, 1009.359436, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19425, 1405.233764, -23.326202, 1009.359436, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(2238, 1399.815673, -21.541904, 1010.669433, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18646, "matcolours", "redlaser", 0x00000000);
	tmpobjjid = CreateDynamicObject(2446, 1407.050415, -13.318703, 1005.689636, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	SetDynamicObjectMaterial(tmpobjjid, 1, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
	tmpobjjid = CreateDynamicObject(3440, 1401.465820, -5.364027, 1006.808898, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0xFFFFFFFF);
	tmpobjjid = CreateDynamicObject(19475, 1407.540283, -14.477864, 1006.309082, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19475, 1407.540283, -14.047863, 1006.309082, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19475, 1407.540283, -13.147863, 1006.309082, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19475, 1407.540283, -13.587859, 1006.309082, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 14651, "ab_trukstpd", "Bow_bar_flooring", 0x00000000);
	tmpobjjid = CreateDynamicObject(19476, 1407.542114, -13.882014, 1006.318847, 0.000000, 0.000000, 360.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjjid, 0, "{000000}IntGl. TV", 40, "Ariel", 30, 1, 0x00000000, 0x00000000, 1);
	tmpobjjid = CreateDynamicObject(2004, 1409.577514, -24.236373, 1011.179443, 0.000000, 0.000000, 0.900004, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 0, 3850, "carshowglass_sfsx", "ws_glass_balustrade_better", 0x00000000);
	tmpobjjid = CreateDynamicObject(2828, 1399.082519, -10.106534, 1010.409912, 0.000000, 0.000000, -104.100013, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjjid, 1, 7985, "vgsswarehse02c", "vgsSshopnew02", 0x00000000);
	SetDynamicObjectMaterial(tmpobjjid, 5, 18641, "flashlight1", "faglite", 0x00000000);
	tmpobjjid = CreateDynamicObject(19379, 1406.938842, -10.132432, 1005.663696, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1703, 1409.739624, -8.080793, 1005.749633, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1808, 1409.241088, -7.683038, 1005.699462, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1574, 1404.437500, -14.331802, 1005.689575, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1776, 1402.298217, -14.619252, 1006.779663, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1209, 1403.446533, -14.533069, 1005.659606, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1714, 1398.033935, -21.019926, 1009.359436, 0.000000, 0.000000, 101.899955, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1704, 1401.292968, -18.542604, 1009.359436, 0.000000, 0.000000, -52.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1704, 1401.897338, -21.588415, 1009.359436, 0.000000, 0.000000, 235.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1667, 1399.673339, -20.378820, 1010.349487, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19513, 1399.419311, -20.267742, 1010.259277, 0.000000, 0.000000, -31.399995, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2342, 1399.532470, -19.753456, 1010.379577, 0.000000, 0.000000, 134.600021, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19358, 1398.749877, -10.374756, 1010.929931, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19450, 1413.235961, -5.391119, 1010.919433, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19450, 1409.766235, -24.501129, 1010.919433, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19450, 1412.187133, -10.291128, 1010.919433, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19450, 1412.187133, -19.731176, 1010.919433, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19929, 1399.217529, -15.912146, 1009.329406, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2571, 1401.892333, -16.162450, 1009.329406, 0.000000, 0.000000, -62.100013, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1703, 1402.083007, -7.539781, 1009.349731, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1703, 1407.654541, -7.539781, 1009.349731, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1742, 1406.489257, -6.923799, 1009.359436, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1742, 1404.828247, -6.923799, 1009.359436, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2011, 1397.283813, -15.891540, 1009.329406, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19358, 1398.749877, -13.294754, 1010.929931, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19358, 1398.749877, -6.954757, 1010.929931, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(11724, 1399.152099, -10.117883, 1009.889343, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19893, 1399.555664, -20.671787, 1010.249938, 0.000000, 0.000000, -100.799964, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2614, 1398.879760, -10.111504, 1011.349548, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1665, 1399.467163, -21.150711, 1010.279479, 0.000000, 0.000000, -23.199998, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(16780, 1401.390747, -20.277057, 1012.849792, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19618, 1397.621826, -24.612392, 1010.459594, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19619, 1398.039184, -24.381046, 1010.459350, 0.000000, 0.000000, 540.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19617, 1397.594482, -24.442995, 1011.609436, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19617, 1399.204467, -24.442995, 1011.609436, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19617, 1400.844970, -24.442995, 1011.609436, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19318, 1402.805297, -24.421985, 1011.400207, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2205, 1409.194946, -17.329618, 1009.359436, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1663, 1410.519287, -16.279207, 1009.809570, 0.000000, 0.000000, -50.899993, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2190, 1408.860839, -16.731231, 1010.259582, 0.000000, 0.000000, 90.899978, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19808, 1409.463256, -16.270605, 1010.309326, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(11705, 1409.012939, -15.733162, 1010.269409, 0.000000, 0.000000, 55.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19835, 1409.467407, -15.778019, 1010.369628, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19358, 1410.481201, -20.324455, 1010.919494, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19388, 1408.741943, -21.851949, 1010.909179, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19358, 1408.741821, -25.044464, 1010.909484, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1502, 1408.867187, -22.597040, 1009.229370, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2521, 1411.598754, -23.949783, 1009.359436, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2518, 1410.491333, -23.894554, 1009.409301, 0.000000, 0.000000, 540.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19874, 1410.193969, -24.335231, 1010.329467, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19873, 1410.810424, -24.074722, 1010.889526, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2610, 1411.866821, -18.083850, 1010.149841, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2610, 1411.866821, -18.553857, 1010.149841, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1703, 1404.102783, -11.469779, 1009.349731, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(640, 1411.421264, -14.673000, 1009.779357, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(638, 1403.539916, -14.632990, 1009.739501, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1703, 1409.682861, -11.459785, 1009.349731, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(638, 1405.849853, -11.612991, 1009.949584, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2404, 1401.130737, -15.399952, 1010.989379, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19358, 1400.210449, -15.004445, 1010.919494, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19450, 1403.645874, -5.391119, 1010.919433, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2167, 1412.047119, -19.545103, 1009.319519, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2233, 1396.304931, -24.399303, 1013.162902, -179.500000, 0.000000, -89.700004, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2233, 1396.292480, -16.089271, 1013.163024, -179.500000, 0.000000, -89.700004, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1736, 1397.014648, -17.492841, 1011.650085, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1210, 1399.709350, -19.339847, 1009.509582, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19319, 1402.284423, -24.413326, 1010.969665, 0.000000, 180.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2251, 1400.368286, -15.875019, 1011.069824, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2161, 1411.657348, -16.863399, 1010.279602, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1814, 1405.287475, -10.053416, 1009.359436, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2855, 1406.234863, -9.527116, 1009.449523, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1961, 1404.349365, -24.408430, 1011.859802, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1962, 1404.359008, -24.411769, 1011.219665, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1960, 1404.369262, -24.406929, 1010.569335, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(638, 1404.753295, -23.075479, 1009.719726, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(638, 1404.753295, -17.275480, 1009.719726, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1670, 1403.342407, -17.087881, 1009.829711, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2727, 1401.681152, -11.060919, 1007.547058, 90.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(11707, 1409.014038, -23.604909, 1010.479553, 0.000000, 0.000000, -89.499946, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2344, 1399.371093, -15.908842, 1010.259521, 0.000000, 0.000000, -151.800018, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19807, 1399.777343, -19.382947, 1010.319274, -0.699998, 0.000000, -46.200004, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2226, 1398.184082, -15.870410, 1010.229614, 0.000000, 0.000000, 40.400001, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(927, 1409.820312, -24.430833, 1011.670043, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1886, 1399.527587, -14.472001, 1012.626403, 19.399999, 0.000000, 126.099998, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19806, 1405.786376, -9.537055, 1012.500000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1806, 1405.693725, -14.296154, 1005.749633, 0.000000, 0.000000, -47.999992, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2813, 1405.406982, -9.573551, 1009.849426, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1886, 1405.798095, -14.107337, 1009.227844, 19.399999, 0.000000, 126.099998, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2685, 1409.968383, -24.378725, 1011.999633, 0.000000, 0.000000, -179.700119, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19814, 1396.702270, -16.291793, 1009.519287, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19622, 1411.681030, -21.043249, 1009.937133, 32.899997, 0.000000, 91.299980, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19618, 1409.979736, -24.433662, 1011.199707, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(11706, 1410.877807, -20.957874, 1009.359436, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19807, 1407.094604, -14.408372, 1006.799987, 0.000000, 0.000000, -111.500007, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(2190, 1407.506103, -13.270502, 1006.689758, 0.000000, 0.000000, -63.299995, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19808, 1407.055175, -13.781471, 1006.729431, 0.000000, 0.000000, -65.599998, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(19787, 1411.469482, -14.052108, 1008.430297, 14.699999, 0.000000, -136.399993, -1, -1, -1, 300.00, 300.00);
	tmpobjjid = CreateDynamicObject(1703, 1405.829223, -8.080793, 1005.749633, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);

	//Flugzeug Autohaus LS - Map by Maximun
	static tmpobjectID;
	tmpobjectID = CreateDynamicObjectEx(18766, 606.721191, -1498.964355, 16.413078, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 596.720764, -1498.964355, 16.413078, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 596.720764, -1522.665405, 16.413078, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 606.680847, -1522.665405, 16.413078, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18980, 611.558227, -1522.659912, 13.961249, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10052, "lomall", "tileornateg256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1519.367919, 13.878455, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18980, 611.558227, -1498.978637, 13.961249, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10052, "lomall", "tileornateg256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1521.266845, 13.878455, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1517.457641, 13.878455, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1500.393798, 13.878453, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1502.294189, 13.878453, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1504.194213, 13.878453, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1506.104370, 13.878453, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1515.557006, 13.878455, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18980, 610.743225, -1507.553100, 6.372257, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 5142, "lashops1b_las2", "sjmhoodaac", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18980, 610.743225, -1514.122924, 6.372257, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 5142, "lashops1b_las2", "sjmhoodaac", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1506.104370, 17.868448, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1504.214721, 17.868448, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1502.334716, 17.868448, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1500.454467, 17.868448, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1515.557006, 17.838457, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1517.467407, 17.838457, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1519.366821, 17.838457, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1521.276123, 17.838457, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19450, 610.754333, -1503.292114, 16.080724, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10973, "mall_sfse", "ws_grilleshade", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 611.050537, -1513.181396, 13.987298, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19450, 610.754333, -1518.342895, 16.310728, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10973, "mall_sfse", "ws_grilleshade", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 4, 14479, "skuzzy_motelmain", "motel_mirror2", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 611.050537, -1513.181396, 15.267292, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 611.050537, -1513.181396, 16.527286, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1512.767456, 17.738451, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 610.580566, -1508.972900, 16.457286, 0.000000, 0.000000, -177.500045, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 610.561767, -1508.532470, 15.167303, 0.000000, 0.000000, -177.500045, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 610.561767, -1508.532470, 16.437313, 0.000000, 0.000000, -177.500045, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1508.955078, 17.738445, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19937, 610.819641, -1510.856445, 17.738449, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14593, "papaerchaseoffice", "wall_stone6_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 611.050537, -1512.740966, 13.987298, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 611.050537, -1512.740966, 15.277297, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 610.580566, -1508.972900, 13.897295, 0.000000, 0.000000, -177.500045, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 610.580566, -1508.972900, 15.187312, 0.000000, 0.000000, -177.500045, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 611.050537, -1512.300537, 13.987298, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 610.599670, -1509.412719, 13.897295, 0.000000, 0.000000, -177.500045, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 611.050537, -1512.740966, 16.547290, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2230, 610.561767, -1508.532470, 13.897295, 0.000000, 0.000000, -177.500045, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 3531, "triadprops_lvs", "casinowall1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 605.371093, -1501.473999, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 605.371093, -1506.443725, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 605.371093, -1511.424072, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 605.371093, -1516.413452, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 605.371093, -1520.705078, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 596.720458, -1520.705078, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 595.789672, -1515.745727, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 596.720458, -1510.795898, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 596.720458, -1505.925903, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 596.720458, -1501.014770, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 591.374572, -1504.006591, 16.413078, 0.000000, 0.000000, -93.299987, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 18009, "genintrestrest1", "rest_cob", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 590.800537, -1513.960449, 16.413078, 0.000000, 0.000000, -93.299987, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 18009, "genintrestrest1", "rest_cob", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 590.582946, -1517.744873, 16.413078, 0.000000, 0.000000, -93.299987, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 18009, "genintrestrest1", "rest_cob", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 595.779846, -1522.665405, 16.413078, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(6340, 588.179992, -1530.469970, 25.593799, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 4, 16008, "des_n", "drvin_ground1", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19174, 606.030883, -1522.169921, 15.971383, 1.700000, 0.000000, 179.999908, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 2254, "picture_frame_clip", "CJ_PAINTING2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 1, 10606, "cluckbell_sfs", "roof04L256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19482, 611.052185, -1510.864868, 18.201629, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 1, 10973, "mall_sfse", "ws_grilleshade", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjectID, 0, "Willkommen!", 50, "Fixedsys", 20, 0, 0xFFFFFFFF, 0x00000000, 1);
	tmpobjectID = CreateDynamicObjectEx(3335, 610.036926, -1510.892333, 18.651542, 18.399993, 0.000000, 89.299972, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14746, "rylounge", "AH_rykitiles", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 1, 14847, "mp_policesf", "mp_cop_tile", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 2, 12862, "sw_block03", "sw_watson", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 3, 12862, "sw_block03", "sw_watson", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 612.383361, -1502.898193, 13.843246, 0.000000, -90.199966, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 612.383361, -1501.347290, 13.843246, 0.000000, -90.199966, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 612.383361, -1504.487915, 13.843246, 0.000000, -90.199966, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 612.119567, -1505.518798, 13.407098, 0.000000, 0.000000, -90.099975, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 613.389404, -1505.520996, 13.407098, 0.000000, 0.000000, -90.099975, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.274841, -1504.615600, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.296875, -1503.345703, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.318908, -1502.075927, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.341247, -1500.824829, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 612.872436, -1518.119018, 14.023244, 0.000000, -90.199951, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 612.872436, -1516.568115, 14.023244, 0.000000, -90.199951, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 612.872436, -1519.708740, 14.023244, 0.000000, -90.199951, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 611.960815, -1515.501342, 13.407098, 0.000000, 0.000000, -90.099975, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 613.220397, -1515.504638, 13.407098, 0.000000, 0.000000, -90.099975, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.151062, -1515.505126, 13.407098, 0.000000, 0.000000, -90.099975, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 615.019165, -1516.400634, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.997436, -1517.670166, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.975585, -1518.940185, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19431, 614.953125, -1520.190917, 13.407098, 0.000000, 0.000000, 179.000122, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 10442, "graveyard_sfs", "ws_graveydfence", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 595.789794, -1520.705078, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(18766, 596.139892, -1510.795898, 18.423107, -90.000000, 0.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 17537, "eastls4_lae2", "backalley3_LAe", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2592, 593.979064, -1510.410400, 15.052798, 0.000000, 0.000000, 87.100074, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 14537, "pdomebar", "club_floor2_sfwTEST", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2267, 599.469787, -1506.117675, 16.899755, 20.400001, 0.000000, -87.999992, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 1, 2464, "rc_shop_acc", "CJ_RC_7", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(19482, 606.082824, -1522.112060, 16.169387, 0.000000, 0.000000, 91.000007, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 4981, "wiresetc2_las", "lasunionclk", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2267, 596.220886, -1522.119506, 16.527235, 0.000000, 0.000000, -179.100006, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 2702, "pick_up", "cj_fambly", 0x00000000);
	SetDynamicObjectMaterial(tmpobjectID, 1, 2702, "pick_up", "cj_fambly", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2267, 591.544433, -1510.305297, 16.888847, 0.000000, 0.000000, 87.099990, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 1, 14832, "lee_stripclub", "cl_floornew_256", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2049, 591.708984, -1508.194213, 16.273370, 0.000000, 0.000000, 92.299980, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 2464, "rc_shop_acc", "CJ_RC_4", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(2049, 591.470825, -1512.218994, 16.273370, 0.000000, -1.299998, 90.200012, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjectID, 0, 2464, "rc_shop_acc", "CJ_RC_3", 0x00000000);
	tmpobjectID = CreateDynamicObjectEx(1215, 610.713806, -1512.620117, 15.182995, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1215, 610.853942, -1509.139648, 15.102993, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(19943, 600.142578, -1514.096557, 11.509888, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(17051, 610.723510, -1496.205566, 9.422373, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1226, 612.680725, -1498.636352, 26.768346, 0.000000, 0.000000, -160.399993, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1226, 612.838195, -1522.737670, 26.768346, 0.000000, 0.000000, 166.499893, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(3801, 611.296325, -1513.239013, 18.507242, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(3801, 611.296325, -1508.349121, 18.507242, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1214, 611.442626, -1499.826660, 13.327610, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1693, 608.579833, -1510.659545, 20.343101, 0.000000, 0.000000, -90.400009, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1291, 611.568603, -1506.232910, 14.275689, 0.000000, 0.000000, 89.200027, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(870, 612.585510, -1502.812377, 14.153066, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(828, 613.188720, -1501.661865, 14.184396, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(751, 612.761169, -1500.997802, 12.007613, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(871, 612.563354, -1503.347656, 14.156675, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1366, 622.114929, -1501.492309, 14.457551, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1215, 611.454223, -1499.834960, 14.571727, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(3459, 611.981262, -1515.063842, 20.816679, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1319, 614.184997, -1520.845703, 14.587223, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1319, 612.374267, -1520.845703, 14.587223, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1319, 613.264465, -1520.845703, 14.587223, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(805, 613.026428, -1518.269287, 14.042741, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(869, 612.837219, -1518.369140, 14.200762, 0.000000, 0.000000, 73.199981, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1232, 615.774475, -1520.923217, 15.026683, 0.000000, 0.000000, 39.900005, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(16780, 605.323913, -1504.036132, 18.173002, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(19943, 600.142578, -1506.104370, 11.509888, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(19893, 594.001220, -1510.721679, 15.039950, 0.000000, 0.000000, -116.299964, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2568, 591.932800, -1511.795410, 14.186412, 0.000000, 0.000000, 86.700027, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2184, 594.195312, -1507.316772, 14.171562, 0.000000, 0.000000, 160.499984, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2207, 591.775634, -1513.255737, 14.213605, 0.000000, 0.000000, -0.999992, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1714, 592.771179, -1510.323364, 14.163558, 0.000000, 0.000000, 57.000003, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2310, 595.080078, -1510.824096, 14.612353, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2251, 594.066467, -1509.212402, 15.808040, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2811, 592.024169, -1508.162475, 14.198431, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1959, 593.850097, -1511.660034, 14.962370, 0.000000, 0.000000, -109.899978, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(11705, 594.008239, -1508.852905, 14.956291, 0.000000, 0.000000, 17.500001, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2571, 606.240417, -1502.053588, 13.944691, 0.000000, 0.000000, -30.400001, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(16780, 603.482788, -1517.661865, 18.069799, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2076, 597.888549, -1510.498168, 17.370243, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1734, 605.077941, -1510.763305, 17.936126, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1742, 600.451782, -1522.259155, 13.960117, 0.000000, 0.000000, -179.300003, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2239, 601.760314, -1521.882080, 13.958722, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1815, 607.302612, -1519.445434, 14.032073, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2291, 609.044860, -1519.074951, 13.960003, 0.000000, 0.000000, -62.400054, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1758, 607.091796, -1517.158813, 13.949033, 0.000000, 0.000000, -37.599998, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2342, 591.898559, -1512.700073, 15.109692, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2059, 607.888000, -1502.043701, 14.500858, 0.000000, 0.000000, 22.799997, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1302, 603.825256, -1499.768920, 13.961196, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(19835, 608.099670, -1519.067626, 14.620289, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1546, 607.667968, -1518.654785, 14.627635, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(19813, 605.762695, -1499.471923, 14.314665, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(19827, 591.359802, -1513.016357, 15.476143, 0.000000, 0.000000, 87.399993, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2443, 598.673156, -1499.909057, 14.121477, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2241, 610.201660, -1499.732543, 14.448557, 0.000000, 0.000000, 93.000015, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(948, 610.073852, -1521.662597, 13.965997, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(19867, 615.292968, -1515.290039, 13.943168, 0.000000, 0.000000, 128.699996, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2485, 593.234497, -1513.161865, 15.052264, 0.000000, 0.000000, 156.800003, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2241, 591.421325, -1521.692382, 14.635773, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2484, 600.111755, -1521.954956, 16.838457, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1216, 613.200561, -1499.108032, 14.439846, 0.000000, 0.000000, 89.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1234, 617.265686, -1499.919067, 15.213027, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2824, 593.421081, -1507.306518, 14.937078, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1808, 591.477966, -1520.596313, 14.212217, 0.000000, 0.000000, 91.499977, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2002, 607.882873, -1500.084228, 13.969382, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1235, 591.640441, -1514.057617, 14.790819, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(1549, 601.419128, -1499.824829, 13.958827, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2833, 608.896606, -1510.223144, 14.104852, 0.000000, 0.000000, -90.600006, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2186, 592.822143, -1501.073120, 14.226784, 0.000000, 0.000000, 92.600036, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2001, 592.266113, -1505.709838, 14.273788, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjectID = CreateDynamicObjectEx(2723, 592.538391, -1502.205322, 14.610918, 0.000000, 0.000000, 0.000000, 300.00, 300.00);

	//Obi Baumarkt - Map by Rocky_Balboa
    CreateDynamicObject(8661, 2517.35791, -1524.41956, 23.00000,   -0.02400, 0.00000, 0.00000);
    CreateDynamicObject(19378, 2531.58203, -1519.00171, 23.02350,   0.00000, 90.00000, 0.00000);
    CreateDynamicObject(19378, 2531.65063, -1528.47864, 23.04750,   0.00000, 90.00000, 0.00000);
    CreateDynamicObject(19387, 2526.30029, -1525.38940, 24.75112,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19403, 2526.31396, -1528.34656, 24.75110,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19449, 2526.30225, -1519.14600, 24.75110,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19357, 2526.30640, -1531.54272, 24.75110,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19449, 2531.02319, -1533.21497, 24.75110,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(19430, 2536.28955, -1533.21802, 24.75110,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(19449, 2531.02856, -1514.28455, 24.75110,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(19430, 2536.01685, -1514.29968, 24.75110,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(19449, 2536.87598, -1518.99292, 24.75110,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19449, 2536.87964, -1528.60559, 24.75110,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19378, 2531.58496, -1519.03345, 26.38390,   0.00000, 90.00000, 0.00000);
    CreateDynamicObject(19378, 2531.55469, -1528.29053, 26.38390,   0.00000, 90.00000, 0.00000);
    CreateDynamicObject(1491, 2526.34912, -1526.14111, 22.99440,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(3859, 2526.22339, -1529.33496, 23.23110,   0.00000, 0.00000, 17.00000);
    CreateDynamicObject(2435, 2526.84399, -1517.98657, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2527.76392, -1517.98730, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2528.68408, -1517.98511, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2529.60840, -1517.98328, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2530.53857, -1517.98145, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2531.45874, -1517.97778, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2532.38428, -1517.97668, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2533.31372, -1517.97949, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2534.24463, -1517.98206, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2534.28931, -1517.40198, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2533.36084, -1517.38147, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2528.81055, -1517.35437, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2532.50757, -1517.36255, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2531.57788, -1517.34216, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2530.66431, -1517.32214, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2529.71436, -1517.33374, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2527.89453, -1517.37805, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2527.00146, -1517.39636, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2535.15894, -1517.97498, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2536.08032, -1517.96790, 23.13584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2535.21875, -1517.39478, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(2435, 2536.14893, -1517.38757, 25.66768,   90.00000, 0.00000, 0.00000);
    CreateDynamicObject(1663, 2529.04053, -1516.91992, 23.53941,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1663, 2531.70557, -1516.88904, 23.53941,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1663, 2534.54688, -1517.01917, 23.53941,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2190, 2531.51172, -1517.98755, 24.05860,   0.00000, 0.00000, 150.00000);
    CreateDynamicObject(2190, 2528.03857, -1518.11890, 24.05860,   0.00000, 0.00000, 150.00000);
    CreateDynamicObject(2190, 2533.67505, -1518.19824, 24.05860,   0.00000, 0.00000, 150.00000);
    CreateDynamicObject(942, 2533.77856, -1531.71277, 24.00859,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2412, 2526.59741, -1523.97925, 23.14264,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(2412, 2526.57129, -1526.19800, 23.14264,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(2459, 2528.53857, -1522.63269, 23.00423,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2459, 2530.97388, -1522.62769, 23.00423,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2459, 2528.61328, -1527.43445, 23.00423,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2459, 2531.00464, -1527.44250, 23.00423,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(18635, 2532.05591, -1527.38892, 24.58770,   450.00000, 90.00000, 0.00000);
    CreateDynamicObject(341, 2531.45947, -1527.23010, 24.00470,   50.00000, 0.00000, 9.00000);
    CreateDynamicObject(18644, 2529.51440, -1527.22485, 24.30930,   90.00000, 0.00000, 90.00000);
    CreateDynamicObject(18638, 2529.45117, -1522.33545, 24.68220,   0.00000, 270.00000, 359.89801);
    CreateDynamicObject(18641, 2531.55371, -1522.77136, 24.03584,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(8875, 2536.35059, -1524.04614, 19.76560,   9.00000, 0.00000, 0.00000);
    CreateDynamicObject(18637, 2530.23071, -1518.32825, 24.25204,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19326, 2536.78784, -1520.48108, 25.64360,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(10183, 2517.62012, -1530.49719, 23.01350,   0.00000, 0.00000, 225.25681);
    CreateDynamicObject(1233, 2526.06030, -1516.88159, 24.23520,   0.00000, 0.00000, 270.00000);
    CreateDynamicObject(1271, 2536.25366, -1525.17029, 23.47310,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(984, 2503.87817, -1514.42651, 23.62323,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(984, 2530.56323, -1534.29089, 23.62323,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(984, 2521.38428, -1514.36377, 23.62323,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(984, 2517.75122, -1534.29248, 23.62323,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(984, 2504.93481, -1534.26563, 23.62323,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(983, 2498.54297, -1534.28162, 23.62320,   0.00000, 0.00000, 90.00000);

    //San Fierro Kart Bahn - Map
    CreateDynamicObject(978, -2082.315918, -136.974884, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2082.457520, -145.931808, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2082.612549, -155.178101, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2079.496582, -163.104187, 35.160534, 0.0000, 0.0000, 133.6901);
	CreateDynamicObject(978, -2071.854492, -167.593994, 35.160534, 0.0000, 0.0000, 165.5211);
	CreateDynamicObject(978, -2062.749268, -168.374344, 35.160534, 0.0000, 0.0000, 184.6197);
	CreateDynamicObject(978, -2058.039551, -163.432068, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2062.176514, -157.628662, 35.160534, 0.0000, 0.0000, 343.7747);
	CreateDynamicObject(978, -2071.159180, -155.028503, 35.160534, 0.0000, 0.0000, 343.7747);
	CreateDynamicObject(978, -2075.473633, -149.101349, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2075.042480, -139.793472, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2070.155518, -134.738190, 35.160534, 0.0000, 0.0000, 184.6197);
	CreateDynamicObject(978, -2060.876221, -133.967743, 35.160534, 0.0000, 0.0000, 184.6197);
	CreateDynamicObject(978, -2052.897949, -136.975739, 35.167614, 0.0000, 0.0000, 133.6901);
	CreateDynamicObject(978, -2047.745361, -144.526901, 35.160534, 0.0000, 0.0000, 114.5916);
	CreateDynamicObject(978, -2041.980225, -161.925186, 35.167614, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2043.852905, -152.958832, 35.160534, 0.0000, 0.0000, 114.5916);
	CreateDynamicObject(978, -2042.102173, -171.124634, 35.167614, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2040.222046, -179.958466, 35.160534, 0.0000, 0.0000, 114.5916);
	CreateDynamicObject(978, -2036.365601, -188.346619, 35.160534, 0.0000, 0.0000, 114.5916);
	CreateDynamicObject(978, -2034.494019, -197.274719, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2038.233521, -204.895721, 35.160534, 0.0000, 0.0000, 38.1971);
	CreateDynamicObject(978, -2045.562988, -210.688629, 35.160534, 0.0000, 0.0000, 38.1971);
	CreateDynamicObject(978, -2053.794922, -214.647919, 35.167614, 0.0000, 0.0000, 12.7324);
	CreateDynamicObject(978, -2062.765625, -216.724136, 35.160534, 0.0000, 0.0000, 12.7324);
	CreateDynamicObject(978, -2071.728271, -216.241638, 35.160534, 0.0000, 0.0000, 340.9014);
	CreateDynamicObject(978, -2078.153809, -214.078873, 35.160534, 0.0000, 0.0000, 340.9014);
	CreateDynamicObject(978, -2082.386475, -207.812927, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2081.939697, -198.446838, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2081.533691, -189.190903, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2083.074707, -207.371307, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2082.953613, -198.138397, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2082.838867, -189.314270, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2083.209473, -216.685181, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2080.789307, -225.182251, 35.160534, 0.0000, 0.0000, 122.4401);
	CreateDynamicObject(978, -2081.124756, -240.610229, 35.160534, 0.0000, 0.0000, 122.4401);
	CreateDynamicObject(978, -2080.982910, -232.994553, 35.160534, 0.0000, 0.0000, 54.9401);
	CreateDynamicObject(978, -2081.287109, -248.422546, 35.160534, 0.0000, 0.0000, 54.9401);
	CreateDynamicObject(978, -2081.459717, -256.052582, 35.160534, 0.0000, 0.0000, 122.4401);
	CreateDynamicObject(978, -2074.371094, -260.014862, 35.160534, 0.0000, 0.0000, 178.6901);
	CreateDynamicObject(978, -2066.481934, -256.910553, 35.160534, 0.0000, 0.0000, 223.6902);
	CreateDynamicObject(978, -2063.040283, -249.128677, 35.160534, 0.0000, 0.0000, 268.6902);
	CreateDynamicObject(978, -2062.838867, -239.787994, 35.160534, 0.0000, 0.0000, 268.6902);
	CreateDynamicObject(978, -2060.034912, -231.278885, 35.167614, 0.0000, 0.0000, 234.9402);
	CreateDynamicObject(978, -2053.435303, -224.944794, 35.160534, 0.0000, 0.0000, 212.4401);
	CreateDynamicObject(978, -2044.894897, -222.572830, 35.167614, 0.0000, 0.0000, 178.6901);
	CreateDynamicObject(978, -2040.288086, -227.418915, 35.167614, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2040.423950, -236.700241, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2040.547852, -245.959625, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2040.691650, -255.283356, 35.160534, 0.0000, 0.0000, 89.1267);
	CreateDynamicObject(978, -2036.214478, -259.404846, 35.160534, 0.0000, 0.0000, 184.6197);
	CreateDynamicObject(978, -2031.451050, -254.445374, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2031.038940, -245.110016, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2030.632080, -235.800629, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2030.206421, -226.476471, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2029.797241, -217.120300, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2029.362793, -207.782776, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2028.926514, -198.518387, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2030.299316, -189.496628, 35.160534, 0.0000, 0.0000, 289.8803);
	CreateDynamicObject(978, -2033.456177, -180.800400, 35.160534, 0.0000, 0.0000, 289.8803);
	CreateDynamicObject(978, -2036.611572, -172.101044, 35.167614, 0.0000, 0.0000, 289.8803);
	CreateDynamicObject(978, -2038.002808, -163.007385, 35.167614, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2037.591431, -153.699051, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2037.174927, -144.378265, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2040.683472, -137.079346, 35.135830, 0.0000, 0.0000, 323.6303);
	CreateDynamicObject(978, -2048.202881, -131.551086, 35.135464, 0.0000, 0.0000, 323.6303);
	CreateDynamicObject(978, -2056.567383, -128.621429, 35.157154, 0.0000, 0.0000, 357.3803);
	CreateDynamicObject(978, -2069.884033, -127.986526, 35.167259, 0.0000, 0.0000, 357.3803);
	CreateDynamicObject(978, -2064.287842, -128.261551, 35.167057, 0.0000, 0.0000, 357.3803);
	CreateDynamicObject(978, -2078.394531, -130.150314, 35.167614, 0.0000, 0.0000, 31.1304);
	CreateDynamicObject(979, -2077.486816, -269.740723, 35.160534, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(979, -2069.195557, -269.749268, 35.160534, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(979, -2061.250977, -266.460846, 35.160534, 0.0000, 0.0000, 45.0000);
	CreateDynamicObject(979, -2057.216553, -262.387939, 35.160534, 0.0000, 0.0000, 45.0000);
	CreateDynamicObject(979, -2053.970459, -254.478439, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2053.985352, -245.334412, 35.167614, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2051.381836, -236.918182, 35.160534, 0.0000, 0.0000, 56.2500);
	CreateDynamicObject(979, -2049.028076, -237.669510, 35.160534, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2049.044922, -246.884918, 35.160534, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2049.033936, -255.769867, 35.160534, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2049.063477, -263.385803, 35.167614, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2044.377563, -268.041107, 35.167614, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(979, -2035.054443, -268.083069, 35.160534, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(979, -2027.050781, -264.789642, 35.160534, 0.0000, 0.0000, 45.0000);
	CreateDynamicObject(979, -2023.787598, -256.779480, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2023.786987, -247.463089, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2022.878540, -238.330688, 35.167614, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(979, -2021.946167, -229.181305, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2021.948853, -220.116791, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2021.899048, -210.973465, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2021.009277, -201.825668, 35.160534, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(979, -2019.233887, -192.898376, 35.160534, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(979, -2017.461426, -184.186554, 35.160534, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(979, -2015.731201, -175.498901, 35.160534, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(979, -2014.272705, -168.217346, 35.160534, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(979, -2012.533936, -159.430328, 35.160534, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(979, -2014.876099, -129.756851, 35.133190, 0.0000, 0.0000, 135.0000);
	CreateDynamicObject(979, -2022.594849, -125.589493, 35.064091, 0.0000, 0.0000, 168.7500);
	CreateDynamicObject(979, -2031.312256, -122.929245, 35.039532, 0.0000, 0.0000, 157.5000);
	CreateDynamicObject(979, -2039.772095, -119.407532, 35.036922, 0.0000, 0.0000, 157.5000);
	CreateDynamicObject(979, -2046.626831, -113.800323, 35.077694, 0.0000, 0.0000, 123.7499);
	CreateDynamicObject(979, -2051.738770, -106.122696, 35.116837, 0.0000, 0.0000, 123.7499);
	CreateDynamicObject(979, -2025.770264, -173.442429, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2025.757813, -164.119827, 35.167614, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2025.758179, -154.931900, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2025.758667, -145.796967, 35.160534, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(979, -2029.020020, -137.787109, 35.128262, 0.0000, 0.0000, 135.0000);
	CreateDynamicObject(979, -2035.433838, -131.358917, 35.094032, 0.0000, 0.0000, 135.0000);
	CreateDynamicObject(979, -2042.985352, -126.250740, 35.092319, 0.0000, 0.0000, 157.5000);
	CreateDynamicObject(979, -2050.985352, -121.902679, 35.113529, 0.0000, 0.0000, 146.2500);
	CreateDynamicObject(979, -2059.412598, -119.327591, 35.163830, 0.0000, 0.0000, 180.0000);
	CreateDynamicObject(979, -2068.707031, -119.353165, 35.172398, 0.0000, 0.0000, 180.0000);
	CreateDynamicObject(979, -2073.904053, -119.286736, 35.168591, 0.0000, 0.0000, 180.0000);
	CreateDynamicObject(979, -2086.979492, -124.013260, 35.167614, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2095.323242, -132.024109, 35.160534, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2094.234375, -139.290741, 35.160534, 0.0000, 0.0000, 292.5001);
	CreateDynamicObject(979, -2092.519043, -148.170197, 35.160534, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2092.538818, -157.202362, 35.160534, 0.0000, 0.0000, 270.0000);
	CreateDynamicObject(979, -2090.011475, -165.679352, 35.160534, 0.0000, 0.0000, 303.7500);
	CreateDynamicObject(979, -2083.662354, -172.137756, 35.160534, 0.0000, 0.0000, 326.2501);
	CreateDynamicObject(979, -2075.244385, -175.678741, 35.160534, 0.0000, 0.0000, 348.7501);
	CreateDynamicObject(979, -2066.109375, -176.594070, 35.160534, 0.0000, 0.0000, 0.0001);
	CreateDynamicObject(979, -2056.840088, -176.592545, 35.160534, 0.0000, 0.0000, 0.0001);
	CreateDynamicObject(979, -2052.049805, -171.906342, 35.160534, 0.0000, 0.0000, 90.0001);
	CreateDynamicObject(979, -2052.009521, -162.798279, 35.160534, 0.0000, 0.0000, 90.0001);
	CreateDynamicObject(979, -2053.610107, -154.407455, 35.160534, 0.0000, 0.0000, 112.5001);
	CreateDynamicObject(979, -2060.046143, -149.165756, 35.160534, 0.0000, 0.0000, 168.7501);
	CreateDynamicObject(979, -2060.682373, -145.822357, 35.167614, 0.0000, 0.0000, 33.7501);
	CreateDynamicObject(979, -2054.385986, -147.047577, 35.160534, 0.0000, 0.0000, 303.7502);
	CreateDynamicObject(979, -2050.886963, -155.399200, 35.167614, 0.0000, 0.0000, 281.2502);
	CreateDynamicObject(979, -2050.000977, -164.589020, 35.160534, 0.0000, 0.0000, 270.0002);
	CreateDynamicObject(979, -2050.017334, -173.789963, 35.160534, 0.0000, 0.0000, 270.0002);
	CreateDynamicObject(979, -2048.174805, -182.691895, 35.167614, 0.0000, 0.0000, 292.5002);
	CreateDynamicObject(979, -2044.901978, -190.480392, 35.160534, 0.0000, 0.0000, 292.5002);
	CreateDynamicObject(979, -2044.961182, -198.745239, 35.160534, 0.0000, 0.0000, 247.5002);
	CreateDynamicObject(979, -2050.940918, -204.728165, 35.167614, 0.0000, 0.0000, 202.5002);
	CreateDynamicObject(979, -2059.551514, -207.326019, 35.160534, 0.0000, 0.0000, 191.2502);
	CreateDynamicObject(979, -2068.167969, -206.474213, 35.160534, 0.0000, 0.0000, 157.5002);
	CreateDynamicObject(979, -2071.424072, -200.238525, 35.160534, 0.0000, 0.0000, 78.7501);
	CreateDynamicObject(979, -2069.588623, -191.400833, 35.160534, 0.0000, 0.0000, 78.7501);
	CreateDynamicObject(979, -2071.236084, -183.003128, 35.160534, 0.0000, 0.0000, 123.7502);
	CreateDynamicObject(979, -2078.117676, -177.437805, 35.160534, 0.0000, 0.0000, 157.5002);
	CreateDynamicObject(979, -2086.826416, -177.391769, 35.160534, 0.0000, 0.0000, 202.5002);
	CreateDynamicObject(979, -2092.937012, -183.473770, 35.160530, 0.0000, 0.0000, 247.5002);
	CreateDynamicObject(979, -2094.803467, -192.350510, 35.160534, 0.0000, 0.0000, 270.0002);
	CreateDynamicObject(979, -2094.768555, -201.254089, 35.160534, 0.0000, 0.0000, 270.0002);
	CreateDynamicObject(979, -2094.729492, -210.396332, 35.160534, 0.0000, 0.0000, 270.0002);
	CreateDynamicObject(979, -2094.761719, -219.705276, 35.160534, 0.0000, 0.0000, 270.0002);
	CreateDynamicObject(979, -2091.659180, -225.347885, 35.160534, 0.0000, 0.0000, 315.0002);
	CreateDynamicObject(979, -2090.960693, -232.308746, 35.160534, 0.0000, 0.0000, 236.2502);
	CreateDynamicObject(979, -2090.118164, -239.445877, 35.160534, 0.0000, 0.0000, 315.0002);
	CreateDynamicObject(979, -2089.476318, -246.521240, 35.160534, 0.0000, 0.0000, 236.2502);
	CreateDynamicObject(979, -2091.438232, -253.209930, 35.160534, 0.0000, 0.0000, 270.0002);
	CreateDynamicObject(979, -2089.708496, -260.077118, 35.160534, 0.0000, 0.0000, 292.5002);
	CreateDynamicObject(979, -2085.279541, -266.542236, 35.160534, 0.0000, 0.0000, 315.0002);
	CreateDynamicObject(978, -2025.257080, -173.428757, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2024.835205, -164.254044, 35.167614, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2024.407227, -154.921021, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2023.981445, -145.754074, 35.160534, 0.0000, 0.0000, 267.3803);
	CreateDynamicObject(978, -2026.924194, -137.840271, 35.131939, 0.0000, 0.0000, 312.3803);
	CreateDynamicObject(978, -2033.834839, -131.658234, 35.100506, 0.0000, 0.0000, 323.6303);
	CreateDynamicObject(978, -2041.155518, -126.296761, 35.087566, 0.0000, 0.0000, 323.6303);
	CreateDynamicObject(978, -2048.646484, -120.750809, 35.095257, 0.0000, 0.0000, 323.6303);
	CreateDynamicObject(978, -2054.202148, -115.677429, 35.138103, 0.0000, 0.0000, 312.3803);
	CreateDynamicObject(978, -2061.912598, -111.971786, 35.165665, 0.0000, 0.0000, 357.3803);
	CreateDynamicObject(978, -2071.080078, -111.556122, 35.170662, 0.0000, 0.0000, 357.3803);
	CreateDynamicObject(978, -2080.255615, -111.179161, 35.160534, 0.0000, 0.0000, 357.3803);
	CreateDynamicObject(978, -2085.082764, -110.984291, 35.160534, 0.0000, 0.0000, 357.3804);
	CreateDynamicObject(978, -2089.774658, -115.301666, 35.160534, 0.0000, 0.0000, 87.3804);
	CreateDynamicObject(978, -2088.431885, -124.177673, 35.160534, 0.0000, 0.0000, 109.8804);
	CreateDynamicObject(979, -2082.898926, -119.262718, 35.160534, 0.0000, 0.0000, 180.0000);
	CreateDynamicObject(979, -2095.680176, -122.864456, 35.267235, 0.0000, 0.0000, 275.0197);
	CreateDynamicObject(10838, -2052.518555, -240.729172, 51.872723, 0.0000, 0.0000, 78.7500);
	CreateDynamicObject(3819, -2058.966797, -203.654358, 35.318069, 0.0000, 0.0000, 101.2500);
	CreateDynamicObject(3819, -2050.634033, -200.281952, 35.325150, 0.0000, 0.0000, 123.7499);
	CreateDynamicObject(3819, -2067.519287, -199.619736, 35.318069, 0.0000, 0.0000, 348.7500);
	CreateDynamicObject(3819, -2065.743408, -189.760925, 35.318069, 0.0000, 0.0000, 348.7500);
	CreateDynamicObject(3819, -2061.842041, -163.556900, 35.318069, 0.0000, 0.0000, 180.0000);
	CreateDynamicObject(3819, -2075.864014, -161.308502, 35.318069, 0.0000, 0.0000, 33.7500);
	CreateDynamicObject(3819, -2062.066895, -115.823563, 35.323311, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(3819, -2072.790771, -115.612854, 35.326942, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(3819, -2083.018799, -115.419281, 35.318069, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(3819, -2078.625977, -148.534607, 35.318069, 0.0000, 0.0000, 180.0000);
	CreateDynamicObject(3819, -2078.630859, -137.508026, 35.318069, 0.0000, 0.0000, 348.7500);
	CreateDynamicObject(3819, -2044.629028, -219.461899, 35.318069, 0.0000, 0.0000, 90.0001);
	CreateDynamicObject(3819, -2036.229248, -256.749084, 35.318069, 0.0000, 0.0000, 90.0001);
	CreateDynamicObject(1231, -2078.175781, -143.341461, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2094.159668, -147.480270, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2080.095947, -154.049011, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2068.213379, -157.739120, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2067.657227, -163.024933, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2060.105469, -146.278595, 37.057785, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2055.401367, -147.373917, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2062.080566, -197.196533, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2070.170654, -180.556305, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2058.844238, -177.989792, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2047.673828, -185.100113, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2045.770996, -192.754395, 37.057785, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2037.878418, -172.800842, 37.057785, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2040.358765, -164.576492, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2039.282593, -151.865585, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2044.257202, -141.058197, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2038.892822, -138.732773, 37.047894, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2034.689209, -180.295593, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2034.239746, -185.980865, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2031.442383, -195.400894, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2034.965942, -209.727448, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2052.381104, -220.598541, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1231, -2061.431396, -229.395248, 37.050705, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2070.280762, -132.083191, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2056.597412, -130.755600, 34.320213, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2014.852661, -125.748482, 34.245758, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2041.360962, -115.460854, 34.188873, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2039.871826, -171.026550, 34.321228, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2040.303711, -156.497055, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2047.343506, -137.371597, 34.312714, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2041.198242, -146.018890, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2035.971558, -232.760773, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2051.471436, -222.300446, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2033.563965, -187.710236, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2054.935791, -189.292679, 34.321228, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2061.869873, -195.132660, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2055.549072, -193.002930, 34.321228, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2095.325439, -156.502487, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2088.946045, -172.397964, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2093.539307, -175.889343, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2063.943848, -179.099289, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2080.286377, -215.965118, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2070.887695, -218.742264, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2075.662354, -231.537140, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2065.919434, -222.083130, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2057.892822, -219.725067, 34.321228, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2038.203247, -213.095474, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2033.984497, -224.548859, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2089.804932, -264.865051, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2078.155762, -273.049896, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2062.254395, -278.542145, 34.321228, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2055.460449, -266.878479, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2033.878174, -272.309692, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2073.499756, -250.779785, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2078.010742, -255.991425, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2069.641846, -255.782410, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1237, -2025.642822, -178.189804, 34.323193, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1237, -2081.413818, -184.502136, 34.510471, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1237, -2082.821045, -184.510666, 34.323193, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1237, -2082.074707, -184.222076, 34.323193, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(615, -2082.221924, -186.273743, 34.314148, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(10281, -2094.769531, -139.235382, 37.816933, 0.0000, 0.0000, 90.0000);
	CreateDynamicObject(10837, -2089.665283, -145.797974, 38.650078, 0.0000, 0.0000, 247.5000);
	CreateDynamicObject(1262, -2094.207275, -142.891022, 36.532459, 0.0000, 0.0000, 0.0000);
	CreateDynamicObject(1262, -2094.349121, -142.886078, 36.838676, 0.0000, 0.0000, 337.5000);
	CreateDynamicObject(14826, -2014.663574, -146.964539, 35.084690, 0.0000, 0.0000, 90.0000);

    //San Fierro Nobel Autohaus - Map Niklas.B
    Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1158.94934, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1178.04736, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.11755, 1154.05005, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1525.65759, 1154.05005, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1154.05005, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1158.94934, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1178.04736, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1528.21350, 1187.68335, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.11755, 1166.88525, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1543.61829, 1166.89929, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1166.88525, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1154.05005, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.09912, 1154.04236, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1528.19556, 1149.31384, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1182.95203, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1182.95203, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1525.65759, 1182.95203, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1525.65759, 1182.95203, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.11755, 1182.95605, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.11755, 1182.95605, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1154.05005, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1166.88525, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1522.61755, 1182.95203, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1528.21350, 1187.68335, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1528.19556, 1149.31384, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.11755, 1182.95605, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1178.04736, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1158.94934, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.09912, 1154.04236, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1533.11755, 1166.88525, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1174.29041, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19449, -1538.71155, 1174.29041, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1176.38623, 16.59320,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1543.61865, 1166.08923, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.97900, 1178.04272, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.97900, 1158.95068, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.97900, 1158.95068, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.60706, 1178.04675, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.60706, 1178.04675, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.97900, 1158.95068, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1543.61865, 1170.91125, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1543.61865, 1166.08923, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1543.62073, 1170.89331, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1543.61865, 1170.91125, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1172.88623, 16.59320,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1169.38623, 16.59320,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1165.88623, 16.59320,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.49902, 1162.40527, 16.59320,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1160.61719, 16.59120,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1178.04578, 14.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1178.04578, 11.25320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1178.04980, 7.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1158.95581, 14.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1158.95581, 11.25320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1158.95581, 7.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1176.38416, 15.87920,   90.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1172.88623, 15.87920,   90.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1169.38623, 15.87920,   90.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1165.88623, 15.87920,   90.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1162.38623, 15.87920,   90.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22510, 1160.61621, 15.87920,   90.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1177.33423, 13.32720,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1177.33423, 9.82720,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1177.33423, 6.32720,   -0.00400, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1159.67017, 13.32720,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1159.67017, 9.82720,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1545.22314, 1159.67017, 6.32720,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1176.62183, 14.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1176.62183, 11.25320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1176.62183, 7.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1176.38416, 15.16720,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1172.88623, 15.16720,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1169.38623, 15.16720,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1165.88623, 15.16720,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.49902, 1162.40527, 15.16720,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50525, 1160.61719, 15.16920,   0.00000, 90.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1160.38477, 14.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1160.38477, 11.25320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1544.50842, 1160.38477, 7.75320,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.97900, 1174.28564, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.60706, 1174.28979, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.96338, 1164.18689, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1536.62744, 1164.18689, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1540.29944, 1164.18689, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1542.81946, 1164.18689, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1540.29944, 1164.18689, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1542.81946, 1164.18689, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1536.62744, 1164.18689, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19430, -1533.96338, 1164.18689, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1176.52991, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1160.47192, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11755, 1160.47192, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11755, 1176.52991, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11755, 1163.68091, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11755, 1173.31995, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1173.31995, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1176.52991, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1160.47192, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1163.68091, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1525.65759, 1176.52991, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1525.65759, 1173.31995, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1525.65759, 1163.68091, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1525.65759, 1160.47192, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1149.32007, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1165.19910, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1171.80115, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.12964, 1158.95215, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11755, 1160.46594, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11560, 1173.30591, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11365, 1176.51587, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1176.52991, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1160.47791, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.12964, 1178.04541, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61829, 1173.31995, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1160.46594, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1173.30591, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1176.51587, 11.43420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1149.32007, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1187.68408, 7.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1187.68408, 11.43420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1160.46594, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1176.51587, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1522.61755, 1173.30591, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1187.68408, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1524.13562, 1149.32007, 14.93420,   0.00000, 0.00000, 90.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1176.52991, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1160.47192, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11755, 1160.46594, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11365, 1176.51587, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1533.11560, 1173.30591, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1168.49585, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1173.31995, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1173.31885, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1163.68091, 14.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1543.61755, 1163.68188, 7.93420,   0.00000, 0.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1545.39111, 1166.78674, 9.77420,   0.00000, 90.00000, 0.00000));
	Wand_ASF(CreateDynamicObject(19357, -1545.39111, 1169.99866, 9.77420,   0.00000, 90.00000, 0.00000));

	//Dach
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1192.58887, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1202.21814, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1211.85291, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1192.58411, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1202.21814, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1211.85291, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1548.92676, 1192.58887, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1548.92676, 1202.21814, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1548.92676, 1211.85291, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1548.92676, 1144.41687, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1144.41687, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1144.41687, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1134.79102, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1134.79102, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1548.92676, 1134.79102, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1125.15601, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1548.92676, 1125.15601, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1125.15601, 13.84060,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1182.95496, 16.59360,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1173.31787, 16.59360,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1163.68494, 16.59360,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1527.92676, 1154.05090, 16.59360,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1173.31787, 16.59360,   0.00000, 90.00000, 0.00000));
	Decke_ALV(CreateDynamicObject(19380, -1538.42676, 1163.68494, 16.59360,   0.00000, 90.00000, 0.00000));

	//Scheiben
	Scheiben(CreateDynamicObject(19325, -1535.25464, 1164.20227, 8.12120,   90.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1550.85706, 1149.23315, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1536.50598, 1149.23315, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1544.68909, 1120.33484, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1537.95410, 1120.33484, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1531.84009, 1120.33484, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1525.72205, 1120.33484, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1551.11414, 1120.33484, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1145.60669, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1138.38477, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1131.14465, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.17114, 1123.94507, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1123.94507, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1131.14465, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1138.38477, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1145.60669, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1152.24976, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1536.50598, 1149.23315, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1543.60803, 1149.23315, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1550.85706, 1149.23315, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1145.60669, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1138.38477, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1131.14465, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.17114, 1123.94507, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1551.11414, 1120.33484, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1544.68909, 1120.33484, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1537.95410, 1120.33484, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1531.84009, 1120.33484, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1525.72205, 1120.33484, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1123.94507, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1131.14465, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1138.38477, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1145.60669, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1152.24976, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1191.47766, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1198.64465, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1205.86475, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1213.01270, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1213.01270, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1205.86475, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1198.64465, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1191.47766, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1550.85706, 1187.77124, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1543.60803, 1187.77124, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1536.50598, 1187.77124, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1184.83472, 7.62120,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1551.09204, 1216.66675, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1544.68909, 1216.66675, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1537.95410, 1216.66675, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1531.84009, 1216.66675, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1525.72205, 1216.66675, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1191.47766, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1184.83472, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1198.64465, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1205.86475, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1522.67712, 1213.01270, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1525.72205, 1216.66675, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1531.84009, 1216.66675, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1537.95410, 1216.66675, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1544.68909, 1216.66675, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1551.09204, 1216.66675, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1213.01270, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1205.86475, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1198.64465, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1554.16882, 1191.47766, 11.74720,   0.00000, 0.00000, 0.00000));
	Scheiben(CreateDynamicObject(19325, -1550.85706, 1187.77124, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1543.60803, 1187.77124, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1536.50598, 1187.77124, 11.74720,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1543.60803, 1149.23315, 7.62120,   0.00000, 0.00000, 90.00000));
	Scheiben(CreateDynamicObject(19325, -1541.56287, 1164.19421, 8.12120,   90.00000, 0.00000, 90.00000));

	//Boden/Decke
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1173.31787, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1163.68494, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1163.68884, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1173.32190, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1154.05493, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1144.42285, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1144.41687, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1134.79102, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1134.78296, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1125.15198, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1125.15198, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1548.92676, 1144.41687, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1548.92676, 1134.78296, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1548.92676, 1125.15198, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1182.95496, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1192.58887, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1202.22095, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1211.85291, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1192.58887, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42700, 1202.21814, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1211.85291, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1548.92676, 1211.85291, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1548.92700, 1202.21814, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1548.92676, 1192.58887, 6.10880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1173.31787, 9.60880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1163.68494, 9.60880,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1154.05090, 9.66180,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1163.69092, 11.22230,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1538.42676, 1173.31787, 11.22030,   0.00000, 90.00000, 0.00000));
	Boden_ASF(CreateDynamicObject(19379, -1527.92676, 1182.95496, 9.60880,   0.00000, 90.00000, 0.00000));

	CreateDynamicObject(3440, -1540.04431, 1149.21680, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.23828, 1149.21680, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.23828, 1149.21680, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.23828, 1120.37878, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1534.90234, 1120.37878, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1528.76013, 1120.37781, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.70325, 1120.37878, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.81335, 1120.37878, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1541.13135, 1120.37878, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.11243, 1127.52295, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.15369, 1141.99500, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1127.52295, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1134.75903, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1141.99500, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.23828, 1149.21680, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.15369, 1134.75903, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.23828, 1149.21680, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1540.04431, 1149.21680, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.15369, 1141.99500, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.15369, 1134.75903, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.11243, 1127.52295, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.23828, 1120.37878, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.81335, 1120.37878, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1541.13135, 1120.37878, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1534.90234, 1120.37878, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1528.76013, 1120.37781, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.72070, 1120.36902, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1127.52295, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1134.75903, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1141.99500, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1546.75854, 1171.03088, 7.46120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1195.05725, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1202.25330, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1209.42432, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1216.61035, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1216.61035, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1209.42432, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1202.25330, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1195.05725, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.23828, 1187.77124, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1540.04431, 1187.77124, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.81335, 1216.66675, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1541.13135, 1216.66675, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1534.90234, 1216.66675, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1528.76013, 1216.66675, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1187.85925, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.23828, 1187.77124, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1540.04431, 1187.77124, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1195.05725, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1202.25330, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1209.42432, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1216.61035, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1547.81335, 1216.66675, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1541.13135, 1216.66675, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1534.90234, 1216.66675, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1528.76013, 1216.66675, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1216.61035, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1209.42432, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1202.25330, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1522.67712, 1195.05725, 11.42120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19381, -1538.43823, 1182.95313, 6.11050,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19381, -1538.43823, 1154.05310, 6.11050,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19381, -1548.93823, 1182.95313, 6.11050,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19381, -1548.93823, 1154.05310, 6.11050,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(970, -1554.19067, 1180.72644, 6.68380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, -1554.19067, 1185.79834, 6.68380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1361, -1554.01892, 1178.36292, 6.90960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, -1554.01892, 1183.24292, 6.90960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -1551.45496, 1178.12842, 6.68380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -1546.45496, 1178.11841, 6.68380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -1542.30103, 1178.11438, 6.68380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, -1548.99243, 1178.27246, 6.90960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1554.13379, 1187.85925, 6.65720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1546.75854, 1165.68689, 7.46120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -1546.45496, 1158.88440, 6.68380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -1542.38501, 1158.88440, 6.68380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, -1549.00562, 1158.75781, 6.90960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -1551.45496, 1158.88440, 6.68380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, -1554.05798, 1158.92188, 6.90960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, -1554.20093, 1156.40613, 6.68380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, -1554.20093, 1151.26599, 6.68380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1361, -1554.10852, 1153.82129, 6.90960,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(672, -1550.85400, 1155.35303, 6.98470,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(672, -1550.85400, 1155.35303, 6.98470,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(672, -1550.51685, 1181.91003, 6.98470,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1536.92065, 1180.78247, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1537.21631, 1185.01770, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1540.32715, 1182.67505, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1543.12402, 1180.95544, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1549.75891, 1185.38794, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1543.54285, 1185.56384, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1548.04700, 1181.59534, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1551.45605, 1154.89636, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1551.18799, 1151.71167, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1546.39160, 1156.52759, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1546.03735, 1152.55737, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1540.73792, 1151.27844, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1543.46082, 1154.56970, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1539.26331, 1156.69812, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1536.35962, 1155.32715, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14469, -1536.64697, 1151.43164, 5.90860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(640, -1554.66211, 1213.05225, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1554.66211, 1205.82727, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1554.66211, 1198.62732, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1554.66211, 1191.42725, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1554.66211, 1145.56726, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1554.66211, 1138.40625, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1554.66211, 1131.13416, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1554.66211, 1123.89819, 6.85730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1544.09656, 1173.86853, 6.85640,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, -1544.09656, 1163.17651, 6.85640,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3440, -1533.12073, 1165.46399, 7.29920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3440, -1533.12073, 1171.96399, 7.29920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, -1533.16870, 1170.90784, 6.69120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2773, -1533.16870, 1166.51282, 6.69120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, -1533.87756, 1162.59204, 6.19640,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1723, -1534.94153, 1159.57642, 6.19640,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2315, -1536.65857, 1161.06030, 6.15590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2315, -1536.65857, 1162.01636, 6.15590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, -1542.89233, 1160.56531, 6.19640,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1723, -1539.96350, 1159.57642, 6.19640,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2315, -1541.70654, 1161.06030, 6.15590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2315, -1541.70654, 1162.01636, 6.15590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2011, -1533.95496, 1159.55249, 6.11750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2011, -1543.09387, 1164.82288, 6.11750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19173, -1538.39282, 1159.06421, 8.71994,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1540.63464, 1181.49231, 6.18130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1550.84326, 1179.81982, 6.18130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1551.24072, 1186.35144, 6.18130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1546.36157, 1184.28650, 6.18130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1543.83191, 1183.16516, 6.18130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1539.45923, 1185.92847, 6.18130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1535.28528, 1183.60229, 6.18130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1541.22485, 1151.32373, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1551.62610, 1157.26880, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1550.50232, 1151.91565, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1545.84424, 1151.11694, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1542.09961, 1157.34326, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1546.11719, 1154.04871, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1538.65894, 1153.68457, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1535.47449, 1157.30969, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, -1535.03687, 1151.17419, 6.18700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2011, -1542.97009, 1159.54187, 6.11750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2011, -1542.90942, 1173.59924, 6.11750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2011, -1533.65503, 1173.67615, 6.11750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2011, -1533.62317, 1164.78284, 6.11750,   0.00000, 0.00000, 0.00000);

	//Bushaltestellen - Map by Shirayama
	CreateDynamicObject(1257,1446.7002000,-2370.7002000,14.7000000,0.0000000,0.0000000,87.9950000); //object(bustopm) (1)
	CreateDynamicObject(1257,2845.2998000,-1905.0000000,11.3000000,0.0000000,0.0000000,0.0000000); //object(bustopm) (2)
	CreateDynamicObject(1257,2273.3999000,-2312.5000000,13.8000000,0.0000000,0.0000000,316.0000000); //object(bustopm) (3)
	CreateDynamicObject(1257,2921.4004000,-1318.2002000,11.2500000,0.0000000,0.0000000,9.9980000); //object(bustopm) (4)
	CreateDynamicObject(1257,2343.9004000,-1147.5000000,27.4000000,0.0000000,0.0000000,91.9940000); //object(bustopm) (5)
	CreateDynamicObject(1257,1401.0000000,-931.5996100,35.1000000,0.0000000,0.0000000,82.5000000); //object(bustopm) (6)
	CreateDynamicObject(1257,763.7000100,-1041.2000000,24.2000000,0.0000000,0.0000000,101.9910000); //object(bustopm) (7)
	CreateDynamicObject(1257,446.7002000,-1306.0000000,15.4500000,0.0000000,0.0000000,125.9860000); //object(bustopm) (8)
	CreateDynamicObject(1257,165.9003900,-1516.0000000,12.5400000,0.0000000,0.0000000,149.9850000); //object(bustopm) (9)
	CreateDynamicObject(1257,444.5996100,-1726.7002000,10.2500000,0.0000000,0.0000000,261.9800000); //object(bustopm) (10)
	CreateDynamicObject(1257,1003.7998000,-1813.7998000,14.4000000,0.0000000,0.0000000,251.9770000); //object(bustopm) (11)
	CreateDynamicObject(1257,1397.0996000,-2293.3994000,13.7000000,0.0000000,0.0000000,270.0000000); //object(bustopm) (12)
	CreateDynamicObject(1257,1433.5996000,-1739.5996000,13.7800000,0.0000000,0.0000000,270.0000000); //object(bustopm) (13)
	CreateDynamicObject(1257,1536.5000000,-1612.0000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(bustopm) (14)
	CreateDynamicObject(1257,1364.5000000,-1260.2998000,13.7500000,0.0000000,0.0000000,0.0000000); //object(bustopm) (15)
	CreateDynamicObject(1257,942.7002000,-1133.2998000,24.0800000,0.0000000,0.0000000,90.0000000); //object(bustopm) (16)
	CreateDynamicObject(1257,620.5000000,-1376.9004000,13.9000000,0.0000000,0.0000000,179.9950000); //object(bustopm) (17)
	CreateDynamicObject(1257,778.5996100,-1413.0000000,13.7800000,0.0000000,0.0000000,269.9950000); //object(bustopm) (18)
	CreateDynamicObject(1257,1158.7998000,-1412.7998000,13.8600000,0.0000000,0.0000000,269.9890000); //object(bustopm) (19)
	CreateDynamicObject(1257,421.5000000,-1574.4004000,26.3000000,0.0000000,0.0000000,89.9840000); //object(bustopm) (20)
	CreateDynamicObject(1257,612.5999800,-1683.8000000,16.4000000,0.0000000,0.0000000,263.9850000); //object(bustopm) (21)
	CreateDynamicObject(1257,1936.0000000,-2159.1001000,13.8000000,0.0000000,0.0000000,89.9790000); //object(bustopm) (22)
	CreateDynamicObject(1257,1319.7002000,-1826.0000000,13.7800000,0.0000000,0.0000000,359.9730000); //object(bustopm) (23)
	CreateDynamicObject(1257,1362.8000000,-1444.5000000,13.8000000,0.0000000,0.0000000,356.0000000); //object(bustopm) (24)
	CreateDynamicObject(1257,1068.5000000,-1874.2998000,13.7900000,0.0000000,0.0000000,0.0000000); //object(bustopm) (25)
	CreateDynamicObject(1257,1283.8000000,-1859.1000000,13.8000000,0.0000000,0.0000000,270.0000000); //object(bustopm) (27)
	CreateDynamicObject(1257,1461.8000000,-1382.2000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(bustopm) (28)
	CreateDynamicObject(1257,1579.2002000,-1310.9004000,17.7000000,0.0000000,0.0000000,270.0000000); //object(bustopm) (29)
	CreateDynamicObject(1257,1593.5996000,-1153.2998000,24.3800000,0.0000000,0.0000000,90.0000000); //object(bustopm) (30)
	CreateDynamicObject(1257,1430.4000000,-1026.9000000,24.1000000,0.0000000,0.0000000,90.0000000); //object(bustopm) (31)
	CreateDynamicObject(1257,1183.2002000,-1032.4004000,32.2000000,0.0000000,0.0000000,90.0000000); //object(bustopm) (33)
	CreateDynamicObject(1257,978.2998000,-1032.0000000,30.5900000,0.0000000,0.0000000,90.0000000); //object(bustopm) (34)
	CreateDynamicObject(1257,1219.7000000,-951.0999800,43.1000000,0.0000000,0.0000000,282.0000000); //object(bustopm) (35)
	CreateDynamicObject(1257,1459.7998000,-2202.5000000,13.9800000,0.0000000,0.0000000,269.9950000); //object(bustopm) (36)
	CreateDynamicObject(1257,1388.5000000,-2279.2998000,13.7600000,0.0000000,0.0000000,89.9890000); //object(bustopm) (37)
	CreateDynamicObject(1257,2254.2998000,-1150.4004000,26.7500000,0.0000000,0.0000000,255.9870000); //object(bustopm) (39)
	CreateDynamicObject(1257,2432.2002000,-1263.9004000,24.2500000,0.0000000,0.0000000,269.9840000); //object(bustopm) (40)
	CreateDynamicObject(1257,2504.2998000,-1428.9004000,28.8500000,0.0000000,0.0000000,179.9840000); //object(bustopm) (41)
	CreateDynamicObject(1257,2187.1006000,-1377.0996000,24.2500000,0.0000000,0.0000000,89.9840000); //object(bustopm) (42)
	CreateDynamicObject(1257,2009.2998000,-1333.5000000,24.2500000,0.0000000,0.0000000,89.9840000); //object(bustopm) (43)
	CreateDynamicObject(1257,2184.3999000,-1902.0000000,13.8000000,0.0000000,0.0000000,270.0000000); //object(bustopm) (44)
	CreateDynamicObject(1257,2511.9004000,-1740.2002000,13.7800000,0.0000000,0.0000000,269.9730000); //object(bustopm) (45)
	CreateDynamicObject(1257,2441.7002000,-1925.0996000,13.8000000,0.0000000,0.0000000,90.0000000); //object(bustopm) (46)
	CreateDynamicObject(1257,2706.6001000,-2024.4000000,13.8000000,0.0000000,0.0000000,179.9730000); //object(bustopm) (51)
	CreateDynamicObject(1257,2292.1001000,-2061.7000000,13.8000000,0.0000000,0.0000000,133.9730000); //object(bustopm) (52)
	CreateDynamicObject(1257,2150.7002000,-2203.0996000,13.7900000,0.0000000,0.0000000,133.9620000); //object(bustopm) (53)
	CreateDynamicObject(1257,2170.2000000,-2363.8000000,13.8000000,0.0000000,0.0000000,229.9670000); //object(bustopm) (54)

	//Garage - Map by Shirayama
	CreateDynamicObject(7245, 2389.59326, 2836.57544, -45.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19457, 12601.39063, 5821.23975, -3171.08569,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2823.59766, -47.50000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2827.09741, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2820.09912, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2816.60669, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2813.07690, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2830.58008, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2406.46558, 2847.55127, -47.98530,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2844.50830, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2402.97949, 2847.57153, -47.98530,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2841.02515, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2837.52856, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2834.07446, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2401.12500, 2847.99390, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2409.95044, 2847.55127, -47.98530,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2413.41821, 2847.53687, -47.93960,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2427.39844, 2847.55127, -48.13660,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2423.90063, 2847.55127, -47.85660,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2420.40454, 2847.55127, -47.85660,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2416.91626, 2847.55127, -47.85660,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2837.52856, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2813.07690, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2816.58667, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2820.07910, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2823.57764, -47.50000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2827.07739, -47.70300,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2830.56006, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2834.05444, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2841.02515, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2844.50830, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2427.50000, 2847.99390, -47.98530,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19454, 2402.95923, 2815.00000, -47.98530,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2849.14966, -47.98530, -47.98530,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2406.45215, 2815.00000, -47.98530,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2409.95044, 2815.00000, -47.98530,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2420.40454, 2815.00000, -47.85660,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2423.90063, 2815.00000, -47.85660,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2427.39844, 2815.00000, -48.13660,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2402.83398, 2819.90796, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2406.28247, 2819.90796, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2409.77563, 2819.94824, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2413.27319, 2819.90820, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2416.76147, 2819.90894, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2420.25439, 2819.90796, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2423.74878, 2819.90796, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2427.23462, 2819.90796, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2427.11987, 2829.53394, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2423.63306, 2829.53394, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2420.13330, 2829.53394, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2416.63330, 2829.53394, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2413.15259, 2829.53394, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2409.65332, 2829.57397, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2406.17334, 2829.53394, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2402.67358, 2829.53394, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2402.95532, 2839.15259, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2406.45703, 2839.15088, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2409.93579, 2839.15259, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2413.39575, 2839.15625, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2416.89526, 2839.15259, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2420.39697, 2839.15259, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2423.89795, 2839.15625, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2427.36816, 2839.13623, -43.80000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2424.89136, 2845.70508, -43.80000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 2415.27539, 2845.71021, -43.80000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 2405.65649, 2845.70679, -43.80000,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19461, 2418.49390, 2816.72583, -47.85660,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(19461, 2410.08447, 2816.70581, -47.85660,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(19442, 2417.84619, 2818.36255, -48.03660,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 2417.57837, 2818.36255, -44.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 2410.83813, 2818.36255, -48.03660,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 2411.17798, 2818.36255, -44.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3089, 2412.86475, 2818.44238, -47.66000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3089, 2415.85010, 2818.44238, -47.66000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19442, 2412.43872, 2818.36255, -48.03660,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 2412.77881, 2818.36255, -44.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 2414.37866, 2818.36255, -44.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 2415.97876, 2818.36255, -44.54000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19442, 2416.25879, 2818.36255, -48.03660,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(0, 2418.43384, 2816.70581, -47.85660,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(19461, 2410.26440, 2816.70581, -47.85660,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(3785, 2427.30176, 2823.67896, -45.29150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3785, 2427.34204, 2828.11523, -45.29150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3785, 2427.30225, 2832.83887, -45.29150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3785, 2427.30225, 2837.39990, -45.29150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3785, 2427.30225, 2842.17993, -45.29150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3785, 2427.30225, 2846.69995, -45.29150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3785, 23.00000, 2846.69995, -45.29150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3785, 2401.32007, 2846.51245, -45.29150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3785, 2401.32007, 2842.17993, -45.29150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3785, 2401.32007, 2837.93994, -45.29150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3785, 2401.32007, 2833.29883, -45.29150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3785, 2401.32007, 2828.75513, -45.29150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3785, 2401.32007, 2823.67896, -45.29150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2886, 2412.52002, 2818.40015, -47.36740,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19461, 2418.67383, 2816.72583, -47.85660,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(1650, 2426.37256, 2817.08789, -48.67750,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2057, 2425.12622, 2816.87329, -48.82660,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(2062, 2425.92310, 2816.53052, -48.42750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1327, 2402.95361, 2815.56641, -46.00000,   90.00000, 90.00000, 0.00000);
	CreateDynamicObject(2690, 2427.28125, 2821.51245, -46.83670,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(923, 2404.16284, 2815.60132, -48.11380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(942, 2422.04199, 2816.27148, -46.64570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1343, 2402.19995, 2815.54004, -48.24000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(14600, 2427.17871, 2816.40210, -47.48800,   0.00000, 0.00000, 360.00000);
	CreateDynamicObject(1650, 2426.42310, 2817.43359, -48.67750,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1650, 2425.99341, 2817.33667, -48.67750,   0.00000, 0.00000, 230.00000);
	CreateDynamicObject(1650, 2425.63135, 2815.88208, -48.67750,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19899, 2408.14380, 2815.65942, -48.97010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19943, 2410.00000, 2818.48853, -50.28070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 2418.63354, 2818.48853, -50.28070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19917, 2408.81055, 2817.45679, -48.97780,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(19903, 2406.03052, 2815.53955, -48.99410,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1244, 2426.98901, 2821.50415, -48.19830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1080, 2416.24414, 2847.37378, -47.14780,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1074, 2414.20020, 2847.37378, -46.49310,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1077, 2410.43188, 2847.37378, -45.40390,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1078, 2414.20020, 2847.37378, -45.40390,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1079, 2412.15698, 2847.37378, -47.14780,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1083, 2414.20020, 2847.37378, -47.57830,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1084, 2417.82861, 2847.37378, -45.40390,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1089, 2405.68384, 2815.54248, -43.92330,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(1097, 2411.21680, 2847.37378, -46.29540,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1098, 2417.09668, 2847.37378, -46.29540,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2254, 2409.95874, 2816.89746, -46.16000,   0.00000, 0.00000, 90270.00000);
	CreateDynamicObject(1893, 2413.81372, 2823.94385, -43.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 2413.81274, 2829.00000, -43.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 2413.81274, 2834.00000, -43.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 2413.81274, 2839.00000, -43.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 2413.81274, 2844.00000, -43.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3790, 2425.91992, 2816.71021, -49.34130,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(3790, 2425.91992, 2816.37036, -49.34130,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19454, 2412.70288, 2818.19360, -47.44630,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19454, 2416.19727, 2818.19360, -47.44630,   90.00000, 0.00000, 90.00000);

	//Schwarzmarkt - Map by Shirayama
	CreateDynamicObject(14399,-1631.4004000,-2236.2998000,30.3000000,0.0000000,0.0000000,92.0000000); //object(bar2)(1)
	CreateDynamicObject(1252,-1631.9165000,-2236.2317000,31.7200000,270.0000000,0.0000000,310.0000000); //object(barrelexpos)(1)
	CreateDynamicObject(1575,-1633.1000000,-2242.3999000,31.6200000,0.0000000,0.0000000,0.0000000); //object(drug_white)(1)
	CreateDynamicObject(1575,-1633.1000000,-2242.8000000,31.6200000,0.0000000,0.0000000,0.0000000); //object(drug_white)(2)
	CreateDynamicObject(1575,-1633.1000000,-2243.2000000,31.6200000,0.0000000,0.0000000,0.0000000); //object(drug_white)(3)
	CreateDynamicObject(1575,-1633.1000000,-2243.6001000,31.6200000,0.0000000,0.0000000,0.0000000); //object(drug_white)(4)
	CreateDynamicObject(1654,-1632.9000000,-2236.3999000,31.7500000,270.0000000,0.0000000,309.9980000); //object(dynamite)(3)
	CreateDynamicObject(1654,-1632.7000000,-2236.7000000,31.7500000,270.0000000,0.0000000,279.9980000); //object(dynamite)(4)
	CreateDynamicObject(2035,-1633.2000000,-2237.8999000,31.7000000,0.0000000,0.0000000,300.0000000); //object(cj_m16)(1)
	CreateDynamicObject(2035,-1633.1000000,-2245.1001000,31.7000000,0.0000000,0.0000000,249.9980000); //object(cj_m16)(2)
	CreateDynamicObject(2036,-1633.2000000,-2239.8999000,31.7000000,0.0000000,0.0000000,110.0000000); //object(cj_psg1)(1)
	CreateDynamicObject(2044,-1633.2000000,-2238.6001000,31.7000000,0.0000000,0.0000000,20.0000000); //object(cj_mp5k)(1)
	CreateDynamicObject(2044,-1632.8000000,-2245.7000000,31.7000000,0.0000000,0.0000000,19.9950000); //object(cj_mp5k)(2)
	CreateDynamicObject(2057,-1631.6000000,-2235.6001000,30.6000000,0.0000000,0.0000000,10.0000000); //object(flame_tins)(1)
	CreateDynamicObject(2057,-1632.4000000,-2235.5000000,30.6000000,0.0000000,0.0000000,229.9980000); //object(flame_tins)(2)
	CreateDynamicObject(2060,-1628.8000000,-2247.5000000,30.6000000,0.0000000,0.0000000,0.0000000); //object(cj_sandbag)(1)
	CreateDynamicObject(2690,-1628.8000000,-2235.6001000,30.8000000,0.0000000,0.0000000,60.0000000); //object(cj_fire_ext)(1)
	CreateDynamicObject(1550,-1632.1000000,-2237.0000000,30.9000000,0.0000000,0.0000000,310.0000000); //object(cj_money_bag)(1)
	CreateDynamicObject(1550,-1632.5000000,-2237.2000000,30.9000000,0.0000000,0.0000000,349.9960000); //object(cj_money_bag)(2)
	CreateDynamicObject(1279,-1632.9000000,-2247.5000000,31.7000000,0.0000000,0.0000000,0.0000000); //object(craigpackage)(1)
	CreateDynamicObject(1279,-1632.9004000,-2246.7998000,31.7000000,0.0000000,0.0000000,0.0000000); //object(craigpackage)(2)
	CreateDynamicObject(1242,-1633.0996000,-2238.8994000,31.8000000,0.0000000,0.0000000,0.0000000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1633.1000000,-2239.2000000,31.8000000,69.0000000,0.0000000,190.0000000); //object(bodyarmour)(2)
	CreateDynamicObject(1210,-1633.1000000,-2242.0000000,31.7600000,0.0000000,0.0000000,0.0000000); //object(briefcase)(1)
	CreateDynamicObject(1210,-1633.0996000,-2241.3994000,31.7700000,74.9980000,1.0000000,309.9960000); //object(briefcase)(2)
	CreateDynamicObject(1210,-1633.0996000,-2241.7998000,31.7500000,90.0000000,0.0000000,270.0000000); //object(briefcase)(3)
	CreateDynamicObject(1210,-1632.1000000,-2247.8000000,30.6000000,0.0000000,0.0000000,0.0000000); //object(briefcase)(4)
	CreateDynamicObject(1210,-1632.1000000,-2247.7000000,30.6000000,0.0000000,0.0000000,0.0000000); //object(briefcase)(5)
	CreateDynamicObject(1210,-1632.1000000,-2247.6001000,30.6000000,0.0000000,0.0000000,0.0000000); //object(briefcase)(6)
	CreateDynamicObject(1210,-1632.1000000,-2247.5000000,30.6000000,0.0000000,0.0000000,0.0000000); //object(briefcase)(7)
	CreateDynamicObject(1210,-1632.1000000,-2247.3999000,30.6000000,0.0000000,0.0000000,0.0000000); //object(briefcase)(8)
	CreateDynamicObject(1210,-1632.1000000,-2247.3000000,30.6000000,0.0000000,0.0000000,0.0000000); //object(briefcase)(9)
	CreateDynamicObject(3052,-1633.0000000,-2240.8999000,31.8000000,0.0000000,0.0000000,0.0000000); //object(db_ammo)(1)
	CreateDynamicObject(3015,-1629.0000000,-2236.8999000,30.5000000,0.0000000,0.0000000,0.0000000); //object(cr_cratestack)(1)
	CreateDynamicObject(3015,-1629.0000000,-2237.3000000,30.5000000,0.0000000,0.0000000,0.0000000); //object(cr_cratestack)(2)
	CreateDynamicObject(3015,-1629.0000000,-2237.7000000,30.5000000,0.0000000,0.0000000,0.0000000); //object(cr_cratestack)(3)
	CreateDynamicObject(2969,-1628.9000000,-2238.3000000,30.6000000,0.0000000,0.0000000,270.0000000); //object(level_ammobox)(1)
	CreateDynamicObject(2969,-1628.9000000,-2239.0000000,30.6000000,0.0000000,0.0000000,270.0000000); //object(level_ammobox)(2)
	CreateDynamicObject(2969,-1628.9000000,-2238.3000000,30.8000000,0.0000000,0.0000000,270.0000000); //object(level_ammobox)(3)
	CreateDynamicObject(2969,-1628.9000000,-2239.7000000,30.6000000,0.0000000,0.0000000,270.0000000); //object(level_ammobox)(4)
	CreateDynamicObject(2969,-1628.9000000,-2239.3000000,30.8000000,0.0000000,0.0000000,270.0000000); //object(level_ammobox)(5)
	CreateDynamicObject(2969,-1628.9000000,-2240.3999000,30.6000000,0.0000000,0.0000000,270.0000000); //object(level_ammobox)(6)
	CreateDynamicObject(2969,-1628.9000000,-2240.2000000,30.8000000,0.0000000,0.0000000,270.0000000); //object(level_ammobox)(7)
	CreateDynamicObject(2062,-1629.2000000,-2232.3000000,31.0000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(1)
	CreateDynamicObject(2062,-1629.2000000,-2233.1001000,31.0000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(2)
	CreateDynamicObject(2062,-1630.1000000,-2232.3000000,31.0000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(3)
	CreateDynamicObject(930,-1629.0996000,-2234.3994000,31.0000000,0.0000000,0.0000000,270.0000000); //object(o2_bottles)(1)
	CreateDynamicObject(1348,-1637.3000000,-2232.7000000,31.2000000,0.0000000,0.0000000,2.0000000); //object(cj_o2tanks)(1)
	CreateDynamicObject(2359,-1633.2000000,-2237.1001000,31.8000000,0.0000000,0.0000000,290.0000000); //object(ammo_box_c5)(1)
	CreateDynamicObject(2041,-1632.3000000,-2236.0000000,31.8000000,0.0000000,0.0000000,272.0000000); //object(ammo_box_m2)(1)
	CreateDynamicObject(2040,-1632.4000000,-2236.3999000,31.7000000,0.0000000,0.0000000,0.0000000); //object(ammo_box_m1)(1)
	CreateDynamicObject(1829,-1631.4000000,-2247.1001000,30.9000000,0.0000000,0.0000000,182.0000000); //object(man_safenew)(1)
	CreateDynamicObject(2332,-1635.9000000,-2232.6001000,30.9000000,0.0000000,0.0000000,0.0000000); //object(kev_safe)(1)
	CreateDynamicObject(2577,-1634.2000000,-2232.5000000,31.2000000,0.0000000,0.0000000,90.0000000); //object(cj_sex_counter)(1)
	CreateDynamicObject(2578,-1632.6000000,-2232.2000000,31.5000000,0.0000000,0.0000000,0.0000000); //object(cj_sex_shelf_1)(1)
	CreateDynamicObject(2582,-1637.7000000,-2237.5000000,31.3000000,0.0000000,0.0000000,92.0000000); //object(cj_sex_video_1)(1)
	CreateDynamicObject(2586,-1637.7000000,-2235.3999000,31.0000000,0.0000000,0.0000000,92.0000000); //object(cj_sex_counter2)(1)
	CreateDynamicObject(1485,-1637.8000000,-2236.3000000,31.5000000,0.0000000,0.0000000,0.0000000); //object(cj_ciggy)(1)
	CreateDynamicObject(14666,-1628.6000000,-2239.6001000,32.2000000,0.0000000,0.0000000,0.0000000); //object(cj_sex_counter03)(1)
	CreateDynamicObject(2060,-1628.6000000,-2245.8999000,30.6000000,0.0000000,0.0000000,299.9980000); //object(cj_sandbag)(2)
	CreateDynamicObject(2060,-1629.0000000,-2246.8000000,30.6000000,0.0000000,0.0000000,49.9960000); //object(cj_sandbag)(3)
	CreateDynamicObject(1661,-1632.9000000,-2240.7000000,33.7000000,0.0000000,0.0000000,0.0000000); //object(htl_fan_rotate_dy)(1)
	CreateDynamicObject(3013,-1628.9000000,-2237.3000000,31.2000000,0.0000000,0.0000000,0.0000000); //object(cr_ammobox)(1)
	CreateDynamicObject(3013,-1628.9000000,-2237.7000000,31.2000000,0.0000000,0.0000000,0.0000000); //object(cr_ammobox)(2)
	CreateDynamicObject(3013,-1628.9000000,-2242.8000000,31.6000000,0.0000000,0.0000000,0.0000000); //object(cr_ammobox)(3)
	CreateDynamicObject(3013,-1630.7000000,-2247.6001000,30.6000000,0.0000000,0.0000000,0.0000000); //object(cr_ammobox)(4)
	CreateDynamicObject(3013,-1630.3000000,-2247.6001000,30.6000000,0.0000000,0.0000000,0.0000000); //object(cr_ammobox)(5)
	CreateDynamicObject(3013,-1630.7000000,-2247.2000000,30.6000000,0.0000000,0.0000000,0.0000000); //object(cr_ammobox)(6)
	CreateDynamicObject(3013,-1630.3000000,-2247.2000000,30.6000000,0.0000000,0.0000000,0.0000000); //object(cr_ammobox)(7)
	CreateDynamicObject(922,-1628.5996000,-2243.0000000,31.4000000,0.0000000,0.0000000,272.0000000); //object(packing_carates1)(1)
	CreateDynamicObject(2060,-1629.5000000,-2246.1001000,30.6000000,0.0000000,0.0000000,229.9910000); //object(cj_sandbag)(3)
	CreateDynamicObject(1242,-1629.8000000,-2247.2000000,30.6500000,0.0000000,0.0000000,34.0000000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1629.5000000,-2247.6001000,30.6500000,0.0000000,0.0000000,33.9990000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1628.3000000,-2247.2000000,31.8000000,0.0000000,0.0000000,93.9990000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1628.3000000,-2246.7000000,31.8000000,0.0000000,0.0000000,93.9990000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1628.3000000,-2246.2000000,31.8000000,0.0000000,0.0000000,93.9990000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1628.4000000,-2245.7000000,31.8000000,0.0000000,0.0000000,93.9990000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1628.4000000,-2245.1001000,31.8000000,0.0000000,0.0000000,93.9940000); //object(bodyarmour)(1)
	CreateDynamicObject(1242,-1630.0000000,-2247.6001000,30.6500000,0.0000000,0.0000000,333.9970000); //object(bodyarmour)(1)
	CreateDynamicObject(3014,-1631.8000000,-2232.3000000,30.7000000,0.0000000,0.0000000,0.0000000); //object(cr_guncrate)(1)
	CreateDynamicObject(3014,-1631.0000000,-2232.3000000,30.7000000,0.0000000,0.0000000,0.0000000); //object(cr_guncrate)(2)
	CreateDynamicObject(3014,-1631.5000000,-2232.3999000,31.2000000,0.0000000,0.0000000,0.0000000); //object(cr_guncrate)(3)
	CreateDynamicObject(2912,-1637.8000000,-2233.7000000,30.5000000,0.0000000,0.0000000,0.0000000); //object(temp_crate1)(1)
	CreateDynamicObject(2912,-1637.8000000,-2233.7000000,31.2000000,0.0000000,0.0000000,0.0000000); //object(temp_crate1)(2)
	CreateDynamicObject(925,-1639.2000000,-2247.1001000,31.5000000,0.0000000,0.0000000,272.0000000); //object(rack2)(1)
	CreateDynamicObject(1410,-1634.6000000,-2248.3000000,32.6000000,0.0000000,0.0000000,180.0000000); //object(dyn_f_r_wood_1b)(1)
	CreateDynamicObject(1410,-1636.5000000,-2231.7000000,32.6000000,0.0000000,0.0000000,2.0000000); //object(dyn_f_r_wood_1b)(2)
	CreateDynamicObject(1410,-1632.9004000,-2231.5000000,32.6000000,0.0000000,0.0000000,2.0000000); //object(dyn_f_r_wood_1b)(3)
	CreateDynamicObject(1410,-1638.3000000,-2235.0000000,32.6000000,0.0000000,0.0000000,272.0000000); //object(dyn_f_r_wood_1b)(4)
	CreateDynamicObject(1410,-1630.7000000,-2248.1001000,32.6000000,0.0000000,0.0000000,179.9950000); //object(dyn_f_r_wood_1b)(5)
	CreateDynamicObject(1410,-1628.0000000,-2244.5000000,32.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_f_r_wood_1b)(6)
	CreateDynamicObject(1410,-1628.2998000,-2234.3994000,32.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_f_r_wood_1b)(7)
	CreateDynamicObject(1410,-1637.8000000,-2245.0000000,32.6000000,0.0000000,0.0000000,272.0000000); //object(dyn_f_r_wood_1b)(8)
	CreateDynamicObject(1097,-1628.7000000,-2236.2000000,32.5000000,0.0000000,0.0000000,190.0000000); //object(wheel_gn4)(1)
	CreateDynamicObject(1083,-1628.6000000,-2237.7000000,32.5000000,0.0000000,0.0000000,180.0000000); //object(wheel_lr2)(1)
	CreateDynamicObject(1010,-1632.9000000,-2246.1001000,31.7000000,0.0000000,0.0000000,332.0000000); //object(nto_b_tw)(1)
	CreateDynamicObject(1009,-1632.6000000,-2245.1001000,31.7000000,0.0000000,0.0000000,90.0000000); //object(nto_b_s)(1)
	CreateDynamicObject(1362,-1639.4000000,-2232.8999000,31.1000000,0.0000000,0.0000000,0.0000000); //object(cj_firebin)(1)
	CreateDynamicObject(1362,-1639.4000000,-2233.8999000,31.1000000,0.0000000,0.0000000,0.0000000); //object(cj_firebin)(2)
	CreateDynamicObject(2041,-1633.3000000,-2238.2000000,31.9000000,0.0000000,0.0000000,30.0000000); //object(ammo_box_m2)(2)
	CreateDynamicObject(363,-1628.4000000,-2247.7000000,31.9000000,0.0000000,0.0000000,180.0000000); //object(1)
	CreateDynamicObject(363,-1628.7000000,-2247.7000000,31.9000000,0.0000000,0.0000000,179.9950000); //object(2)
	CreateDynamicObject(363,-1628.2000000,-2247.3999000,31.9000000,0.0000000,0.0000000,229.9950000); //object(3)
	CreateDynamicObject(363,-1628.2000000,-2247.3000000,32.5000000,0.0000000,0.0000000,239.9930000); //object(4)
	CreateDynamicObject(359,-1628.3000000,-2246.3000000,31.0000000,0.0000000,0.0000000,270.0000000); //object(5)
	CreateDynamicObject(348,-1628.2000000,-2246.8999000,32.4000000,0.0000000,0.0000000,270.0000000); //object(6)
	CreateDynamicObject(348,-1628.3000000,-2246.3999000,32.4000000,0.0000000,0.0000000,270.0000000); //object(7)
	CreateDynamicObject(348,-1628.3000000,-2245.8999000,32.4000000,0.0000000,0.0000000,270.0000000); //object(8)
	CreateDynamicObject(348,-1628.3000000,-2245.3999000,32.4000000,0.0000000,0.0000000,270.0000000); //object(9)
	CreateDynamicObject(349,-1628.2000000,-2246.8000000,32.9000000,0.0000000,0.0000000,274.0000000); //object(10)
	CreateDynamicObject(2901,-1632.3000000,-2238.7000000,30.9000000,0.0000000,0.0000000,270.0000000); //object(kmb_marijuana)(1)
	CreateDynamicObject(2901,-1628.2000000,-2245.7000000,33.0000000,0.0000000,0.0000000,270.0000000); //object(kmb_marijuana)(2)
	CreateDynamicObject(1933,-1632.7000000,-2243.8999000,31.7000000,0.0000000,0.0000000,0.0000000); //object(chip_stack16)(1)
	CreateDynamicObject(1933,-1632.9000000,-2243.8999000,31.7000000,0.0000000,0.0000000,0.0000000); //object(chip_stack16)(2)
	CreateDynamicObject(1933,-1633.1000000,-2243.8999000,31.7000000,0.0000000,0.0000000,0.0000000); //object(chip_stack16)(3)
	CreateDynamicObject(1933,-1633.0000000,-2244.0000000,31.7000000,0.0000000,0.0000000,0.0000000); //object(chip_stack16)(4)
	CreateDynamicObject(1933,-1632.8000000,-2244.0000000,31.7000000,0.0000000,0.0000000,0.0000000); //object(chip_stack16)(5)
	CreateDynamicObject(1933,-1632.9000000,-2244.1001000,31.7000000,0.0000000,0.0000000,0.0000000); //object(chip_stack16)(6)
	CreateDynamicObject(2901,-1628.2000000,-2247.1001000,33.0000000,0.0000000,0.0000000,270.0000000); //object(kmb_marijuana)(3)
	CreateDynamicObject(2901,-1629.3000000,-2247.6001000,32.4000000,0.0000000,0.0000000,180.0000000); //object(kmb_marijuana)(4)
	CreateDynamicObject(3026,-1629.1000000,-2247.8000000,31.8000000,0.0000000,0.0000000,174.0000000); //object(para_pack)(1)
	CreateDynamicObject(3026,-1629.7000000,-2247.8000000,31.8000000,0.0000000,0.0000000,173.9960000); //object(para_pack)(2)
	CreateDynamicObject(3111,-1631.8000000,-2246.2000000,30.5000000,0.0000000,0.0000000,182.0000000); //object(st_arch_plan)(1)
	CreateDynamicObject(363,-1634.7402300,-2246.1621100,31.1775900,0.0000000,0.0000000,0.0000000); //object(11)
	CreateDynamicObject(363,-1633.4000000,-2244.0000000,31.9000000,0.0000000,0.0000000,330.0000000); //object(12)
	CreateDynamicObject(363,-1633.2000000,-2244.3999000,31.9000000,0.0000000,0.0000000,9.9960000); //object(13)
	CreateDynamicObject(363,-1632.7000000,-2244.1001000,31.9000000,0.0000000,0.0000000,269.9920000); //object(14)
	CreateDynamicObject(363,-1633.3000000,-2244.5000000,31.9000000,0.0000000,0.0000000,269.9890000); //object(15)
	CreateDynamicObject(364,-1631.3000000,-2247.2000000,31.4000000,0.0000000,0.0000000,330.0000000); //object(16)
	CreateDynamicObject(2967,-1632.7000000,-2244.6001000,31.7000000,0.0000000,0.0000000,320.0000000); //object(mobile1993a)(1)
	CreateDynamicObject(2967,-1633.4000000,-2244.3999000,31.7000000,0.0000000,0.0000000,359.9990000); //object(mobile1993a)(2)
	CreateDynamicObject(2967,-1633.2000000,-2246.3000000,31.7000000,0.0000000,0.0000000,289.9950000); //object(mobile1993a)(3)
	CreateDynamicObject(2967,-1632.9000000,-2245.3999000,31.7000000,0.0000000,0.0000000,249.9900000); //object(mobile1993a)(4)
	CreateDynamicObject(2967,-1631.5000000,-2236.6001000,31.7000000,0.0000000,0.0000000,249.9880000); //object(mobile1993a)(5)
	CreateDynamicObject(2967,-1631.4000000,-2236.1001000,31.7000000,0.0000000,0.0000000,249.9880000); //object(mobile1993a)(6)
	CreateDynamicObject(2967,-1631.9000000,-2236.6001000,31.7000000,0.0000000,0.0000000,299.9880000); //object(mobile1993a)(7)
	CreateDynamicObject(2967,-1637.6000000,-2236.1001000,31.5000000,0.0000000,0.0000000,59.9870000); //object(mobile1993a)(8)
	CreateDynamicObject(2967,-1637.7000000,-2234.5000000,31.5000000,0.0000000,0.0000000,99.9850000); //object(mobile1993a)(9)
	CreateDynamicObject(2966,-1637.7000000,-2235.3000000,31.5000000,0.0000000,0.0000000,0.0000000); //object(mobile1993b)(1)
	CreateDynamicObject(2966,-1631.3000000,-2236.5000000,31.7000000,0.0000000,0.0000000,0.0000000); //object(mobile1993b)(2)
	CreateDynamicObject(2966,-1631.5000000,-2236.3999000,31.7000000,0.0000000,0.0000000,24.0000000); //object(mobile1993b)(3)
	CreateDynamicObject(1279,-1629.1000000,-2247.8000000,32.8000000,0.0000000,0.0000000,0.0000000); //object(craigpackage)(2)
	CreateDynamicObject(964,-1636.2000000,-2246.3000000,30.5000000,0.0000000,0.0000000,182.0000000); //object(cj_metal_crate)(1)
	CreateDynamicObject(964,-1634.7000000,-2246.2000000,30.5000000,0.0000000,0.0000000,184.0000000); //object(cj_metal_crate)(1)

	//PayNSpray - Map by Shirayama
	CreateDynamicObject(3055,2394.8000000,1483.4000000,12.0000000,0.0000000,90.0000000,0.0000000); //object(kmb_shutter) (2)
	CreateDynamicObject(3055,2389.8000000,1483.4000000,12.0000000,0.0000000,90.0000000,0.0000000); //object(kmb_shutter) (3)
	CreateDynamicObject(3055,-2427.5000000,1028.2000000,51.6000000,0.0000000,90.0000000,0.0000000); //object(kmb_shutter) (4)
	CreateDynamicObject(3055,-2422.5000000,1028.2000000,51.6000000,0.0000000,90.0000000,0.0000000); //object(kmb_shutter) (5)
	CreateDynamicObject(3055,-1901.9000000,277.7999900,42.2000000,0.0000000,90.0000000,0.0000000); //object(kmb_shutter) (6)
	CreateDynamicObject(3055,-99.9000000,1111.5000000,20.9000000,0.0000000,0.0000000,0.0000000); //object(kmb_shutter) (7)
	CreateDynamicObject(3055,-1906.9004000,277.7999900,42.2000000,0.0000000,90.0000000,0.0000000); //object(kmb_shutter) (8)
	CreateDynamicObject(3055,1968.5000000,2162.8000000,12.0000000,0.0000000,0.0000000,270.0000000); //object(kmb_shutter) (9)
	CreateDynamicObject(3055,-1420.8000000,2591.2000000,57.0000000,0.0000000,0.0000000,0.0000000); //object(kmb_shutter) (10)
	CreateDynamicObject(3051,-1421.4000000,2591.2000000,60.6000000,0.0000000,0.0000000,136.5000000); //object(lift_dr) (1)
	CreateDynamicObject(3051,-1423.7000000,2591.2000000,59.3600000,0.0000000,0.0000000,136.5000000); //object(lift_dr) (2)
	CreateDynamicObject(3051,-1422.5000000,2591.2000000,59.3600000,0.0000000,0.0000000,136.5000000); //object(lift_dr) (3)
	CreateDynamicObject(3051,-1420.2000000,2591.2000000,60.6000000,0.0000000,0.0000000,136.5000000); //object(lift_dr) (4)
	CreateDynamicObject(3051,-1419.0000000,2591.2000000,60.6000000,0.0000000,0.0000000,136.5000000); //object(lift_dr) (5)
	CreateDynamicObject(3051,-1417.8000000,2591.2000000,59.3600000,0.0000000,0.0000000,136.5000000); //object(lift_dr) (6)
	CreateDynamicObject(3051,-1416.8000000,2591.2000000,59.3000000,0.0000000,0.0000000,136.5000000); //object(lift_dr) (7)
	CreateDynamicObject(3051,-103.6000000,1111.4000000,23.2780000,0.0000000,0.0000000,136.3500000); //object(lift_dr) (8)
	CreateDynamicObject(3051,-102.4000000,1111.4000000,23.2780000,0.0000000,0.0000000,136.3500000); //object(lift_dr) (9)
	CreateDynamicObject(3051,-101.2000000,1111.4000000,24.5000000,0.0000000,0.0000000,136.3460000); //object(lift_dr) (10)
	CreateDynamicObject(3051,-100.0000000,1111.4000000,24.5000000,0.0000000,0.0000000,136.3460000); //object(lift_dr) (11)
	CreateDynamicObject(3051,-98.8000000,1111.4000000,24.5000000,0.0000000,0.0000000,136.3460000); //object(lift_dr) (12)
	CreateDynamicObject(3051,-97.6000000,1111.4000000,23.2780000,0.0000000,0.0000000,136.3460000); //object(lift_dr) (13)
	CreateDynamicObject(3051,-96.4000000,1111.4000000,23.2780000,0.0000000,0.0000000,136.3460000); //object(lift_dr) (14)
	CreateDynamicObject(3055,2071.6001000,-1831.9000000,14.7000000,0.0000000,0.0000000,270.0000000); //object(kmb_shutter) (12)
	CreateDynamicObject(3055,1025.3000000,-1029.4000000,33.3000000,0.0000000,0.0000000,0.0000000); //object(kmb_shutter) (13)
	CreateDynamicObject(3055,488.3999900,-1735.2000000,12.3000000,0.0000000,359.0000000,352.0000000); //object(kmb_shutter) (14)
	CreateDynamicObject(3055,720.2000100,-462.3999900,16.8000000,0.0000000,0.0000000,0.0000000); //object(kmb_shutter) (15)

	//Parkplatz Zivispawn + Busfahrer Base - Map by Shirayama
	CreateDynamicObject(982, 1538.25000, -2309.30005, 13.20000,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(982, 1525.40002, -2340.10010, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(984, 1538.29004, -2328.50000, 13.16000,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(983, 1538.30005, -2336.50000, 13.20000,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(982, 1576.50000, -2368.25000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1550.90002, -2368.22998, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1525.30005, -2368.19995, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1499.69995, -2368.19995, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1484.37000, -2355.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1500.30005, -2340.19995, 13.20000,   0.00000, 0.00000, 272.00000);
	CreateDynamicObject(983, 1487.59998, -2341.80005, 13.20000,   0.00000, 0.00000, 279.00000);
	CreateDynamicObject(983, 1493.90002, -2340.80005, 13.20000,   0.00000, 0.00000, 278.99799);
	CreateDynamicObject(983, 1511.00000, -2340.09961, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1506.20020, -2340.09961, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1488.50000, -2368.19995, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1361, 1484.80005, -2368.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1484.40002, -2342.30005, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1538.40002, -2340.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1562.90002, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1556.50000, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1566.09998, -2309.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1566.09998, -2323.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1579.00000, -2337.35010, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1361, 1566.30005, -2337.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6296, 1526.59998, -2328.60010, 14.80000,   0.00000, 0.00000, 322.00000);
	CreateDynamicObject(10183, 1454.79395, -2446.03125, 12.46998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1535.00000, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1533.40002, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1529.90002, -2299.60010, 13.20000,   0.00000, 0.00000, 354.00000);
	CreateDynamicObject(983, 1529.30005, -2304.39990, 13.20000,   0.00000, 0.00000, 351.99600);
	CreateDynamicObject(983, 1527.80005, -2310.60010, 13.20000,   0.00000, 0.00000, 339.79999);
	CreateDynamicObject(984, 1504.30005, -2337.30005, 13.20000,   0.00000, 0.00000, 295.79999);
	CreateDynamicObject(983, 1512.50000, -2332.39990, 13.20000,   0.00000, 0.00000, 311.00000);
	CreateDynamicObject(983, 1526.69995, -2313.60010, 13.20000,   0.00000, 0.00000, 339.79999);
	CreateDynamicObject(1361, 1525.00000, -2317.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1515.40002, -2330.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1501.50000, -2339.80005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1515.19995, -2339.60010, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1536.50000, -2338.69995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.30005, -2332.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1529.09998, -2339.39990, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.50000, -2325.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.40002, -2318.60010, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.00000, -2311.80005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.09998, -2304.80005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.30005, -2297.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1522.09998, -2339.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1508.59998, -2339.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1531.30005, -2297.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9833, 1518.50000, -2336.39990, 15.70000,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(9833, 1531.90002, -2319.69995, 15.70000,   0.00000, 0.00000, 337.99701);
	CreateDynamicObject(3660, 1535.09998, -2307.80005, 15.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.59998, -2299.19995, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.40002, -2304.69995, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.19995, -2310.39990, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.00000, -2316.00000, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1360, 1533.40002, -2302.00000, 13.30000,   0.00000, 0.00000, 358.00000);
	CreateDynamicObject(1360, 1533.19995, -2307.60010, 13.30000,   0.00000, 0.00000, 357.99500);
	CreateDynamicObject(1360, 1533.09998, -2313.19995, 13.30000,   0.00000, 0.00000, 357.99500);
	CreateDynamicObject(871, 1517.30005, -2335.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1513.59998, -2334.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1515.90002, -2338.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1506.80005, -2338.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1515.59998, -2336.19995, 12.80000,   0.00000, 0.00000, 298.00000);
	CreateDynamicObject(870, 1508.30005, -2337.80005, 12.80000,   0.00000, 0.00000, 7.99900);
	CreateDynamicObject(870, 1512.19995, -2335.50000, 12.80000,   0.00000, 0.00000, 315.99799);
	CreateDynamicObject(859, 1513.59998, -2338.89990, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1514.09998, -2336.00000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1515.69995, -2334.89990, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1515.69995, -2332.10010, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1510.59998, -2336.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1509.69995, -2336.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1507.09998, -2339.00000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1504.50000, -2339.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1510.19995, -2338.00000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1517.69995, -2334.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(817, 1513.90002, -2337.39990, 13.00000,   0.00000, 0.00000, 280.00000);
	CreateDynamicObject(817, 1505.69995, -2338.19995, 13.00000,   0.00000, 0.00000, 279.99799);
	CreateDynamicObject(817, 1517.69995, -2337.80005, 13.00000,   0.00000, 0.00000, 279.99799);
	CreateDynamicObject(817, 1511.69995, -2335.39990, 13.00000,   0.00000, 0.00000, 259.99799);
	CreateDynamicObject(817, 1514.50000, -2333.19995, 13.00000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1509.80005, -2336.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1512.09998, -2334.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1515.19995, -2332.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1516.59998, -2330.30005, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1503.50000, -2338.89990, 12.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(871, 1513.59998, -2338.89990, 12.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(870, 1505.09998, -2338.89990, 12.80000,   0.00000, 0.00000, 110.00000);
	CreateDynamicObject(869, 1519.80005, -2337.39990, 13.00000,   0.00000, 0.00000, 328.50000);
	CreateDynamicObject(870, 1519.19995, -2335.39990, 12.80000,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(871, 1517.80005, -2333.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1519.30005, -2338.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1521.50000, -2337.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1343, 1535.09998, -2297.50000, 13.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 1566.12000, -2350.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1566.11951, -2361.50000, 13.16000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1566.09998, -2368.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1539.80005, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(8843, 1545.02002, -2307.99121, 12.56130,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(8843, 1551.16235, -2307.99121, 12.56130,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3660, 1577.69995, -2342.19995, 15.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3660, 1586.80005, -2353.19995, 15.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3660, 1569.15002, -2352.89990, 15.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3660, 1577.69995, -2364.00000, 15.20000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(983, 1574.69995, -2347.30005, 13.20000,   0.00000, 0.00000, 300.00000);
	CreateDynamicObject(983, 1571.90002, -2352.10010, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1571.90002, -2353.69995, 13.20000,   0.00000, 0.00000, 359.99500);
	CreateDynamicObject(983, 1574.69995, -2358.50000, 13.20000,   0.00000, 0.00000, 59.99500);
	CreateDynamicObject(983, 1580.30005, -2347.30005, 13.20000,   0.00000, 0.00000, 59.99100);
	CreateDynamicObject(983, 1580.30005, -2358.50000, 13.20000,   0.00000, 0.00000, 300.00000);
	CreateDynamicObject(983, 1583.09998, -2352.10010, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1583.09998, -2353.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6965, 1577.69995, -2352.89990, 15.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1574.40002, -2350.30005, 13.00000,   0.00000, 0.00000, 352.00000);
	CreateDynamicObject(869, 1579.40002, -2356.69995, 13.00000,   0.00000, 0.00000, 21.99600);
	CreateDynamicObject(870, 1576.90002, -2347.80005, 12.80000,   0.00000, 0.00000, 340.00000);
	CreateDynamicObject(870, 1574.19995, -2353.00000, 12.80000,   0.00000, 0.00000, 309.99899);
	CreateDynamicObject(870, 1576.69995, -2357.30005, 12.80000,   0.00000, 0.00000, 39.99600);
	CreateDynamicObject(870, 1581.19995, -2355.00000, 12.80000,   0.00000, 0.00000, 79.99600);
	CreateDynamicObject(871, 1574.30005, -2355.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1581.90002, -2353.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1578.90002, -2348.60010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1580.69995, -2350.69995, 13.00000,   0.00000, 0.00000, 280.00000);
	CreateDynamicObject(869, 1574.69995, -2355.60010, 13.00000,   0.00000, 0.00000, 290.00000);
	CreateDynamicObject(870, 1578.59998, -2348.80005, 12.80000,   0.00000, 0.00000, 300.00000);
	CreateDynamicObject(759, 1577.00000, -2351.00000, 12.60000,   0.00000, 0.00000, 326.00000);
	CreateDynamicObject(759, 1577.09998, -2354.89990, 12.60000,   0.00000, 0.00000, 85.99700);
	CreateDynamicObject(759, 1579.69995, -2352.89990, 12.60000,   0.00000, 0.00000, 207.99500);
	CreateDynamicObject(759, 1575.59998, -2352.69995, 12.60000,   0.00000, 0.00000, 207.99300);
	CreateDynamicObject(759, 1579.09998, -2351.30005, 12.60000,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(759, 1578.80005, -2354.60010, 12.60000,   0.00000, 0.00000, 329.99600);
	CreateDynamicObject(673, 1582.50000, -2345.60010, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1582.50000, -2360.39990, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1572.30005, -2345.80005, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1572.40002, -2360.50000, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1574.80005, -2348.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1575.80005, -2357.89990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1577.59998, -2358.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1581.80005, -2356.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1582.00000, -2350.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1574.09998, -2352.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1575.59998, -2350.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1581.50000, -2351.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1579.30005, -2356.39990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1577.09998, -2348.19995, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1574.59998, -2353.30005, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1538.19995, -2263.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1538.19995, -2246.10010, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1525.40002, -2232.60010, 13.20000,   0.00000, 0.00000, 88.90000);
	CreateDynamicObject(982, 1509.40002, -2232.30005, 13.20000,   0.00000, 0.00000, 88.89600);
	CreateDynamicObject(983, 1487.59998, -2231.00000, 13.20000,   0.00000, 0.00000, 262.00000);
	CreateDynamicObject(983, 1493.90002, -2231.80005, 13.20000,   0.00000, 0.00000, 261.99600);
	CreateDynamicObject(982, 1484.50000, -2217.60010, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1497.30005, -2204.77002, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1522.90002, -2204.77002, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1548.50000, -2204.77002, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1574.09998, -2204.77002, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1590.09998, -2204.77002, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1361, 1484.50000, -2230.50000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1484.59998, -2204.80005, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1538.09998, -2233.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1535.00000, -2276.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1533.40002, -2276.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1566.09998, -2263.60010, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1566.09961, -2238.00000, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1566.09998, -2218.80005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1566.09998, -2205.39990, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1578.90002, -2237.10010, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1562.90002, -2276.39990, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1536.59998, -2276.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1561.29980, -2276.39941, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1502.69995, -2234.69995, 13.20000,   0.00000, 0.00000, 69.00000);
	CreateDynamicObject(983, 1499.71497, -2233.55664, 13.20000,   0.00000, 0.00000, 69.00000);
	CreateDynamicObject(713, 1527.40002, -2243.19995, 12.50000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(673, 1496.59998, -2232.19995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1530.50000, -2276.19995, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.80005, -2276.10010, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.80005, -2264.69995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.80005, -2243.69995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.40039, -2233.89941, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1528.69995, -2233.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1518.30005, -2233.19995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.50000, -2253.80005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1508.00000, -2232.89990, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(968, 1547.59998, -2276.30005, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8041, 1548.79980, -2276.70020, 18.30000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(968, 1550.04004, -2276.30005, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(966, 1547.80005, -2276.30005, 12.60000,   0.00000, 0.00000, 359.99500);
	CreateDynamicObject(966, 1549.90002, -2276.30005, 12.60000,   0.00000, 0.00000, 179.99500);
	CreateDynamicObject(4641, 1548.90002, -2276.60010, 14.10000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(6965, 1577.00391, -2220.60376, 16.18000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3660, 1525.80005, -2234.89990, 15.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3660, 1534.90002, -2265.50000, 15.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3660, 1534.90002, -2245.89990, 15.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3660, 1516.69995, -2235.50000, 15.20000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1361, 1506.30005, -2236.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1526.69995, -2243.39990, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1526.90002, -2241.89990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1527.19995, -2244.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1528.80005, -2244.19995, 12.80000,   0.00000, 0.00000, 328.00000);
	CreateDynamicObject(871, 1528.09998, -2241.60010, 12.80000,   0.00000, 0.00000, 337.99701);
	CreateDynamicObject(869, 1528.69995, -2242.80005, 13.00000,   0.00000, 0.00000, 252.00000);
	CreateDynamicObject(1368, 1510.40002, -2236.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1368, 1515.59998, -2236.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1368, 1520.50000, -2236.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1368, 1525.69995, -2236.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1368, 1531.19995, -2236.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1368, 1533.09998, -2239.89990, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1368, 1533.09998, -2245.10010, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1368, 1533.09998, -2250.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1368, 1533.09998, -2255.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1368, 1533.09998, -2260.60010, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1368, 1533.09998, -2265.69995, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1368, 1533.09998, -2270.80005, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1361, 1513.00000, -2236.69995, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1518.09998, -2236.69995, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1523.09998, -2236.60010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1528.40002, -2236.69995, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.19995, -2237.50000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.09998, -2242.60010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.00000, -2247.89990, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.09998, -2253.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.00000, -2258.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.00000, -2263.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.00000, -2268.30005, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1533.00000, -2273.50000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1343, 1533.09998, -2274.69995, 13.30000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1343, 1507.90002, -2236.60010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(997, 1506.40002, -2236.69995, 12.50000,   0.00000, 0.00000, 326.00000);
	CreateDynamicObject(997, 1509.50000, -2238.80005, 12.50000,   0.00000, 0.00000, 325.99701);
	CreateDynamicObject(997, 1529.50000, -2273.10010, 12.50000,   0.00000, 0.00000, 280.00000);
	CreateDynamicObject(997, 1528.90002, -2269.39990, 12.50000,   0.00000, 0.00000, 279.99799);
	CreateDynamicObject(997, 1528.30005, -2265.69995, 12.50000,   0.00000, 0.00000, 279.99799);
	CreateDynamicObject(870, 1570.59998, -2207.19995, 12.80000,   0.00000, 0.00000, 350.00000);
	CreateDynamicObject(870, 1569.09998, -2212.69995, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1574.59998, -2208.60010, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1581.80005, -2207.30005, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1585.50000, -2210.39990, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1568.80005, -2229.19995, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1570.80005, -2234.39990, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1576.30005, -2232.10010, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1581.80005, -2234.50000, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1584.59998, -2230.19995, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(870, 1587.40002, -2226.50000, 12.80000,   0.00000, 0.00000, 349.99701);
	CreateDynamicObject(869, 1572.59998, -2231.30005, 13.00000,   0.00000, 0.00000, 340.00000);
	CreateDynamicObject(869, 1581.00000, -2231.19995, 13.00000,   0.00000, 0.00000, 19.99900);
	CreateDynamicObject(869, 1576.59998, -2235.10010, 13.00000,   0.00000, 0.00000, 349.99500);
	CreateDynamicObject(869, 1578.09998, -2207.80005, 13.00000,   0.00000, 0.00000, 269.99100);
	CreateDynamicObject(869, 1571.50000, -2210.19995, 13.00000,   0.00000, 0.00000, 209.98900);
	CreateDynamicObject(869, 1585.09998, -2207.19995, 13.00000,   0.00000, 0.00000, 169.98700);
	CreateDynamicObject(869, 1586.80005, -2213.80005, 13.00000,   0.00000, 0.00000, 89.98600);
	CreateDynamicObject(869, 1586.90002, -2229.39990, 13.00000,   0.00000, 0.00000, 89.98400);
	CreateDynamicObject(673, 1568.00000, -2206.60010, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1568.19995, -2235.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1586.00000, -2206.50000, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1585.90002, -2234.89990, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1568.19995, -2209.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1575.50000, -2206.60010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1573.19995, -2207.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1580.19995, -2209.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1580.19995, -2206.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1587.80005, -2209.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1582.00000, -2209.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1584.59998, -2209.39990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1586.50000, -2232.10010, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1583.40002, -2232.39990, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1578.40002, -2232.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1579.40002, -2235.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1583.40002, -2235.50000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1573.30005, -2234.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1569.50000, -2232.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1567.90002, -2226.89990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1575.09998, -2231.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1570.40002, -2229.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1571.90002, -2232.89990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1574.50000, -2233.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1579.80005, -2233.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1585.00000, -2233.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1567.59998, -2232.89990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1567.50000, -2208.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1567.59998, -2214.00000, 12.80000,   0.00000, 0.00000, 330.00000);
	CreateDynamicObject(871, 1567.50000, -2230.10010, 12.80000,   0.00000, 0.00000, 329.99600);
	CreateDynamicObject(871, 1587.40002, -2235.10010, 12.90000,   0.00000, 0.00000, 329.99600);
	CreateDynamicObject(870, 1588.30005, -2216.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1588.30005, -2206.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1589.30005, -2223.60010, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1588.90002, -2234.30005, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1588.80005, -2218.80005, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1589.09998, -2220.30005, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1588.90002, -2221.89990, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1583.40002, -2211.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1581.19995, -2210.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1578.59998, -2210.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1576.09998, -2210.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1573.09998, -2210.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1567.59998, -2224.39990, 12.80000,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(870, 1568.50000, -2226.80005, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1570.28308, -2228.32886, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1572.08716, -2229.40063, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1568.21606, -2215.24585, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1567.31177, -2217.30859, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1567.15552, -2222.65894, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1577.72021, -2230.67065, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1580.82129, -2230.13745, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1583.06812, -2228.98877, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1584.90002, -2227.30005, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1586.28894, -2225.03442, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1586.80005, -2223.10010, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1587.50000, -2221.00000, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1587.69995, -2218.80005, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1587.19995, -2216.30005, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(870, 1584.88843, -2214.12158, 12.80000,   0.00000, 0.00000, 29.99800);
	CreateDynamicObject(871, 1567.50000, -2211.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1569.80005, -2208.60010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1569.00000, -2206.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1572.19995, -2206.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1569.19995, -2233.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1569.09998, -2230.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1569.50000, -2227.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1567.69995, -2224.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1572.69995, -2229.60010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1577.50000, -2230.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1572.19995, -2236.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1569.90002, -2235.89990, 12.80000,   0.00000, 0.00000, 260.00000);
	CreateDynamicObject(871, 1567.40002, -2235.69995, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1585.69995, -2235.69995, 12.90000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1587.80005, -2217.60010, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1588.09998, -2220.60010, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1587.09998, -2225.50000, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1586.30005, -2226.89990, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1584.19995, -2212.89990, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1587.40002, -2211.50000, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1581.90002, -2211.60010, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1577.69995, -2210.50000, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1574.59998, -2210.30005, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1571.19995, -2211.80005, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1573.90002, -2206.00000, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1583.09998, -2206.10010, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1587.30005, -2205.89990, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1585.19995, -2205.80005, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1581.80005, -2233.19995, 12.80000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(1340, 1520.90002, -2246.50000, 13.70000,   0.00000, 0.00000, 222.00000);
	CreateDynamicObject(1341, 1526.19995, -2254.00000, 13.50000,   0.00000, 0.00000, 296.00000);
	CreateDynamicObject(1342, 1526.69995, -2255.89990, 13.60000,   0.00000, 0.00000, 204.00000);
	CreateDynamicObject(1341, 1520.19995, -2244.80005, 13.50000,   0.00000, 0.00000, 312.00000);
	CreateDynamicObject(760, 1569.30005, -2210.80005, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(760, 1583.00000, -2207.50000, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(760, 1583.00000, -2233.89990, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(760, 1569.50000, -2234.19995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(759, 1568.09998, -2207.10010, 12.60000,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(759, 1586.40002, -2207.30005, 12.60000,   0.00000, 0.00000, 39.99600);
	CreateDynamicObject(759, 1585.59998, -2234.50000, 12.60000,   0.00000, 0.00000, 347.99600);
	CreateDynamicObject(759, 1568.40002, -2235.00000, 12.50000,   0.00000, 0.00000, 347.99200);
	CreateDynamicObject(8168, 1561.90002, -2273.30005, 14.50000,   0.00000, 0.00000, 196.50000);
	CreateDynamicObject(1244, 1563.30005, -2270.60010, 13.30000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(2942, 1564.90002, -2270.50000, 13.20000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(8843, 1553.65613, -2263.66357, 12.55560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8843, 1544.02759, -2263.66357, 12.56130,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(871, 1567.16748, -2219.85205, 12.80000,   0.00000, 0.00000, -40.00000);

	//Garage Interior - Map by Shirayama
	CreateDynamicObject(9093,920.2999900,2588.2600000,-136.0500000,359.7000000,0.0000000,90.0000000); //object(cmdgrgdoor_lvs) (1)
	CreateDynamicObject(11292,920.2000100,2589.8301000,-132.5000000,90.0000000,0.0000000,0.0000000); //object(gasstatiohut) (1)
	CreateDynamicObject(11292,916.4000200,2589.8301000,-138.6000100,0.0000000,90.0000000,270.0000000); //object(gasstatiohut) (2)
	CreateDynamicObject(11292,929.4000200,2538.0000000,-132.5000000,270.0000000,180.0000000,180.0000000); //object(gasstatiohut) (3)
	CreateDynamicObject(11292,929.4003900,2538.0000000,-136.3000000,270.0000000,0.0000000,0.0000000); //object(gasstatiohut) (4)
	CreateDynamicObject(11292,926.2999900,2535.0000000,-136.3000000,90.0000000,0.0000000,270.0000000); //object(gasstatiohut) (5)
	CreateDynamicObject(11292,926.2999900,2535.0000000,-132.3000000,90.0000000,0.0000000,270.0000000); //object(gasstatiohut) (6)
	CreateDynamicObject(11292,926.2999900,2526.0000000,-136.3000000,90.0000000,0.0000000,270.0000000); //object(gasstatiohut) (7)
	CreateDynamicObject(11292,926.2999900,2526.0000000,-132.1000100,90.0000000,0.0000000,270.0000000); //object(gasstatiohut) (8)
	CreateDynamicObject(11292,920.2000100,2526.1001000,-136.3000000,270.0000000,180.0000000,180.0000000); //object(gasstatiohut) (9)
	CreateDynamicObject(11292,920.2000100,2526.1001000,-132.1000100,270.0000000,0.0000000,0.0000000); //object(gasstatiohut) (10)
	CreateDynamicObject(11292,911.2000100,2526.1001000,-132.1000100,270.0000000,180.0000000,180.0000000); //object(gasstatiohut) (11)
	CreateDynamicObject(11292,911.2000100,2526.1001000,-136.1000100,270.0000000,0.0000000,0.0000000); //object(gasstatiohut) (12)
	CreateDynamicObject(11292,902.2000100,2526.1001000,-136.1000100,270.0000000,180.0000000,180.0000000); //object(gasstatiohut) (13)
	CreateDynamicObject(11292,902.2000100,2526.1001000,-131.8999900,270.0000000,0.0000000,0.0000000); //object(gasstatiohut) (14)
	CreateDynamicObject(3498,924.7999900,2539.5000000,-133.2000000,0.0000000,0.0000000,0.0000000); //object(wdpillar01_lvs) (1)
	CreateDynamicObject(6387,916.7002000,2555.2998000,-134.2000000,0.0000000,0.0000000,0.0000000); //object(century03_law2) (2)

	//KFZ Tankstelle - Map by Shirayama
	CreateDynamicObject(3036, 1569.34424, -2156.86060, 12.96720,   -90.00000, 0.00000, 90.00000);
	CreateDynamicObject(8947, 1571.63965, -2162.97534, 15.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1728, 1577.93616, -2172.75098, 12.54310,   0.00000, 0.00000, 200.00000);
	CreateDynamicObject(2236, 1578.56384, -2171.38745, 12.54770,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2855, 1578.07556, -2170.70435, 12.61150,   0.00000, 0.00000, -70.00000);
	CreateDynamicObject(2103, 1578.04272, -2170.91895, 13.05070,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(941, 1565.45959, -2162.12720, 13.02000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18633, 1565.68518, -2162.37158, 13.51180,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(18635, 1565.03613, -2162.54321, 13.47400,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18634, 1565.62012, -2162.65918, 13.51390,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(2601, 1565.02441, -2161.81641, 13.57430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2601, 1564.95422, -2162.94922, 13.57430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2601, 1565.21777, -2162.71875, 13.57430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1650, 1565.66016, -2160.63110, 12.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1650, 1565.26038, -2160.61182, 12.88000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1650, 1565.96277, -2173.00146, 12.86000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18452, 1540.91431, -2173.55005, 15.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1686, 1543.77039, -2173.57715, 12.60804,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1686, 1538.17444, -2173.56787, 12.60804,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10281, 1571.83936, -2176.12622, 17.62310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19378, 1559.01648, -2170.40479, 12.47840,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19385, 1558.58191, -2175.13892, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19355, 1555.37634, -2175.14063, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19355, 1564.98865, -2175.14478, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19401, 1553.83740, -2173.62354, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, 1553.84778, -2170.41187, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, 1553.84070, -2167.20605, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, 1555.37317, -2165.65088, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19355, 1558.58630, -2165.66138, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19385, 1561.79492, -2165.67285, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19428, 1563.92029, -2165.66943, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 1553.82910, -2173.85303, 14.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2691, 1555.47705, -2175.03760, 14.57500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, 1562.65356, -2168.88916, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19428, 1560.26184, -2168.88110, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1806, 1554.31018, -2174.46118, 12.56480,   0.00000, 0.00000, -30.00000);
	CreateDynamicObject(19385, 1559.51440, -2167.35986, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2485, 1560.99341, -2169.37939, 13.64870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2655, 1553.98218, -2168.52930, 13.99920,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2060, 1556.29822, -2166.04321, 12.66500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 1561.02869, -2168.77222, 12.54630,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1616, 1563.83838, -2174.67114, 15.73108,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1616, 1554.35144, -2166.15063, 15.73110,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1885, 1559.81201, -2174.80225, 12.56631,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2364, 1560.13660, -2175.53857, 12.54774,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3633, 1565.37878, -2164.14990, 13.02560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2049, 1563.46277, -2174.99854, 13.77900,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1650, 1560.31885, -2169.30225, 12.94000,   0.00000, 0.00000, 10.00000);
	CreateDynamicObject(1650, 1560.10718, -2169.55103, 12.92000,   0.00000, 0.00000, -20.00000);
	CreateDynamicObject(1650, 1559.85999, -2169.25513, 12.92000,   0.00000, 0.00000, 9.00000);
	CreateDynamicObject(2385, 1553.90295, -2170.85010, 12.56350,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1280, 1555.68579, -2175.58765, 12.94730,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18635, 1553.99207, -2170.91650, 13.47400,   90.00000, 0.00000, 30.00000);
	CreateDynamicObject(18635, 1554.03491, -2169.42310, 13.47400,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18633, 1554.21985, -2170.35400, 12.63550,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(18638, 1562.58289, -2169.20581, 13.68020,   0.00000, -90.00000, 230.00000);
	CreateDynamicObject(18645, 1561.66614, -2169.16968, 13.75090,   0.00000, 0.00000, -65.00000);
	CreateDynamicObject(18644, 1554.07178, -2170.35229, 13.50660,   90.00000, 0.00000, -30.00000);
	CreateDynamicObject(18641, 1561.59155, -2169.65430, 13.35050,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18641, 1561.79419, -2169.55737, 13.29050,   -90.00000, 0.00000, 0.00000);
	CreateDynamicObject(18641, 1562.11182, -2169.55249, 13.29050,   -90.00000, 0.00000, 80.00000);
	CreateDynamicObject(1744, 1556.47192, -2165.61768, 13.91725,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19330, 1563.17224, -2169.24194, 13.71080,   0.00000, -90.00000, 140.00000);
	CreateDynamicObject(2690, 1554.17993, -2168.87842, 12.92650,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2690, 1563.99597, -2172.39795, 12.92650,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19308, 1556.50696, -2165.95850, 14.39660,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19311, 1557.42151, -2165.96753, 14.39670,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19377, 1559.02393, -2170.40381, 16.00000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19401, 1561.78467, -2175.15186, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 1561.67822, -2175.13867, 14.62000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2714, 1558.58203, -2175.32129, 15.49450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1523, 1557.77881, -2175.18066, 12.52300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19314, 1559.36047, -2167.35596, 15.26000,   90.00000, 90.00000, 90.00000);
	CreateDynamicObject(3633, 1565.98596, -2166.01709, 13.20560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2893, 1570.32886, -2162.50366, 11.70000,   -30.00000, 0.00000, 180.00000);
	CreateDynamicObject(2893, 1568.38831, -2162.50391, 11.70000,   -30.00000, 0.00000, 180.00000);
	CreateDynamicObject(1002, 1565.47888, -2164.14819, 13.49540,   0.00000, 0.00000, -70.00000);
	CreateDynamicObject(19371, 1573.78552, -2152.67773, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19417, 1573.78503, -2155.86938, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19398, 1575.30811, -2157.56323, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19444, 1577.70020, -2157.55103, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2972, 1565.40039, -2152.26099, 12.56550,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2972, 1566.70093, -2152.24854, 12.56550,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2972, 1566.01953, -2152.23999, 13.74550,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2605, 1577.46045, -2153.07178, 12.94750,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2164, 1573.88403, -2152.45703, 12.54720,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2309, 1577.86292, -2154.33716, 12.54820,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(19466, 1573.77002, -2155.99707, 15.06120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1712, 1578.05420, -2156.29663, 12.52790,   0.00000, 0.00000, -155.00000);
	CreateDynamicObject(1897, 1571.05762, -2156.72192, 13.68000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1897, 1571.06128, -2152.12695, 13.68000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1897, 1567.62561, -2156.76196, 13.68000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1897, 1567.61914, -2152.15674, 13.68000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2254, 1577.25098, -2157.42871, 14.27690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2255, 1565.20862, -2153.97485, 13.72360,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1244, 1571.91089, -2152.59009, 13.36000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1238, 1573.06030, -2152.67847, 12.86580,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 1573.08105, -2152.65918, 12.98580,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 1573.08093, -2152.65894, 13.16580,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(19371, 1575.46484, -2155.86499, 15.96800,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19371, 1575.46973, -2152.65698, 15.96800,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19444, 1577.71338, -2155.87573, 15.97600,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19444, 1577.71460, -2152.44751, 15.97530,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19121, 1576.18994, -2150.96045, 14.55500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1499, 1574.53870, -2157.57104, 12.53760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 1576.42334, -2154.66016, 15.63650,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2069, 1578.33411, -2157.21631, 12.58890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 1568.18396, -2170.43237, 18.18831,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 1568.23901, -2168.24756, 18.18831,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 1568.44702, -2165.10059, 18.18831,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 1573.07654, -2171.14331, 18.18831,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 1573.18091, -2168.98193, 18.18831,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 1573.20532, -2166.90137, 18.18831,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3785, 1564.85400, -2161.88745, 14.22000,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(8948, 1571.63501, -2174.02148, 16.18000,   0.00000, 60.00000, 90.00000);
	CreateDynamicObject(3504, 1563.63269, -2164.66235, 13.90000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2607, 1562.86597, -2168.40747, 12.96000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 1563.24438, -2167.39795, 12.56660,   0.00000, 0.00000, 140.00000);
	CreateDynamicObject(2611, 1564.19165, -2167.41528, 14.03160,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2368, 1561.03723, -2169.32178, 12.56530,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1744, 1553.79956, -2170.73755, 13.15090,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1744, 1553.86499, -2170.73682, 12.73090,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1744, 1553.86499, -2170.73682, 12.29090,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2601, 1554.19006, -2171.12451, 13.17040,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2601, 1554.17151, -2170.81982, 13.17040,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2601, 1554.32166, -2170.90063, 13.17040,   0.00000, 0.00000, 199.00000);
	CreateDynamicObject(2583, 1554.20886, -2167.15063, 13.44000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2060, 1557.45947, -2166.02246, 12.66500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2060, 1556.86084, -2165.96167, 12.90500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, 1563.82642, -2174.45264, 12.56545,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1808, 1563.85522, -2169.43726, 12.56622,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2267, 1554.01575, -2170.21313, 14.57010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2626, 1555.65527, -2173.88574, 13.08600,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2059, 1554.57422, -2167.13086, 12.58460,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2059, 1554.23389, -2166.72266, 12.58460,   0.00000, 0.00000, 6.00000);
	CreateDynamicObject(617, 1518.21594, -2163.69849, 12.53791,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 1537.98999, -2176.60645, 13.16720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19124, 1543.71545, -2176.59058, 13.16720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1616, 1563.83398, -2151.56592, 18.22810,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1616, 1553.33130, -2166.39673, 15.99080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1623, 1564.22986, -2153.22168, 18.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1623, 1564.21362, -2155.88379, 18.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2699, 1560.28992, -2172.04980, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2690, 1543.87061, -2172.72217, 12.96000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2690, 1538.28040, -2172.11206, 12.96000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(7313, 1569.35132, -2151.06958, 16.38790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2654, 1578.26660, -2158.43726, 12.76390,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(930, 1565.22961, -2172.53809, 13.04000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(943, 1566.41943, -2173.76587, 13.32540,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1650, 1565.83154, -2172.72803, 12.86000,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(2893, 1568.39294, -2156.87036, 13.04000,   80.00000, 0.00000, 180.00000);
	CreateDynamicObject(2893, 1570.33276, -2156.86255, 13.04000,   80.00000, 0.00000, 180.00000);
	CreateDynamicObject(1744, 1575.43970, -2150.92310, 14.00260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2163, 1573.89050, -2154.75757, 12.57370,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1549, 1574.17236, -2153.23145, 12.57360,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(1786, 1573.89612, -2154.50342, 13.49750,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1671, 1577.74524, -2151.70923, 13.03380,   0.00000, 0.00000, -45.00000);
	CreateDynamicObject(2855, 1575.27625, -2151.28882, 14.34180,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18638, 1575.66113, -2151.15601, 14.40190,   -5.00000, -90.00000, 60.00000);
	CreateDynamicObject(18631, 1573.70642, -2155.95776, 15.46850,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19171, 1578.54956, -2166.03735, 15.72090,   90.00000, -90.00000, 0.00000);
	CreateDynamicObject(19170, 1578.54504, -2164.54541, 15.72730,   90.00000, -90.00000, 0.00000);
	CreateDynamicObject(19169, 1578.54993, -2166.03711, 17.21540,   90.00000, -90.00000, 0.00000);
	CreateDynamicObject(19168, 1578.54993, -2164.53760, 17.21000,   90.00000, -90.00000, 0.00000);
	CreateDynamicObject(1499, 1562.51648, -2165.67017, 12.53760,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19347, 1562.60425, -2168.21997, 13.38500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18641, 1562.29968, -2168.27002, 13.40470,   90.00000, 0.00000, 30.00000);
	CreateDynamicObject(2190, 1563.25586, -2168.81567, 13.37920,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2074, 1561.70679, -2167.42603, 15.66950,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1495, 1559.46741, -2166.64307, 12.53610,   0.00000, 0.00000, 20.00000);
	CreateDynamicObject(1549, 1559.79456, -2168.56519, 12.56690,   0.00000, 0.00000, -30.00000);
	CreateDynamicObject(18977, 1560.48682, -2172.08496, 13.98820,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18978, 1560.20691, -2171.94678, 13.98840,   0.00000, 0.00000, 130.00000);
	CreateDynamicObject(18979, 1560.23035, -2172.26050, 13.98900,   0.00000, 0.00000, 230.00000);
	CreateDynamicObject(8843, 1549.52185, -2173.22754, 12.56390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8843, 1530.12085, -2172.66406, 12.56390,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19380, 1594.43835, -2160.83398, 12.46460,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(8674, 1584.19849, -2156.12061, 14.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8674, 1594.50549, -2156.13550, 14.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19380, 1583.95459, -2160.83813, 12.46460,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19380, 1594.44019, -2170.44019, 12.46460,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19380, 1583.95984, -2170.44116, 12.46460,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(8674, 1599.66370, -2161.30713, 14.00000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8674, 1599.68286, -2166.42578, 14.00000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8674, 1594.50403, -2175.24463, 14.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8674, 1591.91846, -2175.23633, 14.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2048, 1564.74951, -2166.59277, 15.00000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(966, 1579.55505, -2174.99902, 12.55150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(968, 1579.49268, -2175.02344, 13.30740,   0.00000, 6.00000, 0.00000);
	CreateDynamicObject(958, 1565.11157, -2169.23511, 13.42000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(959, 1565.08240, -2169.23145, 13.39380,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2900, 1574.44751, -2152.08789, 16.05346,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1271, 1575.31152, -2153.09790, 16.40000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1271, 1574.56555, -2153.02905, 16.40000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1271, 1574.95813, -2153.07104, 17.08000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2478, 1574.93127, -2154.11426, 16.33510,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2694, 1574.29175, -2155.86401, 16.15450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2694, 1574.67944, -2155.88208, 16.15450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2694, 1575.04688, -2156.06079, 16.15450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2694, 1574.84814, -2156.02954, 16.39450,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(2694, 1574.39722, -2156.01587, 16.39450,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(1271, 1575.78223, -2156.78516, 16.40000,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(2900, 1577.16760, -2153.29370, 16.05346,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2900, 1577.27222, -2156.78418, 16.05346,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(4638, 1598.63184, -2173.40820, 14.26000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(970, 1537.87256, -2173.55957, 13.14670,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1538.47522, -2173.55737, 13.14670,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1543.43140, -2173.53125, 13.14670,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1544.12488, -2173.62476, 13.14670,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19360, 1577.03442, -2152.65063, 12.47620,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19360, 1575.53650, -2152.65088, 12.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19360, 1577.03271, -2155.86938, 12.47620,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19360, 1575.58203, -2155.86401, 12.47000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(8661, 1568.90967, -2164.78833, 12.55320,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8661, 1548.92407, -2164.82007, 12.55320,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8661, 1528.96375, -2164.88574, 12.55320,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(8661, 1576.85217, -2164.79248, 12.55000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1439, 1558.39624, -2152.13965, 12.55170,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1330, 1565.20154, -2153.43774, 13.01340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1300, 1598.66931, -2170.77490, 12.93110,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19371, 1575.46753, -2151.00684, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19371, 1576.92749, -2150.99463, 14.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19371, 1578.60022, -2152.58081, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19371, 1578.60461, -2155.80054, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19371, 1578.61365, -2155.98242, 14.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3031, 1556.23779, -2171.58423, 17.66000,   0.00000, 0.00000, -150.00000);
	CreateDynamicObject(3042, 1579.01013, -2153.44458, 17.83510,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2370, 1576.20642, -2164.97217, 12.55200,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3111, 1576.50281, -2164.60693, 13.41590,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3017, 1576.54932, -2165.10083, 12.83710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18866, 1576.86707, -2163.85742, 13.39680,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(18890, 1577.74036, -2157.77661, 13.40310,   -15.00000, 0.00000, 0.00000);
	CreateDynamicObject(19468, 1577.39429, -2157.83008, 12.63390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1811, 1577.52454, -2166.35352, 13.16000,   0.00000, 0.00000, -30.00000);
	CreateDynamicObject(1811, 1576.66321, -2162.68970, 13.16000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(1811, 1574.69446, -2165.01147, 13.16000,   0.00000, 0.00000, 160.00000);
	CreateDynamicObject(1078, 1566.93799, -2152.45361, 14.24330,   0.00000, 0.00000, -30.00000);
	CreateDynamicObject(1077, 1565.97778, -2152.16235, 15.04330,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(1077, 1565.97778, -2152.16235, 15.26330,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(1008, 1565.01624, -2161.28540, 13.49440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1010, 1565.13574, -2169.96338, 14.30550,   0.00000, 0.00000, 75.00000);
	CreateDynamicObject(19166, 1564.24353, -2171.09692, 14.51260,   90.00000, -90.00000, 0.00000);
	CreateDynamicObject(19418, 1562.34497, -2168.64771, 13.38470,   90.00000, 0.00000, 60.00000);
	CreateDynamicObject(2161, 1563.15747, -2165.80054, 12.56590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2270, 1561.95667, -2168.29102, 14.32850,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1775, 1563.76257, -2173.32104, 13.66000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2894, 1555.61426, -2173.47266, 13.61470,   0.00000, 0.00000, -80.00000);
	CreateDynamicObject(1424, 1580.12781, -2155.60840, 13.06780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1424, 1579.95374, -2154.65918, 13.06780,   0.00000, 0.00000, -50.00000);
	CreateDynamicObject(1459, 1579.70361, -2152.11157, 13.14770,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1459, 1583.55542, -2155.37524, 13.14770,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 1581.73181, -2155.46509, 12.86770,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 1581.73181, -2155.46509, 13.02770,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1238, 1581.73181, -2155.46509, 13.24770,   0.00000, 0.00000, 20.00000);
	CreateDynamicObject(1635, 1563.64954, -2170.48438, 16.92610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3036, 1557.53491, -2160.66431, 14.29070,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(10252, 1556.83728, -2161.89111, 14.16000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(974, 1557.51270, -2154.84912, 13.26930,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(974, 1560.86816, -2151.53491, 13.26930,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3504, 1563.65125, -2162.96436, 13.90000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1431, 1560.53516, -2152.03198, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1428, 1563.83215, -2153.30786, 13.98000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1264, 1558.78479, -2152.08032, 13.36058,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1264, 1558.09253, -2152.18945, 13.36060,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1265, 1563.41553, -2152.12622, 12.95250,   0.00000, 0.00000, -60.00000);
	CreateDynamicObject(3015, 1559.58191, -2152.74072, 12.71220,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2969, 1560.31067, -2152.79053, 12.67390,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(2969, 1560.31433, -2152.76245, 12.93390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3014, 1561.98022, -2152.06763, 12.77340,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(3014, 1561.94373, -2151.99463, 13.25340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1778, 1564.01563, -2161.78857, 12.55305,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1437, 1564.18604, -2156.69067, 12.80740,   20.00000, 93.50000, 79.50000);

	//Busfahrer Base - Map by Shirayama
	//Bugfixes
	CreateDynamicObject(19454, 1553.33252, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1543.72412, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1534.37744, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1525.08948, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1515.62061, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1506.19702, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1496.68945, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1489.57141, -2363.35596, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1553.33252, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1543.70935, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1534.37744, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1525.08948, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1515.62061, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1506.19702, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1496.68945, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19454, 1489.57141, -2366.80005, 12.45800,   0.00000, 90.00000, 90.00000);
	//
	CreateDynamicObject(982, 1538.25000, -2309.30005, 13.20000,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(982, 1525.40002, -2340.10010, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(984, 1538.29004, -2328.50000, 13.16000,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(983, 1538.30005, -2336.50000, 13.20000,   0.00000, 0.00000, 0.10000);
	CreateDynamicObject(982, 1576.50000, -2368.25000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1550.90002, -2368.22998, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1525.30005, -2368.19995, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1499.69995, -2368.19995, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1484.37000, -2355.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1500.30005, -2340.19995, 13.20000,   0.00000, 0.00000, 272.00000);
	CreateDynamicObject(983, 1487.59998, -2341.80005, 13.20000,   0.00000, 0.00000, 279.00000);
	CreateDynamicObject(983, 1493.90002, -2340.80005, 13.20000,   0.00000, 0.00000, 278.99799);
	CreateDynamicObject(983, 1511.00000, -2340.09961, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1506.20020, -2340.09961, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1488.50000, -2368.19995, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1361, 1484.80005, -2368.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1484.40002, -2342.30005, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1538.40002, -2340.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1562.90002, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1556.50000, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(982, 1566.09998, -2309.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1566.09998, -2323.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1579.00000, -2337.35010, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1361, 1566.30005, -2337.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6296, 1526.59998, -2328.60010, 14.80000,   0.00000, 0.00000, 322.00000);
	CreateDynamicObject(10183, 1454.79395, -2446.03125, 12.46998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1535.00000, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1533.40002, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1529.90002, -2299.60010, 13.20000,   0.00000, 0.00000, 354.00000);
	CreateDynamicObject(983, 1529.30005, -2304.39990, 13.20000,   0.00000, 0.00000, 351.99600);
	CreateDynamicObject(983, 1527.80005, -2310.60010, 13.20000,   0.00000, 0.00000, 339.79999);
	CreateDynamicObject(984, 1504.30005, -2337.30005, 13.20000,   0.00000, 0.00000, 295.79999);
	CreateDynamicObject(983, 1512.50000, -2332.39990, 13.20000,   0.00000, 0.00000, 311.00000);
	CreateDynamicObject(983, 1526.69995, -2313.60010, 13.20000,   0.00000, 0.00000, 339.79999);
	CreateDynamicObject(1361, 1525.00000, -2317.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1515.40002, -2330.00000, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1501.50000, -2339.80005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1515.19995, -2339.60010, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1536.50000, -2338.69995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.30005, -2332.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1529.09998, -2339.39990, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.50000, -2325.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.40002, -2318.60010, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.00000, -2311.80005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.09998, -2304.80005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1537.30005, -2297.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1522.09998, -2339.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1508.59998, -2339.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1531.30005, -2297.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9833, 1518.50000, -2336.39990, 15.70000,   0.00000, 0.00000, 48.00000);
	CreateDynamicObject(9833, 1531.90002, -2319.69995, 15.70000,   0.00000, 0.00000, 337.99701);
	CreateDynamicObject(3660, 1535.09998, -2307.80005, 15.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.59998, -2299.19995, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.40002, -2304.69995, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.19995, -2310.39990, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1368, 1533.00000, -2316.00000, 13.20000,   0.00000, 0.00000, 268.00000);
	CreateDynamicObject(1360, 1533.40002, -2302.00000, 13.30000,   0.00000, 0.00000, 358.00000);
	CreateDynamicObject(1360, 1533.19995, -2307.60010, 13.30000,   0.00000, 0.00000, 357.99500);
	CreateDynamicObject(1360, 1533.09998, -2313.19995, 13.30000,   0.00000, 0.00000, 357.99500);
	CreateDynamicObject(869, 1515.69995, -2333.30005, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1511.09998, -2337.89990, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1517.30005, -2335.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1513.59998, -2334.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1515.90002, -2338.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1506.80005, -2338.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1515.59998, -2336.19995, 12.80000,   0.00000, 0.00000, 298.00000);
	CreateDynamicObject(870, 1508.30005, -2337.80005, 12.80000,   0.00000, 0.00000, 7.99900);
	CreateDynamicObject(870, 1512.19995, -2335.50000, 12.80000,   0.00000, 0.00000, 315.99799);
	CreateDynamicObject(859, 1513.59998, -2338.89990, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1514.09998, -2336.00000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1515.69995, -2334.89990, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1515.69995, -2332.10010, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1510.59998, -2336.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1509.69995, -2336.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1507.09998, -2339.00000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1504.50000, -2339.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1510.19995, -2338.00000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(859, 1517.69995, -2334.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(817, 1513.90002, -2337.39990, 13.00000,   0.00000, 0.00000, 280.00000);
	CreateDynamicObject(817, 1505.69995, -2338.19995, 13.00000,   0.00000, 0.00000, 279.99799);
	CreateDynamicObject(817, 1517.69995, -2337.80005, 13.00000,   0.00000, 0.00000, 279.99799);
	CreateDynamicObject(817, 1511.69995, -2335.39990, 13.00000,   0.00000, 0.00000, 259.99799);
	CreateDynamicObject(817, 1514.50000, -2333.19995, 13.00000,   0.00000, 0.00000, 259.99701);
	CreateDynamicObject(871, 1509.80005, -2336.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1512.09998, -2334.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1515.19995, -2332.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1516.59998, -2330.30005, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1503.50000, -2338.89990, 12.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(871, 1513.59998, -2338.89990, 12.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(870, 1505.09998, -2338.89990, 12.80000,   0.00000, 0.00000, 110.00000);
	CreateDynamicObject(869, 1519.80005, -2337.39990, 13.00000,   0.00000, 0.00000, 328.50000);
	CreateDynamicObject(870, 1519.19995, -2335.39990, 12.80000,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(871, 1517.80005, -2333.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1519.30005, -2338.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1521.50000, -2337.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1343, 1535.09998, -2297.50000, 13.30000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(982, 1566.12000, -2350.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1566.11951, -2361.50000, 13.16000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1566.09998, -2368.10010, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1539.80005, -2296.50000, 13.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(8843, 1545.00000, -2308.19995, 12.60000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3660, 1586.80005, -2353.19995, 15.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3660, 1569.15002, -2352.89990, 15.20000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3660, 1577.69995, -2364.00000, 15.20000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(983, 1574.69995, -2347.30005, 13.20000,   0.00000, 0.00000, 300.00000);
	CreateDynamicObject(983, 1571.90002, -2352.10010, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1571.90002, -2353.69995, 13.20000,   0.00000, 0.00000, 359.99500);
	CreateDynamicObject(983, 1574.69995, -2358.50000, 13.20000,   0.00000, 0.00000, 59.99500);
	CreateDynamicObject(983, 1580.30005, -2347.30005, 13.20000,   0.00000, 0.00000, 59.99100);
	CreateDynamicObject(983, 1580.30005, -2358.50000, 13.20000,   0.00000, 0.00000, 300.00000);
	CreateDynamicObject(983, 1583.09998, -2352.10010, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 1583.09998, -2353.69995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6965, 1577.69995, -2352.89990, 15.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1574.40002, -2350.30005, 13.00000,   0.00000, 0.00000, 352.00000);
	CreateDynamicObject(869, 1579.40002, -2356.69995, 13.00000,   0.00000, 0.00000, 21.99600);
	CreateDynamicObject(870, 1576.90002, -2347.80005, 12.80000,   0.00000, 0.00000, 340.00000);
	CreateDynamicObject(870, 1574.19995, -2353.00000, 12.80000,   0.00000, 0.00000, 309.99899);
	CreateDynamicObject(870, 1576.69995, -2357.30005, 12.80000,   0.00000, 0.00000, 39.99600);
	CreateDynamicObject(870, 1581.19995, -2355.00000, 12.80000,   0.00000, 0.00000, 79.99600);
	CreateDynamicObject(871, 1574.30005, -2355.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1581.90002, -2353.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1578.90002, -2348.60010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1580.69995, -2350.69995, 13.00000,   0.00000, 0.00000, 280.00000);
	CreateDynamicObject(869, 1574.69995, -2355.60010, 13.00000,   0.00000, 0.00000, 290.00000);
	CreateDynamicObject(870, 1578.59998, -2348.80005, 12.80000,   0.00000, 0.00000, 300.00000);
	CreateDynamicObject(759, 1577.00000, -2351.00000, 12.60000,   0.00000, 0.00000, 326.00000);
	CreateDynamicObject(759, 1577.09998, -2354.89990, 12.60000,   0.00000, 0.00000, 85.99700);
	CreateDynamicObject(759, 1579.69995, -2352.89990, 12.60000,   0.00000, 0.00000, 207.99500);
	CreateDynamicObject(759, 1575.59998, -2352.69995, 12.60000,   0.00000, 0.00000, 207.99300);
	CreateDynamicObject(759, 1579.09998, -2351.30005, 12.60000,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(759, 1578.80005, -2354.60010, 12.60000,   0.00000, 0.00000, 329.99600);
	CreateDynamicObject(673, 1582.50000, -2345.60010, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1582.50000, -2360.39990, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1572.30005, -2345.80005, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1572.40002, -2360.50000, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1574.80005, -2348.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1575.80005, -2357.89990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1577.59998, -2358.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1581.80005, -2356.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1582.00000, -2350.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(871, 1574.09998, -2352.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1575.59998, -2350.10010, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1581.50000, -2351.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1579.30005, -2356.39990, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1577.09998, -2348.19995, 13.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1574.59998, -2353.30005, 13.00000,   0.00000, 0.00000, 0.00000);

	//new GTA V LSPD Interior - Map by GangstaSunny
	static lspdinttmpobjid21;
	lspdinttmpobjid21 = CreateDynamicObject(19866,351.194,1832.889,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,352.726,1827.442,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19416,351.209,1830.583,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,351.194,1836.635,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19416,351.211,1838.192,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,344.325,1822.561,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,351.210,1824.161,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19930,344.674,1828.117,2240.573,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19925,344.672,1829.140,2240.573,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19929,342.807,1829.144,2240.573,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19929,339.946,1829.143,2240.573,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,338.620,1828.705,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,344.233,1827.452,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,344.364,1827.450,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,336.620,1829.705,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,336.053,1829.205,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,336.453,1829.205,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,336.252,1829.205,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,340.978,1822.228,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19383,336.248,1826.864,2242.435,90.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19383,336.248,1823.365,2242.435,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,336.250,1816.799,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,331.355,1820.141,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19383,334.389,1828.918,2242.315,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,332.687,1829.576,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,331.840,1829.476,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,327.973,1828.906,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,327.523,1824.138,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,351.194,1842.470,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,346.488,1842.563,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,337.477,1842.591,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,331.927,1843.589,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,328.197,1843.589,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,332.768,1847.328,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,322.761,1846.755,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,327.040,1829.467,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,322.759,1832.777,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	//lspdinttmpobjid21 = CreateDynamicObject(1499,322.780,1832.765,2240.578,0.000,0.000,90.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19527, "cauldron1", "cauldron1", 0);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19332, "balloon_texts", "balloon02", 0);
	//lspdinttmpobjid21 = CreateDynamicObject(1499,322.762,1835.776,2240.578,0.000,0.000,-90.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19527, "cauldron1", "cauldron1", 0);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19332, "balloon_texts", "balloon02", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,322.759,1836.517,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,322.762,1827.212,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,322.759,1841.959,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,322.759,1837.263,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,322.759,1841.209,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,341.259,1842.494,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,336.247,1823.760,2235.637,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1502,333.603,1828.886,2240.562,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,317.897,1836.508,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,320.979,1841.337,2240.647,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,308.263,1836.508,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,326.466,1843.587,2240.647,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,324.466,1843.585,2240.647,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19538,311.996,1831.102,2240.585,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-80-percent", 0);
	//lspdinttmpobjid21 = CreateDynamicObject(1493,345.807,1827.523,2240.581,0.000,0.000,0.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wall2", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,314.688,1834.693,2240.677,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,319.637,1824.883,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,314.688,1833.260,2240.679,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,321.159,1830.390,2240.647,90.000,0.000,116.159,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(3032,314.765,1835.580,2243.229,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(3032,314.765,1833.055,2243.229,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(3032,313.859,1831.548,2243.229,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,313.808,1831.605,2239.731,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,314.682,1832.256,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(3032,310.605,1831.534,2243.229,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(3032,314.761,1834.336,2244.147,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,309.769,1829.218,2236.663,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19383,312.257,1831.603,2242.315,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,310.670,1831.605,2239.731,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,309.769,1831.701,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1499,311.483,1831.585,2240.578,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19527, "cauldron1", "cauldron1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19332, "balloon_texts", "balloon02", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1499,309.775,1825.124,2240.578,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19527, "cauldron1", "cauldron1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19332, "balloon_texts", "balloon02", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,309.763,1827.940,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19383,309.771,1825.864,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,309.769,1822.718,2236.663,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,309.763,1824.600,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,309.763,1821.100,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,322.757,1834.312,2247.896,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,314.735,1820.463,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,309.899,1820.828,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,304.934,1820.463,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,306.288,1832.958,2240.647,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,300.920,1830.702,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,306.371,1831.535,2242.955,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,305.725,1830.687,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,296.361,1825.642,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19383,308.068,1831.298,2242.315,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1499,307.293,1831.278,2240.578,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19527, "cauldron1", "cauldron1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19332, "balloon_texts", "balloon02", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19866,314.312,1836.472,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2608,312.648,1836.232,2242.622,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2063,304.371,1830.214,2241.487,0.000,0.000,0.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2063,299.087,1830.301,2241.487,0.000,0.000,0.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2475,307.554,1820.649,2240.590,0.000,0.000,180.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2475,304.553,1820.621,2240.590,0.000,0.000,180.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2475,301.492,1820.629,2240.590,0.000,0.000,180.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,295.300,1820.464,2240.576,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11496,292.513,1823.114,2246.304,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 2, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2475,298.432,1820.633,2240.590,0.000,0.000,180.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1850,302.801,1825.341,2240.302,0.000,0.000,0.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1850,302.308,1826.061,2240.302,0.000,0.000,180.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1850,305.790,1825.894,2239.507,0.000,0.000,0.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1850,305.297,1825.497,2239.507,0.000,0.000,180.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19107, "armyhelmets", "armyhelmet4", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2608,308.026,1836.202,2242.622,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2164,309.818,1836.379,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2173,311.943,1835.911,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2948,315.223,1834.795,2241.430,0.000,90.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 14385, "trailerkb", "tr_wood1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2948,315.221,1836.368,2241.428,0.000,90.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 14385, "trailerkb", "tr_wood1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1806,312.219,1834.905,2240.584,0.000,0.000,-38.759,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2268,311.661,1835.592,2241.839,-12.000,90.000,19.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2752,311.779,1836.165,2241.367,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19567,311.800,1836.155,2241.264,0.000,0.000,19.020,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.768,1834.724,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.765,1833.921,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.763,1833.459,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.769,1832.855,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.765,1832.254,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.771,1835.203,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.764,1835.895,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.765,1836.366,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,313.838,1834.414,2239.738,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.587,1831.538,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,313.864,1831.545,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,314.226,1831.551,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.869,1831.530,2245.835,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,310.646,1831.543,2245.465,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,310.266,1831.536,2245.969,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2164,306.374,1832.136,2240.583,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2164,306.384,1833.898,2240.583,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1999,307.495,1835.952,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 2, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19354,317.631,1834.386,2238.843,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19325,351.273,1828.346,2241.420,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "lightblue", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19087,314.769,1835.907,2242.312,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19087,314.767,1835.307,2242.312,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19325,309.798,1829.345,2242.483,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19325,309.762,1822.245,2242.483,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.792,1828.626,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.800,1829.421,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.805,1830.206,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.798,1830.947,2245.932,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.803,1827.946,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.769,1823.828,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.770,1823.147,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.757,1822.447,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.766,1821.687,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.770,1821.104,2248.847,0.000,0.000,0.059,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19325,309.814,1825.906,2247.323,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.813,1825.031,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,309.804,1826.692,2248.847,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,345.471,1839.507,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,346.472,1838.160,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,346.472,1836.828,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,346.472,1839.492,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,345.471,1838.175,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,345.471,1836.843,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,341.364,1839.507,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,342.365,1839.492,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,341.364,1838.175,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,342.365,1838.160,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,342.365,1836.828,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,341.364,1836.843,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,337.035,1838.155,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,337.029,1836.804,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,338.036,1838.160,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,338.036,1836.828,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,346.472,1840.824,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,345.471,1840.839,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,342.365,1840.824,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,341.364,1840.839,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19786,348.325,1842.480,2242.906,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19894, "laptopsamp1", "laptopscreen3", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19786,338.885,1842.534,2242.906,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19894, "laptopsamp1", "laptopscreen3", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,338.036,1839.500,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,337.035,1839.495,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,338.036,1840.841,2240.554,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(11685,337.035,1840.836,2240.554,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,351.211,1844.615,2240.576,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19786,342.453,1822.220,2242.906,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19894, "laptopsamp1", "laptopscreen3", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2166,343.744,1823.832,2240.582,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19929,339.956,1828.581,2240.358,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19929,342.807,1828.582,2240.360,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19930,344.248,1828.145,2240.358,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1806,342.721,1827.088,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1806,340.274,1827.208,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2161,337.881,1822.347,2240.583,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 2, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 3, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2161,339.210,1822.346,2240.583,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 2, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 3, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2161,340.539,1822.345,2240.583,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 14385, "trailerkb", "tr_wood1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 2, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 3, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2163,344.205,1826.869,2240.583,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 14385, "trailerkb", "tr_wood1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19567,339.622,1828.566,2241.151,0.000,0.000,11.640,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19567,340.729,1828.576,2241.151,0.000,0.000,-11.640,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19567,343.230,1828.550,2241.151,0.000,0.000,-11.640,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2268,339.398,1828.029,2241.579,0.000,90.000,11.640,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2268,340.320,1828.189,2241.579,0.000,90.000,-11.640,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2268,341.171,1829.016,2241.579,0.000,90.000,168.119,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2268,339.848,1829.130,2241.579,0.000,90.000,191.880,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2268,342.797,1828.170,2241.579,0.000,90.000,-11.640,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2268,343.650,1829.012,2241.579,0.000,90.000,168.119,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19893,343.970,1827.891,2241.281,0.000,0.000,-72.780,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19162, "newpolicehats", "policehatmap2", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19893,343.179,1822.766,2241.366,0.000,0.000,-163.620,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19162, "newpolicehats", "policehatmap2", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19325,351.277,1839.938,2241.420,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "lightblue", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,351.246,1834.394,2247.895,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1753,328.147,1826.305,2240.583,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18835, "mickytextures", "marb002", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1823,328.611,1824.764,2240.583,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 14385, "trailerkb", "tr_wood1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19786,331.400,1828.840,2242.770,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19894, "laptopsamp1", "laptopscreen3", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2164,328.894,1820.276,2240.582,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2167,329.814,1820.272,2240.582,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2204,332.762,1820.301,2240.582,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2205,334.269,1823.062,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19893,334.153,1823.174,2241.520,0.000,0.000,26.760,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 19162, "newpolicehats", "policehatmap2", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19567,335.777,1823.247,2241.404,0.000,0.000,-41.879,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2265,335.192,1823.133,2241.841,0.000,90.000,-41.880,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19325,336.241,1824.883,2241.420,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18065, "ab_sfammumain", "shelf_glas", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.242,1826.647,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.250,1825.106,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.237,1823.585,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.215,1823.585,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.189,1823.585,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.179,1823.585,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.257,1823.585,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.281,1823.585,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.311,1823.585,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.220,1825.106,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.190,1825.106,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.179,1825.106,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.279,1825.106,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.299,1825.106,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.317,1825.106,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.212,1826.647,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.272,1826.647,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.292,1826.647,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.312,1826.647,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,336.182,1826.647,2244.783,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2265,336.390,1823.392,2241.841,0.000,90.000,-221.820,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2163,331.020,1828.800,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 14385, "trailerkb", "tr_wood1", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2162,327.624,1822.376,2242.206,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1753,328.158,1822.188,2240.583,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18835, "mickytextures", "marb002", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19380,330.961,1824.137,2240.507,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-93-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19929,339.944,1829.143,2239.698,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19929,342.807,1829.144,2239.698,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19925,344.672,1829.140,2239.698,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19930,344.674,1828.117,2239.698,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2752,335.820,1823.263,2241.551,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2752,335.732,1823.365,2241.843,0.000,90.000,-41.100,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1547,322.874,1836.180,2242.334,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "orange", 0);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "{000000}Waffenkammer", OBJECT_MATERIAL_SIZE_256x128, "Arial", 42, 0, 0, 0xBEBEBEFF, 1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,335.569,1829.005,2242.072,90.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,322.854,1840.050,2242.674,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "orange", 0);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "{000000}Aufzug", OBJECT_MATERIAL_SIZE_256x128, "Arial", 42, 0, 0, 0xBEBEBEFF, 1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,335.569,1829.005,2242.072,90.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,322.854,1840.050,2242.374,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "orange", 0);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "{000000}zum", OBJECT_MATERIAL_SIZE_256x128, "Arial", 42, 0, 0, 0xBEBEBEFF, 1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,335.569,1829.005,2242.072,90.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,322.854,1840.050,2242.074,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "orange", 0);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "{000000}Dach", OBJECT_MATERIAL_SIZE_256x128, "Arial", 42, 0, 0, 0xBEBEBEFF, 1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,335.569,1829.005,2242.342,90.000,0.000,180.000,-1,-1,-1);//schild
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "orange", 0);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "{000000}Sam", OBJECT_MATERIAL_SIZE_256x128, "Arial", 42, 0, 0, 0xBEBEBEFF, 1);
	lspdinttmpobjid21 = CreateDynamicObject(1547,335.569,1829.005,2242.072,90.000,0.000,180.000,-1,-1,-1);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "orange", 0);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "{000000}Winchester", OBJECT_MATERIAL_SIZE_256x128, "Arial", 42, 0, 0, 0xBEBEBEFF, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19381,331.079,1824.182,2244.075,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2189,343.894,1842.426,2242.807,0.000,90.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2189,319.527,1825.112,2242.807,0.000,90.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2189,301.702,1830.565,2242.807,0.000,90.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2189,327.638,1825.179,2242.507,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 1, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2660,314.795,1834.303,2243.365,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2660,314.759,1834.329,2243.365,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2661,309.900,1825.844,2243.572,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2661,309.872,1825.860,2243.572,0.000,0.000,-90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(18981,348.710,1830.326,2245.904,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0);
	lspdinttmpobjid21 = CreateDynamicObject(18981,297.314,1818.690,2245.463,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19597, "lsbeachside", "ceilingtiles4-128x128", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19378,331.103,1833.746,2244.103,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 16639, "a51_labs", "ws_trainstationwin1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19378,331.103,1843.380,2244.103,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 16639, "a51_labs", "ws_trainstationwin1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,351.212,1838.335,2248.882,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,351.212,1830.511,2248.882,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,346.6750, 1827.4399, 2248.8870,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19378,327.946,1833.746,2244.104,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 16639, "a51_labs", "ws_trainstationwin1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19378,327.946,1843.380,2244.106,0.000,90.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 16639, "a51_labs", "ws_trainstationwin1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19462,330.682,1843.592,2247.896,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19455,336.266,1837.770,2245.766,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-60-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19455,336.268,1828.136,2245.766,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-60-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19455,336.262,1818.503,2245.766,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-60-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,342.730,1828.885,2251.515,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2661,342.203,1828.866,2244.405,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,341.708,1828.885,2251.515,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(2661,342.239,1828.914,2244.405,0.000,0.000,180.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "black64", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,308.095,1831.298,2244.868,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,312.896,1831.596,2244.868,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,311.460,1831.594,2244.870,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(18075,329.726,1836.369,2244.068,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(18075,346.183,1834.651,2245.466,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(18075,336.683,1834.651,2245.466,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(902,339.930,1821.784,2243.340,35.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18835, "mickytextures", "smileyface1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(902,337.930,1821.784,2243.340,36.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18835, "mickytextures", "smileyface1", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19449,339.528,1837.453,2240.499,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-90-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19449,339.528,1840.953,2240.499,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-90-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19449,343.528,1837.453,2240.497,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-90-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19449,343.528,1840.953,2240.497,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "grey-90-percent", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,322.759,1838.833,2243.886,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.269,1830.472,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.270,1838.135,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.270,1837.193,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.270,1838.985,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.269,1829.588,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.269,1831.390,2242.315,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.311,1830.486,2241.734,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.311,1830.486,2243.230,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.341,1838.128,2241.734,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1897,351.341,1838.128,2243.231,0.000,90.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1522,328.917,1843.576,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 9106, "vgeamun", "hirisedoor1_256", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1522,330.416,1843.576,2240.583,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 9106, "vgeamun", "hirisedoor1_256", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,330.433,1843.532,2243.619,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19089,351.197,1834.382,2243.619,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1547,332.308,1843.460,2242.294,90.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 18646, "matcolours", "orange", 0);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "{000000}Garage", OBJECT_MATERIAL_SIZE_256x128, "Arial", 42, 0, 0, 0xBEBEBEFF, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19866,332.665,1842.599,2242.955,90.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3897, "libertyhi", "wallmix64HV", 0);
	lspdinttmpobjid21 = CreateDynamicObject(1522,322.755,1838.109,2240.583,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 9106, "vgeamun", "hirisedoor1_256", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,322.763,1840.425,2242.345,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19443,322.763,1837.321,2242.345,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379,306.283,1839.280,2242.606,0.000,0.000,0.000,-1,-1,-1);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 19004, "roundbuilding1", "stonewalltile4", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 2, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19327,314.788,1834.311,2243.507,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "Waffen", 80, "Ariel", 20, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,314.788,1834.311,2243.197,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "Kammer", 80, "Ariel", 20, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,309.908,1825.881,2243.537,0.000,0.000,90.000,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "Eingang", 80, "Ariel", 20, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,319.534,1825.059,2242.866,0.000,0.000,-90.300,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "S.A.P.D", 80, "Ariel", 30, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,338.882,1822.341,2243.326,0.000,0.000,-179.499,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, ".R.R.P.", 80, "Engravers MT", 30, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,338.976,1822.341,2243.306,0.000,-90.499,179.799,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "[]", 80, "courier", 72, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,338.880,1822.342,2242.776,0.000,-0.099,179.600,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "RosaLife Reloaded", 80, "Calibri", 25, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,343.898,1842.433,2242.807,0.000,0.000,-0.100,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "S.A.P.D", 80, "Ariel", 40, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,327.637,1825.199,2242.565,0.000,0.000,90.700,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "S.A.P.D", 80, "Ariel", 45, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,342.202,1828.924,2244.468,0.000,0.000,-179.000,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "Rosalife", 90, "Ariel", 20, 1, -1, 0, 1);
	lspdinttmpobjid21 = CreateDynamicObject(19327,342.202,1828.924,2244.298,0.000,0.000,-179.000,-1,-1,-1);
	SetDynamicObjectMaterialText(lspdinttmpobjid21, 0, "S.A.P.D", 90, "Ariel", 25, 1, -1, 0, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	lspdinttmpobjid21 = CreateDynamicObject(1536,351.218,1835.896,2240.578,0.000,0.000,990.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1536,351.255,1832.877,2240.578,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2358,300.992,1830.324,2240.696,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2035,301.309,1826.267,2241.121,0.000,-90.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.695,1821.676,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1822.324,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1822.973,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1823.620,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1824.269,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1824.916,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1826.717,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1827.364,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1828.012,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1828.660,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1829.308,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11729,296.696,1829.885,2240.413,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2358,301.754,1830.326,2240.696,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2358,302.576,1830.333,2240.696,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2358,301.432,1830.334,2240.923,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2358,302.274,1830.330,2240.920,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2358,301.833,1830.340,2241.149,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2035,301.815,1826.277,2241.121,0.000,-90.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2035,302.095,1826.258,2241.121,0.000,-90.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2035,302.978,1826.216,2241.121,0.000,-90.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2035,303.263,1826.236,2241.121,0.000,-90.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2035,303.552,1826.271,2241.121,0.000,-90.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11736,307.288,1820.797,2241.398,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11736,303.802,1820.755,2241.398,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11736,301.716,1820.783,2241.398,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11736,298.631,1820.794,2241.398,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11736,298.144,1820.806,2241.398,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11745,307.645,1820.822,2240.868,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11745,306.976,1820.875,2240.868,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11745,301.611,1820.858,2240.868,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11745,300.847,1820.875,2240.868,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11713,312.763,1820.572,2242.095,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19942,307.437,1820.807,2242.204,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19141,304.889,1820.796,2242.161,-30.000,-90.000,5.940,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19141,301.835,1820.828,2242.161,-30.000,-90.000,5.940,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19141,301.557,1820.798,2242.161,-30.000,-90.000,5.940,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19141,301.334,1820.813,2242.161,-30.000,-90.000,5.940,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19141,301.068,1820.830,2242.161,-30.000,-90.000,5.940,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19141,300.726,1820.814,2242.161,-30.000,-90.000,5.940,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19142,307.290,1820.765,2243.013,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19142,306.829,1820.751,2243.013,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19142,303.808,1820.772,2243.013,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19142,301.709,1820.783,2243.013,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19142,298.170,1820.757,2243.013,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18637,296.588,1827.233,2243.005,72.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18637,296.582,1827.834,2243.005,72.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18637,296.574,1828.475,2243.005,72.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18637,296.540,1821.469,2243.005,72.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2041,305.475,1830.178,2242.477,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2041,305.175,1830.182,2242.477,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2041,303.835,1830.199,2242.477,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2041,303.576,1830.222,2242.477,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2041,303.295,1830.186,2242.477,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(3013,298.106,1830.265,2242.412,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(3013,299.028,1830.274,2242.412,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(3013,300.028,1830.257,2242.412,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(3082,303.432,1826.084,2242.048,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(3082,302.509,1826.100,2242.048,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(3082,303.383,1825.369,2242.048,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(3082,301.442,1825.370,2242.048,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2043,299.941,1830.210,2241.958,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2043,299.039,1830.118,2241.958,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2043,299.361,1830.442,2241.958,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,305.131,1830.204,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,304.647,1830.218,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,304.369,1830.191,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,303.867,1830.183,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,303.324,1830.191,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2043,299.941,1830.210,2241.045,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2043,298.519,1830.333,2241.045,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2043,298.302,1830.130,2241.045,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,299.828,1830.229,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,299.006,1830.259,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,305.052,1830.183,2241.047,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2040,305.368,1830.192,2241.047,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18642,307.068,1820.818,2242.115,90.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11750,307.599,1820.755,2242.111,0.000,0.000,66.300,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11750,307.656,1820.968,2242.111,0.000,0.000,66.300,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18641,303.905,1825.560,2242.373,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18641,303.912,1825.280,2242.373,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2036,305.870,1820.564,2241.123,90.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2036,302.829,1820.603,2241.123,90.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2036,299.768,1820.560,2241.123,90.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2036,302.829,1820.603,2242.001,90.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2044,301.448,1825.432,2241.511,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2044,302.013,1825.417,2241.511,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2044,303.623,1825.454,2241.511,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2044,302.316,1825.956,2241.511,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1672,305.341,1830.035,2241.940,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1672,304.831,1830.057,2241.940,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2034,303.341,1830.282,2241.872,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2034,303.779,1830.114,2241.872,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18636,306.778,1825.442,2241.541,0.000,0.000,-121.319,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19808,312.235,1835.760,2241.397,0.000,0.000,0.419,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11713,349.534,1827.540,2242.095,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2616,327.663,1827.540,2242.353,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2612,344.186,1826.059,2242.405,0.000,0.000,-90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2611,344.199,1823.746,2242.405,0.000,0.000,-90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2197,336.709,1823.790,2240.022,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2000,341.285,1822.820,2240.065,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2000,341.785,1822.820,2240.065,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19808,340.112,1828.425,2241.299,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19808,342.739,1828.421,2241.299,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19894,343.916,1824.058,2241.373,0.000,0.000,-122.879,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2611,334.599,1842.458,2242.405,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11706,333.844,1842.228,2240.584,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11706,333.568,1820.487,2240.584,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1714,334.971,1821.450,2240.584,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1715,335.769,1824.680,2240.584,0.000,0.000,-35.159,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(1715,334.213,1824.705,2240.584,0.000,0.000,21.359,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19808,335.306,1822.935,2241.527,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2274,335.806,1820.764,2242.568,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2272,334.930,1820.730,2241.705,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2275,333.823,1820.718,2242.364,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2270,335.656,1820.937,2242.116,0.000,0.000,-90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19807,334.511,1823.325,2241.585,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11749,331.243,1820.477,2241.633,0.000,0.000,22.559,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11749,331.345,1820.484,2241.633,0.000,0.000,3.240,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11736,331.722,1820.485,2241.628,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19824,331.050,1820.463,2242.367,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19623,330.517,1820.498,2241.685,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19352,331.749,1820.496,2241.971,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19352,331.368,1820.495,2241.971,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19331,330.915,1820.462,2242.057,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19330,330.532,1820.468,2242.063,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19100,331.355,1820.507,2241.398,0.000,-90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18636,330.989,1820.562,2241.387,0.000,0.000,89.459,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18636,330.690,1820.573,2241.387,0.000,0.000,89.459,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18636,330.429,1820.563,2241.387,0.000,0.000,89.459,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19355,338.299,1829.045,2238.841,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2886,313.271,1831.554,2241.713,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2886,309.826,1826.886,2241.713,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19172,326.446,1829.559,2242.776,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19174,325.977,1843.495,2242.526,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(11711,351.173,1834.386,2243.396,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2036,304.915,1825.935,2241.524,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2985,300.632,1825.373,2240.583,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19602,304.417,1830.263,2241.911,0.000,0.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19375,317.520,1831.689,2245.065,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19375,311.523,1831.690,2245.067,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19375,311.523,1822.056,2245.067,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19375,322.023,1822.056,2245.067,0.000,90.000,0.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(19623,328.012,1823.403,2242.331,0.000,0.000,90.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18636,327.972,1822.095,2242.315,0.000,0.000,1.859,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(18636,327.985,1822.990,2242.315,0.000,0.000,1.859,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2690,331.220,1829.690,2241.484,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(2690,308.623,1820.678,2241.484,0.000,0.000,180.000,-1,-1,-1);
	lspdinttmpobjid21 = CreateDynamicObject(361,305.734,1825.763,2241.587,76.000,0.000,25.000,-1,-1,-1);
	//Anti boden weg - by GangstaSunny
	/*CreateDynamicObject(19449, 346.46423, 1833.97119, 2240.49707,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19449, 346.46420, 1830.48425, 2240.49707,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19449, 350.08429, 1840.53943, 2240.49707,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19449, 339.90701, 1834.33459, 2240.49609,   0.00000, 90.00000, 0.00000);*/
	//Ab hier Zellenerweiterung - by GangstaSunny
	lspdinttmpobjid21 = CreateDynamicObject(19379, 344.32501, 1812.94128, 2240.57593,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 351.20999, 1814.49890, 2240.57593,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 344.32501, 1803.38416, 2240.57593,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 349.04205, 1800.06543, 2240.57593,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 358.64581, 1800.06543, 2240.57593,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 368.26990, 1800.06543, 2240.57593,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 372.99207, 1804.88330, 2240.57593,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	CreateDynamicObject(18981, 348.70999, 1805.33044, 2245.90405,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(18981, 373.69229, 1805.33044, 2245.90405,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(18981, 373.70459, 1830.33789, 2245.90405,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19302, 351.20300, 1808.79626, 2241.82324,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2930, 351.22711, 1807.92249, 2243.20459,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2930, 351.22711, 1806.21423, 2243.20459,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2930, 351.22711, 1804.49084, 2243.20459,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2930, 351.22711, 1802.78271, 2243.20459,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2930, 351.22711, 1801.06116, 2243.20459,   0.00000, 0.00000, 0.00000);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 351.20999, 1810.17017, 2248.45605,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 351.20999, 1800.53271, 2248.45605,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	CreateDynamicObject(1771, 359.72467, 1808.35583, 2241.19336,   0.00000, 0.00000, 0.00000);
	//lspdinttmpobjid21 = CreateDynamicObject(19379, 351.2100, 1804.8868, 2248.4561,   0.00000, 0.00000, 90.00000);
	//SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	CreateDynamicObject(1771, 363.30240, 1808.35583, 2241.19336,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1771, 366.98459, 1808.35583, 2241.19336,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2695, 361.05209, 1800.15662, 2241.99365,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2256, 356.39679, 1800.17810, 2242.32886,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(11631, 347.60397, 1800.81226, 2241.81177,   0.00000, 0.00000, 180.00000);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 356.12939, 1809.77625, 2240.57593,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19392, 346.58920, 1827.45190, 2242.32495,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);

	CreateDynamicObject(1495, 322.73929, 1834.27905, 2240.58203,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(19305, 322.83569, 1836.03772, 2241.97534,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19305, 322.67569, 1836.03772, 2241.97534,   0.00000, 0.00000, 270.00000);
	lspdinttmpobjid21 = CreateDynamicObject(19273, 345.47363, 1827.52173, 2241.95728,   0.00000, 0.00000, 180.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19273, 347.63062, 1827.36877, 2241.95728,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 365.76489, 1809.77625, 2240.57593,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);
	lspdinttmpobjid21 = CreateDynamicObject(19379, 375.38879, 1809.77625, 2240.57593,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(lspdinttmpobjid21, 0, 3786, "missiles_sfs", "ws_greyfoam", 0);

	//Zollstationen - Map by Daniel_LeMarc
	Zollboden(CreateDynamicObject(18766, 52.92030, -1531.75195, 3.87230,   90.00000, 0.00000, -8.50000));
	Zollwand(CreateDynamicObject(19362, 57.82330, -1531.64722, 6.11910,   0.00000, 0.00000, -8.50000));
	Zollwand(CreateDynamicObject(19435, 57.46840, -1534.02783, 6.11910,   0.00000, 0.00000, -8.50000));
	Zollwand(CreateDynamicObject(19362, 55.85970, -1534.51135, 6.11910,   0.00000, 0.00000, 81.50000));
	Zollwand(CreateDynamicObject(19408, 56.54610, -1529.91626, 6.11910,   0.00000, 0.00000, 81.50000));
	Zollwand(CreateDynamicObject(19362, 53.37150, -1529.44067, 6.11910,   0.00000, 0.00000, 81.50000));
	Zollwand(CreateDynamicObject(19362, 50.19600, -1528.96655, 6.11910,   0.00000, 0.00000, 81.50000));
	Zollwand(CreateDynamicObject(19391, 48.47030, -1530.24353, 6.11910,   0.00000, 0.00000, -8.50000));
	Zollwand(CreateDynamicObject(19435, 48.11450, -1532.62476, 6.11910,   0.00000, 0.00000, -8.50000));
	Zollwand(CreateDynamicObject(19362, 52.68380, -1534.03625, 6.11910,   0.00000, 0.00000, 81.50000));
	Zollwand(CreateDynamicObject(19408, 49.51240, -1533.55835, 6.11910,   0.00000, 0.00000, 81.50000));
	CreateDynamicObject(966, 55.66105, -1535.77344, 4.08410,   0.00000, 0.00000, 81.50000);
	CreateDynamicObject(966, 50.20954, -1527.86536, 4.02010,   0.00000, 0.00000, -98.50000);
	CreateDynamicObject(19466, 49.66439, -1533.53931, 6.85540,   0.00000, 0.00000, 81.50000);
	CreateDynamicObject(19466, 56.48126, -1529.93652, 6.85540,   0.00000, 0.00000, 81.50000);
	CreateDynamicObject(1495, 48.58050, -1529.47949, 4.35680,   0.00000, 0.00000, -98.50000);
	CreateDynamicObject(19273, 48.26450, -1531.24524, 5.48140,   0.00000, 0.00000, -98.50000);
	Zollbecken(CreateDynamicObject(2515, 49.36397, -1533.77515, 5.40870,   0.00000, 0.00000, -8.50000));
	Zollbecken(CreateDynamicObject(2515, 56.69300, -1529.70142, 5.40870,   0.00000, 0.00000, -188.50000));
	CreateDynamicObject(1999, 55.94430, -1530.41882, 4.36320,   0.00000, 0.00000, -8.50000);
	CreateDynamicObject(1999, 50.07789, -1533.07544, 4.36320,   0.00000, 0.00000, -188.50000);
	CreateDynamicObject(1663, 49.47076, -1531.88904, 4.79570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1663, 56.26511, -1531.18140, 4.79570,   0.00000, 0.00000, 140.00000);
	CreateDynamicObject(2199, 52.31107, -1529.40369, 4.36790,   0.00000, 0.00000, -8.50000);
	CreateDynamicObject(2608, 54.37058, -1533.98315, 5.08430,   0.00000, 0.00000, -188.50000);
	Zolldecke(CreateDynamicObject(19457, 53.15302, -1532.48096, 7.78750,   0.00000, 90.00000, 81.50000));
	Zolldecke(CreateDynamicObject(19457, 52.64160, -1532.40100, 7.78350,   0.00000, 90.00000, 81.50000));
	Zolldecke(CreateDynamicObject(19457, 53.39500, -1530.85681, 7.78150,   0.00000, 90.00000, 81.50000));
	Zolldecke(CreateDynamicObject(19457, 52.88640, -1530.78149, 7.78950,   0.00000, 90.00000, 81.50000));
	CreateDynamicObject(1237, 51.47913, -1520.33606, 4.15940,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1237, 54.53506, -1543.74219, 4.15940,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2921, 51.35996, -1533.85815, 6.70720,   0.00000, 6.50000, 78.50000);
	CreateDynamicObject(2921, 54.93110, -1529.59387, 6.70720,   0.00000, 6.50000, -98.50000);
	CreateDynamicObject(1495, 48.58050, -1529.47949, 4.35680,   0.00000, 0.00000, -8.50000);
	Zollboden(CreateDynamicObject(18765, 1750.99060, 513.50226, 25.00740,   0.00000, 0.00000, -19.00000));
	Zollboden(CreateDynamicObject(18765, 1723.27649, 522.91718, 25.00740,   0.00000, 0.00000, -19.00000));
	Zollboden(CreateDynamicObject(18764, 1721.71216, 526.08472, 28.50740,   0.00000, 0.00000, -19.00000));
	Zollboden(CreateDynamicObject(18764, 1752.83472, 510.21121, 28.50740,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19391, 1748.25049, 509.31189, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19362, 1747.30823, 511.24261, 29.25420,   0.00000, 0.00000, -19.00000));
	CreateDynamicObject(966, 1749.80640, 517.45148, 27.01540,   0.00000, 0.00000, -19.00000);
	Zollwand(CreateDynamicObject(19435, 1747.12488, 512.92737, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19408, 1746.94775, 514.61267, 29.25420,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19435, 1748.11975, 515.81427, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19435, 1749.03088, 516.26227, 29.25420,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19362, 1750.70435, 516.44519, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19362, 1753.74109, 515.39899, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19362, 1754.69348, 513.45538, 29.25420,   0.00000, 0.00000, -19.00000));
	Zolldecke(CreateDynamicObject(19377, 1750.47437, 511.68616, 31.04890,   0.00000, 90.00000, -19.00000));
	CreateDynamicObject(19425, 1742.62646, 511.61121, 27.45790,   0.00000, 0.00000, -19.00000);
	CreateDynamicObject(1214, 1745.01074, 510.60727, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1746.46045, 510.09912, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1745.37732, 511.73074, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1747.09827, 516.54199, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1747.44312, 517.50208, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1747.86426, 518.87604, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1745.79114, 512.97980, 27.05000,   0.00000, 0.00000, 0.00000);
	Zolldecke(CreateDynamicObject(19377, 1737.12073, 518.66125, 30.39090,   0.00000, 90.00000, -19.00000));
	Zollwand(CreateDynamicObject(19454, 1738.49976, 522.62018, 28.66130,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19454, 1741.43286, 516.60852, 28.66130,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19454, 1732.48792, 519.68713, 28.66130,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19454, 1735.42090, 513.67261, 28.66130,   0.00000, 0.00000, -109.00000));
	Zolldecke(CreateDynamicObject(19377, 1736.73645, 517.53412, 30.38690,   0.00000, 90.00000, -19.00000));
	Zollwand(CreateDynamicObject(19454, 1752.45569, 518.20209, 26.45330,   0.00000, 0.00000, -109.00000));
	Zollbecken(CreateDynamicObject(2515, 1746.70313, 514.65558, 28.56720,   0.00000, 0.00000, -109.00000));
	CreateDynamicObject(19466, 1746.90039, 514.47882, 30.16040,   0.00000, 0.00000, -19.00000);
	Zollwand(CreateDynamicObject(19391, 1726.23035, 527.04889, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19362, 1727.17395, 525.10950, 29.25420,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19435, 1727.35571, 523.43939, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19408, 1727.53625, 521.77002, 29.25420,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19435, 1726.36365, 520.56689, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19435, 1725.44788, 520.12372, 29.25420,   0.00000, 0.00000, -19.00000));
	Zollwand(CreateDynamicObject(19362, 1723.77686, 519.93927, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19362, 1720.74036, 520.98450, 29.25420,   0.00000, 0.00000, -109.00000));
	Zollwand(CreateDynamicObject(19362, 1719.80066, 522.91559, 29.25420,   0.00000, 0.00000, -19.00000));
	Zolldecke(CreateDynamicObject(19377, 1724.05481, 524.64081, 31.04890,   0.00000, 90.00000, -19.00000));
	Zollwand(CreateDynamicObject(19454, 1721.85474, 518.29382, 26.62130,   0.00000, 0.00000, -109.00000));
	CreateDynamicObject(966, 1724.28271, 518.72668, 27.41940,   0.00000, 0.00000, -199.00000);
	CreateDynamicObject(1214, 1726.35498, 517.39551, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1726.72302, 518.53705, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1727.13965, 519.72522, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1728.45764, 523.46124, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1729.27380, 525.85449, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1728.86194, 524.64044, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1728.06592, 526.25549, 27.05000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 1727.55786, 521.69946, 30.16040,   0.00000, 0.00000, -19.00000);
	CreateDynamicObject(19425, 1731.57947, 524.66821, 26.95790,   0.00000, 0.00000, -19.00000);
	Zollbecken(CreateDynamicObject(2515, 1727.75439, 521.63232, 28.56720,   0.00000, 0.00000, -289.00000));
	CreateDynamicObject(1999, 1747.34143, 513.94055, 27.49710,   0.00000, 0.00000, -289.00000);
	CreateDynamicObject(1663, 1748.43958, 514.01422, 27.94610,   0.00000, 0.00000, -149.00000);
	Zollwand(CreateDynamicObject(19362, 1751.85291, 514.43903, 29.25420,   0.00000, 0.00000, -19.00000));
	CreateDynamicObject(2606, 1750.77441, 516.07288, 30.24570,   0.00000, 0.00000, -19.00000);
	CreateDynamicObject(2608, 1750.77441, 516.07690, 28.19270,   0.00000, 0.00000, -19.00000);
	CreateDynamicObject(957, 1749.47229, 513.58997, 30.94370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1495, 1747.54883, 509.53030, 27.49110,   0.00000, 0.00000, -19.00000);
	CreateDynamicObject(1495, 1747.54883, 509.53030, 27.49110,   0.00000, 0.00000, -289.00000);
	CreateDynamicObject(1999, 1727.13696, 522.41260, 27.49710,   0.00000, 0.00000, -109.00000);
	CreateDynamicObject(1663, 1726.11157, 522.16913, 27.94610,   0.00000, 0.00000, 39.00000);
	CreateDynamicObject(957, 1724.61267, 522.88324, 30.94370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2608, 1723.84021, 520.25464, 28.19270,   0.00000, 0.00000, -199.00000);
	Zollwand(CreateDynamicObject(19362, 1722.82520, 522.02051, 29.25420,   0.00000, 0.00000, -19.00000));
	CreateDynamicObject(2606, 1723.97961, 520.25726, 30.24570,   0.00000, 0.00000, -199.00000);
	CreateDynamicObject(1495, 1726.96741, 526.81628, 27.49110,   0.00000, 0.00000, -199.00000);
	CreateDynamicObject(1495, 1726.96741, 526.81628, 27.49110,   0.00000, 0.00000, -109.00000);
	Zollwand(CreateDynamicObject(19435, 1727.94885, 527.39221, 25.76220,   0.00000, 0.00000, -19.00000));
	CreateDynamicObject(14416, 1726.55151, 529.73712, 24.30360,   0.00000, 0.00000, -199.00000);
	Zollwand(CreateDynamicObject(19435, 1724.02917, 528.53314, 25.76220,   0.00000, 0.00000, -19.00000));
	CreateDynamicObject(19273, 1725.28015, 527.45117, 28.68760,   0.00000, 0.00000, -199.00000);
	CreateDynamicObject(19273, 1749.32080, 508.89636, 28.68760,   0.00000, 0.00000, -19.00000);
	Zollboden(CreateDynamicObject(18765, 1724.41284, 526.20410, 24.45240,   0.00000, 0.00000, -19.00000));
	CreateDynamicObject(1214, 1728.66992, 529.68945, 26.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1726.79944, 530.34186, 26.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1724.96875, 530.93695, 26.55000,   0.00000, 0.00000, 0.00000);
	Zollboden(CreateDynamicObject(18766, 516.87604, 469.13684, 17.72110,   90.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19391, 518.95782, 464.82291, 19.96700,   0.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19454, 514.99872, 467.82834, 19.96700,   0.00000, 0.00000, -145.00000));
	Zollwand(CreateDynamicObject(19362, 513.52972, 472.57419, 19.96700,   0.00000, 0.00000, -55.00000));
	CreateDynamicObject(966, 518.48480, 470.33939, 17.87020,   0.00000, 0.00000, 215.00000);
	Zollwand(CreateDynamicObject(19435, 520.93060, 466.20450, 19.96700,   0.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19408, 520.64789, 467.86130, 19.96700,   0.00000, 0.00000, 35.00000));
	Zollwand(CreateDynamicObject(19435, 519.19031, 468.69580, 19.96700,   0.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19435, 515.50092, 473.95309, 19.96700,   0.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19408, 516.95892, 473.11841, 19.96700,   0.00000, 0.00000, 35.00000));
	Zollwand(CreateDynamicObject(19435, 517.24438, 471.46552, 19.96700,   0.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19362, 517.63391, 469.67160, 19.96700,   0.00000, 0.00000, 35.00000));
	Zolldecke(CreateDynamicObject(19457, 515.91602, 469.40839, 21.76700,   0.00000, 90.00000, -145.00000));
	Zolldecke(CreateDynamicObject(19438, 516.17322, 473.32980, 21.76500,   0.00000, 90.00000, -55.00000));
	Zolldecke(CreateDynamicObject(19438, 516.66260, 472.63419, 21.76100,   0.00000, 90.00000, -55.00000));
	Zolldecke(CreateDynamicObject(19457, 516.69092, 468.30090, 21.76300,   0.00000, 90.00000, -145.00000));
	Zolldecke(CreateDynamicObject(19438, 520.46478, 467.20511, 21.76100,   0.00000, 90.00000, -55.00000));
	Zolldecke(CreateDynamicObject(19438, 520.13953, 467.66861, 21.75900,   0.00000, 90.00000, -55.00000));
	CreateDynamicObject(1999, 519.83795, 468.01044, 18.20760,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(1999, 516.20630, 473.20541, 18.20760,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(1663, 519.23694, 467.05167, 18.66150,   0.00000, 0.00000, 70.00000);
	CreateDynamicObject(1663, 515.81000, 472.19720, 18.66150,   0.00000, 0.00000, 100.00000);
	CreateDynamicObject(2199, 517.14618, 470.09402, 18.21440,   0.00000, 0.00000, -55.00000);
	CreateDynamicObject(630, 517.92078, 468.47089, 19.19600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 520.69891, 467.76926, 20.85290,   0.00000, 0.00000, 35.00000);
	CreateDynamicObject(19466, 517.00214, 473.07538, 20.85290,   0.00000, 0.00000, 35.00000);
	Zollbecken(CreateDynamicObject(2515, 520.84082, 468.02240, 19.26740,   0.00000, 0.00000, -235.00000));
	Zollbecken(CreateDynamicObject(2515, 517.22430, 473.20493, 19.26740,   0.00000, 0.00000, -235.00000));
	CreateDynamicObject(1495, 518.36603, 464.38879, 18.20390,   0.00000, 0.00000, 35.00000);
	CreateDynamicObject(1495, 518.36603, 464.38879, 18.20390,   0.00000, 0.00000, 125.00000);
	CreateDynamicObject(19273, 519.87170, 465.40497, 19.42420,   0.00000, 0.00000, 35.00000);
	Zollboden(CreateDynamicObject(18763, 525.92499, 475.83160, 17.22110,   90.00000, 0.00000, 35.00000));
	Zollwand(CreateDynamicObject(19362, 525.51721, 475.50140, 19.96700,   0.00000, 0.00000, 35.00000));
	Zollwand(CreateDynamicObject(19435, 525.23157, 477.15778, 19.96700,   0.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19435, 526.97559, 474.66650, 19.96700,   0.00000, 0.00000, -55.00000));
	Zollwand(CreateDynamicObject(19362, 526.69513, 476.32990, 19.96700,   0.00000, 0.00000, 35.00000));
	Zolldecke(CreateDynamicObject(19438, 526.24591, 475.98697, 21.76100,   0.00000, 90.00000, -55.00000));
	Zolldecke(CreateDynamicObject(19438, 525.98993, 475.80310, 21.75700,   0.00000, 90.00000, -55.00000));
	CreateDynamicObject(1214, 525.10724, 475.03326, 18.16470,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2921, 515.41998, 473.97198, 20.90750,   0.50000, 0.00000, -55.00000);
	CreateDynamicObject(2921, 526.66138, 474.39551, 20.90750,   0.50000, 0.00000, 125.00000);
	Zollboden(CreateDynamicObject(18766, -173.36424, 366.60071, 10.80280,   90.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19454, -175.57600, 367.28571, 13.04780,   0.00000, 0.00000, -15.00000));
	Zollwand(CreateDynamicObject(19391, -175.33545, 362.32263, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19435, -173.00929, 361.69958, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19408, -171.96445, 362.98996, 13.04780,   0.00000, 0.00000, -15.00000));
	Zollwand(CreateDynamicObject(19435, -172.22520, 364.63620, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19362, -172.88670, 371.46219, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19435, -170.56160, 370.83850, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19408, -170.26450, 369.18839, 13.04780,   0.00000, 0.00000, -15.00000));
	Zollwand(CreateDynamicObject(19435, -171.34680, 367.90829, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19362, -172.47470, 366.45670, 13.04780,   0.00000, 0.00000, -15.00000));
	Zollboden(CreateDynamicObject(18763, -162.60617, 363.79514, 9.80280,   90.00000, 0.00000, -15.00000));
	CreateDynamicObject(966, -171.42410, 366.17340, 11.07510,   0.00000, 0.00000, 165.00000);
	Zollwand(CreateDynamicObject(19362, -162.92540, 363.79111, 13.04780,   0.00000, 0.00000, -15.00000));
	Zollwand(CreateDynamicObject(19435, -162.62737, 362.13867, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19435, -161.84109, 365.07239, 13.04780,   0.00000, 0.00000, 75.00000));
	Zollwand(CreateDynamicObject(19362, -161.54449, 363.42020, 13.04780,   0.00000, 0.00000, -15.00000));
	Zolldecke(CreateDynamicObject(19457, -174.08971, 366.73709, 14.77810,   0.00000, 90.00000, -15.00000));
	Zolldecke(CreateDynamicObject(19457, -174.01746, 366.99823, 14.77610,   0.00000, 90.00000, -15.00000));
	Zolldecke(CreateDynamicObject(19438, -172.41830, 363.11261, 14.77810,   0.00000, 90.00000, 75.00000));
	Zolldecke(CreateDynamicObject(19438, -170.75830, 369.30020, 14.77810,   0.00000, 90.00000, 75.00000));
	Zolldecke(CreateDynamicObject(19438, -162.33034, 363.66412, 14.77810,   0.00000, 90.00000, 75.00000));
	Zolldecke(CreateDynamicObject(19438, -162.05920, 363.59241, 14.77610,   0.00000, 90.00000, 75.00000));
	CreateDynamicObject(1214, -163.58279, 364.05911, 10.83770,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, -171.93660, 362.89841, 13.89690,   0.00000, 0.00000, -15.00000);
	CreateDynamicObject(19466, -170.20572, 369.14639, 13.89690,   0.00000, 0.00000, -15.00000);
	Zollbecken(CreateDynamicObject(2515, -171.68080, 362.89090, 12.29030,   0.00000, 0.00000, 75.00000));
	Zollbecken(CreateDynamicObject(2515, -170.00960, 369.15207, 12.29030,   0.00000, 0.00000, 75.00000));
	CreateDynamicObject(1495, -176.08321, 362.51569, 11.28400,   0.00000, 0.00000, -15.00000);
	CreateDynamicObject(1495, -176.08321, 362.51569, 11.28400,   0.00000, 0.00000, 75.00000);
	CreateDynamicObject(1999, -172.35770, 363.60550, 11.29140,   0.00000, 0.00000, -105.00000);
	CreateDynamicObject(1999, -170.72081, 369.85162, 11.29140,   0.00000, 0.00000, -105.00000);
	CreateDynamicObject(1663, -171.54460, 369.34039, 11.72820,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(1663, -173.26628, 363.22928, 11.72820,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(2199, -172.55705, 366.76340, 11.29670,   0.00000, 0.00000, -105.00000);
	CreateDynamicObject(2921, -162.86690, 362.10321, 14.32900,   0.00000, 4.00000, 75.00000);
	CreateDynamicObject(2921, -170.50450, 370.89548, 14.32900,   0.00000, 4.00000, -105.00000);
	CreateDynamicObject(19273, -174.35396, 362.00662, 12.50750,   0.00000, 0.00000, -15.00000);
	Zollboden(CreateDynamicObject(18766, -974.66705, -336.20856, 35.31840,   90.00000, 0.00000, 78.50000));
	Zollboden(CreateDynamicObject(18766, -959.81335, -338.97473, 35.17640,   90.00000, 0.00000, -11.50000));
	Zollwand(CreateDynamicObject(19454, -976.91858, -335.70230, 37.56500,   0.00000, 0.00000, -11.50000));
	Zollwand(CreateDynamicObject(19391, -976.37280, -340.64041, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19362, -974.48853, -331.37140, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19435, -974.01331, -341.12061, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19408, -973.01001, -339.77451, 37.56500,   0.00000, 0.00000, -11.50000));
	Zollwand(CreateDynamicObject(19362, -972.37048, -336.62741, 37.56500,   0.00000, 0.00000, -11.50000));
	Zollwand(CreateDynamicObject(19435, -972.12903, -331.85291, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19408, -971.73090, -333.48450, 37.56500,   0.00000, 0.00000, -11.50000));
	CreateDynamicObject(1999, -973.47626, -339.17471, 35.81080,   0.00000, 0.00000, -101.50000);
	CreateDynamicObject(1999, -972.19769, -332.90540, 35.81080,   0.00000, 0.00000, -101.50000);
	Zollbecken(CreateDynamicObject(2515, -971.47992, -333.52383, 36.82080,   0.00000, 0.00000, 78.50000));
	Zollbecken(CreateDynamicObject(2515, -972.75574, -339.83215, 36.82080,   0.00000, 0.00000, 78.50000));
	CreateDynamicObject(19466, -972.98792, -339.72421, 38.32690,   0.00000, 0.00000, -11.50000);
	CreateDynamicObject(19466, -971.69708, -333.33847, 38.32690,   0.00000, 0.00000, -11.50000);
	CreateDynamicObject(1663, -973.10815, -333.34943, 36.24370,   0.00000, 0.00000, 50.00000);
	CreateDynamicObject(1663, -974.36328, -339.63544, 36.24370,   0.00000, 0.00000, 50.00000);
	CreateDynamicObject(2199, -972.54590, -336.76410, 35.80940,   0.00000, 0.00000, -101.50000);
	CreateDynamicObject(2608, -976.79120, -336.64621, 36.52560,   0.00000, 0.00000, 78.50000);
	CreateDynamicObject(630, -975.76721, -333.32153, 36.81400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1495, -977.13330, -340.50540, 35.80170,   0.00000, 0.00000, -11.50000);
	CreateDynamicObject(1495, -977.13330, -340.50540, 35.80170,   0.00000, 0.00000, 78.50000);
	CreateDynamicObject(19273, -975.36432, -340.90356, 37.15080,   0.00000, 0.00000, -10.50000);
	CreateDynamicObject(966, -971.78973, -336.59103, 35.42310,   0.00000, 0.00000, 168.50000);
	Zolldecke(CreateDynamicObject(19457, -975.31787, -336.02841, 39.39720,   0.00000, 90.00000, -11.50000));
	Zolldecke(CreateDynamicObject(19457, -973.92908, -336.30911, 39.39320,   0.00000, 90.00000, -11.50000));
	Zollwand(CreateDynamicObject(19362, -963.40582, -338.22449, 37.56500,   0.00000, 0.00000, -11.50000));
	Zollwand(CreateDynamicObject(19362, -962.21979, -340.01569, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19362, -959.07300, -340.65634, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19362, -961.61560, -337.03790, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19362, -958.46887, -337.67780, 37.56500,   0.00000, 0.00000, 78.50000));
	Zollwand(CreateDynamicObject(19362, -957.28003, -339.46811, 37.56500,   0.00000, 0.00000, -11.50000));
	Zolldecke(CreateDynamicObject(19365, -961.81097, -338.55029, 39.39650,   0.00000, 90.00000, -11.50000));
	Zolldecke(CreateDynamicObject(19365, -958.54883, -339.21609, 39.39250,   0.00000, 90.00000, -11.50000));
	CreateDynamicObject(4521, -84.77370, -909.27240, 18.24220,   0.00000, 0.00000, 63.77800);
	CreateDynamicObject(2921, -961.92560, -340.11920, 38.74200,   0.00000, 0.00000, 78.50000);
	CreateDynamicObject(2921, -972.25665, -331.78943, 38.74200,   0.00000, 0.00000, -108.50000);
	CreateDynamicObject(2921, 1723.91797, 527.94208, 30.25760,   0.00000, 0.00000, -109.00000);
	CreateDynamicObject(2921, 1750.19995, 508.45242, 30.25760,   0.00000, 0.00000, 60.00000);
	Zollboden(CreateDynamicObject(18766, 31.71928, -1341.27124, 9.07390,   90.00000, 0.00000, 38.50000));
	Zollwand(CreateDynamicObject(19454, 33.15790, -1342.99658, 11.32260,   0.00000, 0.00000, -51.50000));
	Zollwand(CreateDynamicObject(19391, 35.91480, -1338.86499, 11.32260,   0.00000, 0.00000, 38.50000));
	Zollwand(CreateDynamicObject(19362, 33.78220, -1338.62195, 11.32260,   0.00000, 0.00000, -51.50000));
	Zollwand(CreateDynamicObject(19435, 32.01290, -1339.11853, 11.32260,   0.00000, 0.00000, 38.50000));
	Zollwand(CreateDynamicObject(19362, 30.37830, -1339.50684, 11.32260,   0.00000, 0.00000, -51.50000));
	Zollwand(CreateDynamicObject(19408, 27.86520, -1341.50513, 11.32260,   0.00000, 0.00000, -51.50000));
	Zollwand(CreateDynamicObject(19435, 27.12110, -1343.00928, 11.32260,   0.00000, 0.00000, 38.50000));
	Zollwand(CreateDynamicObject(19362, 28.51150, -1344.75366, 11.32260,   0.00000, 0.00000, 38.50000));
	Zolldecke(CreateDynamicObject(19457, 32.25947, -1341.72009, 13.15260,   0.00000, 90.00000, -51.50000));
	Zolldecke(CreateDynamicObject(19457, 32.11200, -1341.83496, 13.14860,   0.00000, 90.00000, -51.50000));
	Zolldecke(CreateDynamicObject(19365, 28.74640, -1342.76147, 13.14660,   0.00000, 90.00000, -51.50000));
	Zolldecke(CreateDynamicObject(19365, 31.24840, -1340.77258, 13.14860,   0.00000, 90.00000, -51.50000));
	Zolldecke(CreateDynamicObject(19365, 31.58210, -1340.51074, 13.14460,   0.00000, 90.00000, -51.50000));
	CreateDynamicObject(966, 32.84790, -1338.01099, 9.31660,   0.00000, 0.00000, -51.50000);
	CreateDynamicObject(19466, 27.74590, -1341.56287, 12.16120,   0.00000, 0.00000, -51.50000);
	Zollbecken(CreateDynamicObject(2515, 27.73319, -1341.31091, 10.61550,   0.00000, 0.00000, 219.50000));
	CreateDynamicObject(1999, 27.84870, -1342.26489, 9.55500,   0.00000, 0.00000, 38.50000);
	CreateDynamicObject(1663, 28.66440, -1342.75952, 10.01440,   0.00000, 0.00000, 190.00000);
	CreateDynamicObject(2199, 29.72510, -1340.24219, 9.56760,   0.00000, 0.00000, 38.50000);
	CreateDynamicObject(2608, 32.06470, -1343.44836, 10.25850,   0.00000, 0.00000, 219.50000);
	CreateDynamicObject(1495, 36.38460, -1339.42896, 9.55870,   0.00000, 0.00000, 128.50000);
	CreateDynamicObject(1495, 36.38460, -1339.42896, 9.55870,   0.00000, 0.00000, 219.50000);
	CreateDynamicObject(19273, 35.29561, -1338.01746, 10.92660,   0.00000, 0.00000, 128.50000);
	CreateDynamicObject(2921, 27.43460, -1343.53662, 12.50310,   0.00000, 4.50000, 38.50000);
	CreateDynamicObject(1237, 27.86490, -1331.77905, 9.32540,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1237, 26.77171, -1330.45117, 9.32540,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1237, 25.67905, -1329.18054, 9.32540,   0.00000, 0.00000, 0.00000);
	Zollboden(CreateDynamicObject(18766, -8.01161, -1321.06616, 9.96190,   90.00000, 0.00000, 40.00000));
	Zollwand(CreateDynamicObject(19362, -6.51370, -1322.85767, 12.20860,   0.00000, 0.00000, -50.00000));
	Zollwand(CreateDynamicObject(19408, -4.05540, -1320.79382, 12.20860,   0.00000, 0.00000, -50.00000));
	Zollwand(CreateDynamicObject(19435, -3.35100, -1319.27026, 12.20860,   0.00000, 0.00000, 40.00000));
	Zollwand(CreateDynamicObject(19454, -9.49430, -1319.30371, 12.20860,   0.00000, 0.00000, -50.00000));
	Zollwand(CreateDynamicObject(19362, -4.89620, -1317.42615, 12.20860,   0.00000, 0.00000, 40.00000));
	Zollwand(CreateDynamicObject(19435, -8.24590, -1323.15186, 12.20860,   0.00000, 0.00000, 40.00000));
	Zollwand(CreateDynamicObject(19391, -12.14250, -1323.50757, 12.20860,   0.00000, 0.00000, 40.00000));
	Zollwand(CreateDynamicObject(19362, -10.00250, -1323.69434, 12.20860,   0.00000, 0.00000, -50.00000));
	CreateDynamicObject(19466, -4.03170, -1320.82019, 12.96770,   0.00000, 0.00000, -50.00000);
	Zollbecken(CreateDynamicObject(2515, -3.88171, -1320.93640, 11.46090,   0.00000, 0.00000, 40.00000));
	CreateDynamicObject(1999, -3.99520, -1320.03809, 10.45550,   0.00000, 0.00000, -140.00000);
	CreateDynamicObject(2199, -5.81160, -1322.09058, 10.44720,   0.00000, 0.00000, -140.00000);
	CreateDynamicObject(2608, -8.46030, -1318.83911, 11.12630,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(1495, -12.64600, -1322.92261, 10.44590,   0.00000, 0.00000, -50.00000);
	CreateDynamicObject(1495, -12.62880, -1322.91248, 10.44590,   0.00000, 0.00000, 40.00000);
	Zolldecke(CreateDynamicObject(19457, -8.52957, -1320.52209, 14.01660,   0.00000, 90.00000, -50.00000));
	Zolldecke(CreateDynamicObject(19457, -8.36830, -1320.38489, 14.01260,   0.00000, 90.00000, -50.00000));
	Zolldecke(CreateDynamicObject(19365, -4.87930, -1319.54553, 14.01060,   0.00000, 90.00000, -50.00000));
	Zolldecke(CreateDynamicObject(19365, -7.05830, -1321.37317, 14.00660,   0.00000, 90.00000, -50.00000));
	Zolldecke(CreateDynamicObject(19365, -7.64000, -1321.85767, 14.01060,   0.00000, 90.00000, -50.00000));
	CreateDynamicObject(966, -9.00706, -1324.42029, 10.12420,   0.00000, 0.00000, 130.00000);
	CreateDynamicObject(1237, -3.77880, -1330.58386, 10.12340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1237, -2.87310, -1331.67847, 10.12340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1237, -1.77470, -1332.97534, 10.12340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2921, -4.31970, -1318.00610, 13.25190,   0.00000, 6.00000, -140.00000);

   	//LSPD Base - Map by Daniel_LeMarc
	CreateDynamicObject(3934, 1553.31677, -1643.95227, 27.38760,   0.00000, 0.00000, 0.00000); //Helipad
	CreateDynamicObject(3934, 1565.47815, -1654.70691, 27.38760,   0.00000, 0.00000, 0.00000); //Helipad
	CreateDynamicObject(3934, 1565.65540, -1694.36340, 27.38760,   0.00000, 0.00000, 0.00000); //Helipad
	CreateDynamicObject(3934, 1556.78821, -1708.24243, 27.38760,   0.00000, 0.00000, 0.00000); //Helipad
 	CreateDynamicObject(19325, 1553.52917, -1694.07495, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.52930, -1694.07495, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.52930, -1698.20105, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.52930, -1698.20105, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.52930, -1702.32703, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.52930, -1702.32703, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1680.58704, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1680.58704, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1684.71106, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1684.71106, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1688.83704, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1688.83704, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1652.19897, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1656.32495, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1660.45105, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1652.19897, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1656.32495, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1660.45105, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1670.72400, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1666.60205, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1662.48010, 16.43810,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1662.48010, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1666.60205, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, 1553.53333, -1670.72400, 23.08010,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1547.66675, -1664.55627, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1546.65125, -1658.15637, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1545.75525, -1662.00952, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1545.48523, -1664.97205, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1547.59180, -1660.21484, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1546.10791, -1657.64209, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1546.06860, -1686.27686, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1546.18506, -1660.99182, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14400, 1547.38379, -1687.85168, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1546.26123, -1663.26917, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1545.91772, -1659.34009, 12.55710,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(869, 1541.82458, -1649.02637, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1543.21851, -1644.97424, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1542.04004, -1638.19641, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1542.23999, -1642.00867, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1541.24475, -1647.43628, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1541.21436, -1644.37244, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1542.07935, -1639.86670, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1541.24451, -1637.97461, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1541.06714, -1641.95874, 13.14460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14400, 1541.46472, -1647.59534, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1541.64319, -1639.81042, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1541.21179, -1642.06848, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(870, 1547.66602, -1686.16553, 13.10860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1545.34583, -1688.32312, 13.10860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1547.57935, -1689.81555, 13.10860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1545.56006, -1693.78894, 13.10860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1547.71826, -1692.55334, 13.10860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1546.95789, -1664.41895, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1545.98743, -1692.14294, 12.97080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1547.71606, -1688.58533, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1547.69739, -1693.54272, 13.00680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14400, 1547.26489, -1659.50562, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1546.86987, -1691.91553, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1546.15759, -1688.19043, 12.71310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(869, 1541.61279, -1701.86731, 13.27080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1541.55396, -1710.04395, 13.27080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1542.74768, -1705.84277, 13.27080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1541.55432, -1713.54541, 13.27080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1540.80725, -1707.79468, 13.19260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1540.82092, -1704.62219, 13.19260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1541.73560, -1701.89453, 13.19260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1541.47754, -1713.81921, 13.19260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(870, 1541.25293, -1710.68640, 13.19260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14400, 1541.59143, -1703.76953, 12.81110,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1541.57166, -1708.52734, 12.78310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14400, 1541.72021, -1712.21179, 12.75510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1364, 1552.57776, -1665.91418, 13.32320,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1364, 1552.57776, -1659.91418, 13.32320,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1364, 1552.57776, -1653.91418, 13.32320,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1364, 1552.57776, -1685.41418, 13.32320,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1364, 1552.57776, -1691.41418, 13.32320,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1364, 1552.57776, -1697.41418, 13.32320,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(669, 1546.05176, -1661.47974, 12.62930,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(669, 1546.34436, -1690.35645, 12.62930,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19466, 1544.26978, -1630.17480, 14.41000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1411, 1542.55615, -1621.15588, 15.01980,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1411, 1545.92725, -1632.83875, 15.01980,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1411, 1545.93298, -1638.08911, 15.01980,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1546.27576, -1620.20984, 16.37890,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1579.39221, -1617.59058, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1575.21582, -1617.59167, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1571.03894, -1617.59241, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1566.86267, -1617.59241, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1562.68689, -1617.59302, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1558.51270, -1617.59265, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1554.33557, -1617.59167, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1548.15393, -1617.63293, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8572, 1553.07544, -1616.72339, 14.64630,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(970, 1581.48682, -1620.19312, 16.37890,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1548.16968, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1550.26001, -1622.83447, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1554.33557, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1558.51270, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1562.68689, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1566.86267, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1571.03894, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1575.21582, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1579.39221, -1622.83362, 16.37890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1214, 1581.33301, -1622.55029, 15.70880,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1214, 1581.34583, -1617.86365, 15.70880,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1214, 1546.25378, -1617.88379, 15.70880,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1214, 1546.26599, -1622.60083, 15.70880,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19430, 1559.49744, -1615.80896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1562.99744, -1615.80896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1559.49744, -1612.30896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1562.99744, -1612.30896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1566.49744, -1615.80896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1569.99744, -1615.80896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1573.49744, -1615.80896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1576.99744, -1615.80896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1580.49744, -1615.80896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1566.49744, -1612.30896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1569.99744, -1612.30896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1573.49744, -1612.30896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1576.99744, -1612.30896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1580.49744, -1612.30896, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1589.49744, -1617.74500, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1592.99744, -1617.74500, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1596.49744, -1617.74500, 11.61940,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1599.99744, -1617.74500, 11.65940,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1603.49744, -1617.74500, 11.69940,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1606.99744, -1617.74500, 11.74140,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1589.49744, -1614.24500, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1592.99744, -1614.24500, 11.58540,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1596.49744, -1614.24500, 11.61940,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1599.99744, -1614.24500, 11.65940,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1603.49744, -1614.24500, 11.69940,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19430, 1606.99744, -1614.24500, 11.74140,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(640, 1565.50769, -1637.50037, 13.22210,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(640, 1554.74072, -1637.50037, 13.22210,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(640, 1575.40405, -1637.73792, 13.22210,   0.00000, 0.00000, 90.00000);
    CreateDynamicObject(1361, 1535.13123, -1638.18970, 13.20700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1538.16211, -1669.49683, 13.20700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1538.14929, -1675.88220, 13.20700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1538.14197, -1672.77881, 13.20700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1361, 1535.12219, -1721.61829, 13.20700,   0.00000, 0.00000, 0.00000);

	//Textur LSPD Exterior ------------------- Zaun -------------------------------

	Zaun(CreateDynamicObject(970, 1534.75439, -1683.72241, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75403, -1687.85034, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75342, -1692.00830, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75330, -1696.16724, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75305, -1700.30847, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75415, -1704.46912, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75537, -1708.63660, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75488, -1712.79639, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75464, -1716.95801, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.75598, -1719.04761, 13.03560,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.69446, -1640.95630, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.69653, -1645.11206, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.69836, -1649.28540, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.69995, -1653.44250, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.70422, -1661.69739, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1534.70068, -1657.59058, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1537.58704, -1666.00354, 13.03360,   0.00000, 0.00000, 90.00000));
	Zaun(CreateDynamicObject(970, 1537.58398, -1679.44043, 13.03360,   0.00000, 0.00000, 90.00000));

	//Textur LSPD Exterior ----------------- Scheiben -----------------------------


	Scheiben_LSPD(CreateDynamicObject(19378, 1553.60864, -1696.84131, 21.81360,   0.00000, 0.00000, 0.00000));
	Scheiben_LSPD(CreateDynamicObject(19458, 1553.61060, -1696.84033, 14.81390,   0.00000, 0.00000, 0.00000));
	Scheiben_LSPD(CreateDynamicObject(19378, 1553.62061, -1683.34326, 21.81360,   0.00000, 0.00000, 0.00000));
   	Scheiben_LSPD(CreateDynamicObject(19458, 1553.62061, -1683.34326, 14.81390,   0.00000, 0.00000, 0.00000));
	Scheiben_LSPD(CreateDynamicObject(19378, 1553.62061, -1667.84326, 21.81360,   0.00000, 0.00000, 0.00000));
   	Scheiben_LSPD(CreateDynamicObject(19378, 1553.62061, -1654.84326, 21.81360,   0.00000, 0.00000, 0.00000));
    Scheiben_LSPD(CreateDynamicObject(19458, 1553.62061, -1667.84326, 14.81390,   0.00000, -0.02600, 0.00000));
    Scheiben_LSPD(CreateDynamicObject(19458, 1553.62122, -1654.84326, 14.81390,   0.00000, -0.02600, 0.00000));

	//Textur LSPD Exterior ----------------- Mauer an Scheiben -----------------------------

	MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33240, -1678.47327, 24.67130,   0.00000, 0.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33240, -1678.47327, 21.17330,   0.00000, 0.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33044, -1678.47327, 17.67330,   0.00000, 0.00000, 90.00000));
   	MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33240, -1678.47327, 14.17330,   0.00000, 0.00000, 90.00000));
   	MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90894, -1686.99548, 12.85380,   0.00000, 90.00000, 90.00000));
   	MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90894, -1684.72546, 12.85380,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90894, -1682.45447, 12.85380,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90894, -1679.45447, 12.85380,   0.00000, 90.00000, 90.00000));
   	MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90088, -1693.16748, 12.85380,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90088, -1695.43848, 12.85380,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90088, -1697.70850, 12.85380,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90088, -1699.97852, 12.85380,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33240, -1672.72424, 14.17330,   0.00000, 0.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33044, -1672.72424, 17.67330,   0.00000, 0.00000, 90.00000));
  	MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33240, -1672.72424, 21.17330,   0.00000, 0.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(19433, 1554.33240, -1672.72424, 24.67130,   0.00000, 0.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.90894, -1670.95447, 12.85380,   0.00000, 90.00000, 90.00000));
   	MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1667.95447, 12.85380,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1665.68250, 12.85380,   0.00000, 90.00000, 90.00000));
   	MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1663.41052, 12.85580,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1658.41052, 12.85580,   0.00000, 90.00000, 90.00000));
   	MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1656.14050, 12.85580,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1653.87354, 12.85580,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1651.60449, 12.85580,   0.00000, 90.00000, 90.00000));
    MauerScheiben_LSPD(CreateDynamicObject(9131, 1553.91284, -1649.33350, 12.85580,   0.00000, 90.00000, 90.00000));

	//Textur LSPD Exterior ----------------- Mauer Garagen Eingang -----------------------------

    Mauer_LSPD(CreateDynamicObject(19357, 1543.00000, 7810.00000, -1619.00000,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1542.78308, -1619.45752, 14.13440,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1542.78308, -1622.66760, 14.13440,   0.00000, 0.00000, 0.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1544.47693, -1624.18250, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1546.16980, -1622.66711, 14.13440,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1546.16980, -1619.45752, 14.13440,   0.00000, 0.00000, 0.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1544.46375, -1622.66455, 15.79440,   0.00000, 90.00000, 0.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1544.50183, -1619.45349, 15.79440,   0.00000, 90.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1542.78308, -1631.74756, 14.13440,   0.00000, 0.00000, 0.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1544.47522, -1630.23035, 14.13440,   0.00000, 0.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1544.47717, -1633.26440, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1546.17224, -1631.74976, 14.13440,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1544.45166, -1631.74731, 15.79440,   0.00000, 90.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1541.16589, -1617.94556, 14.16840,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1546.17188, -1634.95898, 14.13440,   0.00000, 0.00000, 0.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1546.17102, -1638.16846, 14.13440,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19403, 1544.47778, -1630.23474, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1544.45166, -1631.75134, 13.48640,   0.00000, 90.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19449, 1539.57336, -1613.21594, 14.16840,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1539.57361, -1606.79358, 14.16840,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1539.57715, -1603.89380, 14.16840,   0.00000, 0.00000, 0.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1547.84485, -1622.77856, 14.13440,   0.00000, -0.35000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1551.05579, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1554.26575, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1557.47070, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1560.67871, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1563.88867, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1567.09875, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1570.30676, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1573.51685, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1576.72681, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1579.92883, -1622.77856, 14.13040,   0.00000, -0.35000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1579.92883, -1617.60388, 14.13040,   0.00000, 0.00000, 90.06300));
   	Mauer_LSPD(CreateDynamicObject(19357, 1573.51685, -1617.60986, 14.13040,   0.00000, 0.00000, 90.06300));
	Mauer_LSPD(CreateDynamicObject(19357, 1570.30676, -1617.61389, 14.13040,   0.00000, 0.00000, 90.06300));
    Mauer_LSPD(CreateDynamicObject(19357, 1576.72681, -1617.60596, 14.13040,   0.00000, 0.00000, 90.06300));
   	Mauer_LSPD(CreateDynamicObject(19357, 1567.09875, -1617.61792, 14.13040,   0.00000, 0.00000, 90.06300));
    Mauer_LSPD(CreateDynamicObject(19357, 1563.88867, -1617.61987, 14.13040,   0.00000, 0.00000, 90.06300));
    Mauer_LSPD(CreateDynamicObject(19357, 1557.47070, -1617.62805, 14.13040,   0.00000, 0.00000, 90.06300));
    Mauer_LSPD(CreateDynamicObject(19357, 1560.67871, -1617.62390, 14.13040,   0.00000, 0.00000, 90.06300));
 	Mauer_LSPD(CreateDynamicObject(19357, 1554.26575, -1617.63000, 14.13040,   0.00000, 0.00000, 90.06300));
   	Mauer_LSPD(CreateDynamicObject(19357, 1551.20337, -1617.63000, 14.13040,   0.00000, 0.00000, 90.06300));
    Mauer_LSPD(CreateDynamicObject(19357, 1581.44666, -1621.25134, 14.13040,   0.00000, 0.00000, 0.00000));
  	Mauer_LSPD(CreateDynamicObject(19430, 1581.44556, -1618.35425, 14.13040,   0.00000, 0.00000, 0.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1579.92761, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1579.92908, -1619.24463, 14.13040,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1579.92908, -1619.55762, 14.13040,   0.00000, 0.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19430, 1578.39014, -1619.43665, 14.13440,   0.00000, 0.00000, 0.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1579.92358, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1576.72681, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1573.51685, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1570.30676, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1567.09875, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1563.88867, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1560.67871, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1557.47070, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1554.26575, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1551.05579, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1547.84485, -1621.12695, 15.79840,   0.00000, 90.00000, 90.00000));
 	Mauer_LSPD(CreateDynamicObject(19357, 1576.72681, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1573.51685, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1570.31531, -1619.31995, 15.79640,   0.00000, 90.00000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1567.09875, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1563.88867, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1560.67871, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1557.47070, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1554.26575, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1551.05579, -1619.30188, 15.79640,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1547.84485, -1619.30400, 15.79640,   0.00000, 90.00000, 90.06000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1606.42883, -1622.77856, 14.13440,   0.00000, 0.00000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1603.21875, -1622.77856, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1600.01880, -1622.77856, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1596.81079, -1622.77856, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1593.60083, -1622.77856, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1590.39185, -1622.77856, 14.13440,   0.00000, 0.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1588.87610, -1621.08630, 14.13440,   0.00000, 0.00000, 0.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1590.39185, -1619.39563, 14.13440,   0.00000, 0.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1593.60083, -1619.39563, 14.13440,   0.00000, 0.00000, 90.00000));
	Mauer_LSPD(CreateDynamicObject(19357, 1596.81079, -1619.39563, 14.13440,   0.00000, 0.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1600.01880, -1619.39563, 14.13440,   0.00000, 0.00000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1603.21875, -1619.39563, 14.13440,   0.00000, 0.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1606.42883, -1619.39563, 14.13440,   0.00000, 0.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1590.39392, -1621.07117, 15.79440,   0.00000, 90.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1593.60083, -1621.07117, 15.79440,   0.00000, 90.00000, 90.00000));
   	Mauer_LSPD(CreateDynamicObject(19357, 1596.81079, -1621.07117, 15.79440,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1596.81079, -1619.39563, 14.13440,   0.00000, 0.00000, 90.00000));
 	Mauer_LSPD(CreateDynamicObject(19357, 1600.01880, -1621.07117, 15.79440,   0.00000, 90.00000, 90.00000));
  	Mauer_LSPD(CreateDynamicObject(19357, 1603.21875, -1621.07117, 15.79440,   0.00000, 90.00000, 90.00000));
    Mauer_LSPD(CreateDynamicObject(19357, 1606.42883, -1621.07117, 15.79440,   0.00000, 90.00000, 90.00000));

    //FBI Interior - Map by Niklas.B

    //Decke

	Decke_FBI(CreateDynamicObject(19378, -2450.44092, 525.00781, 27.48350,   0.00000, 90.00000, 90.00000));
	Decke_FBI(CreateDynamicObject(19378, -2460.07495, 525.00781, 27.48350,   0.00000, 90.00000, 90.00000));
	Decke_FBI(CreateDynamicObject(19378, -2469.70703, 525.00781, 27.48350,   0.00000, 90.00000, 90.00000));
	Decke_FBI(CreateDynamicObject(19378, -2469.70703, 514.50781, 27.48350,   0.00000, 90.00000, 90.00000));
	Decke_FBI(CreateDynamicObject(19378, -2460.07495, 514.50781, 27.48350,   0.00000, 90.00000, 90.00000));
	Decke_FBI(CreateDynamicObject(19378, -2450.44092, 514.50781, 27.48350,   0.00000, 90.00000, 90.00000));
	Decke_FBI(CreateDynamicObject(19378, -2460.07495, 504.00781, 27.48350,   0.00000, 90.00000, 90.00000));


	//Boden

	Boden_FBI(CreateDynamicObject(19360, -2458.12109, 503.71909, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19360, -2458.12109, 507.21909, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19376, -2458.12012, 514.21942, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19376, -2458.12012, 524.71838, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19376, -2467.75024, 514.21942, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19376, -2467.74829, 524.71942, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19325, -2461.19434, 511.19958, 23.98610,   90.00000, 0.00000, 0.00000));
	Boden_FBI(CreateDynamicObject(19376, -2448.49316, 514.21942, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19376, -2448.49316, 524.71838, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19433, -2460.52930, 503.71851, 24.00840,   0.00000, 90.00000, 90.00000));
	Boden_FBI(CreateDynamicObject(19433, -2460.52319, 507.21851, 24.00840,   0.00000, 90.00000, 90.00000));


	//Wand

	Wand_FBI(CreateDynamicObject(19362, -2458.12183, 501.89240, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2456.60620, 503.58871, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2456.60620, 506.79871, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2461.24316, 503.58270, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2461.24316, 506.79269, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2461.24316, 511.60471, 23.41040,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2461.24316, 511.60471, 28.44240,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2456.60620, 511.60571, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2462.93530, 509.91159, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2464.45142, 511.60431, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2466.14526, 509.91159, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2469.35522, 509.91159, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2470.87134, 511.60431, 25.81840,   0.00000, 0.00000, 0.0000));
	Wand_FBI(CreateDynamicObject(19362, -2470.87134, 514.81531, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2470.87134, 518.02533, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2464.45337, 518.02533, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2466.14526, 521.14459, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2469.35522, 521.14459, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2470.87134, 522.83728, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2470.87134, 526.04730, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2470.87134, 529.25732, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2466.14526, 530.04260, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2469.35083, 530.04810, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2462.76318, 530.04260, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2459.55420, 530.04260, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2461.07056, 528.35217, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2461.07056, 521.93518, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2456.34814, 530.04260, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2453.14014, 530.04260, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2449.92017, 530.04260, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2451.42407, 520.43329, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2448.21411, 520.43329, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2446.52100, 521.95032, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2446.52100, 525.15833, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2446.52100, 528.36731, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2446.71216, 530.04260, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2452.94092, 518.73950, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2451.42407, 514.01129, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2448.21411, 514.01129, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2446.44092, 518.73950, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2446.44092, 515.52887, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19362, -2445.00415, 514.01129, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2454.91284, 513.29779, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2451.70288, 513.29779, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19362, -2452.94092, 515.53351, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2460.53003, 501.89371, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19435, -2461.24390, 509.19971, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2456.60620, 509.19971, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2464.45337, 520.43201, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2470.87134, 520.43201, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2464.45337, 523.93201, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2464.45337, 527.43201, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2464.45337, 530.43201, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19435, -2459.14502, 520.43329, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19435, -2456.48291, 520.43329, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19435, -2457.32007, 513.29938, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19435, -2453.82886, 520.43329, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19391, -2459.72632, 513.29993, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19391, -2462.93530, 513.29993, 25.81840,   0.00000, 0.00000, 90.00000));
	Wand_FBI(CreateDynamicObject(19391, -2464.45337, 514.81531, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19391, -2461.07056, 525.14032, 25.81840,   0.00000, 0.00000, 0.00000));
	Wand_FBI(CreateDynamicObject(19391, -2452.94141, 512.31787, 25.81840,   0.00000, 0.00000, 0.00000));

	//-------------------------------------------------------------------

	CreateDynamicObject(1533, -2456.71436, 504.10910, 23.95730,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1533, -2456.71436, 505.60910, 23.95730,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19325, -2464.39893, 521.53870, 24.98610,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, -2464.39893, 529.03870, 24.98610,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19325, -2457.73804, 520.36060, 25.54610,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1502, -2463.72095, 513.27832, 24.08440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, -2464.42554, 514.06671, 24.08440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1502, -2461.10034, 525.92603, 24.08440,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2922, -2458.51587, 513.22302, 25.39180,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2922, -2458.51587, 513.39899, 25.39180,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19370, -2457.13208, 525.15411, 24.79630,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19370, -2457.13086, 526.66870, 23.10430,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19168, -2457.87378, 524.42383, 24.90020,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19171, -2456.37476, 525.92371, 24.89960,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19170, -2456.37476, 524.42389, 24.89890,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19169, -2457.87305, 525.92291, 24.90110,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19370, -2457.13086, 523.63672, 23.10430,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(19370, -2455.47046, 525.15503, 23.13430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19370, -2458.79248, 525.15503, 23.13430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19443, -2453.63330, 525.19287, 24.79630,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19443, -2450.13306, 525.19287, 24.79630,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19443, -2448.47314, 525.19287, 22.95630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2454.04102, 523.62628, 24.08370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2453.04102, 523.62628, 24.08370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2452.04102, 523.62628, 24.08370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2451.04102, 523.62628, 24.08370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2450.04102, 523.62628, 24.08370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2449.04102, 523.62628, 24.08370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2449.04102, 526.70032, 24.08370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2450.04102, 526.70032, 24.08370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2451.04102, 526.70032, 24.08370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2452.04102, 526.70032, 24.08370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2453.04102, 526.70032, 24.08370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2454.04102, 526.70032, 24.08370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2455.04102, 526.70032, 24.08370,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2455.04102, 523.62628, 24.08370,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2447.64404, 525.16431, 24.08370,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2010, -2447.02344, 520.89569, 24.09503,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2453.46167, 519.84937, 24.09503,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2460.44629, 529.38330, 24.09503,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2460.42651, 520.96210, 24.09503,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, -2466.83130, 521.70728, 24.08380,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1723, -2470.13965, 526.40570, 24.08380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2315, -2468.80859, 527.88507, 24.09631,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2315, -2468.80859, 526.92908, 24.09630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, -2469.09180, 529.51093, 24.08380,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1723, -2470.13965, 522.76569, 24.08380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2315, -2468.80859, 523.23810, 24.09630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2315, -2468.80859, 524.19708, 24.09630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2470.22437, 521.76404, 24.09590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2470.14526, 529.49683, 24.09590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2464.88940, 527.42535, 24.09590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2464.89160, 523.88025, 24.09590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1742, -2456.49854, 530.07684, 24.07500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1742, -2449.69629, 520.37262, 24.07500,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1742, -2451.13037, 520.37262, 24.07500,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1742, -2455.06250, 530.07678, 24.07500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2614, -2446.64771, 525.19458, 26.29170,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2193, -2470.34229, 511.90021, 23.96390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2198, -2465.99951, 513.00568, 24.04390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2198, -2464.98364, 516.17371, 24.04390,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2193, -2469.34229, 517.56421, 23.96390,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2197, -2469.53833, 515.05310, 24.06220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2197, -2469.53833, 514.37311, 24.06220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2197, -2469.53833, 513.69312, 24.06220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2197, -2469.53833, 515.73309, 24.06220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1722, -2470.23926, 517.77008, 24.07020,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2465.61792, 517.20685, 24.07020,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1722, -2465.30786, 511.98914, 24.07020,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1722, -2469.60083, 511.75952, 24.07020,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1742, -2465.68701, 509.86374, 24.09610,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1742, -2469.71973, 521.19391, 24.09610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1742, -2467.11304, 509.86371, 24.09610,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1742, -2468.27979, 521.19391, 24.09610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1742, -2466.83984, 521.19391, 24.09610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2197, -2464.89038, 519.73260, 24.06220,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2197, -2465.57031, 519.73260, 24.06220,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2202, -2464.99585, 519.03766, 24.03970,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2202, -2468.45264, 510.47552, 24.03970,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2198, -2461.80591, 512.05353, 24.01650,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1722, -2462.79688, 511.35547, 24.08340,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2614, -2464.32568, 511.57050, 25.61070,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2010, -2470.27710, 510.58926, 24.09590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2470.61499, 520.62494, 24.09590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2614, -2453.06616, 516.82581, 26.29170,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2010, -2447.03320, 529.45380, 24.09503,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, -2453.50195, 513.83386, 24.09503,   0.00000, 0.00000, 0.00000);

    //FBI Base - Map by Daniel_LeMarc
    CreateDynamicObject(7010, -2168.03247, 283.64639, 35.90300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10010, -2225.53516, 265.29721, 26.35300,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(6959, -2176.62671, 279.64761, 14.00000,   -90.00000, 42.00000, 0.00000);
	CreateDynamicObject(6959, -2208.03149, 238.05669, 34.36780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6959, -2221.38354, 238.02029, 34.36480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6959, -2221.39111, 263.99951, 34.36480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6959, -2221.38428, 290.55981, 34.35880,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6959, -2207.64111, 277.64880, 34.36180,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19369, -2157.93506, 310.29440, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2157.93506, 310.29141, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2161.13892, 310.29141, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2161.13892, 310.29440, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19355, -2162.59106, 308.58170, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2162.59277, 305.84381, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2162.59912, 303.35989, 39.38320,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2165.79321, 308.59271, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2165.79395, 305.79721, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2165.78052, 303.64529, 39.38320,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19369, -2164.13892, 310.29440, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2164.13892, 310.29141, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2167.13892, 310.29440, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2167.13892, 310.29141, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2170.13892, 310.29440, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2170.13892, 310.29141, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2173.13892, 310.29141, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2173.13892, 310.28839, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2193.01636, 308.77142, 38.51690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19355, -2168.99536, 308.61090, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2172.17285, 308.57321, 39.39820,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2175.38525, 308.58859, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2168.97632, 305.81470, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2172.16016, 305.81210, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2168.94238, 303.63269, 39.38320,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2172.12329, 303.63950, 39.38320,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2175.35059, 302.32031, 39.36820,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19369, -2193.02002, 308.78421, 35.97590,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(19369, -2193.02002, 305.78421, 35.97590,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(19369, -2193.01343, 305.77139, 38.51690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19369, -2193.01343, 302.77139, 38.51690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19369, -2193.02002, 302.78421, 35.97590,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(19369, -2193.02002, 299.78421, 35.97590,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(19369, -2193.01343, 299.78421, 38.51690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19369, -2193.02002, 296.78421, 35.97590,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(19369, -2193.01343, 296.78421, 38.51690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19369, -2193.02002, 293.78421, 35.97590,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(19369, -2193.01343, 293.78421, 38.51690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19369, -2193.02002, 290.78421, 35.97590,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(19369, -2193.01050, 291.94519, 38.51690,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19355, -2175.34082, 305.81830, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2178.59668, 308.60251, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2178.54492, 305.85239, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2178.55957, 302.34039, 39.37720,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2181.80786, 308.60785, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2185.01221, 308.59320, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2188.17529, 308.57709, 39.39520,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2191.31836, 308.59171, 39.39820,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19369, -2176.13892, 310.28839, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2176.13892, 310.29141, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2179.13892, 310.29141, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2179.13892, 310.28839, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2182.13892, 310.29141, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2182.13892, 310.28839, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2185.13892, 310.28839, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2185.13892, 310.29141, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2188.13892, 310.28839, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, -2188.13892, 310.29141, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2191.34521, 310.29141, 35.97590,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(19369, -2191.33911, 310.28839, 38.51690,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(6959, -2211.92505, 290.41931, 34.35580,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, -2181.77344, 305.86554, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2184.97241, 305.86282, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2188.19043, 305.88019, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2191.39941, 305.89688, 39.38920,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2181.74512, 302.38116, 39.37720,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2184.94971, 302.41010, 39.37720,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2188.16528, 302.43884, 39.37720,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2191.32813, 302.44702, 39.37720,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2191.40601, 298.96591, 39.36820,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2191.40283, 295.50000, 39.36220,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2191.40210, 292.01431, 39.36220,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2188.20581, 298.99319, 39.37420,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2188.20264, 295.50851, 39.36820,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2188.21655, 292.02502, 39.37120,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2185.00781, 298.96469, 39.37420,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2185.04614, 295.54111, 39.36820,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2181.80664, 298.95590, 39.37120,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2181.84473, 295.47141, 39.37120,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2178.63818, 298.95840, 39.37120,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19355, -2192.07153, 302.24045, 34.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, -2192.07153, 299.24039, 34.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, -2192.07153, 296.24039, 34.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19355, -2192.07153, 293.24039, 34.30000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6959, -2177.22510, 238.03740, 34.36180,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(6959, -2177.15625, 254.82120, 34.34680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8168, -2158.90161, 269.38251, 36.09000,   0.00000, 0.00000, 107.00000);
	CreateDynamicObject(8210, -2214.17969, 218.04730, 34.36450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8210, -2241.72705, 245.46780, 37.40000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(8210, -2241.72559, 282.52399, 37.40000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(8210, -2214.10864, 309.96121, 37.40000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(8210, -2184.12305, 218.04201, 34.36450,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, -2156.82007, 218.15440, 34.25530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, -2156.81006, 233.16493, 34.25530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, -2156.81006, 230.16074, 34.25530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, -2156.76172, 253.98466, 34.25530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, -2156.63184, 245.08615, 34.25530,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(987, -2168.49097, 254.02400, 34.25530,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, -2156.62061, 273.04581, 34.25530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, -2156.66870, 285.00681, 34.25530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, -2156.66870, 296.87601, 34.25530,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(4564, -2224.10303, 248.55206, 143.55800,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(17070, -2177.40771, 229.75751, 34.38300,   0.00000, 0.00000, 2.30000);
	CreateDynamicObject(1294, -2156.73901, 252.74974, 38.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1294, -2168.18701, 252.71762, 38.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1294, -2168.15771, 246.28860, 38.80000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1294, -2156.93848, 246.40604, 38.80000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1294, -2155.37036, 265.50632, 38.80000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1294, -2155.37256, 273.28375, 38.80000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1294, -2175.45483, 288.87234, 36.80000,   0.00000, 0.00000, 222.00000);
	CreateDynamicObject(1294, -2171.14917, 282.65295, 36.80000,   0.00000, 0.00000, 215.00000);
	CreateDynamicObject(1294, -2169.37183, 274.66486, 38.80000,   0.00000, 0.00000, 190.00000);
	CreateDynamicObject(19355, -2177.00122, 293.37531, 37.20000,   90.00000, 181.00000, 149.00000);
	CreateDynamicObject(19355, -2177.12036, 293.46899, 37.20000,   90.00000, 181.00000, 149.00000);
	CreateDynamicObject(19355, -2177.19067, 293.50708, 37.20000,   90.00000, 181.00000, 149.00000);
	CreateDynamicObject(19355, -2175.45776, 296.51904, 37.20000,   90.00000, 181.00000, 149.00000);
	CreateDynamicObject(19355, -2175.33911, 296.45413, 37.20000,   90.00000, 181.00000, 149.00000);
	CreateDynamicObject(19355, -2175.25342, 296.40717, 37.20000,   90.00000, 181.00000, 149.00000);
	CreateDynamicObject(1689, -2175.48242, 294.46777, 37.30450,   84.00000, 0.00000, 60.00000);
	CreateDynamicObject(4003, -2199.63062, 228.00049, 43.50940,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(4003, -2199.63940, 240.98601, 43.50940,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3928, -2165.55176, 306.36511, 39.48620,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3928, -2176.82764, 306.38281, 39.48620,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3928, -2188.66113, 301.33307, 39.47420,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(974, -2159.75928, 310.33990, 38.31830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2166.38208, 310.34161, 38.31830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2173.00073, 310.33319, 38.31830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2179.61182, 310.32941, 38.31830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2186.30957, 310.30200, 39.21830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2189.61035, 310.33789, 40.62830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2156.45093, 306.97070, 39.35830,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(974, -2156.45728, 300.31870, 39.35830,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(638, -2164.56958, 218.79253, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2188.20679, 218.67500, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2184.86597, 218.69160, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2181.35034, 218.70906, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2178.11157, 218.72520, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2174.66479, 218.74232, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2171.33179, 218.75890, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2167.89282, 218.77600, 35.05860,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(638, -2157.87866, 228.99863, 35.05860,   0.00000, 0.00000, 182.00000);
	CreateDynamicObject(638, -2158.31641, 239.13573, 35.05860,   0.00000, 0.00000, 182.00000);
	CreateDynamicObject(638, -2158.16187, 235.77650, 35.05860,   0.00000, 0.00000, 182.00000);
	CreateDynamicObject(638, -2158.02197, 232.43336, 35.05860,   0.00000, 0.00000, 182.00000);
	CreateDynamicObject(638, -2196.14526, 238.57814, 35.05860,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(638, -2196.63745, 228.49348, 35.05860,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(638, -2196.47583, 231.80342, 35.05860,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(638, -2196.31006, 235.20370, 35.05860,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(638, -2190.38037, 223.42609, 35.05860,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(638, -2190.38037, 220.59113, 35.05860,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(638, -2191.99487, 226.07188, 35.05860,   0.00000, 0.00000, 87.70000);
	CreateDynamicObject(638, -2194.88281, 226.19284, 35.05860,   0.00000, 0.00000, 87.70000);
	CreateDynamicObject(638, -2194.16235, 240.67940, 35.05860,   0.00000, 0.00000, 87.70000);
	CreateDynamicObject(638, -2191.31689, 240.59949, 35.05860,   0.00000, 0.00000, 87.70000);
	CreateDynamicObject(638, -2162.35620, 223.64917, 35.05860,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(638, -2162.35596, 220.56122, 35.05860,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(638, -2160.32056, 241.25162, 35.05860,   0.00000, 0.00000, 272.00000);
	CreateDynamicObject(638, -2163.40430, 241.14055, 35.05860,   0.00000, 0.00000, 272.00000);
	CreateDynamicObject(638, -2159.70776, 226.67656, 35.05860,   0.00000, 0.00000, 272.00000);
	CreateDynamicObject(1360, -2169.40869, 244.73727, 34.95700,   0.00000, 0.00000, 142.00000);
	CreateDynamicObject(1360, -2169.88501, 242.14243, 34.95700,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1360, -2170.00854, 256.75763, 34.95700,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1360, -2169.45142, 254.16554, 34.95700,   0.00000, 0.00000, 221.00000);
	CreateDynamicObject(1682, -2202.41382, 300.07544, 40.60000,   0.00000, 0.00000, -25.00000);
	CreateDynamicObject(649, -2191.06592, 275.73541, 34.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2167.68579, 245.17490, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.45068, 245.16756, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.45874, 244.40443, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2167.65894, 253.99229, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2167.65894, 253.99229, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.42578, 253.98621, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.42578, 253.98621, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.42773, 254.67670, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.42773, 254.67670, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2167.65894, 253.99234, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.42578, 253.98619, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.42773, 254.67674, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2167.68579, 245.17490, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.45068, 245.16760, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.45874, 244.40440, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2167.68579, 245.17490, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.45068, 245.16760, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2168.45874, 244.40440, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2157.85571, 253.90231, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2157.90039, 245.20927, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2157.90039, 245.20930, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2157.85571, 253.90230, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2157.85571, 253.90230, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2157.90039, 245.20930, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2172.59985, 275.68961, 34.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2186.49390, 275.72406, 34.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2200.02734, 275.75763, 34.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2195.95508, 275.74756, 34.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2176.85425, 275.70013, 34.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2182.04272, 275.71301, 34.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2186.82861, 281.60864, 36.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2192.32666, 281.53171, 3.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2193.02783, 281.59616, 36.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2193.02783, 281.59619, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2184.74438, 281.60739, 40.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2193.02783, 281.59619, 40.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2186.82861, 281.60861, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2185.76099, 281.60889, 40.88900,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(9131, -2192.25073, 281.59711, 38.88900,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(9131, -2191.55005, 281.58740, 40.88900,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(9131, -2185.76099, 281.60889, 36.10000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(9131, -2186.82764, 281.60870, 40.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2178.89453, 281.63062, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2178.89453, 281.63065, 36.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2185.76099, 281.60889, 38.60000,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(9131, -2184.74438, 281.60739, 36.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2184.74438, 281.60739, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2178.89453, 281.63062, 40.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2190.31177, 281.66037, 35.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2181.77930, 281.63062, 35.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8623, -2188.53198, 281.43246, 36.32640,   26.00000, 0.00000, 0.00000);
	CreateDynamicObject(8623, -2183.08691, 281.17700, 36.32640,   -26.00000, 0.00000, 180.00000);
	CreateDynamicObject(8623, -2181.00537, 281.18839, 36.32640,   26.00000, 0.00000, 0.00000);
	CreateDynamicObject(8623, -2190.30103, 280.73334, 36.32640,   -26.00000, 0.00000, 180.00000);
	CreateDynamicObject(8990, -2186.37256, 288.47849, 39.50000,   28.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.72217, 245.27165, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.72217, 245.27170, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.56323, 217.98340, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.87622, 253.91728, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.87622, 253.91730, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.87622, 253.91730, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.72217, 245.27170, 38.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.56323, 217.98340, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.56323, 218.00340, 39.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2242.00220, 217.56868, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2242.00220, 217.56870, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2242.05591, 310.26645, 35.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2242.05591, 310.26639, 37.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2242.05591, 310.26639, 39.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2242.05591, 310.26639, 40.39400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2156.43359, 293.63577, 39.35830,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(974, -2156.40820, 286.95209, 38.35830,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(974, -2156.35986, 280.28519, 37.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(974, -2156.39526, 276.28711, 35.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3506, -2159.48315, 296.65524, 37.93750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3506, -2159.13477, 290.56851, 36.13750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3506, -2158.07471, 284.20651, 35.13750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2179.31641, 291.62256, 39.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2177.27075, 295.31097, 39.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2181.75684, 290.24500, 39.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(649, -2185.68311, 290.29587, 39.38430,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8990, -2165.54248, 300.81339, 39.36800,   28.00000, 0.00000, 0.00000);
	CreateDynamicObject(1294, -2195.05054, 239.66739, 34.80000,   0.00000, 0.00000, 142.00000);
	CreateDynamicObject(1294, -2195.41040, 227.47275, 34.80000,   0.00000, 0.00000, 215.00000);
	CreateDynamicObject(1294, -2188.86426, 219.66689, 34.80000,   0.00000, 0.00000, 215.00000);
	CreateDynamicObject(1294, -2163.93457, 219.64612, 34.80000,   0.00000, 0.00000, 324.00000);
	CreateDynamicObject(1294, -2159.13330, 227.96826, 34.80000,   0.00000, 0.00000, 324.00000);
	CreateDynamicObject(1294, -2159.47461, 239.90417, 34.80000,   0.00000, 0.00000, 47.00000);
	CreateDynamicObject(9131, -2156.81763, 272.76071, 38.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(9131, -2156.80420, 266.17599, 38.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, -2156.64111, 269.67599, 38.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(974, -2156.39526, 276.28711, 37.80000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1689, -2158.81006, 269.49930, 38.34050,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3928, -2193.42773, 264.76895, 34.36480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18850, -2228.61694, 292.46301, 29.98120,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8613, -2208.12744, 285.05069, 38.67900,   0.00000, 0.00000, -270.00000);
	CreateDynamicObject(19457, -2215.28394, 288.45349, 41.96860,   0.00000, 90.00000, 90.00000);
	CreateDynamicObject(19279, -2179.15039, 277.81628, 35.08388,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19279, -2185.54834, 277.81979, 35.08388,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19279, -2192.51001, 277.82178, 35.08388,   0.00000, 0.00000, 0.00000);

    //Los Santos Biker Autohaus - Map by Blacktrax
    static Bike;
	Bike = CreateDynamicObject(19123,1826.848,-1390.350,12.889,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19123,1816.478,-1390.350,12.889,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19123,1837.044,-1390.350,12.889,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19449,1832.016,-1406.274,13.930,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Bike, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Bike = CreateDynamicObject(19449,1822.426,-1406.297,13.930,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Bike, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Bike = CreateDynamicObject(19449,1812.160,-1403.119,13.930,0.000,0.000,60.000);
	SetDynamicObjectMaterial(Bike, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	Bike = CreateDynamicObject(19449,1808.163,-1396.145,13.930,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	Bike = CreateDynamicObject(19449,1820.427,-1407.916,13.930,0.000,0.000,60.000);
	SetDynamicObjectMaterial(Bike, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	Bike = CreateDynamicObject(19449,1817.550,-1401.647,13.930,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	Bike = CreateDynamicObject(19388,1817.563,-1395.281,13.930,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	Bike = CreateDynamicObject(19428,1817.563,-1392.895,13.930,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	Bike = CreateDynamicObject(19428,1817.563,-1392.077,13.930,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	Bike = CreateDynamicObject(19449,1812.741,-1391.409,13.930,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Bike, 0, 10430, "hashblock1z_sfs", "ws_ed_shop13", 0);
	Bike = CreateDynamicObject(19380,1813.717,-1394.816,15.689,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 3603, "bevmans01_la", "genroof01_128", 0);
	Bike = CreateDynamicObject(19380,1803.237,-1394.822,15.689,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 3603, "bevmans01_la", "genroof01_128", 0);
	Bike = CreateDynamicObject(19380,1813.744,-1404.460,15.689,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 3603, "bevmans01_la", "genroof01_128", 0);
	Bike = CreateDynamicObject(19380,1803.321,-1404.445,15.689,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 3603, "bevmans01_la", "genroof01_128", 0);
	Bike = CreateDynamicObject(19380,1812.518,-1412.607,11.731,0.000,40.000,90.000);
	SetDynamicObjectMaterial(Bike, 0, 3603, "bevmans01_la", "genroof01_128", 0);
	Bike = CreateDynamicObject(8417,1816.312,-1409.676,12.524,0.000,180.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 3603, "bevmans01_la", "sjmlahus25", 0);
	SetDynamicObjectMaterial(Bike, 1, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(Bike, 2, 10430, "hashblock1z_sfs", "ws_apartmentblue1", 0);
	Bike = CreateDynamicObject(19379,1836.291,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1834.651,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1832.685,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1830.056,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1827.916,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1825.491,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1823.546,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1821.346,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19379,1819.324,-1408.159,7.330,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(1491,1817.611,-1396.030,12.289,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Bike, 0, 4830, "airport2", "sanairtex3", 0);
	Bike = CreateDynamicObject(1723,1814.564,-1392.339,12.551,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(1723,1809.330,-1392.339,12.551,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(2024,1815.181,-1394.279,12.550,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 4830, "airport2", "sanairtex3", 0);
	Bike = CreateDynamicObject(2024,1809.811,-1394.279,12.550,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 4830, "airport2", "sanairtex3", 0);
	Bike = CreateDynamicObject(2356,1815.506,-1403.199,12.548,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(2356,1810.142,-1399.922,12.551,0.000,0.000,-40.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(2608,1808.522,-1396.128,13.363,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(12957,1815.523,-1393.135,16.406,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Bike, 0, 3603, "bevmans01_la", "genroof01_128", 0);
	Bike = CreateDynamicObject(19452,1813.002,-1398.489,12.511,0.000,90.000,30.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(19452,1812.445,-1396.955,12.531,0.000,90.000,120.000);
	SetDynamicObjectMaterial(Bike, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	Bike = CreateDynamicObject(1597,1832.040,-1390.399,15.034,0.000,0.000,90.000);
	Bike = CreateDynamicObject(1597,1821.786,-1390.392,15.034,0.000,0.000,90.000);
	Bike = CreateDynamicObject(1597,1811.339,-1390.392,15.034,0.000,0.000,90.000);
	Bike = CreateDynamicObject(19379,1830.615,-1389.351,7.290,0.000,0.000,0.000);
	Bike = CreateDynamicObject(1661,1814.940,-1398.648,15.176,0.000,0.000,0.000);
	Bike = CreateDynamicObject(1661,1814.838,-1393.214,15.176,0.000,0.000,0.000);
	Bike = CreateDynamicObject(1661,1809.743,-1395.990,15.176,0.000,0.000,0.000);
	Bike = CreateDynamicObject(910,1818.215,-1392.611,13.668,0.000,0.000,90.000);
	Bike = CreateDynamicObject(2607,1815.271,-1402.505,12.956,0.000,0.000,210.000);
	Bike = CreateDynamicObject(2607,1810.571,-1399.404,12.956,0.000,0.000,490.000);
	Bike = CreateDynamicObject(19174,1815.657,-1391.510,14.358,0.000,0.000,0.000);
	Bike = CreateDynamicObject(19172,1810.240,-1391.504,14.547,0.000,0.000,0.000);
	Bike = CreateDynamicObject(630,1812.967,-1392.400,13.670,0.000,0.000,0.479);
	Bike = CreateDynamicObject(18075,1812.922,-1396.906,15.576,0.000,0.000,0.000);

    //Los Santos Rettungsdienst - Map by Blacktrax
    static Krankenhaus2;
	Krankenhaus2 = CreateDynamicObject(16564,1648.141,-1245.390,13.860,0.000,0.000,-90.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	SetDynamicObjectMaterial(Krankenhaus2, 1, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(Krankenhaus2, 2, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(Krankenhaus2, 3, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(Krankenhaus2, 4, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(Krankenhaus2, 7, 10101, "2notherbuildsfe", "flatdoor01_law", 0);
	SetDynamicObjectMaterial(Krankenhaus2, 8, 10101, "2notherbuildsfe", "flatdoor01_law", 0);
	Krankenhaus2 = CreateDynamicObject(967,1659.084,-1287.679,13.648,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0);
	Krankenhaus2 = CreateDynamicObject(966,1660.049,-1288.150,13.665,0.000,0.000,180.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1672.016,-1287.885,11.411,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1682.024,-1287.885,11.411,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1691.931,-1287.885,11.411,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1699.774,-1287.885,11.411,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1704.270,-1282.417,11.411,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1704.270,-1272.484,11.411,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1704.270,-1262.562,11.411,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1704.270,-1252.542,11.411,0.000,0.000,90.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1653.323,-1287.963,13.470,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1643.412,-1287.979,14.490,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(18766,1633.560,-1287.954,16.023,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1655.034,-1261.426,15.120,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1655.034,-1280.236,15.120,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1677.466,-1280.155,14.308,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1677.453,-1266.430,14.308,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1677.474,-1238.963,14.308,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1677.466,-1225.255,14.308,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1677.473,-1211.479,14.308,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19375,1682.716,-1283.129,13.694,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19375,1693.091,-1283.084,13.694,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19452,1700.038,-1282.558,13.694,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19452,1702.916,-1282.562,13.674,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19375,1698.961,-1273.001,13.694,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19375,1698.845,-1263.362,13.694,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19375,1698.572,-1253.745,13.694,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19375,1698.949,-1244.124,13.694,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19452,1703.434,-1239.287,13.897,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19452,1703.421,-1229.706,13.897,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19452,1703.472,-1220.083,13.897,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19452,1703.497,-1210.483,13.897,0.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1684.590,-1283.216,14.308,0.000,0.000,319.816);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1694.859,-1283.299,14.308,0.000,0.000,319.816);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1661.876,-1224.360,15.120,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(4100,1661.876,-1204.064,15.120,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19452,1703.319,-1248.240,11.520,30.000,90.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 10403, "golf_sfs", "golf_greengrass", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1695.795,-1279.547,8.559,0.000,0.000,40.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1696.959,-1273.934,8.559,0.000,0.000,40.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1696.783,-1266.104,8.559,0.000,0.000,40.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1698.260,-1259.300,8.559,0.000,0.000,40.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1698.434,-1243.092,8.740,0.000,0.000,140.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1697.935,-1235.068,8.740,0.000,0.000,140.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1697.358,-1226.719,8.740,0.000,0.000,140.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1696.544,-1218.098,8.740,0.000,0.000,140.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1693.929,-1212.164,8.740,0.000,0.000,140.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1687.475,-1214.769,8.740,0.000,0.000,180.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1683.783,-1214.782,8.740,0.000,0.000,180.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1691.550,-1278.321,8.559,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1686.100,-1278.249,8.559,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1680.196,-1277.960,8.559,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19388,1681.878,-1228.469,12.238,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19388,1680.869,-1232.283,12.238,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19388,1680.764,-1237.099,12.238,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19388,1680.799,-1242.058,12.238,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19388,1679.947,-1246.865,12.238,0.000,0.000,50.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(1361,1655.618,-1251.496,14.564,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(1361,1655.709,-1244.857,14.564,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(966,1660.070,-1288.138,14.138,-178.000,4.000,180.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1648.710,-1264.370,8.740,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1635.035,-1258.214,8.740,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1636.201,-1286.240,8.740,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1641.056,-1286.240,8.740,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1645.521,-1286.240,8.740,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);
	Krankenhaus2 = CreateDynamicObject(19379,1650.460,-1286.240,8.740,0.000,0.000,0.000);
	SetDynamicObjectMaterial(Krankenhaus2, 0, 9583, "bigshap_sfw", "bridge_walls2_sfw", 0);

	Krankenhaus2 = CreateDynamicObject(968,1660.011,-1288.172,14.519,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(18766,1704.249,-1242.607,11.411,0.000,0.000,90.000);
	Krankenhaus2 = CreateDynamicObject(717,1702.978,-1239.525,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(717,1702.888,-1256.191,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(717,1702.487,-1270.056,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(717,1702.929,-1283.256,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(717,1693.670,-1285.567,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(717,1681.563,-1285.346,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(4100,1701.399,-1276.221,14.308,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(4100,1701.399,-1262.489,14.308,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(4100,1701.399,-1248.776,14.308,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(4100,1701.399,-1235.063,14.308,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(4100,1701.399,-1221.370,14.308,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(4100,1701.399,-1207.637,14.308,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(4100,1643.417,-1217.477,15.120,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(3934,1652.731,-1216.016,13.842,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(3934,1652.798,-1230.471,20.253,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.262,-1211.302,14.022,0.000,0.000,30.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.245,-1216.436,14.022,0.000,0.000,30.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.317,-1221.558,14.022,0.000,0.000,30.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.343,-1226.346,14.022,0.000,0.000,30.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.448,-1231.707,14.022,0.000,0.000,30.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.193,-1237.419,14.022,0.000,0.000,30.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.127,-1241.661,14.022,0.000,0.000,30.000);
	Krankenhaus2 = CreateDynamicObject(3520,1702.946,-1247.119,14.022,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.127,-1252.824,14.022,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1703.015,-1258.516,13.527,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1702.812,-1262.864,13.527,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1702.934,-1268.169,13.527,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1702.986,-1272.205,13.527,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1702.831,-1276.335,13.527,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1702.855,-1280.795,13.527,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1702.535,-1284.658,13.527,0.000,0.000,20.000);
	Krankenhaus2 = CreateDynamicObject(3520,1699.393,-1284.984,13.527,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(3520,1695.347,-1285.262,13.527,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(3520,1691.243,-1285.416,13.527,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(3520,1687.672,-1285.347,13.527,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(3520,1683.875,-1285.350,13.527,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(3520,1679.832,-1285.180,13.527,0.000,0.000,50.000);
	Krankenhaus2 = CreateDynamicObject(717,1703.101,-1224.110,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(717,1702.947,-1210.542,13.782,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1686.437,-1286.043,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1698.688,-1285.861,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1702.913,-1275.453,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1703.199,-1262.199,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1703.030,-1248.237,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1702.973,-1231.579,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1703.325,-1217.361,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1677.084,-1214.818,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1677.084,-1231.504,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1677.084,-1246.139,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1677.084,-1259.829,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1677.084,-1273.607,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1677.084,-1287.168,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1628.578,-1260.796,16.445,356.858,0.000,3.141);
	Krankenhaus2 = CreateDynamicObject(1232,1654.601,-1263.021,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1654.709,-1287.181,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(19388,1675.062,-1228.191,12.238,0.000,0.000,90.000);
	Krankenhaus2 = CreateDynamicObject(19388,1674.921,-1218.788,12.238,0.000,0.000,90.000);
	Krankenhaus2 = CreateDynamicObject(19388,1679.062,-1261.699,12.238,0.000,0.000,90.000);
	Krankenhaus2 = CreateDynamicObject(19388,1679.020,-1268.647,12.238,0.000,0.000,90.000);
	Krankenhaus2 = CreateDynamicObject(1232,1661.481,-1208.115,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1232,1643.985,-1224.192,14.729,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(1361,1655.802,-1240.098,14.564,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(8843,1665.142,-1264.107,13.817,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(8843,1685.723,-1253.307,13.817,0.000,0.000,90.000);
	Krankenhaus2 = CreateDynamicObject(2942,1653.526,-1251.785,15.074,0.000,0.000,90.000);
	Krankenhaus2 = CreateDynamicObject(11245,1657.240,-1258.297,20.191,0.000,0.000,0.000);
	Krankenhaus2 = CreateDynamicObject(3934,1649.003,-1258.184,20.253,0.000,0.000,0.000);

    //Los Santos Airport Tankstelle - Map by Blacktrax
    static AirPortTanke;
	AirPortTanke = CreateDynamicObject(11417,1852.352,-2395.712,17.008,0.000,0.000,0.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 849, "junkpiles", "ws_oldredbrick", 0);
	SetDynamicObjectMaterial(AirPortTanke, 1, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 2, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 3, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 4, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 5, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 6, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	AirPortTanke = CreateDynamicObject(3287,1866.174,-2372.999,16.556,0.000,0.000,0.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 1, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 3, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	AirPortTanke = CreateDynamicObject(3287,1847.377,-2389.329,16.556,0.000,0.000,90.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 1, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 3, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	AirPortTanke = CreateDynamicObject(9361,1875.991,-2374.722,15.011,0.000,0.000,0.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 1, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 2, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 3, 3603, "bevmans01_la", "genroof01_128", 0);
	SetDynamicObjectMaterial(AirPortTanke, 4, 849, "junkpiles", "ws_oldredbrick", 0);
	SetDynamicObjectMaterial(AirPortTanke, 5, 14651, "ab_trukstpd", "Bow_bar_flooring", 0);
	SetDynamicObjectMaterial(AirPortTanke, 6, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 7, 4830, "airport2", "sanairtex1", 0);
	SetDynamicObjectMaterial(AirPortTanke, 8, 4828, "airport3_las", "mirrwind1_LAn", 0);
	AirPortTanke = CreateDynamicObject(2607,1874.282,-2376.641,13.025,0.000,0.000,180.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 2, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 3, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	AirPortTanke = CreateDynamicObject(2356,1874.389,-2377.734,12.635,0.000,0.000,0.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 1, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	AirPortTanke = CreateDynamicObject(2607,1876.606,-2371.628,13.028,0.000,0.000,0.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 2, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 8, 14651, "ab_trukstpd", "Bow_bar_flooring", 0);
	AirPortTanke = CreateDynamicObject(2356,1876.674,-2370.685,12.660,0.000,0.000,180.000);
	SetDynamicObjectMaterial(AirPortTanke, 0, 1826, "kbmiscfrn1", "wee_blak_32", 0);
	SetDynamicObjectMaterial(AirPortTanke, 1, 10355, "haight1_sfs", "ws_apartmentwhite2", 0);
	SetDynamicObjectMaterial(AirPortTanke, 3, 1706, "kbcouch1", "kb_sofa555c", 0);

	AirPortTanke = CreateDynamicObject(11417,1872.010,-2378.766,17.008,0.000,0.000,0.000);
	AirPortTanke = CreateDynamicObject(3934,1863.109,-2387.403,12.633,0.000,0.000,-47.000);
	AirPortTanke = CreateDynamicObject(1676,1871.287,-2379.297,14.354,0.000,0.000,317.850);
	AirPortTanke = CreateDynamicObject(1676,1852.876,-2395.200,14.354,0.000,0.000,317.850);
	AirPortTanke = CreateDynamicObject(3850,1870.825,-2379.635,12.988,0.000,0.000,47.000);
	AirPortTanke = CreateDynamicObject(3850,1853.094,-2394.708,12.988,0.000,0.000,47.000);
	AirPortTanke = CreateDynamicObject(19123,1872.199,-2380.167,13.051,0.000,0.000,0.000);
	AirPortTanke = CreateDynamicObject(19123,1870.488,-2378.501,13.051,0.000,0.000,0.000);
	AirPortTanke = CreateDynamicObject(19123,1853.854,-2396.111,13.051,0.000,0.000,0.000);
	AirPortTanke = CreateDynamicObject(19123,1851.912,-2394.409,13.051,0.000,0.000,0.000);
	CreateDynamicObject(1569, 1876.52466, -2376.37744, 12.22666,   0.00000, 0.00000, 45.83398);
	CreateDynamicObject(1569, 1878.57446, -2374.27075, 12.22670,   0.00000, 0.00000, 225.26511);

	//Los Santos - Offroad Autohaus
	static lspdinttmpobjid;
	lspdinttmpobjid = CreateDynamicObject(18980,1901.8973,-1596.5008,19.4396,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1868.3242,-1583.2447,21.3267,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1871.7353,-1583.2591,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1867.2465,-1599.0867,13.7944,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1913.9062,-1584.4792,19.4389,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1900.9212,-1577.6973,19.4400,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1906.6433,-1584.4989,19.4395,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1867.0081,-1601.7120,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1860.6737,-1601.6882,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1867.0086,-1589.7141,19.4389,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1877.3793,-1596.5062,19.4395,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1860.6760,-1589.6932,19.4395,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1872.7022,-1596.5089,19.4389,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1875.9342,-1577.6954,19.4395,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1872.7365,-1577.6949,19.4395,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1913.8966,-1577.8385,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1906.6433,-1577.7362,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1860.6759,-1577.6943,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1867.0908,-1577.7181,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1867.1068,-1596.4987,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1860.5946,-1599.1782,13.7043,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1860.6765,-1596.5804,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.6529,-1597.1567,13.7159,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.6529,-1597.1567,17.2093,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.6057,-1601.1068,13.7159,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.6057,-1601.1068,17.2073,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1866.3482,-1596.4719,10.6158,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1884.7650,-1596.4675,10.6159,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1882.2932,-1596.4916,10.6158,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1900.2873,-1596.4931,10.6159,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1897.6834,-1596.4512,10.6158,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1869.5456,-1596.6064,13.7643,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1873.5266,-1596.6064,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1877.5134,-1596.6064,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1881.5159,-1596.6064,13.7843,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1885.4940,-1596.6064,13.7643,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1889.4775,-1596.6064,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1893.4833,-1596.6064,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1897.4658,-1596.6064,13.6243,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1901.4523,-1596.6071,13.5943,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1905.4456,-1596.6064,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1913.9141,-1596.5024,7.4387,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1875.5987,-1596.5405,12.4642,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1891.2869,-1596.5184,12.4642,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1906.9418,-1596.5266,12.4642,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1915.6191,-1596.4989,10.6159,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1908.3660,-1596.6064,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1912.2913,-1596.6064,13.8343,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1914.1643,-1587.2005,12.4642,45.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1913.9060,-1579.1877,10.6159,0.0000,135.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1913.8796,-1595.8426,10.6159,0.0000,45.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1868.3315,-1590.9079,21.3267,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1905.0268,-1590.5502,21.3267,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1868.5759,-1596.4602,21.1433,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1873.1145,-1596.4749,17.3279,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1876.7852,-1596.4848,21.1828,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1882.4885,-1596.4580,22.7525,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1888.0985,-1596.4848,21.1828,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1898.1491,-1596.4843,21.1828,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1905.1077,-1596.4790,21.1313,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1891.2083,-1596.4749,22.7525,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1906.6905,-1596.5456,17.3279,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1867.2792,-1601.1068,17.2073,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1867.2789,-1601.1068,13.7159,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1867.2719,-1597.1567,17.2094,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1867.2756,-1597.1567,13.7159,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1863.8386,-1595.7282,19.8073,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1865.7482,-1599.6621,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.8840,-1599.6145,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.5187,-1601.7319,17.7523,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1866.0683,-1601.7403,17.7523,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1866.0661,-1601.7427,14.2653,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.5032,-1601.7291,14.2774,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1862.7087,-1601.6735,19.4337,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1864.9943,-1601.6911,19.4335,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1914.0903,-1594.1999,13.7743,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1914.0903,-1590.2128,14.1744,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1914.0899,-1587.2843,14.1744,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1914.0903,-1583.3367,13.6243,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1914.0903,-1579.3486,13.5943,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1898.7932,-1577.8311,12.4642,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1907.3936,-1577.6976,10.6159,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1889.5393,-1577.6993,10.6158,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1904.1988,-1577.8970,13.7543,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1900.1959,-1577.8780,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1897.4658,-1577.8970,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1893.4833,-1577.8970,13.6643,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1885.4940,-1577.8970,13.7243,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1889.4895,-1577.8970,13.6943,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1877.5134,-1577.8970,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1881.5159,-1577.8970,13.7043,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1869.5456,-1577.8970,13.9643,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1873.5266,-1577.8970,14.1744,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1875.5791,-1577.8145,12.4642,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1866.2869,-1577.7030,10.6158,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1884.6992,-1577.6987,10.6159,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1868.5759,-1577.7542,21.1434,0.0000,45.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1882.4833,-1577.7608,22.7525,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1905.1077,-1577.7017,21.1313,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1891.1939,-1577.7117,22.7525,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1905.0180,-1582.9807,21.3267,0.0000,135.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1873.1923,-1577.8719,17.3279,45.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1876.7852,-1577.8729,21.1828,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1888.0985,-1577.8729,21.1828,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1898.1491,-1577.8719,21.1828,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1900.9866,-1577.8891,17.3279,135.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1875.7249,-1583.2591,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1879.7172,-1583.2591,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1883.7071,-1583.2591,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1887.7060,-1583.2592,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1891.6964,-1583.2591,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1895.6888,-1583.2591,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1899.6871,-1583.2591,22.7404,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1901.6113,-1583.2596,22.7399,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1871.7500,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1875.7457,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1879.7436,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1883.7432,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1887.7327,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1891.7232,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1895.7165,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1899.7109,-1591.1931,22.7409,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1901.6092,-1591.1931,22.7395,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1882.2432,-1585.8875,22.7520,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1882.2254,-1589.0183,22.7520,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1869.5244,-1579.7717,22.7525,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1869.5244,-1584.7705,22.7525,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1869.5244,-1589.7680,22.7525,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1869.5240,-1594.4573,22.7520,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1890.9033,-1589.0114,22.7530,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1903.8829,-1579.7135,22.7520,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1903.8818,-1584.7036,22.7520,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1903.8818,-1589.6976,22.7520,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1903.8858,-1594.4683,22.7530,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1890.8929,-1585.8857,22.7530,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1908.8349,-1582.7104,12.5242,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1908.8452,-1591.5861,12.5248,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1898.3505,-1591.5861,12.5248,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1887.8493,-1591.5861,12.5248,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1877.3465,-1591.5861,12.5248,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1866.8465,-1591.5861,12.5248,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1898.3439,-1582.7054,12.5242,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1887.8422,-1582.7054,12.5242,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1877.3442,-1582.7054,12.5242,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1866.8491,-1582.7054,12.5242,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1856.0772,-1581.2492,7.4200,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1856.1402,-1591.2838,7.4200,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1845.5012,-1581.2492,7.4200,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1845.5097,-1591.2584,7.4200,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1856.3598,-1585.9975,12.5361,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1853.7517,-1591.5771,13.7684,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1847.9630,-1591.5715,13.7684,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1845.5607,-1589.2230,13.7683,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1845.5571,-1583.2468,13.6435,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1864.0029,-1577.6387,13.9043,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1866.1573,-1577.6834,14.2653,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.4750,-1577.6744,14.2653,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.4750,-1577.6744,17.7623,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1866.1573,-1577.6834,17.7623,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1907.2689,-1572.2780,14.2653,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1913.4683,-1572.3041,14.2653,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1911.9277,-1572.2856,17.7451,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1908.7249,-1572.2871,17.7451,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1913.9094,-1572.4656,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1906.6416,-1572.4656,7.0720,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1913.8460,-1575.1524,13.6743,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1913.8719,-1573.4000,14.2653,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1913.8359,-1576.9202,14.2653,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1913.8359,-1576.9202,17.7658,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1913.8719,-1573.4000,17.7658,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1906.5362,-1574.9841,13.6744,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1906.5443,-1573.1695,14.2653,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1906.5114,-1576.8320,14.2653,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1906.5443,-1573.1695,17.7658,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1906.5114,-1576.8320,17.7658,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1908.2852,-1576.2967,12.5242,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1911.7847,-1576.2883,12.5242,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1908.2954,-1573.9239,12.5200,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1911.7905,-1573.9371,12.5200,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1912.0986,-1573.8861,12.5150,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1912.0963,-1577.0904,12.5150,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1858.5710,-1581.1812,13.8243,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1858.6716,-1581.2443,19.4473,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1860.5604,-1579.2031,13.8143,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1860.6693,-1581.2053,7.4200,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1865.4943,-1598.0026,12.5248,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1862.3549,-1598.0021,12.5240,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1865.4956,-1600.0208,12.5240,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1862.3553,-1600.0191,12.5229,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1862.6499,-1594.7952,12.5229,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1862.6551,-1591.5870,12.5229,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1862.3249,-1579.5657,12.5249,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1862.3671,-1579.2393,12.5260,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1865.8635,-1579.2468,12.5260,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "citywall1", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1859.1622,-1589.6295,12.5260,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1855.6802,-1589.6329,12.5260,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(18980,1860.6497,-1591.2890,7.4200,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1858.6364,-1591.2937,19.4473,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1860.9071,-1593.8734,13.7243,90.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1910.3410,-1590.4816,19.8432,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1910.3223,-1579.1875,19.8432,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1908.6505,-1572.4801,19.4389,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1911.8934,-1572.4735,19.4395,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1912.0437,-1573.0644,19.8432,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1908.5454,-1573.0667,19.8432,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1907.7103,-1575.6174,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1912.8013,-1575.6091,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1912.7337,-1579.9174,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1912.7369,-1583.4083,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1912.7360,-1586.8983,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1912.7402,-1590.3981,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1912.7347,-1593.8951,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1911.6993,-1595.7100,19.8430,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1908.2554,-1595.7038,19.8430,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1907.5629,-1593.3905,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1907.5659,-1589.8984,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1907.5709,-1586.4008,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1907.5682,-1582.9086,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1907.5755,-1579.4091,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.8431,-1595.8930,14.2709,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.8898,-1591.8587,14.2709,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.8898,-1591.8587,17.7623,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1860.8431,-1595.8930,17.7623,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1850.8718,-1586.7465,12.5439,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1848.0908,-1581.1427,13.7684,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1854.0717,-1581.1414,13.7684,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1845.5640,-1586.2152,14.2355,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1845.5640,-1586.2152,17.6895,0.0000,0.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19378,1850.8226,-1585.9614,12.5459,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3980, "cityhall_lan", "man_cellarfloor128", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1850.8449,-1591.5548,14.2355,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1850.8449,-1591.5548,17.6895,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1850.9312,-1581.1204,14.2355,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1850.9312,-1581.1204,17.6895,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1858.3564,-1591.2452,13.7143,90.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1853.6706,-1581.2443,19.4473,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1848.6728,-1581.2443,19.4473,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1847.5095,-1581.2440,19.4470,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1845.5108,-1584.2401,19.4470,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1845.5108,-1589.2406,19.4470,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1848.6431,-1591.2937,19.4470,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1853.6391,-1591.2937,19.4470,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(18762,1847.5189,-1591.2929,19.4477,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "scratchedmetal", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1853.0793,-1586.5042,19.8432,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1865.7424,-1596.1964,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.8801,-1596.1372,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.8745,-1592.6392,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1865.7374,-1592.7117,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1865.7359,-1589.2196,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(3851,1863.8476,-1584.4147,19.8073,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3905, "libertyhi2", "bankdoor_64a", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1865.7313,-1585.7270,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.8741,-1589.1480,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.8703,-1585.6551,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.8660,-1582.1575,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1861.8741,-1578.9825,19.7488,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1865.7259,-1582.2304,19.7483,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1865.7290,-1579.1450,19.7488,0.0000,90.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1863.8614,-1578.9583,19.7495,0.0000,90.0000,0.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1863.7882,-1601.7344,17.2358,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1863.7882,-1601.7340,16.7677,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1911.9277,-1572.2860,16.8638,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1908.7249,-1572.2860,16.8638,0.0000,0.0000,90.0000,-1,-1,-100);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);

	lspdinttmpobjid = CreateDynamicObject(700,1870.6423,-1599.9730,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1912.3061,-1600.0859,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1898.9667,-1599.8847,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1886.0118,-1600.2359,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1921.5128,-1543.2319,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1930.6984,-1543.4008,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1913.9464,-1550.6911,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1907.0008,-1551.4351,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1898.5217,-1551.5513,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1892.9857,-1559.5080,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1886.5522,-1561.0198,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1875.7659,-1560.9647,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1865.1584,-1561.4880,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1855.9735,-1566.2141,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1847.1906,-1573.0163,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1840.2396,-1581.3269,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1835.7192,-1590.2166,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1833.3651,-1598.6740,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1841.3415,-1601.2642,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1852.1300,-1601.2154,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1930.5052,-1578.4857,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1930.7558,-1559.7917,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1930.5308,-1589.7265,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1930.6790,-1600.2683,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(700,1922.1772,-1600.4927,12.9921,356.8583,0.0000,-1.5707,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19454,1926.8197,-1567.8153,12.5143,0.0000,90.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19454,1917.8602,-1567.8035,12.5263,0.0000,90.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19454,1913.4556,-1567.7996,12.5299,0.0000,90.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19454,1910.3968,-1567.4356,12.5279,0.0000,90.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(13188,1910.4039,-1572.2983,13.8098,0.0000,0.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19458,1853.7254,-1582.8635,19.7993,0.0000,90.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19458,1853.6330,-1589.8721,19.7993,0.0000,90.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19458,1847.6358,-1585.9888,19.7999,0.0000,90.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(19458,1858.5455,-1586.0341,19.7999,0.0000,90.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(11420,1921.6048,-1555.9298,12.4320,0.0000,0.0000,129.9251,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(3763,1922.1943,-1556.3414,43.9861,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(3876,1851.8885,-1570.6771,-11.3847,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2165,1865.8735,-1599.4998,12.6099,0.0000,0.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2356,1866.8066,-1598.8063,12.6131,0.0000,0.0000,90.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(1502,1865.2847,-1601.7053,12.5386,0.0000,0.0000,180.0601,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(1502,1862.2641,-1601.7705,12.5233,0.0000,0.0000,360.7197,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1868.2254,-1590.4045,13.1158,0.0000,0.0000,-60.0600,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1870.8986,-1595.7547,13.1153,0.0000,0.0000,-60.0600,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1876.4696,-1591.2604,13.1158,0.0000,0.0000,-60.0600,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1878.9636,-1595.5678,13.1158,0.0000,0.0000,-60.0600,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1884.3909,-1590.2590,13.1158,0.0000,0.0000,-59.7000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1878.9636,-1595.5678,13.1158,0.0000,0.0000,-60.0600,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1887.4125,-1595.1804,13.1158,0.0000,0.0000,-59.7000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1893.3764,-1589.5999,13.1158,0.0000,0.0000,-59.1599,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1896.8342,-1595.4459,13.1158,0.0000,0.0000,-59.1599,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1901.5072,-1589.0097,13.1158,0.0000,0.0000,-52.4999,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1905.7703,-1594.4266,13.1158,0.0000,0.0000,-52.4999,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1901.1341,-1584.1721,13.1158,0.0000,0.0000,-77.5799,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1899.7679,-1578.2603,13.1158,0.0000,0.0000,-79.9799,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1890.2733,-1579.0633,13.1158,0.0000,0.0000,-68.6399,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1882.8016,-1584.5811,13.1158,0.0000,0.0000,-68.6399,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1880.5874,-1578.8051,13.1158,0.0000,0.0000,-68.6399,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1874.7587,-1584.8710,13.1158,0.0000,0.0000,-68.6399,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1872.1690,-1578.5231,13.1158,0.0000,0.0000,-68.6399,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1859.6370,-1585.4525,13.1358,0.0000,0.0000,11.7600,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1847.7603,-1588.1879,13.1358,0.0000,0.0000,14.1600,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2773,1892.4381,-1584.6463,13.1158,0.0000,0.0000,-68.5799,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(1703,1864.8006,-1579.4555,12.5925,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2118,1865.2589,-1581.2840,12.5701,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(1703,1866.7709,-1583.0317,12.5925,0.0000,0.0000,180.1199,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(1704,1868.0767,-1581.7215,12.5686,0.0000,0.0000,246.4200,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(1704,1867.7457,-1580.0100,12.5686,0.0000,0.0000,294.2402,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1867.6032,-1579.3560,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1867.5426,-1583.1571,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1865.7069,-1602.2065,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1861.9454,-1602.1741,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1846.1975,-1590.5952,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1846.2459,-1581.9079,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1907.6749,-1572.7941,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1913.0784,-1572.8200,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1861.4882,-1601.0671,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);
	lspdinttmpobjid = CreateDynamicObject(2010,1913.1794,-1595.1342,12.6110,0.0000,0.0000,0.0000,-1,-1,-100);

	//Los Santos - PNS + Firmengeb?ude
	CreateDynamicObject(11319, 2115.36865, -1742.34131, 9.65427,   0.00000, 0.00000, -90.12003);
	CreateDynamicObject(19486, 2158.51514, -1733.28491, 15.05593,   0.00000, 0.00000, -179.57990);
	CreateDynamicObject(3294, 2169.74194, -1741.34058, 9.57247,   0.00000, 0.00000, -89.94000);
	CreateDynamicObject(19376, 2159.97534, -1736.33411, 12.47650,   0.00000, 90.00000, 0.24000);
	CreateDynamicObject(19376, 2149.49976, -1736.39343, 12.47650,   0.00000, 90.00000, 0.36000);
	CreateDynamicObject(19376, 2159.94751, -1729.84729, 12.47550,   0.00000, 90.00000, 0.24000);
	CreateDynamicObject(19376, 2149.47778, -1729.88330, 12.47450,   0.00000, 90.00000, 0.24000);
	CreateDynamicObject(19376, 2147.89722, -1736.39673, 12.47550,   0.00000, 90.00000, 0.36000);
	CreateDynamicObject(19376, 2147.93628, -1730.03552, 12.47600,   0.00000, 90.00000, 0.36000);
	CreateDynamicObject(1723, 2164.54419, -1727.65454, 12.56266,   0.00000, 0.00000, -88.31995);
	CreateDynamicObject(1724, 2163.19507, -1726.02039, 12.56189,   0.00000, 0.00000, -32.21999);
	CreateDynamicObject(1723, 2160.14795, -1725.91443, 12.56266,   0.00000, 0.00000, -0.05994);
	CreateDynamicObject(2008, 2163.60229, -1735.45667, 12.56297,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19397, 2165.32568, -1733.28577, 14.29387,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1846, 2166.25464, -1731.96875, 16.46170,   90.00000, 0.00000, -90.00000);
	CreateDynamicObject(1846, 2166.27417, -1734.74878, 16.46170,   90.00000, 0.00000, -90.00000);
	CreateDynamicObject(19415, 2163.62720, -1731.75403, 14.29485,   0.00000, 0.00000, -90.21999);
	CreateDynamicObject(19397, 2160.42944, -1731.73328, 14.29390,   0.00000, 0.00000, -90.56000);
	CreateDynamicObject(19369, 2158.71069, -1726.98987, 14.29490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19415, 2158.68823, -1730.19299, 14.29490,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(19369, 2158.70996, -1726.76990, 14.29490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19369, 2163.64282, -1734.82764, 14.29490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, 2160.44287, -1734.82764, 14.29490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, 2157.23242, -1734.83716, 14.29390,   0.00000, 0.00000, -89.70000);
	CreateDynamicObject(2191, 2164.73022, -1738.06287, 12.48610,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2187, 2163.36670, -1735.59241, 12.54480,   0.00000, 0.00000, 360.00000);
	CreateDynamicObject(2008, 2161.21729, -1735.45715, 12.56300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2187, 2160.95068, -1735.46436, 12.54480,   0.00000, 0.00000, 360.00000);
	CreateDynamicObject(2008, 2158.79224, -1735.45007, 12.56300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2187, 2158.60840, -1735.45715, 12.54480,   0.00000, 0.00000, 360.00000);
	CreateDynamicObject(2163, 2162.64648, -1738.28052, 12.56430,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2163, 2161.84009, -1738.33191, 12.56430,   0.00000, 0.00000, 360.00000);
	CreateDynamicObject(2163, 2160.08008, -1738.33191, 12.56430,   0.00000, 0.00000, 360.00000);
	CreateDynamicObject(2163, 2160.88647, -1738.28052, 12.56430,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2164, 2160.93652, -1741.10974, 12.56480,   0.00000, 0.00000, 180.12000);
	CreateDynamicObject(19415, 2155.71509, -1736.52991, 14.29490,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(19369, 2155.71436, -1739.70569, 14.29490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2067, 2155.89575, -1739.87805, 12.56420,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2067, 2155.89575, -1739.29810, 12.56420,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2067, 2155.89575, -1738.71814, 12.56420,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2011, 2164.71899, -1740.71509, 12.56340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2194, 2162.63013, -1738.30127, 13.77158,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2254, 2155.81470, -1739.32520, 14.87760,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2247, 2160.02563, -1738.26050, 13.81726,   0.00000, 0.00000, -47.10001);
	CreateDynamicObject(646, 2156.63770, -1740.47913, 13.91466,   0.00000, 0.00000, 39.41999);
	CreateDynamicObject(1714, 2159.78394, -1736.66626, 12.56460,   0.00000, 0.00000, 184.37981);
	CreateDynamicObject(1714, 2162.34424, -1736.64270, 12.56464,   0.00000, 0.00000, 184.37982);
	CreateDynamicObject(1714, 2164.70239, -1736.65955, 12.56460,   0.00000, 0.00000, 184.37981);
	CreateDynamicObject(1502, 2165.24487, -1732.49683, 12.52420,   0.00000, 0.00000, -89.40000);
	CreateDynamicObject(1502, 2159.66968, -1731.73828, 12.54480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, 2156.47852, -1734.89185, 12.54480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1846, 2154.74927, -1736.46045, 14.44930,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(1846, 2157.75659, -1730.06116, 14.44930,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(1846, 2163.62036, -1730.79980, 14.44930,   90.00000, 0.00000, 0.24000);
	CreateDynamicObject(2894, 2158.98853, -1735.35046, 13.37538,   0.00000, 0.00000, 12.36000);
	CreateDynamicObject(2261, 2159.04175, -1735.42615, 13.86480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2256, 2161.74194, -1734.92554, 14.25060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2258, 2164.04541, -1734.92590, 14.24650,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2828, 2161.37231, -1735.15198, 13.36802,   0.00000, 0.00000, -188.64006);
	CreateDynamicObject(2826, 2163.79736, -1735.36047, 13.36946,   0.00000, 0.00000, 28.67999);
	CreateDynamicObject(2266, 2163.57373, -1734.23608, 13.87770,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2261, 2161.98145, -1734.21997, 14.26120,   0.00000, 0.00000, 180.06000);
	CreateDynamicObject(2256, 2160.06665, -1734.71887, 14.71960,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2011, 2164.54297, -1726.73376, 12.56340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(646, 2159.39136, -1725.60217, 13.91466,   0.00000, 0.00000, -58.55995);
	CreateDynamicObject(2118, 2161.84448, -1727.76086, 12.53678,   0.00000, 0.00000, -33.53999);
	CreateDynamicObject(2071, 2164.69775, -1725.32336, 13.82649,   0.00000, 0.00000, -30.06000);
	CreateDynamicObject(1510, 2162.73584, -1728.25781, 13.34715,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3028, 2158.79126, -1727.93909, 14.07610,   180.00000, -30.00000, 76.92010);
	CreateDynamicObject(3028, 2158.82739, -1727.24634, 14.07610,   180.00000, -30.00000, -96.58020);
	CreateDynamicObject(2011, 2164.60718, -1731.03088, 12.56340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19369, 2163.65479, -1733.29126, 15.94530,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19369, 2160.41479, -1733.29089, 15.94560,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1714, 2143.60889, -1738.18933, 12.52410,   0.00000, 0.00000, 90.66000);
	CreateDynamicObject(2207, 2145.56738, -1739.09119, 12.52406,   0.00000, 0.00000, 89.52000);
	CreateDynamicObject(1808, 2161.93579, -1731.48120, 12.56279,   0.00000, 0.00000, 179.88007);
	CreateDynamicObject(1828, 2146.41919, -1738.20874, 12.54366,   0.00000, 0.00000, -92.33990);
	CreateDynamicObject(1841, 2143.08594, -1741.01697, 14.84810,   0.00000, -20.00000, 227.45990);
	CreateDynamicObject(1841, 2143.12427, -1735.32727, 14.84810,   0.00000, -20.00000, 137.04021);
	CreateDynamicObject(2101, 2144.38721, -1740.93835, 13.06851,   0.00000, 0.00000, 179.82007);
	CreateDynamicObject(2314, 2145.11646, -1741.05286, 12.57162,   0.00000, 0.00000, -179.69968);
	CreateDynamicObject(1670, 2145.14355, -1740.91943, 13.10496,   0.00000, 0.00000, -19.44011);
	CreateDynamicObject(1727, 2147.57813, -1738.61365, 12.47289,   0.00000, 0.00000, -105.89999);
	CreateDynamicObject(1727, 2147.33398, -1736.64697, 12.47289,   0.00000, 0.00000, -73.91997);
	CreateDynamicObject(1786, 2142.56250, -1739.66077, 13.13880,   0.00000, 0.00000, 90.06000);
	CreateDynamicObject(2190, 2145.15137, -1739.39893, 13.28799,   0.00000, 0.00000, -150.60011);
	CreateDynamicObject(2332, 2143.22778, -1735.48608, 12.96358,   0.00000, 0.00000, 90.17995);
	CreateDynamicObject(2344, 2143.74780, -1740.95166, 13.07660,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2835, 2144.41553, -1738.73425, 12.55580,   0.00000, 0.00000, 88.62000);
	CreateDynamicObject(1665, 2144.79126, -1737.53064, 13.31889,   0.00000, 0.00000, 279.06000);
	CreateDynamicObject(1484, 2144.68335, -1737.28223, 13.48765,   -10.00000, 30.00000, 0.00000);
	CreateDynamicObject(2614, 2145.52881, -1735.09961, 15.13813,   0.00000, 0.00000, 0.60000);
	CreateDynamicObject(2255, 2143.37988, -1739.39099, 14.37490,   0.00000, 0.00000, 91.32000);
	CreateDynamicObject(3017, 2145.38403, -1738.03479, 13.31526,   0.00000, 0.00000, 95.22001);
	CreateDynamicObject(19369, 2154.06323, -1734.83911, 14.29490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, 2147.63721, -1734.84656, 14.29490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, 2150.85034, -1734.84509, 14.29390,   0.00000, 0.00000, -89.70000);
	CreateDynamicObject(19369, 2147.99683, -1733.39136, 14.29490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19369, 2147.99634, -1732.93140, 14.29490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19369, 2150.62720, -1731.67395, 14.29490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, 2153.83276, -1731.67346, 14.29490,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, 2157.04272, -1731.68896, 14.29390,   0.00000, 0.00000, -90.56000);
	CreateDynamicObject(19369, 2147.41528, -1731.67395, 14.29400,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1502, 2150.11255, -1734.85400, 12.54480,   0.00000, 0.00000, -0.54000);
	CreateDynamicObject(1502, 2156.29785, -1731.71094, 12.54480,   0.00000, 0.00000, -0.60000);
	CreateDynamicObject(19369, 2147.99512, -1729.73108, 14.29490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19369, 2147.99512, -1726.53113, 14.29490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2186, 2154.57324, -1730.20764, 12.56328,   0.00000, 0.00000, -88.92000);
	CreateDynamicObject(2186, 2152.23218, -1730.27466, 12.56328,   0.00000, 0.00000, -88.92000);
	CreateDynamicObject(2186, 2149.95044, -1730.28162, 12.56328,   0.00000, 0.00000, -88.92000);
	CreateDynamicObject(2002, 2149.05371, -1735.44800, 12.56428,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 2150.43115, -1725.15906, 12.56420,   0.00000, 0.00000, 1.50000);
	CreateDynamicObject(2164, 2153.71265, -1725.09888, 12.56420,   0.00000, 0.00000, 1.02000);
	CreateDynamicObject(2164, 2156.87061, -1725.11353, 12.56420,   0.00000, 0.00000, 1.02000);
	CreateDynamicObject(2162, 2148.08862, -1728.28931, 12.56324,   0.00000, 0.00000, 90.11998);
	CreateDynamicObject(631, 2148.74731, -1725.84094, 13.42060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(631, 2152.47607, -1725.66016, 13.42060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(631, 2155.64258, -1725.58545, 13.42060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2258, 2158.57471, -1727.18909, 14.49157,   0.00000, 0.00000, -90.12003);
	CreateDynamicObject(2239, 2143.15674, -1736.16040, 12.54591,   0.00000, 0.00000, 74.46001);
	CreateDynamicObject(1726, 2154.93188, -1736.30896, 12.56374,   0.00000, 0.00000, -89.04002);
	CreateDynamicObject(1727, 2151.94507, -1739.46802, 12.52779,   0.00000, 0.00000, 141.89987);
	CreateDynamicObject(1726, 2152.10254, -1735.53723, 12.56374,   0.00000, 0.00000, -1.20000);
	CreateDynamicObject(2031, 2152.32324, -1737.33984, 12.46558,   0.00000, 0.00000, -35.70000);
	CreateDynamicObject(2011, 2155.11963, -1735.46899, 12.56340,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1962, 2148.11499, -1733.24500, 14.33725,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2284, 2155.59570, -1734.27515, 14.01790,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(2286, 2154.08472, -1734.73425, 14.83270,   0.00000, 0.00000, 180.06000);
	CreateDynamicObject(2287, 2152.46948, -1734.27844, 13.97710,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(2276, 2158.80054, -1732.31628, 13.94860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2261, 2154.40601, -1732.26208, 13.98840,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2262, 2152.70752, -1732.24365, 13.73234,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2264, 2150.89502, -1732.26563, 13.93160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2108, 2148.46118, -1732.16284, 12.56345,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2258, 2155.59937, -1739.25781, 14.70430,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19369, 2157.23438, -1733.27100, 15.94530,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19369, 2154.01978, -1733.30725, 15.94560,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19369, 2150.78589, -1733.23755, 15.94530,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19369, 2147.56152, -1733.20642, 15.94560,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19466, 2155.75464, -1739.88477, 16.66722,   0.00000, 0.00000, 0.54000);
	CreateDynamicObject(19466, 2155.75122, -1737.64807, 16.66720,   0.00000, 0.00000, -0.24000);
	CreateDynamicObject(19466, 2158.72168, -1730.61951, 16.66720,   0.00000, 0.00000, -0.36000);
	CreateDynamicObject(19466, 2155.76270, -1735.41760, 16.82720,   0.00000, 0.00000, -0.12000);
	CreateDynamicObject(19466, 2154.63086, -1734.80383, 16.66720,   0.00000, 0.00000, 89.03999);
	CreateDynamicObject(19466, 2152.39893, -1734.78381, 16.66720,   0.00000, 0.00000, 89.94000);
	CreateDynamicObject(19466, 2150.18896, -1734.77344, 16.66720,   0.00000, 0.00000, 89.64001);
	CreateDynamicObject(19466, 2147.95190, -1734.81274, 16.66720,   0.00000, 0.00000, 92.51996);
	CreateDynamicObject(19466, 2156.86084, -1734.83960, 16.66720,   0.00000, 0.00000, 88.85999);
	CreateDynamicObject(19466, 2159.08716, -1734.85193, 16.66720,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(19466, 2161.31006, -1734.83398, 16.66720,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(19466, 2163.53247, -1734.81177, 16.66720,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(19466, 2164.19312, -1734.80530, 16.66720,   0.00000, 0.00000, 90.42000);
	CreateDynamicObject(19466, 2158.74707, -1728.38940, 16.66720,   0.00000, 0.00000, -0.36000);
	CreateDynamicObject(19466, 2158.74707, -1726.14941, 16.66720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2164.17212, -1731.67944, 16.66720,   0.00000, 0.00000, 89.15999);
	CreateDynamicObject(19466, 2159.85181, -1731.67688, 16.66720,   0.00000, 0.00000, 89.70000);
	CreateDynamicObject(19466, 2164.18604, -1731.70422, 16.66720,   0.00000, 0.00000, 89.04000);
	CreateDynamicObject(19466, 2162.07202, -1731.67944, 16.66720,   0.00000, 0.00000, 90.54002);
	CreateDynamicObject(19466, 2157.63794, -1731.65771, 16.66720,   0.00000, 0.00000, 89.28000);
	CreateDynamicObject(19466, 2155.39722, -1731.62903, 16.66720,   0.00000, 0.00000, 89.46000);
	CreateDynamicObject(19466, 2153.17725, -1731.60901, 16.66720,   0.00000, 0.00000, 89.28000);
	CreateDynamicObject(19466, 2150.97729, -1731.60901, 16.66720,   0.00000, 0.00000, 90.59998);
	CreateDynamicObject(19466, 2148.73730, -1731.62903, 16.66720,   0.00000, 0.00000, 90.06000);
	CreateDynamicObject(19466, 2148.03394, -1730.49646, 16.66720,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19466, 2148.03394, -1728.25647, 16.62720,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19466, 2148.01416, -1726.03345, 16.62720,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1411, 2139.78394, -1741.85583, 14.12920,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1411, 2134.61084, -1741.86377, 14.12920,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1411, 2124.91211, -1741.84692, 14.12920,   0.00000, 0.00000, 181.32001);
	CreateDynamicObject(1414, 2136.65894, -1741.72961, 13.70390,   0.00000, 0.00000, 179.58014);
	CreateDynamicObject(19425, 2129.78076, -1741.47937, 12.56271,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(910, 2124.56372, -1728.07715, 13.78480,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(849, 2125.87744, -1724.46082, 12.82889,   0.00000, 0.00000, 44.45999);
	CreateDynamicObject(1358, 2133.02173, -1723.90393, 13.69799,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1349, 2130.26172, -1724.26477, 13.10900,   0.00000, 0.00000, -52.79999);
	CreateDynamicObject(1349, 2128.62012, -1723.84839, 13.10900,   0.00000, 0.00000, 14.03999);
	CreateDynamicObject(1349, 2129.39526, -1724.90381, 13.10723,   0.00000, 0.00000, -181.43987);
	CreateDynamicObject(1265, 2135.39795, -1723.79907, 12.92864,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1265, 2135.16748, -1724.70935, 12.92864,   0.00000, 0.00000, 120.24004);


	//Los Santos - PNS + Cluckinbell
	CreateDynamicObject(6959, 1397.63074, -1900.62866, 12.54166,   0.00000, 0.00000, -1.62000);
	CreateDynamicObject(6959, 1379.16858, -1901.12671, 12.51771,   0.00000, 0.00000, -6.12000);
	CreateDynamicObject(19447, 1411.76172, -1901.96545, 14.22211,   0.00000, 0.00000, -86.03994);
	CreateDynamicObject(19447, 1402.15442, -1902.51282, 14.23940,   0.00000, 0.00000, -87.41994);
	CreateDynamicObject(19447, 1392.52686, -1902.62244, 14.23954,   0.00000, 0.00000, -91.31994);
	CreateDynamicObject(19447, 1382.90161, -1902.46179, 14.24140,   0.00000, 0.00000, -90.65990);
	CreateDynamicObject(19447, 1373.27515, -1902.34363, 14.23940,   0.00000, 0.00000, -90.65990);
	CreateDynamicObject(19447, 1363.69373, -1902.22717, 14.23991,   0.00000, 0.00000, -90.65990);
	CreateDynamicObject(910, 1376.86646, -1901.73523, 13.68479,   0.00000, 0.00000, 179.88016);
	CreateDynamicObject(1372, 1378.83008, -1898.04517, 12.54303,   0.00000, 0.00000, -179.69989);
	CreateDynamicObject(1358, 1368.03503, -1899.85413, 13.79982,   0.00000, 0.00000, -39.72001);
	CreateDynamicObject(1299, 1373.18872, -1901.06567, 12.92066,   0.00000, 0.00000, -24.24000);
	CreateDynamicObject(1349, 1371.57129, -1901.38806, 13.07146,   0.00000, 0.00000, -61.02002);
	CreateDynamicObject(1349, 1370.89917, -1900.12195, 13.07146,   0.00000, 0.00000, -145.02005);
	CreateDynamicObject(1327, 1379.14746, -1901.60291, 13.29855,   25.02001, 31.92002, -59.69999);
	CreateDynamicObject(3012, 1368.70667, -1899.85986, 13.57699,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3011, 1367.23865, -1899.77588, 13.54057,   5.88001, 107.88002, -50.76000);
	CreateDynamicObject(11319, 1388.48572, -1882.34521, 9.59509,   0.00000, 0.00000, -89.93999);
	CreateDynamicObject(16767, 1408.96399, -1903.96033, 18.49650,   0.00000, 0.00000, 91.32000);
	CreateDynamicObject(1569, 1412.44763, -1886.81836, 12.50270,   0.00000, 0.00000, 1.44000);
	CreateDynamicObject(1569, 1415.44666, -1886.74573, 12.50270,   0.00000, 0.00000, 181.32001);
	CreateDynamicObject(644, 1415.64587, -1883.32446, 12.79097,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(640, 1412.29443, -1883.37573, 13.10240,   0.00000, 0.00000, 89.16000);
	CreateDynamicObject(638, 1407.43652, -1883.31287, 13.07425,   0.00000, 0.00000, 88.92005);
	CreateDynamicObject(1432, 1410.81396, -1886.07251, 12.61545,   0.00000, 0.00000, -55.02002);
	CreateDynamicObject(1432, 1407.67346, -1886.18506, 12.61247,   0.00000, 0.00000, 61.74000);
	CreateDynamicObject(1432, 1399.72253, -1885.50720, 12.61370,   0.00000, 0.00000, -5.99997);
	CreateDynamicObject(1432, 1402.98328, -1885.48547, 12.61166,   0.00000, 0.00000, 50.88002);
	CreateDynamicObject(640, 1401.07837, -1883.15234, 13.10240,   0.00000, 0.00000, 89.88000);
	CreateDynamicObject(627, 1415.82739, -1885.99438, 14.29842,   0.00000, 0.00000, 41.39999);
	CreateDynamicObject(1411, 1397.24146, -1890.10413, 14.05027,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1372, 1397.71387, -1893.84338, 12.54303,   0.00000, 0.00000, -88.07985);
	CreateDynamicObject(3035, 1389.68567, -1892.61536, 13.26531,   0.00000, 0.00000, 89.93992);
	CreateDynamicObject(1450, 1397.61877, -1892.37500, 13.10384,   0.00000, 0.00000, -83.93999);
	CreateDynamicObject(1449, 1396.73450, -1890.51575, 12.96734,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1440, 1396.85901, -1901.15344, 13.02787,   0.00000, 0.00000, 34.44001);
	CreateDynamicObject(1370, 1394.12915, -1893.83398, 13.02887,   0.00000, 0.00000, 73.91998);
	CreateDynamicObject(1370, 1393.32349, -1894.45007, 13.00906,   0.00000, 0.00000, 22.31998);
	CreateDynamicObject(1235, 1404.09875, -1883.15393, 13.02887,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1264, 1394.06165, -1894.90759, 12.90888,   177.11992, 176.64017, -52.08000);
	CreateDynamicObject(2676, 1395.97327, -1896.51721, 12.62328,   0.00000, 0.00000, 113.09999);
	CreateDynamicObject(2674, 1394.70129, -1892.80774, 12.55020,   0.00000, 0.00000, -36.12001);
	CreateDynamicObject(1369, 1394.45752, -1901.67529, 13.06502,   0.00000, 0.00000, 153.29999);
	CreateDynamicObject(1369, 1393.31226, -1902.03442, 13.10779,   0.00000, 0.00000, 102.71997);
	CreateDynamicObject(2971, 1388.95203, -1901.06458, 12.45954,   0.00000, 0.00000, -18.66000);
	CreateDynamicObject(910, 1390.46252, -1898.00867, 13.74840,   0.00000, 0.00000, 0.78000);
	CreateDynamicObject(2671, 1391.80322, -1899.60425, 12.51161,   0.00000, 0.00000, -42.72000);
	CreateDynamicObject(2670, 1395.15259, -1899.61682, 12.59004,   0.00000, 0.00000, -298.68011);
	CreateDynamicObject(18664, 1398.24963, -1897.76404, 13.89163,   0.00000, 0.00000, 0.96000);
	CreateDynamicObject(1215, 1409.00818, -1882.58643, 13.05515,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1412.55054, -1882.64124, 13.05515,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1416.11255, -1882.69824, 13.05515,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1416.13770, -1886.49768, 13.05510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 1416.16992, -1884.55994, 8.34877,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19463, 1414.30811, -1882.65320, 8.34880,   90.00000, 0.00000, 88.98000);
	CreateDynamicObject(19463, 1410.74597, -1882.59741, 8.34880,   90.00000, 0.00000, 88.98000);
	CreateDynamicObject(19463, 1407.20557, -1882.53418, 8.34880,   90.00000, 0.00000, 88.98000);
	CreateDynamicObject(19463, 1402.58240, -1882.47205, 8.34880,   90.00000, 0.00000, 88.98000);
	CreateDynamicObject(19463, 1399.63586, -1882.41895, 8.34800,   90.00000, 0.00000, 88.92002);
	CreateDynamicObject(19463, 1398.10913, -1887.13562, 8.34800,   90.00000, 0.00000, 181.56004);
	CreateDynamicObject(19463, 1398.02661, -1884.07434, 8.34750,   90.00000, 0.00000, 181.56000);
	CreateDynamicObject(1412, 1377.22339, -1882.12903, 13.72320,   0.00000, 0.00000, -6.78000);
	CreateDynamicObject(1412, 1368.25696, -1880.94775, 13.72320,   0.00000, 0.00000, -7.86000);
	CreateDynamicObject(1283, 1379.39355, -1874.92554, 15.62500,   356.85840, 0.00000, -91.18353);

	//Los Santos - PNS n?he BSN
	CreateDynamicObject(11319, 1213.59460, -1060.83521, 27.40499,   -0.12000, 2.28000, 269.51996);
	CreateDynamicObject(5728, 1210.76636, -1080.78088, 17.83690,   2.46000, -0.24000, 0.90000);
	CreateDynamicObject(5728, 1216.24255, -1080.75110, 17.87050,   2.46000, -0.30000, 0.72000);
	CreateDynamicObject(3684, 1230.02722, -1013.35693, 34.58529,   0.38159, 0.72000, 94.31992);
	CreateDynamicObject(19447, 1225.95764, -1060.98865, 30.12260,   0.00000, 0.00000, 0.78000);
	CreateDynamicObject(19447, 1226.08875, -1070.59924, 30.12260,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(19447, 1226.17676, -1077.29456, 30.12260,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(19447, 1221.50061, -1082.19019, 30.12256,   0.00000, 0.00000, 90.30005);
	CreateDynamicObject(19447, 1221.50061, -1082.19019, 26.62939,   0.00000, 0.00000, 90.30000);
	CreateDynamicObject(19447, 1226.17676, -1077.29456, 26.63240,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(19447, 1226.08875, -1070.59924, 26.62308,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(19447, 1225.95764, -1060.98865, 26.65079,   0.00000, 0.00000, 0.78000);
	CreateDynamicObject(19447, 1211.87390, -1082.23706, 30.12256,   0.00000, 0.00000, 90.30005);
	CreateDynamicObject(19447, 1211.87390, -1082.23706, 26.62393,   0.00000, 0.00000, 90.30005);
	CreateDynamicObject(19447, 1204.87366, -1082.27295, 30.12260,   0.00000, 0.00000, 90.30000);
	CreateDynamicObject(19447, 1200.08191, -1077.39063, 30.12260,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(19447, 1204.87366, -1082.27295, 26.62484,   0.00000, 0.00000, 90.30000);
	CreateDynamicObject(19447, 1200.08191, -1077.39063, 26.63728,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(19447, 1199.94946, -1067.77075, 30.12260,   0.00000, 0.00000, 0.84000);
	CreateDynamicObject(19447, 1199.94946, -1067.77075, 26.64251,   0.00000, 0.00000, 0.84000);
	CreateDynamicObject(19447, 1199.84143, -1061.00610, 30.12260,   0.00000, 0.00000, 1.02000);
	CreateDynamicObject(3532, 1226.79614, -1064.34399, 28.79569,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3532, 1226.82385, -1068.70947, 28.79569,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3532, 1226.66687, -1073.14441, 28.79569,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3532, 1226.54126, -1076.69177, 28.79569,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3532, 1226.80237, -1060.43958, 29.69479,   12.90001, 5.88000, 0.00000);
	CreateDynamicObject(3532, 1226.73279, -1080.61951, 28.48354,   12.90000, 7.37999, 5.28001);
	CreateDynamicObject(3920, 1219.50330, -1082.78027, 30.99400,   0.00000, 0.00000, 0.30000);
	CreateDynamicObject(3920, 1206.87744, -1082.82227, 30.99400,   0.00000, 0.00000, 0.30000);
	CreateDynamicObject(3532, 1199.44238, -1080.34509, 28.18829,   12.90000, 7.37999, 3.90001);
	CreateDynamicObject(3532, 1199.44202, -1076.62524, 28.68037,   3.36001, 15.05999, 3.90001);
	CreateDynamicObject(3532, 1199.19263, -1072.63171, 28.68037,   3.36001, 15.05999, 3.90001);
	CreateDynamicObject(3532, 1199.28699, -1069.01685, 28.64070,   3.36001, 15.05999, 2.64002);
	CreateDynamicObject(3532, 1199.11328, -1065.11584, 28.64070,   3.36001, 15.05999, 3.90001);
	CreateDynamicObject(3532, 1198.98938, -1061.15881, 29.34658,   14.46001, 14.51999, 3.90001);
	CreateDynamicObject(3532, 1199.04956, -1058.34705, 30.39692,   20.40002, 14.63999, 3.90001);
	CreateDynamicObject(19463, 1223.37634, -1065.44385, 30.13980,   -2.46000, 90.00000, 179.64003);
	CreateDynamicObject(19463, 1219.86316, -1074.92603, 29.73190,   -2.46000, 90.00000, 179.82001);
	CreateDynamicObject(19463, 1223.33362, -1075.05591, 29.73190,   -2.46000, 90.00000, 179.82001);
	CreateDynamicObject(19463, 1224.39136, -1075.04651, 29.73140,   -2.40000, 90.48000, 179.82001);
	CreateDynamicObject(19463, 1221.33093, -1080.39429, 29.51000,   0.18000, 92.34000, 270.42001);
	CreateDynamicObject(19463, 1217.39771, -1077.51587, 29.61100,   0.12000, 92.34000, 270.42001);
	CreateDynamicObject(19463, 1212.18982, -1080.48987, 29.47007,   0.18000, 92.34000, 270.42001);
	CreateDynamicObject(19463, 1204.95837, -1080.48193, 29.43010,   0.18000, 92.34000, 270.42001);
	CreateDynamicObject(19463, 1201.79016, -1073.97351, 29.67918,   -2.46000, 90.00000, 180.59998);
	CreateDynamicObject(19463, 1203.15491, -1073.97375, 29.67920,   -2.46000, 90.24000, 180.60001);
	CreateDynamicObject(19463, 1201.67419, -1065.43677, 30.09500,   -2.46000, 90.00000, 180.78000);
	CreateDynamicObject(19463, 1203.25183, -1065.41602, 30.09540,   -2.46000, 90.00000, 180.78000);
	CreateDynamicObject(1408, 1223.19153, -1061.49683, 30.97887,   0.00000, 0.00000, 180.06010);
	CreateDynamicObject(640, 1223.18445, -1060.96619, 31.11637,   0.00000, 0.00000, 89.87999);
	CreateDynamicObject(640, 1220.89233, -1060.94397, 31.11600,   0.00000, 0.00000, 89.46001);
	CreateDynamicObject(1408, 1220.78992, -1061.49744, 30.97890,   0.00000, 0.00000, 180.06010);
	CreateDynamicObject(1408, 1202.60559, -1061.41223, 30.92430,   0.00000, 0.00000, 180.06010);
	CreateDynamicObject(640, 1202.47083, -1060.95422, 30.99440,   -0.12000, -0.36000, 90.30000);
	CreateDynamicObject(870, 1219.89258, -1064.54346, 30.53120,   2.88000, -1.50000, 0.00000);
	CreateDynamicObject(870, 1223.01184, -1068.80933, 30.33319,   0.00000, 0.00000, 37.32000);
	CreateDynamicObject(870, 1220.35535, -1072.28040, 30.11477,   0.00000, 0.00000, 9.77999);
	CreateDynamicObject(870, 1222.84521, -1075.56177, 29.99478,   0.00000, 0.00000, -13.98001);
	CreateDynamicObject(870, 1218.75391, -1078.97888, 30.04116,   0.00000, 0.00000, -59.10002);
	CreateDynamicObject(870, 1214.21521, -1079.42737, 29.77480,   0.00000, 0.00000, -34.62002);
	CreateDynamicObject(759, 1224.56982, -1080.82825, 29.42770,   0.00000, 0.00000, -31.56000);
	CreateDynamicObject(759, 1219.85083, -1068.07019, 30.04560,   0.00000, 0.00000, 13.44001);
	CreateDynamicObject(759, 1213.87561, -1077.56055, 29.52230,   0.00000, 0.00000, -38.93999);
	CreateDynamicObject(859, 1220.22656, -1076.07312, 29.71460,   0.00000, 0.00000, -24.42000);
	CreateDynamicObject(859, 1223.61975, -1071.97046, 29.91757,   0.00000, 0.00000, 25.32000);
	CreateDynamicObject(859, 1220.89746, -1069.61450, 30.01906,   0.00000, 0.00000, 25.32000);
	CreateDynamicObject(859, 1222.86279, -1065.93298, 30.11729,   0.00000, 0.00000, 68.63999);
	CreateDynamicObject(859, 1224.69934, -1062.43982, 30.35674,   0.00000, 0.00000, 81.35998);
	CreateDynamicObject(2936, 1223.66589, -1065.70142, 30.29126,   0.00000, 0.00000, 33.90000);
	CreateDynamicObject(2936, 1221.83423, -1070.33716, 30.08461,   0.00000, 0.00000, 104.52003);
	CreateDynamicObject(749, 1216.26086, -1080.46887, 26.08940,   0.00000, 0.00000, 21.24000);
	CreateDynamicObject(905, 1220.18872, -1076.72571, 29.94323,   0.00000, 0.00000, -60.89999);
	CreateDynamicObject(3929, 1224.69922, -1077.85376, 30.08308,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3929, 1218.88318, -1062.30212, 30.57350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1220.52637, -1072.44507, 27.10657,   0.00000, 0.00000, 144.53998);
	CreateDynamicObject(673, 1221.21838, -1062.85718, 27.48343,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1223.17249, -1069.04199, 27.85681,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1222.97375, -1075.71228, 27.10657,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 1210.94104, -1080.53967, 27.10657,   0.00000, 0.00000, 39.11999);
	CreateDynamicObject(673, 1218.71118, -1079.04456, 27.10657,   0.00000, 0.00000, 77.87999);
	CreateDynamicObject(870, 1210.83398, -1080.47424, 29.77480,   0.00000, 0.00000, -90.42002);
	CreateDynamicObject(870, 1206.49487, -1080.79541, 29.79400,   0.00000, 0.00000, -136.85999);
	CreateDynamicObject(870, 1202.86353, -1075.65625, 29.88044,   0.00000, 0.00000, -164.63998);
	CreateDynamicObject(870, 1202.38953, -1069.64917, 30.16823,   0.00000, 0.00000, -151.31976);
	CreateDynamicObject(870, 1203.65991, -1063.76672, 30.50576,   0.00000, 0.00000, -164.63998);
	CreateDynamicObject(749, 1201.10400, -1063.10229, 26.08940,   0.00000, 0.00000, 124.74001);
	CreateDynamicObject(759, 1209.63184, -1080.82813, 29.42770,   0.00000, 0.00000, -31.56000);
	CreateDynamicObject(759, 1202.10583, -1080.44690, 29.65071,   0.00000, 0.00000, 189.47993);
	CreateDynamicObject(3929, 1200.99109, -1081.72729, 29.81133,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3929, 1204.30151, -1066.23279, 30.27499,   0.00000, 0.00000, 32.33999);
	CreateDynamicObject(2936, 1200.60657, -1070.57910, 30.08461,   0.00000, 0.00000, 28.44003);
	CreateDynamicObject(673, 1202.74719, -1075.53882, 27.10657,   0.00000, 0.00000, 86.70000);
	CreateDynamicObject(673, 1201.94287, -1069.73999, 27.18037,   0.00000, 0.00000, 86.70000);
	CreateDynamicObject(1215, 1225.78015, -1056.02698, 31.22980,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1215, 1199.97754, -1056.16174, 31.14480,   0.00000, 0.00000, -31.98000);
	CreateDynamicObject(19373, 1219.44971, -1062.87793, 30.23780,   -0.18000, 87.84000, 90.00000);
	CreateDynamicObject(19373, 1222.51587, -1062.87280, 30.25080,   0.06000, 87.54000, 90.00000);
	CreateDynamicObject(19373, 1224.42151, -1062.84790, 30.26590,   -0.45000, 87.48000, 90.00000);
	CreateDynamicObject(19373, 1224.37427, -1066.27991, 30.11700,   -0.39000, 87.53990, 89.16000);
	CreateDynamicObject(19373, 1221.19446, -1066.35498, 30.09790,   -0.39000, 87.53990, 90.18000);
	CreateDynamicObject(19373, 1219.45776, -1066.37720, 30.08600,   -0.39000, 87.53990, 90.18000);
	CreateDynamicObject(19373, 1219.43567, -1069.75232, 29.96600,   -0.57000, 88.49970, 94.31995);
	CreateDynamicObject(19373, 1222.57166, -1069.74146, 29.99100,   -0.45000, 88.49980, 93.11990);
	CreateDynamicObject(19373, 1224.40308, -1069.65125, 30.00090,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1224.45459, -1073.00134, 29.91000,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1221.37805, -1073.05261, 29.88999,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1219.60132, -1072.93689, 29.88999,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1219.63208, -1076.35461, 29.80100,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1222.68652, -1076.28125, 29.80800,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1224.50464, -1076.12024, 29.82500,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1224.67529, -1079.60291, 29.73300,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1224.68726, -1080.33179, 29.71500,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1221.61792, -1079.77869, 29.72100,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1221.62366, -1080.40186, 29.70420,   -0.45000, 88.49980, 90.47990);
	CreateDynamicObject(19373, 1218.49023, -1079.85999, 29.70300,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1218.40723, -1080.44812, 29.68500,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1216.47327, -1077.56311, 29.74700,   -0.45000, 88.49980, 89.45990);
	CreateDynamicObject(19373, 1214.26404, -1077.58264, 29.72700,   -0.45000, 88.49980, 89.45990);
	CreateDynamicObject(19373, 1215.26904, -1080.53113, 29.65900,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1212.10046, -1080.50171, 29.63700,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1209.00549, -1080.41882, 29.61700,   -0.45000, 88.49980, 91.01990);
	CreateDynamicObject(19373, 1205.82385, -1080.45190, 29.59700,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1202.71838, -1080.45935, 29.57300,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1201.78760, -1080.45801, 29.56300,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1203.28381, -1077.29102, 29.65940,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1201.68567, -1076.96765, 29.65340,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1201.57874, -1073.78296, 29.73130,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1203.23621, -1074.20154, 29.74045,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1203.82532, -1070.74841, 29.84106,   -0.45000, 88.49980, 89.93990);
	CreateDynamicObject(19373, 1201.64319, -1070.75610, 29.82750,   -0.27400, 87.65980, 89.93990);
	CreateDynamicObject(19373, 1201.73291, -1068.65918, 29.92885,   -1.23000, 89.99966, 180.90001);
	CreateDynamicObject(19373, 1201.69568, -1068.37891, 29.98620,   -2.79000, 90.23970, 180.89999);
	CreateDynamicObject(19373, 1203.29565, -1065.26294, 30.14250,   -2.79000, 90.23970, 180.12000);
	CreateDynamicObject(19373, 1201.66724, -1065.29749, 30.14250,   -2.79000, 90.23970, 180.12000);
	CreateDynamicObject(19373, 1201.55701, -1062.74146, 30.26500,   -2.79000, 90.23970, 180.12000);
	CreateDynamicObject(19373, 1203.22388, -1062.83765, 30.25900,   -2.79000, 90.23970, 180.12000);
	CreateDynamicObject(12978, 1213.43848, -1068.43860, 30.05480,   0.00000, 180.00000, 180.00000);

 	//LSStra?en Breit
 	CreateDynamicObject(713, 1304.77148, -1711.17346, 12.43750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19371, 1304.95691, -1724.74121, 12.54304,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19371, 1304.95691, -1727.94360, 12.54300,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19371, 1304.95691, -1731.15198, 12.54300,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19371, 1304.95691, -1734.34155, 12.54300,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19121, 1306.49414, -1722.89819, 13.08192,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19121, 1306.49414, -1736.22070, 13.08190,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19121, 1303.37354, -1736.20447, 13.08190,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19121, 1303.37354, -1722.91821, 13.08190,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1306.73328, -1749.37170, 13.23214,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1306.73328, -1774.97046, 13.23210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1306.73328, -1800.57434, 13.23210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1306.73328, -1819.78882, 13.18710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1306.73328, -1832.57874, 13.18710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1303.19849, -1832.44653, 13.18710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1303.19849, -1819.65662, 13.18710,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1303.19849, -1800.44214, 13.23210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1303.19849, -1774.83826, 13.23210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1303.19849, -1749.23950, 13.23214,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1303.19849, -1709.75562, 13.23210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(982, 1306.69031, -1709.75562, 13.23210,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1306.69531, -1690.56177, 13.17810,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(984, 1303.18726, -1690.56177, 13.17810,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1319, 1304.11169, -1553.07007, 13.05177,   0.00000, 0.00000, -10.26001);
	CreateDynamicObject(1319, 1304.89075, -1547.16565, 13.05180,   0.00000, 0.00000, -10.26000);
	CreateDynamicObject(1319, 1305.67078, -1541.58496, 13.05180,   0.00000, 0.00000, -10.26000);
	CreateDynamicObject(1319, 1307.90137, -1534.59900, 13.05180,   0.00000, 0.00000, -21.95999);
	CreateDynamicObject(1319, 1310.51050, -1527.59558, 13.05180,   0.00000, 0.00000, -21.95999);
	CreateDynamicObject(1319, 1313.16968, -1520.72095, 13.05180,   0.00000, 0.00000, -21.95999);
	CreateDynamicObject(1319, 1317.15369, -1513.84058, 13.05180,   0.00000, 0.00000, -29.69999);
	CreateDynamicObject(1319, 1322.19922, -1506.47168, 13.05180,   0.00000, 0.00000, -29.69999);
	CreateDynamicObject(1319, 1326.44067, -1500.20959, 13.05180,   0.00000, 0.00000, -29.69999);
	CreateDynamicObject(1319, 1330.68665, -1492.59460, 13.05180,   0.00000, 0.00000, -22.43998);
	CreateDynamicObject(1319, 1334.33997, -1485.61182, 13.05180,   0.00000, 0.00000, -22.43998);
	CreateDynamicObject(1319, 1337.39380, -1479.84363, 13.05180,   0.00000, 0.00000, -22.43998);
	CreateDynamicObject(1319, 1339.93445, -1473.47778, 13.05180,   0.00000, 0.00000, -11.33998);
	CreateDynamicObject(1319, 1341.59412, -1466.06226, 13.05180,   0.00000, 0.00000, -11.33998);
	CreateDynamicObject(1319, 1343.25024, -1458.76050, 13.05180,   0.00000, 0.00000, -11.33998);
	CreateDynamicObject(1319, 1344.92273, -1451.26477, 13.05180,   0.00000, 0.00000, -11.33998);
	CreateDynamicObject(1319, 1346.06079, -1443.26123, 13.05180,   0.00000, 0.00000, -1.97998);
	CreateDynamicObject(1319, 1346.53821, -1435.66370, 13.05180,   0.00000, 0.00000, -1.97998);
	CreateDynamicObject(1319, 1347.11707, -1428.02295, 13.05180,   0.00000, 0.00000, -1.97998);
	CreateDynamicObject(1319, 1347.70764, -1419.94568, 13.05180,   0.00000, 0.00000, -1.97998);
	CreateDynamicObject(1319, 1352.00000, -1420.28430, 13.05180,   0.00000, 0.00000, -1.97998);
	CreateDynamicObject(1319, 1351.45227, -1428.27625, 13.05180,   0.00000, 0.00000, -1.97998);
	CreateDynamicObject(1319, 1350.95923, -1435.88037, 13.05180,   0.00000, 0.00000, -1.97998);
	CreateDynamicObject(1319, 1350.43628, -1443.58496, 13.05180,   0.00000, 0.00000, -6.83998);
	CreateDynamicObject(1319, 1349.25854, -1452.14600, 13.05180,   0.00000, 0.00000, -11.87998);
	CreateDynamicObject(1319, 1347.46692, -1459.76465, 13.05180,   0.00000, 0.00000, -11.87998);
	CreateDynamicObject(1319, 1345.81653, -1466.89832, 13.05180,   0.00000, 0.00000, -11.87998);
	CreateDynamicObject(1319, 1344.03284, -1474.61133, 13.05180,   0.00000, 0.00000, -11.87998);
	CreateDynamicObject(1319, 1341.33667, -1481.45813, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1338.09058, -1487.83374, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1334.81543, -1494.35754, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1330.33032, -1502.23413, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1325.83496, -1508.68250, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1320.64014, -1516.42407, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1317.22205, -1522.17126, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1314.52368, -1528.87256, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1311.82361, -1536.15320, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1309.93652, -1542.07764, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1309.23718, -1547.64661, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(1319, 1308.48596, -1552.88379, 13.05180,   0.00000, 0.00000, -23.99998);
	CreateDynamicObject(19425, 1354.30664, -1416.20081, 12.50720,   0.00000, 0.00000, -2.16000);
	CreateDynamicObject(19425, 1357.60535, -1416.33081, 12.50720,   0.00000, 0.00000, -2.16000);
	CreateDynamicObject(19425, 1360.90515, -1416.46069, 12.50720,   0.00000, 0.00000, -2.16000);
	CreateDynamicObject(19425, 1332.36169, -1402.55627, 12.43320,   0.00000, 0.00000, 990.00000);
	CreateDynamicObject(19425, 1332.36230, -1405.85706, 12.43320,   0.00000, 0.00000, 990.00000);
	CreateDynamicObject(19425, 1332.36304, -1409.15710, 12.43320,   0.00000, 0.00000, 990.00000);
	CreateDynamicObject(19425, 1339.31750, -1384.83557, 12.58120,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1342.61926, -1384.83569, 12.58120,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1345.91797, -1384.82800, 12.58120,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1353.26172, -1291.99634, 12.32220,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1356.55969, -1291.97437, 12.32220,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1359.86804, -1291.97449, 12.32220,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1363.16431, -1291.94836, 12.32220,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1346.01929, -1269.98047, 12.47020,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1342.73413, -1269.98254, 12.47020,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(19425, 1339.40967, -1269.96863, 12.47020,   0.00000, 0.00000, 1080.11987);
	CreateDynamicObject(713, 1306.90125, -1550.53174, 12.43750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(713, 1317.99170, -1517.07275, 12.43750,   0.00000, 0.00000, 21.12000);
	CreateDynamicObject(713, 1337.41553, -1485.59229, 12.43750,   0.00000, 0.00000, 68.27999);
	CreateDynamicObject(713, 1348.17615, -1450.05945, 12.43750,   0.00000, 0.00000, 68.27999);
	CreateDynamicObject(713, 1350.24109, -1420.28809, 12.43750,   0.00000, 0.00000, 68.27999);

	//Krankenhaus Interior
    CreateDynamicObject(14671,2037.498,-2173.931,-327.473,0.0,0.0,0.0);
	CreateDynamicObject(2146,1159.953,-1330.178,-1.381,0.0,0.0,0.0);
	CreateDynamicObject(2842,1939.128,-2117.918,-20.328,0.0,0.0,0.0);
	CreateDynamicObject(2596,1144.126,-1334.952,0.995,0.0,0.0,-180.000);
	CreateDynamicObject(2842,1939.164,-2114.378,-20.328,0.0,0.0,0.0);
	CreateDynamicObject(2842,1939.084,-2121.369,-20.328,0.0,0.0,0.0);
	CreateDynamicObject(1998,1169.087,-1334.863,-1.867,0.0,0.0,-90.000);
	CreateDynamicObject(18084,1939.069,-2112.719,-16.949,0.0,0.0,-180.000);
	CreateDynamicObject(18084,1942.699,-2112.763,-16.026,0.0,0.0,-180.000);
	CreateDynamicObject(2007,1165.102,-1335.826,-1.871,0.0,0.0,-180.000);
	CreateDynamicObject(2163,1168.615,-1336.654,-0.267,0.0,0.0,-180.000);
	CreateDynamicObject(2008,1167.058,-1334.885,-1.867,0.0,0.0,0.0);
	CreateDynamicObject(1806,1169.290,-1335.995,-1.847,0.0,0.0,-90.000);
	CreateDynamicObject(2008,1147.731,-1315.746,-1.860,0.0,0.0,-90.000);
	CreateDynamicObject(2371,1150.863,-1314.208,-0.598,0.0,-84.225,-270.001);
	CreateDynamicObject(2381,1150.264,-1315.317,-0.429,0.0,0.0,0.0);
	CreateDynamicObject(2394,1150.238,-1315.311,-1.152,0.0,0.0,0.0);
	CreateDynamicObject(1726,1161.378,-1325.811,-1.874,0.0,0.0,-270.001);
	CreateDynamicObject(2762,1163.457,-1324.102,-1.455,0.0,0.0,-89.381);
	CreateDynamicObject(2164,1164.710,-1314.997,-1.873,0.0,0.0,0.0);
	CreateDynamicObject(2162,1165.580,-1314.992,-0.023,0.0,0.0,0.0);
	CreateDynamicObject(2816,1939.097,-2106.794,-19.488,0.0,0.0,0.0);
	CreateDynamicObject(2813,1938.396,-2107.639,-19.488,0.0,0.0,0.0);
	CreateDynamicObject(2826,1935.881,-2105.390,-19.488,0.0,0.0,0.0);
	CreateDynamicObject(2827,1165.274,-1324.607,-1.023,0.0,0.0,-173.606);
	CreateDynamicObject(2829,1942.881,-2108.283,-19.488,0.0,0.0,-22.500);
	CreateDynamicObject(2853,1163.462,-1323.601,-1.037,0.0,0.0,175.325);
	CreateDynamicObject(2855,1166.380,-1326.594,-1.354,0.0,0.0,-22.500);
	CreateDynamicObject(18084,1936.491,-2112.776,-17.061,0.0,0.0,-180.000);
	CreateDynamicObject(18084,1935.039,-2112.786,-17.064,0.0,0.0,-180.000);
	CreateDynamicObject(18084,1933.684,-2110.610,-17.011,0.0,0.0,-90.000);
	CreateDynamicObject(18084,1931.040,-2113.303,-16.951,0.0,0.0,-90.000);
	CreateDynamicObject(7191,1171.660,-1331.668,-0.169,0.0,0.0,0.0);
	CreateDynamicObject(7191,1171.674,-1324.462,1.157,0.0,0.0,0.0);
	CreateDynamicObject(7191,1162.634,-1336.267,-0.893,0.0,0.0,-92.819);
	CreateDynamicObject(7191,1160.952,-1336.205,1.459,0.0,0.0,-92.819);
	CreateDynamicObject(7191,1141.308,-1333.862,-1.682,0.0,1.719,179.623);
	CreateDynamicObject(7191,1141.285,-1326.360,0.231,0.0,1.719,179.623);
	CreateDynamicObject(7191,1160.512,-1314.790,-1.158,0.0,0.0,89.381);
	CreateDynamicObject(7191,1151.812,-1314.720,1.795,0.0,0.0,89.381);
	CreateDynamicObject(14671,1146.455,-1323.209,0.122,0.0,0.0,0.0);
	CreateDynamicObject(7191,1146.434,-1326.575,-0.119,0.0,0.0,-92.819);
	CreateDynamicObject(7191,1158.542,-1327.153,2.535,0.0,0.0,-92.819);
	CreateDynamicObject(1491,1171.529,-1327.812,-1.910,0.0,0.0,-181.341);
	CreateDynamicObject(1491,1168.492,-1327.728,-1.922,0.0,0.0,-1.719);
	CreateDynamicObject(7191,1160.587,-1310.262,-0.284,0.0,0.0,0.0);
	CreateDynamicObject(7191,1160.575,-1310.254,2.506,0.0,0.0,0.0);
	CreateDynamicObject(7191,1160.792,-1311.028,0.024,0.0,1.719,179.623);
	CreateDynamicObject(7191,1160.727,-1315.525,2.481,0.0,1.719,179.623);
	CreateDynamicObject(1491,1160.729,-1333.115,-1.944,0.0,0.0,-91.100);
	CreateDynamicObject(1491,1160.711,-1336.129,-1.948,0.0,0.0,-269.863);
	CreateDynamicObject(7191,1160.576,-1355.268,2.483,0.0,0.0,0.0);
	CreateDynamicObject(7191,1152.090,-1326.938,2.531,0.0,0.0,86.803);
	CreateDynamicObject(7191,1145.720,-1326.618,-1.319,0.0,0.0,86.803);
	CreateDynamicObject(1506,1171.562,-1323.066,-1.947,0.0,0.0,-90.000);
	CreateDynamicObject(1506,1171.603,-1323.097,-1.954,0.0,0.0,90.482);
	CreateDynamicObject(1569,1160.880,-1318.180,-1.865,0.0,0.0,90.000);
	CreateDynamicObject(1569,1160.862,-1315.178,-1.874,0.0,0.0,269.622);
	CreateDynamicObject(1569,1160.526,-1315.120,-1.887,0.0,0.0,269.622);
	CreateDynamicObject(1569,1160.515,-1318.099,-1.877,0.0,0.0,89.244);
	CreateDynamicObject(14455,1146.982,-1314.742,-0.180,0.0,0.0,-180.000);
	CreateDynamicObject(14455,1141.478,-1315.766,-0.199,0.0,0.0,-90.618);
	CreateDynamicObject(1801,1143.806,-1330.160,-1.863,0.0,0.0,-361.100);
	CreateDynamicObject(1801,1147.622,-1330.359,-1.839,0.0,0.0,-361.100);
	CreateDynamicObject(1801,1151.417,-1330.543,-1.839,0.0,0.0,-361.100);
	CreateDynamicObject(1801,1155.146,-1330.783,-1.814,0.0,0.0,-361.100);
	CreateDynamicObject(2225,1143.254,-1326.523,-1.867,0.0,0.0,-360.001);
	CreateDynamicObject(2225,1147.115,-1326.783,-1.806,0.0,0.0,-360.001);
	CreateDynamicObject(2225,1150.896,-1326.950,-1.817,0.0,0.0,-360.001);
	CreateDynamicObject(2225,1154.620,-1327.215,-1.835,0.0,0.0,-360.001);
	CreateDynamicObject(2190,1143.355,-1326.533,-1.119,0.0,0.0,-361.960);
	CreateDynamicObject(2190,1147.200,-1326.780,-1.071,0.0,0.0,-361.960);
	CreateDynamicObject(2190,1150.982,-1326.957,-1.096,0.0,0.0,-361.960);
	CreateDynamicObject(2190,1154.699,-1327.203,-1.098,0.0,0.0,-361.960);
	CreateDynamicObject(2596,1147.715,-1335.116,1.007,0.0,0.0,-180.000);
	CreateDynamicObject(2596,1152.365,-1335.364,1.183,0.0,0.0,-180.000);
	CreateDynamicObject(2596,1155.961,-1335.535,1.284,0.0,0.0,-180.000);
	CreateDynamicObject(2576,1147.254,-1334.875,-1.878,0.0,0.0,-180.000);
	CreateDynamicObject(2576,1151.635,-1335.039,-1.877,0.0,0.0,-180.000);
	CreateDynamicObject(2576,1155.865,-1335.327,-1.879,0.0,0.0,-180.000);
	CreateDynamicObject(1789,1141.801,-1333.096,-1.285,0.0,0.0,-90.000);
	CreateDynamicObject(2146,1141.857,-1330.641,-1.381,0.0,0.0,0.0);
	CreateDynamicObject(1806,1168.077,-1335.853,-1.885,0.0,0.0,0.0);
	CreateDynamicObject(2007,1164.134,-1335.827,-1.873,0.0,0.0,-180.000);
	CreateDynamicObject(2146,1161.324,-1329.818,-1.381,0.0,0.0,0.0);
	CreateDynamicObject(2161,1171.563,-1331.923,-1.852,0.0,0.0,-90.000);
	CreateDynamicObject(2164,1171.498,-1330.158,-1.873,0.0,0.0,-90.000);
	CreateDynamicObject(2161,1171.568,-1331.915,-0.524,0.0,0.0,-90.000);
	CreateDynamicObject(2199,1165.902,-1327.989,-1.887,0.0,0.0,0.0);
	CreateDynamicObject(2200,1163.568,-1327.937,-1.867,0.0,0.0,0.0);
	CreateDynamicObject(2164,1166.477,-1314.988,-1.873,0.0,0.0,0.0);
	CreateDynamicObject(1726,1161.348,-1323.385,-1.887,0.0,0.0,-270.001);
	CreateDynamicObject(1726,1164.292,-1326.695,-1.888,0.0,0.0,-180.619);
	CreateDynamicObject(1726,1166.718,-1326.684,-1.874,0.0,0.0,-180.619);
	CreateDynamicObject(949,1161.209,-1320.814,-1.230,0.0,0.0,0.0);
	CreateDynamicObject(949,1167.235,-1326.807,-1.230,0.0,0.0,0.0);
	CreateDynamicObject(949,1161.507,-1326.589,-1.223,0.0,0.0,0.0);
	CreateDynamicObject(2762,1165.065,-1324.585,-1.455,0.0,0.0,-179.381);
	CreateDynamicObject(1775,1171.044,-1318.319,-0.763,0.0,0.0,-90.000);
	CreateDynamicObject(1776,1171.136,-1319.605,-0.785,0.0,0.0,-90.000);
	CreateDynamicObject(949,1170.895,-1315.673,-1.223,0.0,0.0,0.0);
	CreateDynamicObject(2008,1147.742,-1317.795,-1.861,0.0,0.0,-90.000);
	CreateDynamicObject(1806,1146.837,-1318.697,-1.840,0.0,0.0,-90.000);
	CreateDynamicObject(1806,1146.819,-1316.684,-1.848,0.0,0.0,-90.000);
	CreateDynamicObject(2164,1143.592,-1326.237,-1.862,0.0,0.0,-180.000);
	CreateDynamicObject(2164,1145.356,-1326.260,-1.876,0.0,0.0,-180.000);
	CreateDynamicObject(914,1159.876,-1322.763,-1.096,0.0,0.0,0.0);
	CreateDynamicObject(914,1159.861,-1322.754,0.417,0.0,0.0,0.0);
	CreateDynamicObject(914,1159.873,-1322.746,1.939,0.0,0.0,0.0);
	CreateDynamicObject(3384,1155.504,-1326.401,-0.417,0.0,0.0,-90.000);
	CreateDynamicObject(914,1157.142,-1326.455,-1.153,0.0,0.0,90.241);
	CreateDynamicObject(914,1157.142,-1326.471,0.367,0.0,0.0,90.241);
	CreateDynamicObject(914,1157.129,-1326.466,1.868,0.0,0.0,90.241);
	CreateDynamicObject(914,1157.130,-1325.284,-1.162,0.0,0.0,90.241);
	CreateDynamicObject(914,1157.155,-1325.285,0.388,0.0,0.0,90.241);
	CreateDynamicObject(914,1157.146,-1325.281,1.893,0.0,0.0,90.241);
	CreateDynamicObject(958,1158.790,-1326.740,-1.061,0.0,0.0,-0.859);
	CreateDynamicObject(927,1160.440,-1324.814,-0.548,0.0,0.0,-90.000);
	CreateDynamicObject(914,1157.139,-1324.114,-1.117,0.0,0.0,90.241);
	CreateDynamicObject(914,1157.139,-1324.125,0.408,0.0,0.0,90.241);
	CreateDynamicObject(914,1157.151,-1324.125,1.945,0.0,0.0,90.241);
	CreateDynamicObject(914,1158.705,-1322.779,-1.119,0.0,0.0,0.0);
	CreateDynamicObject(914,1158.698,-1322.770,0.390,0.0,0.0,0.0);
	CreateDynamicObject(914,1158.689,-1322.737,1.916,0.0,0.0,0.0);
	CreateDynamicObject(914,1157.660,-1323.035,1.903,0.0,0.0,30.003);
	CreateDynamicObject(914,1157.195,-1323.604,1.916,0.0,0.0,65.317);
	CreateDynamicObject(983,1157.610,-1323.203,-1.176,89.381,0.0,-54.144);



    //Los Satos Trucker Base - by Brandon
    CreateDynamicObject(3627, 2179.6829, -2220.5181, 15.91516, 0, 0, 314.981);
	CreateDynamicObject(10183, 2210.2561, -2197.0662, 12.55262, 0, 0, 0.484);
	CreateDynamicObject(10183, 2251.4951, -2238.3694, 12.54022, 0.088, 0.088, 0.483);
	CreateDynamicObject(1226, 2227.8235, -2210.6633, 16.4213, 0, 0, 46.22);
	CreateDynamicObject(1226, 2214.1746, -2197.0085, 16.4213, 0, 0, 46.219);
	CreateDynamicObject(1226, 2203.7737, -2186.5942, 16.4213, 0, 0, 46.219);
	CreateDynamicObject(1226, 2241.1978, -2224.1289, 16.4213, 0, 0, 46.219);
	CreateDynamicObject(1226, 2251.853, -2234.7473, 16.4213, 0, 0, 46.219);

	//Interior 2 T?ren (Ordnungsamt Interior)
	CreateDynamicObject(1555, 321.43503, 310.11249, 998.14832,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1498, 321.44571, 301.95190, 998.14838,   0.00000, 0.00000, 0.00000);

	//German Samplife - Tankstellen in Los Santos - Mapping by GangstaSunny (34 Objects)
	CreateDynamicObject(2943,1928.6999500,-1771.3000500,13.3000000,0.0000000,0.0000000,90.0000000); //object(kmb_atm2) (1)
	CreateDynamicObject(1886,1937.5000000,-1780.9000200,18.1000000,12.0000000,0.0000000,180.0000000); //object(shop_sec_cam) (1)
	CreateDynamicObject(1886,1944.5000000,-1766.0000000,18.2000000,16.0000000,0.0000000,0.0000000); //object(shop_sec_cam) (2)
	CreateDynamicObject(3578,1941.6999500,-1762.0999800,11.6000000,0.0000000,0.0000000,0.0000000); //object(dockbarr1_la) (1)
	CreateDynamicObject(3578,1951.5999800,-1787.3000500,11.6000000,0.0000000,0.0000000,270.0000000); //object(dockbarr1_la) (2)
	CreateDynamicObject(1424,1911.1999500,-1772.1999500,12.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2) (1)
	CreateDynamicObject(1424,1911.3000500,-1780.8000500,12.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2) (2)
	CreateDynamicObject(1237,1909.5999800,-1780.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (1)
	CreateDynamicObject(1237,1913.0999800,-1780.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (2)
	CreateDynamicObject(1237,1909.4000200,-1772.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (3)
	CreateDynamicObject(1237,1913.0000000,-1772.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (4)
	CreateDynamicObject(984,1942.1999500,-1772.9000200,13.3000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (1)
	CreateDynamicObject(984,1941.0999800,-1772.9000200,13.3000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (2)
	CreateDynamicObject(1251,1932.1999500,-1794.5999800,12.5000000,0.0000000,0.0000000,320.0000000); //object(smashbar) (1)
	CreateDynamicObject(1251,1927.5999800,-1794.5999800,12.5000000,0.0000000,0.0000000,319.9990000); //object(smashbar) (2)
	CreateDynamicObject(1251,1922.9000200,-1794.5999800,12.5000000,0.0000000,0.0000000,319.9990000); //object(smashbar) (3)
	CreateDynamicObject(1251,1918.0000000,-1794.6999500,12.5000000,0.0000000,0.0000000,319.9990000); //object(smashbar) (4)
	CreateDynamicObject(984,1902.1999500,-1780.9000200,13.2000000,0.0000000,0.0000000,270.0000000); //object(fenceshit2) (3)
	CreateDynamicObject(984,1902.0999800,-1771.6999500,13.2000000,0.0000000,0.0000000,270.0000000); //object(fenceshit2) (4)
	CreateDynamicObject(1215,1941.5999800,-1764.9000200,13.2000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,1941.5999800,-1780.8000500,13.2000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (2)
	CreateDynamicObject(1676,998.5000000,-937.5999800,42.8000000,0.0000000,0.0000000,8.0000000); //object(washgaspump) (1)
	CreateDynamicObject(1676,1001.7999900,-937.2000100,42.8000000,0.0000000,0.0000000,7.9980000); //object(washgaspump) (2)
	CreateDynamicObject(1676,1005.5999800,-936.7000100,42.8000000,0.0000000,0.0000000,7.9980000); //object(washgaspump) (3)
	CreateDynamicObject(1676,1009.2999900,-936.2000100,42.8000000,0.0000000,0.0000000,7.9980000); //object(washgaspump) (4)
	CreateDynamicObject(2885,1015.7999900,-922.2999900,44.8000000,0.0000000,0.0000000,8.0000000); //object(xref_garagedoor) (1)
	CreateDynamicObject(2885,1014.5000000,-913.7000100,45.6000000,0.0000000,0.0000000,187.9980000); //object(xref_garagedoor) (2)
	CreateDynamicObject(984,1004.0999800,-937.4000200,41.9000000,0.0000000,0.0000000,278.0000000); //object(fenceshit2) (5)
	CreateDynamicObject(984,1003.9000200,-936.2999900,41.9000000,0.0000000,0.0000000,277.9980000); //object(fenceshit2) (6)
	CreateDynamicObject(1215,996.0999800,-938.0000000,41.9000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (3)
	CreateDynamicObject(1215,1011.7999900,-935.7000100,41.9000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (4)
	CreateDynamicObject(2714,1000.5999800,-918.5000000,43.2000000,0.0000000,0.0000000,280.0000000); //object(cj_open_sign_2) (1)

	//German Samplife - staatliches Casino - Mapping by GangstaSunny (50 Objects)

	//Krankenhaus Map - Mapping by GangstaSunny (10 Objecte)
	CreateDynamicObject(970,1183.0000000,-1329.0000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,1183.0000000,-1318.4000200,13.1000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (2)
	CreateDynamicObject(970,1185.5000000,-1323.5999800,13.1000000,0.0000000,0.0000000,270.0000000); //object(fencesmallb) (3)
	CreateDynamicObject(19127,1185.5999800,-1342.3000500,13.8000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (1)
	CreateDynamicObject(19127,1185.5000000,-1305.0999800,13.8000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (2)
	CreateDynamicObject(19127,1185.4000200,-1318.4000200,13.1000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (3)
	CreateDynamicObject(19127,1185.4000200,-1329.0000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (4)
	CreateDynamicObject(19127,1180.4000200,-1335.5000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (5)
	CreateDynamicObject(19127,1180.4000200,-1311.9000200,13.8000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (6)
	CreateDynamicObject(1257,1187.0000000,-1355.0999800,13.8000000,0.0000000,0.0000000,180.0000000); //object(bustopm) (1)

	//Los Santos Police Gef?ngnis
	CreateDynamicObject(19303, 266.36670, 78.46580, 1001.28967,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19303, 266.37381, 76.70620, 1001.28967,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19303, 266.36670, 82.96580, 1001.28967,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19303, 266.37381, 81.20620, 1001.28967,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19303, 266.36670, 87.46580, 1001.28967,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19303, 266.37381, 85.70620, 1001.28967,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1886, 270.16669, 92.46620, 1003.89618,   10.00000, 0.00000, 340.46201);

	//Rampe f?r die Einfahrt der Appartments in Los Santos by Tobi_DeKey
	CreateDynamicObject(5152, 1268.46985, -916.17151, 41.42190,   0.00000, 15.00000, 100.24420);
	CreateDynamicObject(5152, 1270.53760, -915.82166, 41.42190,   0.00000, 15.00000, 100.24420);
	CreateDynamicObject(5152, 1271.41345, -915.69135, 41.42190,   0.00000, 15.00000, 100.24420);

	//Kehrmaschinen Base - Los Santos by Tobi_DeKey
    CreateDynamicObject(984, 1413.01318, -1652.65686, 13.18320,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(984, 1400.21326, -1652.65686, 13.18320,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(984, 1387.41333, -1652.67688, 13.18320,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(983, 1381.03235, -1652.66675, 13.24320,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(19127, 1377.72046, -1652.82104, 13.10300,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1419.53857, -1652.74695, 13.11620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19127, 1419.53857, -1644.53687, 13.11620,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8843, 1386.42358, -1650.71289, 12.39320,   0.00000, 0.00000, 270.71317);
	CreateDynamicObject(8843, 1410.65344, -1646.71472, 12.39320,   0.00000, 0.00000, 89.49599);
	CreateDynamicObject(8843, 1410.24011, -1650.55054, 12.39320,   0.00000, 0.00000, 270.71320);
	CreateDynamicObject(8843, 1386.42358, -1646.53247, 12.39320,   0.00000, 0.00000, 89.49600);

	//Los Santos Bank
	lspdinttmpobjid = CreateObject(8661,1764.545,-1707.245,12.543,0.000,0.000,90.000);
	SetObjectMaterial(lspdinttmpobjid, 0, 10388, "scum2_sfs", "ws_carparkmanky1", 0);
	lspdinttmpobjid = CreateObject(8661,1764.545,-1702.258,12.539,0.000,0.000,90.000);
	SetObjectMaterial(lspdinttmpobjid, 0, 10388, "scum2_sfs", "ws_carparkmanky1", 0);
	lspdinttmpobjid = CreateObject(8661,1784.525,-1702.498,12.539,0.000,0.000,90.000);
	SetObjectMaterial(lspdinttmpobjid, 0, 10388, "scum2_sfs", "ws_carparkmanky1", 0);
	lspdinttmpobjid = CreateObject(8661,1802.156,-1707.249,12.543,0.000,0.000,90.000);
	SetObjectMaterial(lspdinttmpobjid, 0, 10388, "scum2_sfs", "ws_carparkmanky1", 0);
	lspdinttmpobjid = CreateObject(8661,1804.495,-1702.258,12.539,0.000,0.000,90.000);
	SetObjectMaterial(lspdinttmpobjid, 0, 10388, "scum2_sfs", "ws_carparkmanky1", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1788.175,-1716.235,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1809.251,-1709.160,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1805.901,-1717.284,14.036,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1804.744,-1713.709,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1808.137,-1715.050,14.036,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1809.251,-1702.744,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1806.275,-1693.472,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1804.744,-1704.079,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1804.744,-1695.004,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1804.748,-1697.929,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1804.744,-1713.709,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1808.137,-1715.050,17.533,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1805.901,-1717.284,17.533,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1809.251,-1709.160,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1809.251,-1702.744,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1804.744,-1695.004,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1804.744,-1704.079,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1804.748,-1697.929,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1794.429,-1713.789,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1793.310,-1717.389,17.533,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1788.175,-1716.235,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1793.310,-1717.389,14.036,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1794.429,-1713.789,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1794.429,-1704.160,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1793.896,-1698.842,14.036,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1788.582,-1698.298,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1778.956,-1698.298,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1769.335,-1698.298,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1761.232,-1703.680,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1763.765,-1697.525,14.036,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1761.578,-1697.489,14.036,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1761.558,-1699.644,14.036,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1772.369,-1716.235,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1777.943,-1716.288,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(1491,1778.012,-1716.250,12.500,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4830, "airport2", "sanairtex3", 0);
	lspdinttmpobjid = CreateDynamicObject(1491,1781.026,-1716.232,12.500,0.000,0.000,180.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4830, "airport2", "sanairtex3", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1781.094,-1716.288,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1784.279,-1716.288,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1782.681,-1716.990,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1776.275,-1716.990,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1774.738,-1716.288,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1781.094,-1716.288,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1782.681,-1716.990,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1784.279,-1716.288,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1774.738,-1716.288,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1772.369,-1716.235,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1777.943,-1716.288,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1776.275,-1716.990,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1779.563,-1716.218,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1779.501,-1718.028,15.722,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(3498,1782.880,-1719.434,11.289,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 14569, "traidman", "darkgrey_carpet_256", 0);
	lspdinttmpobjid = CreateDynamicObject(3498,1776.269,-1719.480,11.289,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 14569, "traidman", "darkgrey_carpet_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1794.429,-1704.160,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1761.232,-1703.680,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1761.578,-1697.489,17.533,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1761.558,-1699.644,17.533,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1763.765,-1697.525,17.533,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1761.236,-1711.504,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1763.048,-1716.982,14.036,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1760.886,-1714.813,14.036,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1760.899,-1716.967,14.036,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1765.945,-1716.235,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1762.742,-1716.235,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1761.236,-1711.504,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1760.886,-1714.813,17.533,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1763.048,-1716.982,17.533,0.000,0.000,-45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1760.899,-1716.947,17.533,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1765.945,-1716.235,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1762.742,-1716.235,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(3660,1808.610,-1692.264,15.091,0.000,0.000,-90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(3660,1799.520,-1681.261,15.091,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(3660,1779.908,-1681.261,15.091,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(3660,1764.355,-1681.263,15.093,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(19437,1793.896,-1698.842,17.533,0.000,0.000,45.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1788.582,-1698.298,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1778.956,-1698.298,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1769.335,-1698.298,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19442,1796.114,-1718.486,18.459,90.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19442,1799.594,-1718.486,18.459,90.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19442,1803.074,-1718.486,18.459,90.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19442,1796.114,-1699.417,18.459,90.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19442,1799.594,-1699.417,18.459,90.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19442,1803.074,-1699.417,18.459,90.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19379,1789.098,-1711.403,12.463,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19375,1778.603,-1711.403,12.463,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19379,1768.097,-1711.155,12.463,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19375,1767.170,-1703.077,12.465,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14710, "vgshm3int2", "HSV_3carpet2", 0);
	lspdinttmpobjid = CreateDynamicObject(19379,1777.664,-1703.077,12.465,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19379,1788.158,-1703.077,12.465,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1781.598,-1718.028,15.726,0.000,90.000,89.940);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1777.530,-1718.028,15.726,0.000,90.000,89.940);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19370,1776.276,-1714.084,12.467,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19370,1772.788,-1714.084,12.467,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19370,1776.276,-1708.512,12.467,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19370,1772.788,-1708.512,12.467,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19370,1782.752,-1714.728,12.467,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19370,1782.766,-1709.132,12.467,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 15041, "bigsfsave", "AH_flroortile9", 0);
	lspdinttmpobjid = CreateDynamicObject(19360,1776.434,-1714.671,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19360,1773.207,-1714.657,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1777.957,-1715.379,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1781.082,-1715.365,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19360,1782.627,-1714.651,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1789.050,-1714.651,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1793.735,-1709.838,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1766.810,-1714.651,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1765.355,-1710.959,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1793.166,-1703.184,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1788.763,-1698.553,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1779.117,-1698.553,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1769.497,-1698.553,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19383,1787.744,-1711.967,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19426,1787.744,-1714.376,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1789.296,-1708.000,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19426,1787.744,-1709.560,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1792.501,-1708.000,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19383,1787.744,-1705.546,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19426,1787.744,-1707.955,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1792.903,-1701.235,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1787.744,-1702.337,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19426,1791.390,-1700.501,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19426,1787.730,-1699.945,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1789.263,-1699.991,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1792.472,-1699.991,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19452,1768.010,-1708.020,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19360,1772.748,-1706.500,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1784.626,-1711.916,12.475,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1785.828,-1711.916,12.477,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1785.988,-1711.936,12.472,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1785.835,-1708.421,12.477,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1785.828,-1704.926,12.477,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1784.626,-1704.926,12.475,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1784.626,-1708.421,12.475,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1785.988,-1705.526,12.472,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19450,1779.850,-1703.088,11.727,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1778.838,-1704.903,12.475,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1780.217,-1704.903,12.477,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1780.217,-1708.393,12.477,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1778.838,-1708.393,12.475,0.000,90.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 14803, "bdupsnew", "Bdup2_carpet", 0);
	lspdinttmpobjid = CreateDynamicObject(19358,1773.780,-1704.693,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19431,1775.297,-1703.814,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19360,1772.748,-1703.299,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19431,1786.950,-1703.088,11.727,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(1491,1784.643,-1703.114,10.967,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 17588, "lae2coast_alpha", "plainglass", 0);
	lspdinttmpobjid = CreateDynamicObject(19431,1775.117,-1703.814,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1809.261,-1698.208,14.036,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1807.706,-1693.485,14.036,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1807.706,-1693.485,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19364,1806.275,-1693.472,17.533,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 6871, "vegascourtbld", "marbletilewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19456,1809.261,-1698.208,17.533,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4593, "buildblk55", "sl_plazatile01", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1771.668,-1708.622,12.550,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1770.266,-1708.622,12.550,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1772.698,-1714.039,12.550,0.000,0.000,180.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1771.291,-1714.039,12.550,0.000,0.000,180.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1765.568,-1709.544,13.409,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 1975, "texttest", "kb_blue", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1765.568,-1711.175,13.409,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 1975, "texttest", "kb_blue", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(19429,1765.568,-1712.837,13.409,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 1975, "texttest", "kb_blue", 0);
	lspdinttmpobjid = CreateDynamicObject(19431,1775.822,-1703.098,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(1723,1786.232,-1714.048,12.550,0.000,0.000,180.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(19360,1772.628,-1700.188,16.892,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(2773,1780.995,-1704.219,12.985,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(2773,1779.475,-1704.219,12.985,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(2773,1778.031,-1704.219,12.985,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1786.526,-1699.203,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1787.222,-1699.974,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1787.564,-1699.930,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19360,1787.564,-1702.337,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19386,1787.564,-1705.546,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1787.564,-1707.955,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1787.564,-1709.560,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19386,1787.564,-1711.962,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19433,1787.564,-1714.368,14.272,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 13694, "lahillstxd1a", "glasswindow2_256", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1789.296,-1714.496,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(19353,1792.510,-1714.478,14.272,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 8419, "vgsbldng1", "buildng01wind_128", 0);
	lspdinttmpobjid = CreateDynamicObject(1491,1787.695,-1712.710,12.520,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3484, "vegashse5", "vegashousewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(1491,1787.695,-1706.290,12.520,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 3484, "vegashse5", "vegashousewal1_256", 0);
	lspdinttmpobjid = CreateDynamicObject(1723,1773.383,-1708.626,12.550,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1723,1786.963,-1707.730,12.550,0.000,0.000,-90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightblue2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1789.958,-1709.813,12.551,0.000,0.000,78.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightyellow2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1790.587,-1712.478,12.551,0.000,0.000,124.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightgreen2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1789.726,-1703.971,12.551,0.000,0.000,25.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightyellow2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1724,1791.720,-1703.443,12.551,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightgreen2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(1723,1788.558,-1700.625,12.550,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 1, 7650, "vgnusedcar", "lightpurple2_32", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1804.872,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1800.477,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1796.338,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1792.094,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1788.045,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1783.809,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1779.748,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1775.467,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1771.082,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1766.789,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1762.365,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1757.988,-1683.996,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1759.385,-1700.394,11.764,0.000,0.000,40.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1760.227,-1703.940,11.764,0.000,0.000,40.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1760.050,-1708.439,11.764,0.000,0.000,40.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1760.007,-1713.319,11.764,0.000,0.000,40.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(19435,1772.870,-1716.558,12.584,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4829, "airport_las", "sjmlahus28", 0);
	lspdinttmpobjid = CreateDynamicObject(19435,1769.376,-1716.558,12.584,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4829, "airport_las", "sjmlahus28", 0);
	lspdinttmpobjid = CreateDynamicObject(19435,1765.887,-1716.558,12.584,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4829, "airport_las", "sjmlahus28", 0);
	lspdinttmpobjid = CreateDynamicObject(19435,1762.966,-1716.558,12.587,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4829, "airport_las", "sjmlahus28", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1785.859,-1717.392,10.937,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1789.056,-1717.392,10.937,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(19366,1792.259,-1717.392,10.937,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(19439,1784.269,-1716.691,10.931,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4821, "union_las", "lasunion995", 0);
	lspdinttmpobjid = CreateDynamicObject(19435,1786.059,-1716.558,12.584,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4829, "airport_las", "sjmlahus28", 0);
	lspdinttmpobjid = CreateDynamicObject(19435,1789.556,-1716.558,12.584,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4829, "airport_las", "sjmlahus28", 0);
	lspdinttmpobjid = CreateDynamicObject(19435,1792.744,-1716.558,12.587,0.000,90.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 4829, "airport_las", "sjmlahus28", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1799.534,-1713.359,11.762,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1799.532,-1718.241,11.764,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "ws_carparkwall2", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1799.534,-1704.580,11.764,0.000,0.000,90.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 10765, "airportgnd_sfse", "white", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1799.568,-1699.623,11.762,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "ws_carparkwall2", 0);
	lspdinttmpobjid = CreateDynamicObject(3578,1799.532,-1727.092,11.770,0.000,0.000,0.000);
	SetDynamicObjectMaterial(lspdinttmpobjid, 0, 16640, "a51", "ws_carparkwall2", 0);

	CreateDynamicObject(19364,1809.2510000,-1699.5350000,17.5330000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19377,1799.6100000,-1713.7730000,17.5940000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19364,1776.2750000,-1715.5560000,14.0360000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19364,1782.6810000,-1715.5560000,14.0360000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19364,1782.6810000,-1715.5560000,17.5330000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19364,1776.2750000,-1715.5560000,17.5330000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19442,1779.5440000,-1716.2130000,15.7950000,90.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19459,1754.6410000,-1687.0580000,10.7960000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19459,1754.6410000,-1696.6910000,10.7960000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19459,1754.6410000,-1706.3130000,10.7960000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19459,1754.6410000,-1715.9420000,10.7960000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19377,1799.6100000,-1704.1390000,17.5940000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1799.6100000,-1704.1390000,19.2140000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1799.6200000,-1713.7550000,19.2140000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19452,1764.9860000,-1703.0370000,14.0360000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19360,1763.4070000,-1707.5830000,14.0360000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19451,1765.9350000,-1703.0420000,14.2720000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19451,1767.7490000,-1698.5710000,14.2720000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19451,1767.9650000,-1706.9940000,14.2720000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19359,1772.1480000,-1703.2990000,14.2720000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19359,1772.1480000,-1706.4900000,14.2720000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19377,1804.0810000,-1704.1390000,19.2170000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1804.0810000,-1709.1500000,19.2070000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19362,1806.9070000,-1713.8750000,19.1940000,0.0000000,90.0000000,45.0000000); //
	CreateDynamicObject(19362,1804.8280000,-1716.0220000,19.1740000,0.0000000,90.0000000,45.0000000); //
	CreateDynamicObject(19362,1807.5890000,-1695.0130000,19.2140000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19362,1807.5890000,-1698.2150000,19.2140000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19362,1806.4100000,-1695.0130000,19.2160000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19362,1806.4100000,-1698.2150000,19.2160000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(2634,1772.4470000,-1699.5130000,13.8070000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2634,1772.5390000,-1701.5130000,13.8460000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2634,1772.3080000,-1701.4750000,13.8460000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(19359,1772.4480000,-1700.1880000,16.8920000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19359,1772.2680000,-1700.1880000,16.8920000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19377,1768.0970000,-1711.1550000,15.9410000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1767.1700000,-1703.0770000,15.9430000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1777.6640000,-1703.0770000,15.9430000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1778.6030000,-1711.4030000,15.9410000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1786.0610000,-1703.1190000,15.9450000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(3280,1792.0970000,-1706.2310000,15.9460000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19435,1792.1080000,-1700.2110000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(19435,1792.1080000,-1703.6590000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(19435,1792.1080000,-1708.7340000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(19377,1786.0610000,-1711.4030000,15.9430000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(3280,1792.0970000,-1711.3080000,15.9460000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19435,1792.1080000,-1713.8400000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(19435,1793.7110000,-1712.8570000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(19435,1793.7110000,-1709.3760000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(19435,1793.7110000,-1705.8740000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(19435,1793.7110000,-1702.3690000,15.9410000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(2008,1778.7940000,-1702.4670000,12.5340000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2008,1780.7830000,-1702.4670000,12.5340000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(1671,1780.6470000,-1701.4620000,13.0500000,0.0000000,0.0000000,-8.0000000); //
	CreateDynamicObject(1671,1777.9660000,-1701.4470000,13.0500000,0.0000000,0.0000000,26.0000000); //
	CreateDynamicObject(2186,1774.4290000,-1704.0730000,12.5530000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2000,1786.1740000,-1699.1540000,12.5520000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2000,1785.6740000,-1699.1540000,12.5520000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2000,1785.1540000,-1699.1540000,12.5520000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2002,1784.3910000,-1699.0800000,12.5530000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2000,1786.9550000,-1700.3110000,12.5520000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2000,1786.9550000,-1700.8310000,12.5520000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2000,1786.9550000,-1701.3510000,12.5520000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2000,1786.9550000,-1701.8710000,12.5520000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2333,1782.3900000,-1699.8660000,12.3700000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2333,1780.4920000,-1699.8660000,12.3700000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2886,1772.6580000,-1700.7890000,13.9950000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2921,1787.7240000,-1702.6140000,14.9060000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2921,1775.1380000,-1703.1350000,14.9060000,0.0000000,0.0000000,-10.0000000); //
	CreateDynamicObject(2921,1772.8830000,-1706.1540000,14.9060000,0.0000000,6.0000000,158.0000000); //
	CreateDynamicObject(2921,1787.5730000,-1714.0860000,14.9060000,0.0000000,12.0000000,-19.0000000); //
	CreateDynamicObject(631,1773.2120000,-1705.2140000,13.4450000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2194,1783.1050000,-1698.9000000,13.5920000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2196,1780.8330000,-1698.6470000,13.3300000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2257,1778.7770000,-1698.6610000,14.3310000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2258,1785.2470000,-1714.5220000,14.6750000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2261,1776.1510000,-1714.0830000,14.1380000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2262,1769.4670000,-1714.0810000,14.6340000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2267,1768.8350000,-1708.1270000,14.8210000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2256,1787.4680000,-1708.7790000,14.4910000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(631,1775.8920000,-1703.7210000,13.4450000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(631,1787.1150000,-1703.6640000,13.4450000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1714,1793.2650000,-1710.5260000,12.5510000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2165,1791.9490000,-1711.1010000,12.5520000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2000,1793.1180000,-1714.1280000,12.5520000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2000,1793.1180000,-1713.6480000,12.5520000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(631,1788.3670000,-1713.9860000,13.4450000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(632,1789.4600000,-1709.0170000,12.8510000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2264,1793.1430000,-1712.2320000,14.4510000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2265,1793.1500000,-1711.2910000,14.8310000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2165,1791.4420000,-1705.5930000,12.5520000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1714,1792.1510000,-1706.8610000,12.5510000,0.0000000,0.0000000,-130.0000000); //
	CreateDynamicObject(631,1788.3260000,-1707.4600000,13.4450000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(630,1792.8340000,-1701.7340000,13.4450000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2000,1789.1460000,-1707.4200000,12.5520000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2000,1789.6550000,-1707.4200000,12.5520000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2269,1792.5960000,-1705.9280000,14.5580000,0.0000000,0.0000000,-90.0000000); //
	CreateDynamicObject(2271,1791.7310000,-1707.4260000,14.5580000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2270,1789.5740000,-1700.5730000,14.5980000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2003,1771.5910000,-1706.5750000,12.9980000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1771.5910000,-1706.5750000,13.9120000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2003,1771.5910000,-1706.5750000,14.7920000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(1829,1770.7400000,-1706.3550000,12.9980000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1769.8810000,-1706.5750000,12.9980000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1769.0200000,-1706.5750000,12.9980000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2003,1768.1780000,-1706.5750000,12.9980000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1767.3200000,-1706.5750000,12.9980000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2003,1766.4470000,-1706.5760000,12.9980000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1770.7400000,-1706.5750000,13.9120000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1769.8810000,-1706.5750000,13.9120000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2003,1769.0200000,-1706.5750000,13.9120000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(1829,1768.1780000,-1706.3550000,13.9120000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1767.3200000,-1706.5750000,13.9120000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2003,1766.4470000,-1706.5760000,13.9120000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(1829,1769.8810000,-1706.3550000,14.7920000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1770.7400000,-1706.5750000,14.7920000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2003,1769.0200000,-1706.5750000,14.7920000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1768.1780000,-1706.5750000,14.7920000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(1829,1767.3200000,-1706.3550000,14.7920000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2332,1766.4470000,-1706.5760000,14.7920000,0.0000000,0.0000000,180.0000000); //
	CreateDynamicObject(2003,1766.4580000,-1699.0920000,12.9980000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1699.8990000,12.9980000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1700.7380000,12.9980000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1701.5410000,12.9980000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2003,1766.4580000,-1702.3620000,12.9980000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1703.1640000,12.9980000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2003,1766.4580000,-1703.1640000,13.9120000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1702.3620000,13.9120000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1701.5410000,13.9120000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1829,1766.5780000,-1700.7380000,13.9120000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1829,1766.5780000,-1699.9260000,13.9120000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1699.0920000,13.9120000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1703.1640000,14.7920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1829,1766.5780000,-1702.3620000,14.7920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4580000,-1701.5410000,14.7920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1829,1766.5780000,-1700.7380000,14.7920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(2332,1766.4670000,-1699.9260000,14.7920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1829,1766.5970000,-1699.0850000,14.7920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19457,1789.6580000,-1705.2350000,17.6130000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19457,1789.6580000,-1707.1410000,17.6130000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19457,1782.4650000,-1704.2430000,17.6130000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19365,1784.7520000,-1703.7170000,17.6130000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19365,1784.7520000,-1700.5060000,17.6130000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19365,1783.6890000,-1699.8780000,17.6130000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19457,1789.6580000,-1710.2440000,17.6130000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19457,1789.6580000,-1712.4480000,17.6130000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19365,1784.7520000,-1708.6880000,17.6130000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19365,1782.4450000,-1710.6850000,17.6130000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19365,1783.6280000,-1712.1980000,17.6130000,0.0000000,0.0000000,80.0000000); //
	CreateDynamicObject(3280,1783.6420000,-1700.7830000,19.3470000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19377,1785.9470000,-1706.3860000,19.3540000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1789.7010000,-1704.1500000,19.3140000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1789.2490000,-1711.5000000,19.2940000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1778.7600000,-1711.4820000,19.3140000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1777.6230000,-1703.1650000,19.3340000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1767.2400000,-1703.1650000,19.3340000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1768.2800000,-1711.4900000,19.3140000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1766.4130000,-1704.1660000,19.2740000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19377,1766.3970000,-1711.4890000,19.2940000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19362,1762.0950000,-1715.7850000,19.3220000,0.0000000,90.0000000,45.0000000); //
	CreateDynamicObject(19362,1762.5940000,-1698.5670000,19.3220000,0.0000000,90.0000000,45.0000000); //
	CreateDynamicObject(19362,1776.3200000,-1715.4840000,19.3220000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19362,1782.6750000,-1715.5000000,19.3220000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(19362,1794.4990000,-1716.2440000,19.3220000,0.0000000,90.0000000,45.0000000); //
	CreateDynamicObject(19362,1793.2830000,-1700.5930000,19.3220000,0.0000000,90.0000000,45.0000000); //
	CreateDynamicObject(19454,1789.2770000,-1700.1430000,19.2740000,0.0000000,90.0000000,90.0000000); //
	CreateDynamicObject(2921,1793.9140000,-1698.5500000,19.2600000,0.0000000,-18.0000000,-55.0000000); //
	CreateDynamicObject(19435,1783.9880000,-1699.1620000,19.3080000,0.0000000,90.0000000,0.0000000); //
	CreateDynamicObject(934,1788.7050000,-1704.2340000,20.7200000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1420,1779.5940000,-1700.6170000,19.3780000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1420,1778.0690000,-1700.6170000,19.3780000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1420,1776.5010000,-1700.6170000,19.3780000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(943,1785.4440000,-1713.1220000,20.1680000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(929,1769.8380000,-1711.3520000,20.1680000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(943,1770.6930000,-1703.6050000,20.1680000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(929,1806.4130000,-1707.8160000,20.1680000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1420,1806.6330000,-1696.4910000,19.3780000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1420,1806.6330000,-1698.4680000,19.3780000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1420,1806.6330000,-1700.7440000,19.3780000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1687,1764.2720000,-1707.5990000,20.0180000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1687,1792.2280000,-1712.6960000,20.0180000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(1687,1805.1790000,-1714.3110000,19.9580000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1783.6250000,-1699.3330000,19.8920000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1781.5540000,-1701.3640000,19.8920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(970,1785.6850000,-1701.3850000,19.8920000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19458,1766.6930000,-1717.3920000,10.9370000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19366,1773.1100000,-1717.3920000,10.9370000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(19439,1774.6390000,-1716.6750000,10.9310000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(860,1764.8570000,-1716.8000000,12.6180000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(861,1766.6200000,-1716.8810000,12.6430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(860,1768.4810000,-1716.8610000,12.6430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(859,1771.9840000,-1716.7810000,12.6430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(862,1770.3640000,-1716.8410000,12.6240000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(861,1773.6260000,-1716.8130000,12.6430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(859,1785.5000000,-1716.7750000,12.6430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(859,1788.3240000,-1716.7840000,12.6430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(859,1791.4320000,-1716.7270000,12.6430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(861,1789.8650000,-1716.8710000,12.6030000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(862,1786.8540000,-1716.8000000,12.5430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(700,1810.2040000,-1684.1610000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(700,1810.2390000,-1688.3510000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(700,1810.2270000,-1692.9000000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(700,1810.3840000,-1697.6470000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(700,1810.5650000,-1702.3790000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(700,1810.5440000,-1707.8760000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(700,1810.6980000,-1713.7580000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(868,1810.0980000,-1716.9330000,12.6230000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(869,1791.2460000,-1716.0740000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(867,1807.7260000,-1720.5950000,12.5430000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(869,1773.0690000,-1716.0630000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(869,1789.6310000,-1716.1370000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(869,1786.8500000,-1716.1950000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(869,1789.6310000,-1716.1370000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(869,1770.8100000,-1716.1490000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(869,1767.9670000,-1716.1970000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(869,1765.4260000,-1716.2210000,12.6030000,0.0000000,0.0000000,-20.0000000); //
	CreateDynamicObject(647,1809.1590000,-1719.8020000,12.9940000,356.8580000,0.0000000,-0.8720000); //
	CreateDynamicObject(2000,1776.9870000,-1699.1530000,12.5520000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2000,1776.4860000,-1699.1530000,12.5520000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(2000,1775.9950000,-1699.1530000,12.5520000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19457,1794.1970000,-1707.6030000,17.6130000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19459,1754.6410000,-1722.4390000,10.7990000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(19459,1759.3730000,-1727.2010000,10.7960000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(700,1755.3030000,-1726.3920000,12.7290000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1756.7150000,-1727.2170000,13.0230000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1754.6300000,-1725.0960000,13.0230000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(970,1765.1450000,-1727.1520000,13.0230000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1772.9420000,-1727.1520000,13.0230000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1780.1560000,-1727.1520000,13.0230000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1787.5410000,-1727.1520000,13.0230000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1809.6250000,-1722.3720000,13.0230000,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(970,1811.7020000,-1720.2670000,13.0230000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(970,1754.6190000,-1684.7040000,13.0230000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(970,1754.6190000,-1688.8310000,13.0230000,0.0000000,0.0000000,90.0000000); //
	CreateDynamicObject(3934,1799.6120000,-1708.2780000,19.2960000,0.0000000,0.0000000,90.0000000); //

	//San NewsReporter
	CreateDynamicObject(1569, 732.08728, -1350.03113, 12.49790,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1569, 732.07648, -1347.04688, 12.49790,   0.00000, 0.00000, 270.00000);

	CreateDynamicObject(18850, 741.99017, -1372.31665, 13.72956,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8615, 734.46820, -1354.97131, 24.21728,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(11472, 731.83655, -1360.13940, 22.95908,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8615, 735.85132, -1354.96338, 23.22300,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(3763, 656.97498, -1340.86707, 53.89742,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1595, 698.31934, -1373.17908, 32.59095,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1595, 676.57965, -1366.41931, 32.61595,   0.00000, 0.00000, 294.49500);
	CreateDynamicObject(1595, 721.37964, -1342.30176, 32.71595,   0.00000, 0.00000, 164.75232);

	//San NewsReporter Interory

    CreateDynamicObject(2957, 671.43652, -1353.18799, 1692.76819,   0.00000, 0.00000, 90.22101);
    CreateDynamicObject(14594, 692.83105, -1364.94824, 1694.39539,   0.00000, 0.00000, 359.93958);
    CreateDynamicObject(1703, 656.42413, -1348.65076, 1694.40369,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(14393, 662.57971, -1352.45142, 1696.63806,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(14391, 664.29999, -1353.36243, 1695.36487,   0.00000, 0.00000, 0.01199);
    CreateDynamicObject(18070, 716.23547, -1381.02966, 1694.69922,   0.00000, 0.00000, 260.88965);
    CreateDynamicObject(8378, 633.10529, -1357.64087, 1690.76038,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2140, 671.04437, -1354.57544, 1693.88574,   180.06290, 90.00000, 90.00000);
    CreateDynamicObject(14680, 658.65369, -1355.22534, 1696.36694,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2604, 680.28290, -1388.54675, 1694.86414,   0.00000, 0.00000, 269.89490);
    CreateDynamicObject(2604, 687.82153, -1388.56763, 1694.86414,   0.00000, 0.00000, 269.89014);
    CreateDynamicObject(2604, 696.09296, -1388.52881, 1694.86414,   0.00000, 0.00000, 269.89490);
    CreateDynamicObject(2604, 697.15564, -1387.02966, 1694.86414,   0.00000, 0.00000, 89.87012);
    CreateDynamicObject(2604, 688.88507, -1387.07104, 1694.86255,   0.00000, 0.00000, 89.86816);
    CreateDynamicObject(2604, 681.34302, -1387.05212, 1694.86414,   0.00000, 0.00000, 89.86816);
    CreateDynamicObject(1671, 689.84375, -1387.90564, 1694.87122,   0.00000, 0.00000, 249.06799);
    CreateDynamicObject(1671, 686.73865, -1388.12170, 1694.87122,   0.00000, 0.00000, 94.23550);
    CreateDynamicObject(1671, 682.40417, -1387.62231, 1694.87122,   0.00000, 0.00000, 271.88367);
    CreateDynamicObject(1671, 679.30341, -1387.85315, 1694.87122,   0.00000, 0.00000, 77.34869);
    CreateDynamicObject(1671, 694.92896, -1388.13257, 1694.87122,   0.00000, 0.00000, 135.20380);
    CreateDynamicObject(1671, 698.79822, -1387.85254, 1694.87122,   0.00000, 0.00000, 264.22821);
    CreateDynamicObject(14532, 685.16913, -1378.80920, 1695.38586,   0.00000, 0.00000, 179.84351);
    CreateDynamicObject(14813, 704.03357, -1380.56287, 1694.81396,   0.00000, 0.00000, 269.80164);
    CreateDynamicObject(14720, 689.25446, -1356.40454, 1694.38367,   0.00000, 0.00000, 359.92801);
    CreateDynamicObject(2534, 694.64355, -1350.39209, 1694.41101,   0.00000, 0.00000, 269.94568);
    CreateDynamicObject(2534, 694.64117, -1351.38123, 1694.41101,   0.00000, 0.00000, 269.94507);
    CreateDynamicObject(1825, 690.56677, -1350.10889, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2165, 710.49097, -1348.73877, 1694.41101,   0.00000, 0.00000, 179.99463);
    CreateDynamicObject(1998, 710.16699, -1342.71680, 1694.41101,   0.00000, 0.00000, 90.00549);
    CreateDynamicObject(1806, 710.25714, -1341.74780, 1694.41101,   0.00000, 0.00000, 170.70996);
    CreateDynamicObject(1806, 709.86920, -1348.12573, 1694.41101,   0.00000, 0.00000, 178.64557);
    CreateDynamicObject(1811, 710.54272, -1344.14526, 1695.03735,   0.00000, 0.00000, 279.32800);
    CreateDynamicObject(1811, 709.09406, -1344.10657, 1695.03735,   0.00000, 0.00000, 253.52258);
    CreateDynamicObject(2172, 704.10431, -1387.05969, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2172, 702.18604, -1387.05920, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2172, 705.11450, -1386.13660, 1694.41101,   0.00000, 0.00000, 179.99365);
    CreateDynamicObject(2172, 703.19507, -1386.13574, 1694.41101,   0.00000, 0.00000, 179.98901);
    CreateDynamicObject(1806, 704.55994, -1385.44775, 1694.41101,   0.00000, 0.00000, 170.70557);
    CreateDynamicObject(1806, 702.52155, -1385.45911, 1694.41101,   0.00000, 0.00000, 180.63062);
    CreateDynamicObject(1806, 703.01111, -1387.92444, 1694.41101,   0.00000, 0.00000, 29.76617);
    CreateDynamicObject(1806, 704.82507, -1387.77856, 1694.41101,   0.00000, 0.00000, 5.94196);
    CreateDynamicObject(1724, 690.35901, -1360.48438, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1724, 687.65820, -1360.45081, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1723, 667.26044, -1360.44043, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1723, 665.86401, -1363.93250, 1694.41101,   0.00000, 0.00000, 89.96704);
    CreateDynamicObject(1714, 716.65240, -1381.35315, 1694.41101,   0.00000, 0.00000, 242.88495);
    CreateDynamicObject(1708, 707.92761, -1384.16162, 1694.41101,   0.00000, 0.00000, 110.41113);
    CreateDynamicObject(1708, 707.66071, -1381.43115, 1694.41101,   0.00000, 0.00000, 67.48615);
    CreateDynamicObject(1663, 713.18054, -1379.07300, 1694.87122,   0.00000, 0.00000, 73.62500);
    CreateDynamicObject(1663, 712.76569, -1381.46997, 1694.87122,   0.00000, 0.00000, 87.51987);
    CreateDynamicObject(14806, 717.37646, -1372.60132, 1695.49707,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(14527, 716.23224, -1381.12122, 1696.10815,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2836, 716.31311, -1375.82922, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2828, 714.17316, -1383.40125, 1695.20959,   0.00000, 0.00000, 282.71698);
    CreateDynamicObject(2700, 707.08856, -1383.57080, 1697.15308,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2700, 707.08893, -1382.94775, 1697.15308,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2700, 707.09070, -1382.32751, 1697.15308,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2700, 707.08948, -1381.70776, 1697.15308,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2700, 707.08960, -1381.08289, 1697.15308,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2186, 706.69391, -1360.45789, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2186, 708.72260, -1360.46143, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2002, 689.31659, -1352.66052, 1694.41101,   0.00000, 0.00000, 89.80200);
    CreateDynamicObject(1808, 693.79382, -1360.12939, 1694.41101,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(14819, 731.88049, -1347.74231, 13.66522,   0.00000, 0.00000, 90.29782);
    CreateDynamicObject(14819, 732.15869, -1347.73804, 13.66522,   0.00000, 0.00000, 270.46387);
    CreateDynamicObject(14455, 720.52905, -1383.87085, 1696.08276,   0.00000, 0.00000, 89.92023);
    CreateDynamicObject(2610, 707.07135, -1372.21350, 1695.23645,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2610, 707.56744, -1372.21228, 1695.23645,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2610, 686.90680, -1378.80042, 1695.22864,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2610, 687.40179, -1378.80237, 1695.22864,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2610, 687.89612, -1378.80151, 1695.22864,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2610, 688.38824, -1378.79944, 1695.22864,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2610, 688.88208, -1378.79797, 1695.22864,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2610, 689.37622, -1378.79968, 1695.22864,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2608, 681.85779, -1378.66406, 1695.12244,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2199, 673.78552, -1388.73962, 1694.41101,   0.00000, 0.00000, 89.93225);
    CreateDynamicObject(2199, 673.78693, -1387.36633, 1694.41101,   0.00000, 0.00000, 89.92859);
    CreateDynamicObject(2261, 689.49353, -1360.44788, 1696.66882,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2266, 668.30292, -1360.40637, 1696.61572,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2267, 665.38568, -1362.96643, 1697.02637,   0.00000, 0.00000, 89.94189);
    CreateDynamicObject(2265, 710.71497, -1384.90002, 1696.86145,   0.00000, 0.00000, 180.03612);
    CreateDynamicObject(2264, 717.26544, -1384.89331, 1696.81653,   0.00000, 0.00000, 179.99274);
    CreateDynamicObject(2262, 720.24872, -1375.91699, 1696.82678,   0.00000, 0.00000, 269.86606);
    CreateDynamicObject(2263, 711.51233, -1372.35181, 1696.97754,   0.00000, 0.00000, 359.88000);
    CreateDynamicObject(15038, 689.49878, -1360.43787, 1695.02039,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(18014, 677.17871, -1352.87793, 1694.84326,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2011, 691.84174, -1369.27356, 1694.38391,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2011, 666.06866, -1360.71777, 1694.38391,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(644, 672.77588, -1376.93689, 1694.69312,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2140, 670.87878, -1351.73792, 1694.34766,   0.00000, 0.00000, 269.95999);


	new objects;
	printf("%i Gemappte Objecte Geladen",objects);
	return 1;
}
stock RemoveBuildings(playerid)
{
    RemoveBuildingForPlayer(playerid, 1297, 881.2969, -1673.0078, 16.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 869.5469, -1673.0078, 16.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 892.2500, -1673.0078, 16.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 869.0859, -1654.2031, 16.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 891.3594, -1654.2031, 16.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 881.4531, -1654.2031, 16.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 6204, 880.6016, -1653.7656, 14.1797, 0.25);
	return 1;
}

