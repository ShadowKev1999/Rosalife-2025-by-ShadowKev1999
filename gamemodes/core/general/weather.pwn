public Wetter()
{
	SendICPMsg("Das News Studio informiert, dass eine Wetteränderung in ganz San Andreas vorliegt.");
	new randwetter = random(8);
	switch(randwetter)
	{
	    case 0:{Weather[0] = 7; Weather[1] = 8; Weather[2] = 4;}
	    case 1:{Weather[0] = 7; Weather[1] = 4; Weather[2] = 8;}
	    case 2:{Weather[0] = 7; Weather[1] = 2; Weather[2] = 7;}
	    case 3:{Weather[0] = 7; Weather[1] = 7; Weather[2] = 2;}
	    case 4:{Weather[0] = 7; Weather[1] = 16; Weather[2] = 21;}
	    case 5:{Weather[0] = 7; Weather[1] = 10; Weather[2] = 16;}
	    case 6:{Weather[0] = 7; Weather[1] = 21; Weather[2] = 10;}
	    case 8:{Weather[0] = 7; Weather[1] = 7; Weather[2] = 7;}
	    case 9:{Weather[0] = 7; Weather[1] = 8; Weather[2] = 4;}
	    case 10:{Weather[0] = 7; Weather[1] = 10; Weather[2] = 21;}
	    case 11:{Weather[0] = 7; Weather[1] = 8; Weather[2] = 8;}
	    case 12:{Weather[0] = 7; Weather[1] = 16; Weather[2] = 4;}
	    case 13:{Weather[0] = 7; Weather[1] = 21; Weather[2] = 10;}
	    case 14:{Weather[0] = 7; Weather[1] = 4; Weather[2] = 8;}
	}
}

public SetPlayerWetter(playerid)
{
    if(GetPVarInt(playerid,"InGarage") == 0 && GetPVarInt(playerid,"InHaus") == 0 && GetPVarInt(playerid,"Paintball") == 0)
    {
	    new Float:xx, Float:yy, Float:zz;
		GetPlayerPos(playerid, xx, yy, zz);
		if((xx > -992.5172 && xx < 4000.0000) && (yy < 528.0000 && yy > -4000.0000)) //Los Santos
		{
			SetPlayerWeather(playerid, Weather[0]);
		}
		if((xx > -4000.0000 && xx< -992.5172) && (yy < 4000.0000 && yy > -4000.0000)) //San Fierro
		{
			SetPlayerWeather(playerid, Weather[1]);
		}
		if((xx > -992.5172 && xx< 4000.0000) && (yy < 4000.0000 && yy > 528.0000)) //Las Venturas
		{
			SetPlayerWeather(playerid, Weather[2]);
		}
	}
	return 1;
}