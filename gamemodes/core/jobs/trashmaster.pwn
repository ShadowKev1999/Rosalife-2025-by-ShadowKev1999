forward MuellEntleeren(playerid);
public MuellEntleeren(playerid)
{
	new string[128], tmpcar = GetPVarInt(playerid,"M�llAuto");
	UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, "M�llmann:\n{FE0000}Niemand{FFFFFF}\nM�ll: {FF0000}0{FFFFFF} Liter");
	SetVehicleToRespawn(tmpcar);
	FahrzeugInfo[tmpcar][fJobFahrer] = 0;
	DeletePVar(playerid,"M�llBeutel");
	DeletePVar(playerid,"M�llBeutelHand");
	DeletePVar(playerid,"M�llmannArbeitet");
	MuellHausPos[playerid][0] = 0;
	MuellHausPos[playerid][1] = 0;
	MuellHausPos[playerid][2] = 0;
	MuellAutoPos[playerid][0] = 0;
	MuellAutoPos[playerid][1] = 0;
	MuellAutoPos[playerid][2] = 0;
	format(string,sizeof(string),"Dein Gehalt in H�he von %d$ wird dir am Payday �berwiesen. Benutze /payday um deinen Check einzusehen.",JobInfo[6][jiGehalt]);
	SendClientMessage(playerid,COLOR_INFO,string);
	SpielerInfo[playerid][sPayDayGeld] += JobInfo[6][jiGehalt];
	TogglePlayerControllable(playerid, true);
	return 1;
}