stock DeleteSupTicket(playerid)
{
    mysql_Delete("suptickets", "Name", SpielerInfo[playerid][sName]);
    return 1;
}

stock CreateSupTicket(playerid, const message[])
{
	new string[128];
	format(string,sizeof(string),"%s hat ein Support-Ticket geschrieben!",SpielerInfo[playerid][sName]);
	SetPVarInt(playerid,"SupTicket",1);
	SetPVarInt(playerid,"SupTicketOpen",0);
	SendAdminMessage(COLOR_INFO,string);

    new Uhrzeit[16], Datum[16],  query[265];
	gettime(Hour, Minute, Second);
	getdate(Year, Month, Day);
	format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
	format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);
	mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `oldtickets` (`Name`, `Text`, `Uhrzeit`, `Datum`) VALUES ('%s', '%s', '%s', '%s')", SpielerInfo[playerid][sName], message, Uhrzeit, Datum);
    mysql_tquery(sqlHandle, query);

	mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `suptickets` (`Name`, `Text`) VALUES ('%s', '%s')", SpielerInfo[playerid][sName], message);
    mysql_tquery(sqlHandle, query);
	return 1;
}