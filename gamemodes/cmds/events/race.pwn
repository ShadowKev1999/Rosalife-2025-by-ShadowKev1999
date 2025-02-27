COMMAND:races(playerid,params[]) {
	new string[512],cpcount = 0, racecount = 0;
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

    for(new r=0;r<MAX_RACES;r++) {
        
        if(!RaceCreated[r]) continue;
        
        for(new rcp=0;rcp<MAX_RACECPS;rcp++)
        {   
            if(RaceInfoUsed[r][rcp] == 1) cpcount++;
        }
        format(string,sizeof(string),"%i. %s | %i Checkpoints\n%s",r,RaceName[r],cpcount,string);
        racecount ++;
        cpcount = 0;
    }
    if(racecount == 0)return SendClientMessage(playerid, COLOR_GREY, "Es wurden keine Rennen erstellt.");
    return ShowPlayerDialog(playerid, DIALOG_NULL, DIALOG_STYLE_MSGBOX, "Rennen", string, "Verlassen","");
}

COMMAND:rinvite(playerid,params[]) {
	new pID,string[128];
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

    if(RaceStarted == -1)return SendClientMessage(playerid,COLOR_GREY,"Es wurde kein Rennen ausgewählt.");
    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /rinvite [playerid/Name]");
    if(!IsPlayerConnected(pID))return SendClientMessage(playerid,COLOR_GREY,"Der angegebene Spieler ist nicht eingeloggt!");
    if(IsPlayerNPC(pID))return SendClientMessage(playerid,COLOR_GREY,"Das kannst du nicht!");
    if(GetDistanceBetweenPlayersEx(playerid,pID) > 5.0)return SendClientMessage(playerid,COLOR_GREY,"Der angegebene Spieler ist nicht in deiner Nähe!");
    format(string,sizeof(string),"Du wurdest von %s in ein Rennen eingeladen.(/accept race)",GetName(playerid));
    SendClientMessage(pID, COLOR_YELLOW,string);
    format(string,sizeof(string),"[RACE-INFO]: Du hast %s in ein Rennen '%s' eingeladen.",GetName(pID),RaceName[RaceStarted]);
    SendClientMessage(playerid, COLOR_YELLOW, string);

    SetPVarInt(pID, "RaceOffer", 1);
    SetPVarInt(pID, "RacePlayer", playerid);
    return 1;
}

COMMAND:runinvite(playerid,params[]) {
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID,stringuninv[128];

    
    if(RaceStarted == -1)return SendClientMessage(playerid,COLOR_GREY,"Es wurde kein Rennen ausgewählt.");
    if(sscanf(params,"u",pID)) return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /runinvite [playerid/Name]");
    if(!IsPlayerConnected(pID))return SendClientMessage(playerid,COLOR_GREY,"Der angegebene Spieler ist nicht eingeloggt!");
    if(IsPlayerNPC(pID))return SendClientMessage(playerid,COLOR_GREY,"Das kannst du nicht!");
    if(InviteInRace[pID] == 0)return SendClientMessage(playerid,COLOR_GREY,"Spieler ist in keinem Rennen Aktiv.");
    format(stringuninv,sizeof(stringuninv),"[RACE-INFO]: Du hast %s aus dem Rennen gehauen.",GetName(pID));
    SendClientMessage(playerid,COLOR_YELLOW,stringuninv);
    format(stringuninv,sizeof(stringuninv),"[RACE-INFO]: %s hat dich aus dem Rennen gehauen.",GetName(playerid));
    SendClientMessage(pID,COLOR_YELLOW,stringuninv);
    DisablePlayerRaceCheckpoint(pID);
    InviteInRace[pID] = 0;
    RaceCps[pID] = 0;
    return 1;
}

COMMAND:selectrace(playerid,params[]) {
	new string[128],r;
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

    if(sscanf(params,"i",r))return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /selectrace [RennID]");
    if(RaceCreated[r] == 0)return SendClientMessage(playerid,COLOR_GREY,"Das Rennen existiert nicht.");
    if(MakeRace[playerid] != -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan ein Rennen.");
    if(RaceStarted != -1)return SendClientMessage(playerid,COLOR_GREY,"Es findet bereits ein Rennen statt.");
    RaceStarted = r;
    InviteInRace[playerid] = 1;
    for(new rcp=0;rcp<MAX_RACECPS;rcp++)
    {
        if(RaceInfoUsed[r][rcp] == 1) RaceMaxCps++;
    }
    format(string,sizeof(string),"[RACE-INFO]: %s hat das Rennen '%s' mit %i Checkpoints ausgewählt.",GetName(playerid),RaceName[r],RaceMaxCps);
    SendAdminMessage(COLOR_YELLOW, string);
    SendClientMessage(playerid, COLOR_WHITE, "Renneinladung: /rinvite,Rennausladung: /runinvite,Rennen starten: /startrace,Rennen beenden: /stoprace");
    return 1;
}

COMMAND:startrace(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new r = RaceStarted,string[128];
    
    if(MakeRace[playerid] != -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan ein Rennen.");
    if(RaceStarted == -1)return SendClientMessage(playerid,COLOR_GREY,"Es wurde kein Rennen ausgewählt.");
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i) && !IsPlayerNPC(i))
        {
            if(InviteInRace[i] == 1)
            {
                format(string,sizeof(string),"[RACE-INFO]: %s hat den Countdown für das Rennen '%s' gestartet.",GetName(playerid),RaceName[r]);
                SendClientMessage(i,COLOR_YELLOW,string);
                GameTextForPlayer(i,"~g~5",1000,3);
                PlayerPlaySound(i,1056,0.0,0.0,0.0);
                TogglePlayerControllable(i,false);
            }
        }
    }
    RCountdownSec = 5;
    RCountDownTimer = SetTimerEx("CountDown", 1000, true, "i", 1);
    return 1;
}

COMMAND:stoprace(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

	new string1[500],string2[64];
    
    if(MakeRace[playerid] != -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan ein Rennen.");
    if(RaceStarted == -1)return SendClientMessage(playerid,COLOR_GREY,"Es findet momentan kein Rennen statt.");
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i) && !IsPlayerNPC(i))
        {
            if(InviteInRace[i] == 1)
            {
                format(string2,sizeof(string2),"[RACE-INFO]: %s hat das Rennen '%s' beendet.",GetName(playerid),RaceName[RaceStarted]);
                SendClientMessage(i,COLOR_YELLOW,string2);
                DisablePlayerRaceCheckpoint(i);
                InviteInRace[i] = 0;
                RaceCps[i] = 0;
                for(new t=0;t<6;t++){ PlayerTextDrawHide(i,RACEdraw[i][t]); }
                format(string1,sizeof(string1),"%s | %i.%02d Minuten\n%s",GetName(i),RaceZeitAfterRace[i]/60,RaceZeitAfterRace[i]%60,string1);
                ShowPlayerDialog(i, DIALOG_NULL, DIALOG_STYLE_MSGBOX, RaceName[RaceStarted], string1, "Verlassen","");
                RaceZeitAfterRace[i] = 0;
            }
        }
    }
    format(string2,sizeof(string2),"[RACE-INFO]: Du hast das Rennen '%s' beendet.",RaceName[RaceStarted]);
    SendClientMessage(playerid, COLOR_YELLOW, string2);
    RaceWinner = -1;
    RaceStarted = -1;
    RaceMaxCps = 0;
    return 1;
}

COMMAND:searchracecp(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new rcp,r = MakeRace[playerid],string[64];

    
    if(MakeRace[playerid] == -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan kein Rennen.");
    if(sscanf(params,"i",rcp))return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /searchracecp [CheckpointID]");
    if(RaceInfoUsed[r][rcp] == 0)return SendClientMessage(playerid,COLOR_GREY,"Der Renncheckpoint existiert nicht.");
    format(string,sizeof(string),"[RACE-INFO]: Der Checkpoint Nummer %i wurde auf deiner Karte markiert.",rcp);
    SendClientMessage(playerid, COLOR_WHITE, string);
    SetPlayerCheckpointEx(playerid,RaceInfo[r][rcp][0],RaceInfo[r][rcp][1],RaceInfo[r][rcp][2],3.0);
    return 1;
}

COMMAND:searchrace(playerid,params[]) {
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

	new r,rcpcount = 0,cmd[15],string[128];

    
    if(sscanf(params,"is[15]",r,cmd))return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /searchrace [RennID][Startpunkt/Finishpunkt]");
    if(RaceCreated[r] == 0)return SendClientMessage(playerid,COLOR_GREY,"Das Rennen existiert nicht.");
    if(strcmp(cmd,"Startpunkt",true) == 0)
    {
        if(RaceInfoUsed[r][0] == 0)return SendClientMessage(playerid,COLOR_GREY,"Das Rennen besitzt keinen Start/Ziel.");
        format(string,sizeof(string),"[RACE-INFO]: Der Startpunkt des Rennens '%s' wurde auf deiner Karte markiert.",RaceName[r]);
        SendClientMessage(playerid,COLOR_WHITE,string);
        SetPlayerCheckpointEx(playerid,RaceInfo[r][0][0],RaceInfo[r][0][1],RaceInfo[r][0][2],3.0);
        return 1;
    }
    if(strcmp(cmd,"Finishpunkt",true) == 0)
    {
        if(RaceInfoUsed[r][0] == 0)return SendClientMessage(playerid,COLOR_GREY,"Das Rennen besitzt keinen Start/Ziel.");
        for(new rcp=0;rcp<MAX_RACECPS;rcp++)
        {
            if(RaceInfoUsed[r][rcp] == 1) rcpcount++;
        }
        format(string,sizeof(string),"[RACE-INFO]: Das Ziel des Rennens '%s' wurde auf deiner Karte markiert.",RaceName[r]);
        SendClientMessage(playerid,COLOR_WHITE,string);
        SetPlayerCheckpointEx(playerid,RaceInfo[r][rcpcount-1][0],RaceInfo[r][rcpcount-1][1],RaceInfo[r][rcpcount-1][2],3.0);
        return 1;
    }
    return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /searchrace [RennID][Startpunkt/Finishpunkt]");
}

COMMAND:crace(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

	new nameofrace[31],string[128],query[128];
    
    if(MakeRace[playerid] != -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan ein Rennen.");
    if(sscanf(params,"s[31]",nameofrace))return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /crace [Rennname]");
    if(strlen(nameofrace) > 30)return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /crace [Rennname darf maximal 30 Zeichen beinhalten]");
    for(new r=0;r<MAX_RACES;r++)
    {
        if(RaceCreated[r] == 0)
        {
            RaceCreated[r] = 1;
            MakeRace[playerid] = r;
            format(RaceName[r],32,"%s",nameofrace);
            format(string,sizeof(string),"[RACE-INFO]: %s hat das Rennen '%s' erstellt.",GetName(playerid),RaceName[r]);
            SendAdminMessage(COLOR_YELLOW, string);
            for(new rcp=0;rcp<MAX_RACECPS;rcp++)
            {
                RaceInfoUsed[r][rcp] = 0;
                RaceInfo[r][rcp][0] = 0;
                RaceInfo[r][rcp][1] = 0;
                RaceInfo[r][rcp][2] = 0;
            }
            mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO races (`race`) VALUES ('%s')",nameofrace);
		    mysql_tquery(sqlHandle, query);
            return 1;
        }
    }
    return SendClientMessage(playerid,COLOR_GREY,"Es wurde bereits die maximale Anzahl an Rennen erstellt.");
}

COMMAND:drace(playerid,params[]) {
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

	new r,query[128],string[64];
    
    if(MakeRace[playerid] != -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan ein Rennen.");
    if(sscanf(params,"i",r))return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /drace [RennID]");
    if(RaceCreated[r] == 0)return SendClientMessage(playerid,COLOR_GREY,"Rennen existiert nicht.");
    MakeRace[playerid] = -1;
    format(string,sizeof(string),"[RACE-INFO]: %s hat das Rennen '%s' gelöscht.",GetName(playerid),RaceName[r]);
    SendAdminMessage(COLOR_YELLOW, string);
    RaceCreated[r] = 0;
    for(new rcp=0;rcp<MAX_RACECPS;rcp++) {
        RaceInfoUsed[r][rcp] = 0;
        RaceInfo[r][rcp][0] = 0;
        RaceInfo[r][rcp][1] = 0;
        RaceInfo[r][rcp][2] = 0;
    }
    mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM races WHERE race = '%s'", RaceName[r]);
    mysql_tquery(sqlHandle, query);
    return 1;
}

COMMAND:cracecp(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

	new string[128],rennid = MakeRace[playerid];
    
    if(MakeRace[playerid] == -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan kein Rennen.");
    if(RaceCreated[rennid] == 1)
    {
        for(new rcp=0;rcp<MAX_RACECPS;rcp++)
        {
            if(RaceInfoUsed[rennid][rcp] == 0)
            {
                RaceInfoUsed[rennid][rcp] = 1;
                GetPlayerPos(playerid,RaceInfo[rennid][rcp][0],RaceInfo[rennid][rcp][1],RaceInfo[rennid][rcp][2]);
                format(string,sizeof(string),"[RACE-INFO]: Du hast den Checkpoint Nummer '%i' für das Rennen '%s' erstellt.",rcp+1,RaceName[rennid]);
                SendClientMessage(playerid,COLOR_YELLOW,string);
                return 1;
            }
        }
    }
    return SendClientMessage(playerid,COLOR_GREY,"Es wurde bereits die maximale Anzahl an RennCheckpoints erstellt.");
}

COMMAND:dracecp(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

	new rennid = MakeRace[playerid], rcp, string[128];
    if(MakeRace[playerid] == -1)return SendClientMessage(playerid,COLOR_GREY,"Du erstellt momentan kein Rennen.");
    if(sscanf(params,"i",rcp))return SendClientMessage(playerid,COLOR_GREY,"BENUTZE: /dracecp [RennCheckpointID]");
    if(RaceCreated[rennid] == 1) {
        if(RaceInfoUsed[rennid][rcp] == 1) {
            RaceInfoUsed[rennid][rcp] = 0;
            RaceInfo[rennid][rcp][0] = 0;
            RaceInfo[rennid][rcp][1] = 0;
            RaceInfo[rennid][rcp][2] = 0;
            format(string,sizeof(string),"[RACE-INFO]: Du hast den Checkpoint Nummer '%i' für das Rennen '%s' entfernt.",rcp+1,RaceName[rennid]);
            SendClientMessage(playerid, COLOR_YELLOW, string);
            return 1;
        }
    }
    return SendClientMessage(playerid, COLOR_GREY,"RennCheckpoint existiert nicht.");
}

COMMAND:finishrace(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt

	new string[128];
    if(MakeRace[playerid] == -1)return SendClientMessage(playerid, COLOR_GREY, "Du erstellt momentan kein Rennen.");
    format(string,sizeof(string),"[RACE-INFO]: %s hat das Rennen '%s' fertiggestellt.", GetName(playerid), RaceName[MakeRace[playerid]]);
    SendAdminMessage(COLOR_YELLOW, string);
    MakeRace[playerid] = -1;

    SaveRaces();
    return 1;
}