forward OnPasswordChecked(playerid, bool:success);
public OnPasswordChecked(playerid, bool:success)
{
	if(success)
	{
		SetPVarInt(playerid,"LoggedIn",1);
		KillTimer(CamFahrten[playerid]);
		LoadAccount(playerid);
	}
	else
	{
		new logingstring[340];
		format(logingstring,sizeof(logingstring),"{FFFFFF}Willkommen zurück auf "SERV_NAME" {007DFF}%s{FFFFFF}.\nIn unserer Datenbank wurde dein Account gefunden. Bitte logge dich ein indem du das Passwort\neingibst was du bei deiner Registration gewählt hattest. Bei Fragen wende dich an unser Team.\n\n{FE0000}Passwort und Accountname stimmen nicht überein.",SpielerInfo[playerid][sName]);
		ShowPlayerDialog(playerid,DIALOG_LOGIN,DIALOG_STYLE_PASSWORD,"{007DFF}"SERV_NAME"{FFFFFF} - Einloggen",logingstring,"Weiter","");
	}
	return 1;	
}