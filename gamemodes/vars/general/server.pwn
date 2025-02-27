enum AnticheatDaten {
	bool:sSetMoney,
	bool:sLooseMoney,
	bool:sSetHealth,
	bool:sSetArmour,
	sBargeld,
	Float:sHealth,
	Float:sArmour,
	sStopAC[2]
}
new AnticheatInfo[MAX_PLAYERS][AnticheatDaten];


enum GlobaleVariablen {
	crespawn,
	Rekord,
	AktuellClients,
	WerbungAktiv,
	OOC,
	Werbung,
	Geldlieferant,
	bool:DoubleEXP,
	bool:EasterEvent,
	bool:HalloweenEvent,
	WinterMode,
}
new GlobalVars[GlobaleVariablen];