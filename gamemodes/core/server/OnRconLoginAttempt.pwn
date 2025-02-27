public OnRconLoginAttempt(ip[], password[], success)
{
	new pip[16], string[235];
	foreach(new i : Player)
	{
	    GetPlayerIp(i, pip, sizeof(pip));
     	if(!strcmp(ip, pip, true))
		{
		    if(!success)
			{
				format(string,235,"RCON: %s hat sich versucht mit dem Passwort '%s' einzuloggen. IP-Adresse: %s | GESCHEITERT",SpielerInfo[i][sName],password,ip);
				SendClientMessage(i,COLOR_RED,"[Info]: {FFFFFF}Dein Fehlversuch dich als RCON einzuloggen, wurde an die Administration weitergegeben und samt IP-Adresse gespeichert.");
                SetPVarInt(i, "RCON_TRYS", GetPVarInt(i, "RCON_TRYS") + 1);

                if(GetPVarInt(i, "RCON_TRYS") >= 3) {
                    BanPlayer(i, "SERVER", "RCON LOGIN PASSWORD");
                    return 1;
                }
			}
		    else format(string,235,"RCON: %s hat sich versucht mit dem Passwort '%s' einzuloggen. IP-Adresse: %s | ERFOLGREICH",SpielerInfo[i][sName],password,ip);
			SendLeiterMessage(COLOR_RED,string);
			CreateServerLogEntry("RCON_LOG", string);
			break;
		}
	}
	return 0;
}