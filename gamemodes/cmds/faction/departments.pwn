
CMD:megaphone(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 0 && SpielerInfo[playerid][sFraktion] < 9)
	{
		new string[144], Text[128];
 		if(SpielerInfo[playerid][sMuted] > 0)
	    {
	        format(string,sizeof(string),"Du bist noch für %d Minute(n) gemutet.",SpielerInfo[playerid][sMuted]);
	        SendClientMessage(playerid,COLOR_RED,string);
	        return 1;
	    }
		if(sscanf(params,"s[128]",Text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/m(egaphone) [Text]");
		format(string,sizeof(string),"[[ %s %s ]] %s",FrakKurzel(SpielerInfo[playerid][sFraktion]),SpielerInfo[playerid][sName],Text);
		ProxDetector(65, playerid, string,0xF5FF00FF,0xF5FF00FF,0xF5FF00FF,0xF5FF00FF,0xF5FF00FF);
		return 1;
	}
	return NichtBerechtigt
}
alias:megaphone("m")

CMD:department(playerid,params[])
{
    if(SpielerInfo[playerid][sMuted] > 0)
    {
        new mutedstring[128];
        format(mutedstring,128,"Du bist noch für %d Minute(n) gemutet.",SpielerInfo[playerid][sMuted]);
        SendClientMessage(playerid,COLOR_RED,mutedstring);
        return 1;
    }
	if(SpielerInfo[playerid][sFraktion] != 0 && SpielerInfo[playerid][sFraktion] < 9)
	{
	    if(SpielerInfo[playerid][sFraktion] == 2 && GetPVarInt(playerid,"CopDuty") < 1 || SpielerInfo[playerid][sFraktion] == 6 && GetPVarInt(playerid,"FBIDuty") < 1 || SpielerInfo[playerid][sFraktion] == 7 && GetPVarInt(playerid,"OAmtDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du führst kein Funkgerät mit dir.");
		new string[144], Text[128];
 		if(SpielerInfo[playerid][sMuted] > 0)
	    {
	        format(string,sizeof(string),"Du bist noch für %d Minute(n) gemutet.",SpielerInfo[playerid][sMuted]);
	        SendClientMessage(playerid,COLOR_RED,string);
	        return 1;
	    }
		if(sscanf(params,"s[128]",Text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /d(epartment) [Nachricht]");
		foreach(new i : Player)
		{
		    if(SpielerInfo[i][sFraktion] != 0 && SpielerInfo[i][sFraktion] < 9)
		    {
		        if(SpielerInfo[playerid][sFraktion] == 2 && GetPVarInt(playerid,"CopDuty") < 1 || SpielerInfo[playerid][sFraktion] == 6 && GetPVarInt(playerid,"FBIDuty") < 1 || SpielerInfo[playerid][sFraktion] == 7 && GetPVarInt(playerid,"OAmtDuty") < 1)continue;
			    format(string,sizeof(string),"%s %s: %s",FrakKurzel(SpielerInfo[playerid][sFraktion]),SpielerInfo[playerid][sName],Text);
			    SendClientMessage(i,0xFF3E3FFF,string);
			}
		}
		if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"* Unbekannter spricht in sein Funkgerät.");}
		else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(string,sizeof(string),"* Unbekannter spricht in sein Funkgerät.");}
		else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(string,sizeof(string),"* Unbekannter spricht in sein Funkgerät.");}
		format(string,sizeof(string),"* %s %s spricht in sein Funkgerät.",RangName(playerid),SpielerInfo[playerid][sName]);
		ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}
alias:department("d")



CMD:ticket(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
			new pID, Betrag, Grund[64], string2[144];
		    if(sscanf(params,"uis[64]",pID,Betrag,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/ticket [SpielerID] [Betrag] [Grund]");
			if(Betrag < 1 || Betrag > 10000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Betrag darf nicht niedriger als 1$ oder höher als 2000$ sein.");
			if(!IsPlayerConnectedEx(pID))return NichtOnline
			if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dir selber kein Ticket ausstellen.");
			if(GetDistanceBetweenPlayersEx(playerid, pID) >= 12)return NichtNahe
			SetPVarInt(pID,"Officer",playerid);
			SetPVarInt(pID,"TicketAngebot",1);
			SetPVarInt(pID,"TicketPreis",Betrag);
			format(string2,sizeof(string2),"{FF0000}%s %s{00CDFF} hat dir ein Ticket in höhe von {FF0000}%d${00CDFF} ausgestellt. Grund: {FF0000}%s",RangName(playerid),SpielerInfo[playerid][sName],Betrag,Grund);
			SendClientMessage(pID,COLOR_INFO,string2);
			SendClientMessage(pID,COLOR_INFO,"Benutze {FF0000}'/accept ticket'{00CDFF} um das Ticket zu bezahlen.");
			format(string2,sizeof(string2),"Du hast dem Spieler {FF0000}%s{00CDFF} ein Ticket in höhe von {FF0000}%d${00CDFF} ausgestellt. Grund: {FF0000}%s",SpielerInfo[pID][sName],Betrag,Grund);
			SendClientMessage(playerid,COLOR_INFO,string2);
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
 	}
 	else NichtBerechtigt
 	return 1;
}


CMD:funk(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 5 || SpielerInfo[playerid][sFraktion] == 8 || SpielerInfo[playerid][sFraktion] == 7)
	{
	    new text[254], string[254];
	   	if(SpielerInfo[playerid][sMuted] > 0)
	    {
	        format(string,sizeof(string),"Du bist noch für %d Minute(n) gemutet.",SpielerInfo[playerid][sMuted]);
	        SendClientMessage(playerid,COLOR_RED,string);
	        return 1;
	    }
	    if(sscanf(params,"s[254]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/funk [Text]");
	    format(string,sizeof(string),"* Funkchat %s %s: %s",RangName(playerid),SpielerInfo[playerid][sName],text);
		for(new ss = 0; ss < MAX_PLAYERS; ss++)
	    {
	        if(SpielerInfo[playerid][sFraktion] == 2 && SpielerInfo[ss][sFraktion] == 2)
	        {
	            if(GetPVarInt(playerid,"CopDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du führst kein Funkgerät mit dir.");
	            if(GetPVarInt(ss,"CopDuty") < 1)continue;
	            //SCM(ss,COLOR_BLUE,string);
	            SendSplitMessage(ss,COLOR_BLUE,string);
	        }
	        else if(SpielerInfo[playerid][sFraktion] == 5 && SpielerInfo[ss][sFraktion] == 5)
	        {
	            //SCM(ss,COLOR_BLUE,string);
	            SendSplitMessage(ss,COLOR_BLUE,string);
	        }
	        else if(SpielerInfo[playerid][sFraktion] == 6 && SpielerInfo[ss][sFraktion] == 6)
	        {
	            if(GetPVarInt(playerid,"FBIDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du führst kein Funkgerät mit dir.");
	            if(GetPVarInt(ss,"FBIDuty") < 1)continue;
	            //SCM(ss,COLOR_BLUE,string);
	            SendSplitMessage(ss,COLOR_BLUE,string);
	        }
	        else if(SpielerInfo[playerid][sFraktion] == 7 && SpielerInfo[ss][sFraktion] == 7)
	        {
	            if(GetPVarInt(playerid,"OAmtDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du führst kein Funkgerät mit dir.");
	            if(GetPVarInt(ss,"OAmtDuty") < 1)continue;
	            //SCM(ss,COLOR_BLUE,string);
	            SendSplitMessage(ss,COLOR_BLUE,string);
	        }
	        else if(SpielerInfo[playerid][sFraktion] == 8 && SpielerInfo[ss][sFraktion] == 8)
	        {
	            //SCM(ss,COLOR_BLUE,string);
	            SendSplitMessage(ss,COLOR_BLUE,string);
	        }
	    }
	    if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"* Unbekannter spricht in sein Funkgerät.");}
		else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(string,sizeof(string),"* Unbekannter spricht in sein Funkgerät.");}
		else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(string,sizeof(string),"* Unbekannter spricht in sein Funkgerät.");}
		format(string,sizeof(string),"* %s %s spricht in sein Funkgerät.",RangName(playerid),SpielerInfo[playerid][sName]);
		ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	    return 1;
	}
	else NichtBerechtigt
	return 1;
}
alias:funk("r")

CMD:government(playerid,params[])
{
    new text[128], string[144];
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 5 || SpielerInfo[playerid][sFraktion] == 1)
	{
		if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	    if(sscanf(params,"s[128]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gov(ernment) [Nachricht]");
	    format(string,sizeof(string),"* %s %s berichtet: %s",RangName(playerid),SpielerInfo[playerid][sName],text);
		SendClientMessageToAll(COLOR_BLUE,string);
		return 1;
	}
	else NichtBerechtigt
    return 1;
}
alias:government("gov")


CMD:notrufliste(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 5 || SpielerInfo[playerid][sFraktion] == 6)
    {
        if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FeuerwehrDuty") == 1 || GetPVarInt(playerid,"MedicDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1  || GetPVarInt(playerid,"OAmtDuty") == 1)
        {
            new string[128], merker = true;
    		if(SpielerInfo[playerid][sFraktion] == 2)
	        {
			    SendClientMessage(playerid,COLOR_WHITE,">>>>> {FF0000}Notrufe{FFFFFF} <<<<<");
			    foreach(new i : Player)
				{
					if(GetPVarInt(i,"NotrufID") == 1)
					{
					    format(string,sizeof(string),"Anrufer: %s | ID: %d | Streifenwagen",SpielerInfo[i][sName],i);
					    SendClientMessage(playerid,COLOR_YELLOW,string);
					    merker = false;
					}
				}
				if(merker)
				{
				    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es sind derzeit keine Notrufe eingegangen.");
				    return 1;
				}
			    return 1;
			}
 			else if(SpielerInfo[playerid][sFraktion] == 6)
	        {
			    SendClientMessage(playerid,COLOR_WHITE,">>>>> {FF0000}Notrufe{FFFFFF} <<<<<");
			    foreach(new i : Player)
				{
					if(GetPVarInt(i,"NotrufID") == 2)
					{
					    format(string,sizeof(string),"Anrufer: %s | ID: %d",SpielerInfo[i][sName],i);
					    SendClientMessage(playerid,COLOR_YELLOW,string);
					    merker = false;
					}
				}
				if(merker)
				{
				    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es sind derzeit keine Notrufe eingegangen.");
				    return 1;
				}
			    return 1;
			}
			else if(SpielerInfo[playerid][sFraktion] == 5)
			{
			    SendClientMessage(playerid,COLOR_WHITE,">>>>> {FF0000}Notrufe{FFFFFF} <<<<<");
			    foreach(new i : Player)
				{
					if(GetPVarInt(i,"NotrufID") == 4)
					{
					    format(string,sizeof(string),"Anrufer: %s | ID: %d",SpielerInfo[i][sName],i);
					    SendClientMessage(playerid,COLOR_YELLOW,string);
					    merker = false;
					}
				}
				if(merker)
				{
				    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es sind derzeit keine Notrufe eingegangen.");
				    return 1;
				}
			    return 1;
			}
 		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:notruf(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 5 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
    {
        if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"FeuerwehrDuty") == 1 || GetPVarInt(playerid,"MedicDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
        {
			new pID, Float:x, Float:y, Float:z, string[144];
		   	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/notruf [SpielerID/Name]");
		   	if(!IsPlayerConnectedEx(pID))return NichtOnline
   			if(SpielerInfo[playerid][sFraktion] == 2)
	        {
	            if(GetPVarInt(pID,"NotrufID") != 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler benötigt keinen Streifenwagen.");
	            GetPlayerPos(pID,x,y,z);
	            DeletePVar(pID,"NotrufID");
  				NotrufSperre[playerid][0] = 0;
				KillTimer(NotrufTimer[playerid][0]);
	            format(string,sizeof(string),"[Notruf]: {FFFFFF}%s %s hat deinen Anruf entgegengenommen. Bitte warte an deiner aktuellen Position.",RangName(playerid),SpielerInfo[playerid][sName]);
	            SendClientMessage(pID,COLOR_SUPER,string);
	            format(string,sizeof(string),"Du hast den Notruf von %s entgegengenommen. Er befindet sich am roten Marker.",SpielerInfo[pID][sName]);
	            SendClientMessage(playerid,COLOR_SUPER,string);
	            SetPlayerCheckpointEx(playerid,x,y,z,3.0);
	            return 1;
	        }
 			else if(SpielerInfo[playerid][sFraktion] == 6)
	        {
	            if(GetPVarInt(pID,"NotrufID") != 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler benötigt nicht das FBI.");
	            GetPlayerPos(pID,x,y,z);
	            DeletePVar(pID,"NotrufID");
  				NotrufSperre[playerid][1] = 0;
				KillTimer(NotrufTimer[playerid][1]);
	            format(string,sizeof(string),"%s %s hat deinen Anruf entgegengenommen. Bitte warte an deiner aktuellen Position.",RangName(playerid),SpielerInfo[playerid][sName]);
	            SendClientMessage(pID,COLOR_SUPER,string);
	            format(string,sizeof(string),"Du hast den Notruf von %s entgegengenommen. Er befindet sich am roten Marker.",SpielerInfo[pID][sName]);
	            SendClientMessage(playerid,COLOR_SUPER,string);
	            SetPlayerCheckpointEx(playerid,x,y,z,3.0);
	            return 1;
	        }
	        else if(SpielerInfo[playerid][sFraktion] == 5)
	        {
	            if(GetPVarInt(pID,"NotrufID") != 4)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler benötigt keinen Sanitäter.");
	            GetPlayerPos(pID,x,y,z);
	            DeletePVar(pID,"NotrufID");
				NotrufSperre[playerid][3] = 0;
				KillTimer(NotrufTimer[playerid][3]);
	            format(string,sizeof(string),"%s %s hat deinen Anruf entgegengenommen. Bitte warte an deiner aktuellen Position.",RangName(playerid),SpielerInfo[playerid][sName]);
	            SendClientMessage(pID,COLOR_SUPER,string);
	            format(string,sizeof(string),"Du hast den Notruf von %s entgegengenommen. Er befindet sich am roten Marker.",SpielerInfo[pID][sName]);
	            SendClientMessage(playerid,COLOR_SUPER,string);
	            SetPlayerCheckpointEx(playerid,x,y,z,3.0);
	            return 1;
	        }
	        else if(SpielerInfo[playerid][sFraktion] == 7)
	        {
	            if(GetPVarInt(pID,"NotrufID") != 5)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler benötigt das Ordnungsamt nicht.");
	            GetPlayerPos(pID,x,y,z);
	            DeletePVar(pID,"NotrufID");
				NotrufSperre[playerid][4] = 0;
				KillTimer(NotrufTimer[playerid][4]);
	            format(string,sizeof(string),"%s %s hat deinen Anruf entgegengenommen. Bitte warte an deiner aktuellen Position.",RangName(playerid),SpielerInfo[playerid][sName]);
	            SendClientMessage(pID,COLOR_SUPER,string);
	            format(string,sizeof(string),"Du hast den Service-Ruf von %s entgegengenommen. Er befindet sich am roten Marker.",SpielerInfo[pID][sName]);
	            SendClientMessage(playerid,COLOR_SUPER,string);
	            SetPlayerCheckpointEx(playerid,x,y,z,3.0);
	            return 1;
	        }
		    return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}