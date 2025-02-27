CMD:makeadm(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] == 5 || IsPlayerAdmin(playerid))
	{
		new pID, Rang, string[128];
		if(sscanf(params,"ui",pID,Rang))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /makeadmin [SpielerID] [Rang]");
	    if(Rang > 5 || Rang < 0)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /makeadmin [SpielerID] [Rang(1-5)]");
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    SpielerInfo[pID][sAdmin] = Rang;
	    if(Rang != 0)
	    {
		    format(string,128,"%s %s hat %s zu einem '%s' ernannt. Willkommen im Team!",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],AdminName(pID));
			SendAdminMessage(COLOR_INFO,string);

			givePlayerTitle(pID, TITLE_TEAMMEMBER);
		}
		else if(Rang == 0)
		{
		    if(GetPVarInt(pID,"AdminDuty") > 0)
			{
			    SetPlayerHealth(pID,100);
	  			if(GetPVarInt(pID,"Supmobil") != 0)
		    	{
					DeleteVehicle(GetPVarInt(pID,"Supmobil"));
					DeletePVar(pID,"Supmobil");
					SendClientMessage(pID,COLOR_RED,"Supmobil wurde gelöscht.");
				}
	   			format(string,sizeof(string),"%s",SpielerInfo[pID][sName]);
			    SetPlayerName(pID, string);
				DeletePVar(pID,"AdminDuty");
				DestroyDynamic3DTextLabel(AdmDutyLabel[playerid]);
			}

		    format(string,128,"%s %s hat %s zu einem '%s' ernannt. Er ist nun kein Teammitglied mehr.",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],AdminName(pID));
			SendAdminMessage(COLOR_INFO,string);
			format(string,128,"%s %s hat dich zu einem '%s' ernannt. Du bist nun kein Teammitglied mehr.",AdminName(playerid),SpielerInfo[playerid][sName],AdminName(pID));
			SendClientMessage(pID,COLOR_INFO,string);
		}
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/makeadmin' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}