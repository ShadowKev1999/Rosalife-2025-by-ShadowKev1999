CMD:achiv(playerid, params[])
{
	new achivstring[1024];
 	format(achivstring,sizeof(achivstring),"Achivment\tBelohnung\tErreicht\n\
	Werde Leader einer Fraktion\t300 EXP\t%s\n\
	Besitze 1 Mio. in BAR\t100 EXP\t%s\n\
	Kaufe dein erstes Auto\t50 EXP\t%s\n\
	Erreiche ein Nebenjob-Gehalt von 10.000$\t150 EXP\t%s\n\
	Mache deinen Flugschein\t100 EXP\t%s\n\
	Verkaufe Pfandflaschen\t50 EXP\t%s\n\
	Werde VIP Mitglied auf "SERV_NAME"\t2.250 EXP\t%s\n\
	Erreiche einen Killing-Spree in der Paintball-Arena\t500 EXP\t%s\n\
	Besorge dir deinen Personalausweiﬂ\t50 EXP\t%s",
	JaNein(SpielerInfo[playerid][sAchivLeader]),JaNein(SpielerInfo[playerid][sAchivMillion]),JaNein(SpielerInfo[playerid][sAchivAuto]),JaNein(SpielerInfo[playerid][sAchivJobGehalt]),JaNein(SpielerInfo[playerid][sAchivFlugLic]),JaNein(SpielerInfo[playerid][sAchivPfand]),JaNein(SpielerInfo[playerid][sAchivVIP]),
	JaNein(SpielerInfo[playerid][sAchivPB]),JaNein(SpielerInfo[playerid][sAchivPerso]));

	ShowPlayerDialog(playerid,9992,DIALOG_STYLE_TABLIST_HEADERS,"{007DFF}"SERV_NAME"{FFFFFF} - Achivments",achivstring,"OK","");
	return 1;
}