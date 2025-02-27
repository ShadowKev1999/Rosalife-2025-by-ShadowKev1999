forward MuellEntleeren(playerid);
public MuellEntleeren(playerid)
{
	new string[128], tmpcar = GetPVarInt(playerid,"MüllAuto");
	UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, "Müllmann:\n{FE0000}Niemand{FFFFFF}\nMüll: {FF0000}0{FFFFFF} Liter");
	SetVehicleToRespawn(tmpcar);
	FahrzeugInfo[tmpcar][fJobFahrer] = 0;
	DeletePVar(playerid,"MüllBeutel");
	DeletePVar(playerid,"MüllBeutelHand");
	DeletePVar(playerid,"MüllmannArbeitet");
	MuellHausPos[playerid][0] = 0;
	MuellHausPos[playerid][1] = 0;
	MuellHausPos[playerid][2] = 0;
	MuellAutoPos[playerid][0] = 0;
	MuellAutoPos[playerid][1] = 0;
	MuellAutoPos[playerid][2] = 0;
	format(string,sizeof(string),"Dein Gehalt in Höhe von %d$ wird dir am Payday überwiesen. Benutze /payday um deinen Check einzusehen.",JobInfo[6][jiGehalt]);
	SendClientMessage(playerid,COLOR_INFO,string);
	SpielerInfo[playerid][sPayDayGeld] += JobInfo[6][jiGehalt];
	TogglePlayerControllable(playerid, true);
	return 1;
}