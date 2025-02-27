stock InitBots() {

    ConnectNPC("Zivi_Winkler","Ziviwinkler");

	ConnectNPC("TrainDriverLV","train_lv");
	ConnectNPC("TrainDriverLS","train_ls");
	ConnectNPC("TrainDriverSF","train_sf");

	TrainLasVenturas = AddStaticVehicleEx(538,1462.0745,2630.8787,10.8203,200.0,-1,-1,(30*60));// LV passenger
	TrainSanFierro = AddStaticVehicleEx(538,-1942.7950,168.4164,27.0006,200.0,-1,-1,(30*60));// SF passenger
	TrainLosSantos = AddStaticVehicleEx(538,1700.7551,-1953.6531,14.8756,200.0,-1,-1,(30*60));// LS passenger

	BotMichelle = CreateDynamicActor(11, 918.6790,-1461.6885,2754.3459,178.6952, .worldid = -1, .interiorid = 0);
	SetPVarInt(BotMichelle,"NPCNichtAusraubBar",1);

	BotEmilio = CreateDynamicActor(28, -1632.1375,-2241.5371,31.4766, 90.5599, .worldid = -1, .interiorid = 0);
	SetPVarInt(BotEmilio,"NPCNichtAusraubBar",1);

	BotTracy = CreateDynamicActor(12, 204.8534,-8.0864,1001.2109, 267.9277, .worldid = -1, .interiorid = 5);
	SetPVarInt(BotTracy,"NPCNichtAusraubBar",1);

	BotBank[0] = CreateDynamicActor(11, 1779.8584,-1701.7178,13.5509, 183.0852, .worldid = -1, .interiorid = 0);
	SetPVarInt(BotBank[0],"NPCNichtAusraubBar",1);

	BotBank[1] = CreateDynamicActor(11, 1778.4592,-1701.9597,13.5509, 177.6540, .worldid = -1, .interiorid = 0);
	SetPVarInt(BotBank[1],"NPCNichtAusraubBar",1);

	BotMaut[0] = CreateDynamicActor(280, 56.9194,-1531.1129,5.3723, 347.5203, .worldid = -1, .interiorid = 0);//LS-SF
	SetPVarInt(BotMaut[0],"NPCNichtAusraubBar",1);

	BotMaut[1] = CreateDynamicActor(281, 50.0334,-1532.1726,5.3723, 170.8220, .worldid = -1, .interiorid = 0);//SF-LS
	SetPVarInt(BotMaut[1],"NPCNichtAusraubBar",1);

	BotMaut[2] = CreateDynamicActor(282, 1726.6248,522.5086,28.5074, 251.3999, .worldid = -1, .interiorid = 0);//LV-LS
	SetPVarInt(BotMaut[2],"NPCNichtAusraubBar",1);

	BotMaut[3] = CreateDynamicActor(280, 1747.9623,514.1594,28.5074, 68.7482, .worldid = -1, .interiorid = 0);//LS-LV
	SetPVarInt(BotMaut[3],"NPCNichtAusraubBar",1);

	BotMaut[4] = CreateDynamicActor(281, 28.7410,-1342.2162,10.5739, 38.4527, .worldid = -1, .interiorid = 0);//SFTunnel - LSTunnel
	SetPVarInt(BotMaut[4],"NPCNichtAusraubBar",1);

	BotMaut[5] = CreateDynamicActor(280, -4.7365,-1319.9880,11.4619, 218.9344, .worldid = -1, .interiorid = 0);//LSTunnel - SFTunnel
	SetPVarInt(BotMaut[5],"NPCNichtAusraubBar",1);

	BotMaut[6] = CreateDynamicActor(280, 519.7160,467.2825,19.2211, 307.9220, .worldid = -1, .interiorid = 0);//LS - LV
	SetPVarInt(BotMaut[6],"NPCNichtAusraubBar",1);

	BotMaut[7] = CreateDynamicActor(282, 516.1275,472.4210,19.2211, 303.2220, .worldid = -1, .interiorid = 0);//LV - LS
	SetPVarInt(BotMaut[7],"NPCNichtAusraubBar",1);
    return 1;
}