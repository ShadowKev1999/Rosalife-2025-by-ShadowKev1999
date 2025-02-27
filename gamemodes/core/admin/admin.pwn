stock WarnPlayer(playerid,const admin[],const Reason[])
{
    SpielerInfo[playerid][sWarns] += 1;
	new query[664], Uhrzeit[16], Datum[16];
	gettime(Hour, Minute, Second);
	getdate(Year, Month, Day);
	format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
	format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);
	mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `accwarns` (`Name`, `Teammitglied`, `Warngrund`, `Uhrzeit`, `Datum`) VALUES ('%s', '%s', '%s', '%s', '%s')", SpielerInfo[playerid][sName], admin , Reason, Uhrzeit, Datum);
    mysql_tquery(sqlHandle, query);
    return 1;
}

stock MutePlayer(playerid,zeit)
{
	SpielerInfo[playerid][sMuted] = zeit;
	KillTimer(MutePlayerTimer[playerid]);
	MutePlayerTimer[playerid] = SetTimerEx("PlayerMuted",100*10*60,true,"i",playerid);
	return 1;
}

stock PrisonPlayer(playerid,zeit)
{
	SpielerInfo[playerid][sPrison] = zeit;
	KillTimer(PrisonPlayerTimer[playerid]);
	PrisonPlayerTimer[playerid] = SetTimerEx("PlayerPrison",100*10*60,true,"i",playerid);
	return 1;
}

stock WerbungSperre(playerid,zeit)
{
	SpielerInfo[playerid][sADSperre] = zeit;
	KillTimer(WerbungSperrePlayerTimer[playerid]);
	WerbungSperrePlayerTimer[playerid] = SetTimerEx("PlayerWerbungSperre",100*10*60,true,"i",playerid);
	return 1;
}

stock BanPlayer(playerid, const admin[], const Reason[])
{
	new query[200], Uhrzeit[16], Datum[16];
	gettime(Hour, Minute, Second);
	getdate(Year, Month, Day);
	format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
	format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);
	mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `accbans` (`Name`, `Teammitglied`, `Bangrund`, `Uhrzeit`, `Datum`) VALUES ('%s', '%s', '%s', '%s', '%s')", SpielerInfo[playerid][sName], admin , Reason, Uhrzeit, Datum);
    mysql_tquery(sqlHandle, query);
	SetTimerEx("EndIPBan",100,false,"i",playerid);
	return 1;
}

stock TBanPlayer(playerid,dauer,admin[],grund[])
{
    new timestamp, query[250], Uhrzeit[16], Datum[16];
	timestamp = gettime();
	timestamp += dauer * 60;
	gettime(Hour, Minute, Second);
	getdate(Year, Month, Day);
	format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
	format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);
	mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `timebans` (`Name`, `Teammitglied`, `Bangrund`, `Uhrzeit`, `Datum`, `serv_Data`) VALUES ('%s', '%s', '%s', '%s', '%s', '%i')", SpielerInfo[playerid][sName], admin , grund , Uhrzeit, Datum, timestamp);
    mysql_tquery(sqlHandle, query);
	KickPlayer(playerid,"");
	return 1;
}

stock GiveVIP(const name[], dauer, const admin[])
{
    new timestamp, query[250], Uhrzeit[16], Datum[16];
	timestamp = gettime();
	timestamp += dauer * 86400;
	gettime(Hour, Minute, Second);
	getdate(Year, Month, Day);
	format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
	format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);
	mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `vip` (`Name`, `Teammitglied`, `Uhrzeit`, `Datum`, `serv_Data`) VALUES ('%s', '%s', '%s', '%s', '%i')", name, admin, Uhrzeit, Datum, timestamp);
    mysql_tquery(sqlHandle, query);
   	mysql_format(sqlHandle, query,sizeof(query),"UPDATE `accounts` SET `VIP`='1' WHERE `Name`='%s'", name);
	mysql_tquery(sqlHandle, query);
	return 1;
}

stock CreateServerLogEntry(const logfile[], const event[])
{
	new prepare[256], time[6];
    gettime(time[0], time[1], time[2]); getdate(time[3], time[4], time[5]);
    format(prepare,sizeof(prepare),"Serverlogs/%s.log",logfile);
	new File:log = fopen(prepare, io_append);
	format(prepare,sizeof(prepare),"[%02d/%02d/%02d | %02d:%02d:%02d] %s\r\n",time[5],time[4],time[3],time[0],time[1],time[2],event);
 	fwrite(log, prepare);
  	fclose(log);
  	return true;
}

stock ClearChat(playerid,Zeilen)
{
    for(new i = 0; i < Zeilen; i++)
	{
		SendClientMessage(playerid,0xFFFFFFFF," ");
	}
	return 1;
}

stock AdminName(playerid)
{
	new admname[22];
	switch(SpielerInfo[playerid][sAdmin])
	{
		case 0:{admname="Spieler";}
		case 1:{admname="Supporter";}
		case 2:{admname="Moderator";}
		case 3:{admname="Administrator";}
		case 4:{admname="Server Management";}
		case 5:{admname="Projektleitung";}
	}
	return admname;
}

stock AdminNameList(playerid)
{
	new admname[22];
	switch(SpielerInfo[playerid][sAdmin])
	{
		case 0:{admname="Spieler";}
		case 1:{admname="{00EC15}Supporter";}
		case 2:{admname="{00C9FF}Moderator";}
		case 3:{admname="{0400FF}Administrator";}
		case 4:{admname="Server Management";}
		case 5:{admname="Projektleitung";}
	}
	return admname;
}

stock AdmDuty(playerid)
{
	new admdutys[60];
	switch(GetPVarInt(playerid,"AdminDuty"))
	{
	    case 0:{admdutys="{C8C8C8}Außer Dienst{FFFFFF}";}
		case 1:{admdutys="{00FE00}Im Admin-Dienst{FFFFFF}";}
	}
	return admdutys;
}

stock SendLeiterMessage(color,const message[])
{
	foreach(new i : Player)
	{
		if(IsPlayerConnectedEx(i) && SpielerInfo[i][sAdmin] == 4)
		{
			SendClientMessage(i,color,message);
		}
	}
	return 1;
}

stock FreezePlayer(playerid, boolean)
{
	if(boolean == 1)
	{
		PlayerTextDrawShow(playerid,Freeze[playerid]);
		SelectTextDraw(playerid, 0x00000000);
		SetPVarInt(playerid,"Freezed",1);
	}
	else
	{
		CancelSelectTextDraw(playerid);
		PlayerTextDrawHide(playerid,Freeze[playerid]);
		SetPVarInt(playerid,"Freezed",0);
	}
	return 1;
}

stock AdminColor(playerid)
{
	new admcolor[22];
	switch(SpielerInfo[playerid][sAdmin])
	{
		case 0:{admcolor="FFFFFF";}//Spieler (Kein Admin)
		case 1:{admcolor="2E8B57";}//Supporter
		case 2:{admcolor="104E8B";}//Administrator
		case 3:{admcolor="4A708B";}//Head-Administrator
		case 4:{admcolor="CD2626";}//Projektleitung
		case 5:{admcolor="CD2626";}//Projektleitung
	}
	return admcolor;
}

stock ShowAdminBefehle(playerid)
{
    SendClientMessage(playerid,COLOR_RED,"=============================== | "SERV_NAME" - Admin Befehle | ===============================");
    if(SpielerInfo[playerid][sAdmin] >= 1)//Supporter
    {
        SendClientMessage(playerid,COLOR_WHITE,"{2E8B57}Supporter:");
        SendClientMessage(playerid,COLOR_WHITE,"/acheck, /apn, /spawn, /slap, /setskin, /a, /goto, /gethere, /setint, /setvw, /sethp, /setarmour");
        SendClientMessage(playerid,COLOR_WHITE,"/kick, /tickets, /createsup, /taketicket, /giveticket, /closeticket, /adsperre, /adentsperre, /hidetd");
        SendClientMessage(playerid,COLOR_WHITE,"/mute, /unmute, /freeze, /spec, /clearchat, /fixveh, /delad, /marker, /tog, /gotomark, /unmask, /supmobil");
	}
    if(SpielerInfo[playerid][sAdmin] >= 2)//Moderator
    {
        SendClientMessage(playerid,COLOR_WHITE,"{104E8B}Moderator:");
        SendClientMessage(playerid,COLOR_WHITE,"/prisoncp, /prison, /respawncar, /veh, /gotopos, /ban, /unban, /timeban, /givemoney");
        SendClientMessage(playerid,COLOR_WHITE,"/givegun, /warn, /lic, /carrespawn, /refill, /giveexp, /giveall, /givepayday");
        SendClientMessage(playerid,COLOR_WHITE,"/getcar, /gotocar, /giveganfight, /wetter, /adminachiv, /fraksperre, /lottogewinn");
    }
    if(SpielerInfo[playerid][sAdmin] >= 3)//Administrator
    {
        SendClientMessage(playerid,COLOR_WHITE,"{4A708B}Administrator:");
        SendClientMessage(playerid,COLOR_WHITE,"/givemats, /makeleader, /ainvite, /auninvite, /carcontrol, /oban, /otimeban, /untimeban, /deletecar, /createcar");
        SendClientMessage(playerid,COLOR_WHITE,"/editcar, /parkcar, /createhaus, /edithaus, /delhaus, /creategarage, /creategarageout, /editgarage");
        SendClientMessage(playerid,COLOR_WHITE,"/delgarage, /getcarinfo, /gupgrade, /ahlock, /givefmoney, /givebank, /anticheat, /astaatskasse, /givegangpunkte");
        SendClientMessage(playerid,COLOR_WHITE,"/dbsave, /dbload, /gotocar, ");
    }
 	if(SpielerInfo[playerid][sAdmin] >= 4)//Management
    {
        SendClientMessage(playerid,COLOR_WHITE,"{CD2626}Server Management:");
		SendClientMessage(playerid,COLOR_WHITE,"/givevip, /takevip, /ogivevip, /otakevip, /makeadmin, /createtstelle, /edittstelle, /deltstelle");
		SendClientMessage(playerid,COLOR_WHITE,"/createammu, /delammu, /createstore, /editstore, /delstore, /saveall, /acc_lock, /gangzoneeditor");
		SendClientMessage(playerid,COLOR_WHITE,"/downtime [Vorsicht: Befehl nur im Notfall verwenden!]");
	}
    if(SpielerInfo[playerid][sAdmin] >= 5)//Projektleitung
    {
        SendClientMessage(playerid,COLOR_WHITE,"{CD2626}Projektleitung:");
		SendClientMessage(playerid,COLOR_WHITE,"/givevip, /takevip, /ogivevip, /otakevip, /makeadmin, /createtstelle, /edittstelle, /deltstelle");
		SendClientMessage(playerid,COLOR_WHITE,"/createammu, /delammu, /createstore, /editstore, /delstore, /saveall /acc_lock, /gangzoneeditor");
		SendClientMessage(playerid,COLOR_WHITE,"/downtime [Vorsicht: Befehl nur im Notfall verwenden!]");
	}
	return 1;
}

stock UpdateSpectateStatus(playerid, spectatorid)
{
	if(SpielerInfo[spectatorid][sSpectate] != playerid)return 1;
    if(GetPlayerState(playerid) == PLAYER_STATE_WASTED) return GameTextForPlayer(spectatorid, "~r~Spieler ist gestorben.", 5000, 3);
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) return GameTextForPlayer(spectatorid, "~r~Spieler schaut jemand anderem zu.", 5000, 3);
	if(!IsPlayerConnected(playerid)) return GameTextForPlayer(spectatorid, "~r~Spieler hat den Server verlassen.", 5000, 3);
	TogglePlayerSpectating(spectatorid, true);
    if(IsPlayerInAnyVehicle(playerid)){PlayerSpectateVehicle(spectatorid, GetPlayerVehicleID(playerid));}
	else PlayerSpectatePlayer(spectatorid, playerid);
	SetPlayerInterior(spectatorid, GetPlayerInterior(playerid));
	SetPlayerVirtualWorld(spectatorid, GetPlayerVirtualWorld(playerid));
	return 1;
}