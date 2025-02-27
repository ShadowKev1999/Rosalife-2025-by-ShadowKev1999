public GeldkofferHolen(playerid)
{
	new string[224], geldbetrag = GetPVarInt(playerid,"PackeGeldkoffer"), ergebnis = GetPVarInt(playerid,"GeldtransporterGeld")-geldbetrag;
	TogglePlayerControllable(playerid, true);
	DeletePVar(playerid,"PackeGeldkoffer");
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0);
    SetPVarInt(playerid,"GeldkofferInHand",1);
    SetPVarInt(playerid,"GeldtransporterGeld",GetPVarInt(playerid,"GeldtransporterGeld")-geldbetrag);
    SetPVarInt(playerid,"GeldkofferWert",geldbetrag);
    SetVehicleParamsCarDoors(GetPVarInt(playerid,"GeldtransporterID"),false,false,false,false);
    SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,1210,6,0.303294, 0.081651, 0.010630, 0.000000, 270.000000, 0.000000);
	if(SpielerInfo[playerid][sJobEXP][10] < 50){format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}\nKapazität{FFFFFF}\n{FE0000}$%d{FFFFFF} / {009300}$10.000", SpielerInfo[playerid][sName],ergebnis);}
 	else format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}\nKapazität{FFFFFF}\n{FE0000}$%d{FFFFFF} / {009300}$15.000", SpielerInfo[playerid][sName],ergebnis);
	UpdateDynamic3DTextLabelText(FahrzeugInfo[GetPVarInt(playerid,"GeldtransporterID")][fLabel], COLOR_WHITE, string);
}

public GeldkofferReinlegen(playerid)
{
    new string[224];
    TogglePlayerControllable(playerid, true);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0);
    SetPVarInt(playerid,"GeldtransporterGeld",GetPVarInt(playerid,"GeldtransporterGeld")+GetPVarInt(playerid,"GeldkofferWert"));
    DeletePVar(playerid,"GeldkofferInHand");
    DeletePVar(playerid,"GeldkofferWert");
    RemovePlayerAttachedObject(playerid, ATTACH_INDEX_JOB);
    SetVehicleParamsCarDoors(GetPVarInt(playerid,"GeldtransporterID"),false,false,false,false);

    if(SpielerInfo[playerid][sJobEXP][10] < 50){format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}\nKapazität{FFFFFF}\n{FE0000}$%d{FFFFFF} / {009300}$10.000", SpielerInfo[playerid][sName],GetPVarInt(playerid,"GeldtransporterGeld"));}
 	else format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}\nKapazität{FFFFFF}\n{FE0000}$%d{FFFFFF} / {009300}$15.000", SpielerInfo[playerid][sName],GetPVarInt(playerid,"GeldtransporterGeld"));
	UpdateDynamic3DTextLabelText(FahrzeugInfo[GetPVarInt(playerid,"GeldtransporterID")][fLabel], COLOR_WHITE, string);
}

public FillATM(playerid)
{
    new atmdialog[364], payday[164], atmid = GetPVarInt(playerid,"ATMID"), wert = GetPVarInt(playerid,"ATMWert");
    new Float:gehalt = wert*0.15, gehaltwert = floatround(gehalt, floatround_ceil);

    TogglePlayerControllable(playerid, true);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0);

    SetPVarInt(playerid,"GeldlieferantGehalt",GetPVarInt(playerid,"GeldlieferantGehalt")+gehaltwert);
	SetPVarInt(playerid,"GeldkofferWert",GetPVarInt(playerid,"GeldkofferWert")-wert);
	ATMInfo[atmid][atmGeld] += wert;
	SaveATMById(atmid);
	if(wert > 999)
	{
	    SpielerInfo[playerid][sJobEXP][10] += 1;
	    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}+1 Geldlieferant Job-EXP");
	}
	format(atmdialog,sizeof(atmdialog),"{FFFFFF}Bankautomat neuer Stand: ${FF0000}%d{FFFFFF}/$10.000\nGeldkoffer neuer Stand: ${FF0000}%d{FFFFFF}/$3.000",ATMInfo[atmid][atmGeld],GetPVarInt(playerid,"GeldkofferWert"));
	ShowPlayerDialog(playerid,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Geldlieferant",atmdialog,"Verstanden","");

	format(payday,sizeof(payday),"[JOB]: Dir werden +${FF0000}%d{9ACD32} am nächsten PayDay ausgezahlt.",gehaltwert,GetPVarInt(playerid,"GeldlieferantGehalt"));
	SendClientMessage(playerid,COLOR_SUPER,payday);

	if(GetPVarInt(playerid,"GeldkofferWert") == 0)
	{
	    if(GetPVarInt(playerid,"GeldtransporterGeld") == 0)
	    {
	        SendClientMessage(playerid,COLOR_SUPER,"Gute Arbeit Sir! Gib dein Geldtransporter nun am roten Marker ab um dein Gehalt am nächsten PayDay zu kriegen.");
	        PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
	        SetPlayerCheckpointEx(playerid,1801.7838,-1707.5288,13.6681,5.0);
	        SetPVarInt(playerid,"GeldlieferantAbgabe",1);
	    }
	    else
	    {
	    	SendClientMessage(playerid,COLOR_INFO,"Hinweis: Dein Geldkoffer ist leer. Benutze /reinlegen um ihn zurück in das Fahrzeug zu legen.");
	    }
	}
	else if(GetPVarInt(playerid,"GeldkofferWert") != 0)
	{
		new kofferstand[128];
	    format(kofferstand,sizeof(kofferstand),"Hinweis: In deinem Geldkoffer befinden sich aktuell noch ${FF0000}%d",GetPVarInt(playerid,"GeldkofferWert"));
	    SendClientMessage(playerid,COLOR_INFO,kofferstand);
	}

 	DeletePVar(playerid,"ATMID");
    DeletePVar(playerid,"ATMWert");
    DeletePVar(playerid,"ATMErgebnis");
    DeletePVar(playerid,"ATMFillVorgang");
}