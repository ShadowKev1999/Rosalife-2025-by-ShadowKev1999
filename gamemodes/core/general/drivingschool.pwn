
public TheoriAufgaben(playerid)
{
	ClearChat(playerid,10);
	if(GetPVarInt(playerid,"TheoriTest") == 1)
	{
	    SetPVarInt(playerid,"TheoriTest",2);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 1/4 ~_____________________|");
	  	SendClientMessage(playerid, COLOR_WHITE, "Auf welcher Fahrspur darfst du andere Fahrzeuge überholen?");
	  	SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
	 	SendClientMessage(playerid, COLOR_WHITE, "A: Links");//Richtig
	   	SendClientMessage(playerid, COLOR_WHITE, "B: Rechts");
	   	SendClientMessage(playerid, COLOR_WHITE, "C: Beide");
   	}
	else if(GetPVarInt(playerid,"TheoriTest") == 2)
	{
	    SetPVarInt(playerid,"TheoriTest",3);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 2/4 ~_____________________|");
		SendClientMessage(playerid, COLOR_WHITE, "Wie lautet die Richtgeschwindigkeit in der Stadt?");
		SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
		SendClientMessage(playerid, COLOR_WHITE, "A: Es gibt keine maximalen Geschwindigkeiten, es wird sich angepasst");
		SendClientMessage(playerid, COLOR_WHITE, "B: Bis zu 90 KM/H auf Landstraßen und in der Stadt");
		SendClientMessage(playerid, COLOR_WHITE, "C: Maximal 90 KM/H in der Stadt, ländlich empfohlen max. 160 KM/H");//Richtig
	}
	else if(GetPVarInt(playerid,"TheoriTest") == 3)
	{
        SetPVarInt(playerid,"TheoriTest",4);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 3/4 ~_____________________|");
		SendClientMessage(playerid, COLOR_WHITE, "Was ist deine Aufgabe wenn dir ein Einsatzfahrzeug begegnet?");
		SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
		SendClientMessage(playerid, COLOR_WHITE, "A: Hupen und andere Autofahrer warnen");
		SendClientMessage(playerid, COLOR_WHITE, "B: Die Polizei verständigen und um Hilfe beten");
		SendClientMessage(playerid, COLOR_WHITE, "C: Rechts ran fahren und Platz machen");//Richtig
	}
	else if(GetPVarInt(playerid,"TheoriTest") == 4)
	{
        SetPVarInt(playerid,"TheoriTest",5);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 4/4 ~_____________________|");
		SendClientMessage(playerid, COLOR_WHITE, "Wie lange darfst du dein Fahrzeug maximal am Straßenrand parken?");
		SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
		SendClientMessage(playerid, COLOR_WHITE, "A: Da es dafür keine Regelung gibt, ist das mir überlassen");
		SendClientMessage(playerid, COLOR_WHITE, "B: Maximal 3 Minuten, es sei den es hat eine Panne");//Richtig
		SendClientMessage(playerid, COLOR_WHITE, "C: Nur 5 Minuten, länger wenn ich neben einem Parkplatz parke");
	}
	else if(GetPVarInt(playerid,"TheoriTest") == 5)
	{
        SetPVarInt(playerid,"TheoriTest",6);
	}
}

public TheoriFlugAufgaben(playerid)
{
	ClearChat(playerid,10);
	if(GetPVarInt(playerid,"TheoriTest") == 1)
	{
	    SetPVarInt(playerid,"TheoriTest",2);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 1/4 ~_____________________|");
	  	SendClientMessage(playerid, COLOR_WHITE, "Welches der folgenden Regeln gibt es?");
	  	SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
	 	SendClientMessage(playerid, COLOR_WHITE, "A: Tiefflugverbot");//Richtig
	   	SendClientMessage(playerid, COLOR_WHITE, "B: Tiefflugerlaubnis");
	   	SendClientMessage(playerid, COLOR_WHITE, "C: Beim Fliegen gibt es keine Regeln");
   	}
	else if(GetPVarInt(playerid,"TheoriTest") == 2)
	{
	    SetPVarInt(playerid,"TheoriTest",3);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 2/4 ~_____________________|");
		SendClientMessage(playerid, COLOR_WHITE, "Wo ist das Landen erlaubt?");
		SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
		SendClientMessage(playerid, COLOR_WHITE, "A: Man darf überall landen");
		SendClientMessage(playerid, COLOR_WHITE, "B: Nur am Flughafen und im Gelände");
		SendClientMessage(playerid, COLOR_WHITE, "C: Nur an Flughäfen und gekennzeichneten Hubschrauber-Landeplätzen");//Richtig
	}
	else if(GetPVarInt(playerid,"TheoriTest") == 3)
	{
        SetPVarInt(playerid,"TheoriTest",4);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 3/4 ~_____________________|");
		SendClientMessage(playerid, COLOR_WHITE, "Darfst du in der Nacht fliegen?");
		SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
		SendClientMessage(playerid, COLOR_WHITE, "A: Nein. Es herrscht ein Nachtflugverbot");
		SendClientMessage(playerid, COLOR_WHITE, "B: Ja, aber nur wenn ich eine Nachtfluglizenz besitze");
		SendClientMessage(playerid, COLOR_WHITE, "C: Ja darf man. Es zählt nur erhöhte Vorsicht");//Richtig
	}
	else if(GetPVarInt(playerid,"TheoriTest") == 4)
	{
        SetPVarInt(playerid,"TheoriTest",5);
		SendClientMessage(playerid, COLOR_RED, "|_____________________~ Frage 4/4 ~_____________________|");
		SendClientMessage(playerid, COLOR_WHITE, "Gibt es eine Flugverbotszone? Wenn ja, was ist das?");
		SendClientMessage(playerid, COLOR_RED, "_________________________________________________________");
		SendClientMessage(playerid, COLOR_WHITE, "A: Nein, gibt es nicht");
		SendClientMessage(playerid, COLOR_WHITE, "B: Ja gibt es. Das sind Staatsgebäude wie Polizei,- & Regierungseinrichtungen");//Richtig
		SendClientMessage(playerid, COLOR_WHITE, "C: Ja gibt es. Darf ich aber ohne weiters überfliegen");
	}
	else if(GetPVarInt(playerid,"TheoriTest") == 5)
	{
        SetPVarInt(playerid,"TheoriTest",6);
	}
}

public Praxis(playerid)
{
    SetPVarInt(playerid,"FahrschulStunde",1);
    TogglePlayerControllable(playerid,true);
}