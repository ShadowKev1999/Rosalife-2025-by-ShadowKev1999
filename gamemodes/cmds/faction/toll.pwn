CMD:maut(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid,3.5,1730.1222,520.3935,28.2204))//LV-LS
 	{
  		if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
    	{
     		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
       		{
				PlayerPlaySound(playerid, 1139, 1724.22595, 518.73871, 28.09300);
				MoveDynamicObject(MautSchranke[5], 1724.22595, 518.73871, 28.09300+0.01,4.0,0.00000, 0.00000, -22.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",1);
				return 1;
			}
			else
			{
				if(MautStatus[5] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   				if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
       			SetPVarInt(playerid,"NoPAYBACK",1);
				GivePlayerMoneyEx(playerid,-150);
				PlayerPlaySound(playerid, 1139, 1724.22595, 518.73871, 28.09300);
				MoveDynamicObject(MautSchranke[5], 1724.22595, 518.73871, 28.09300+0.01,4.0,0.00000, 0.00000, -22.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",1);
				if(GetPlayerWantedLevelEx(playerid) > 0)
				{
    				new stringmaut[128];
				    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LV-LS{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
				    foreach(new i : Player)
				    {
        				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
				        {
            				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
				            SendClientMessage(i,COLOR_INFO,stringmaut);
				        }
				    }
				}
				return 1;
			}
		}
		else
		{
			if(MautStatus[5] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
			if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
   			SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-150);
			PlayerPlaySound(playerid, 1139, 1724.22595, 518.73871, 28.09300);
			MoveDynamicObject(MautSchranke[5], 1724.22595, 518.73871, 28.09300+0.01,4.0,0.00000, 0.00000, -22.00000);
			SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
			SetPVarInt(playerid,"MautStation",1);
			if(GetPlayerWantedLevelEx(playerid) > 0)
			{
   				new stringmaut[128];
			    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LV-LS{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
			    foreach(new i : Player)
			    {
       				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
			        {
           				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
			            SendClientMessage(i,COLOR_INFO,stringmaut);
			        }
			    }
			}
			return 1;
		}
  	}
   	else if(IsPlayerInRangeOfPoint(playerid,3.5,1743.9443,515.8735,28.2149))//LS-LV
    {
		if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
  		{
    		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
      		{
				PlayerPlaySound(playerid, 1139, 1749.94031, 517.41351, 27.70300);
				MoveDynamicObject(MautSchranke[6], 1749.94031, 517.41351, 27.70300+0.01,4.0,0.00000, 0.00000, -22.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",2);
				return 1;
			}
			else
			{
				if(MautStatus[6] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   				if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
       			SetPVarInt(playerid,"NoPAYBACK",1);
				GivePlayerMoneyEx(playerid,-150);
				PlayerPlaySound(playerid, 1139, 1749.94031, 517.41351, 27.70300);
				MoveDynamicObject(MautSchranke[6], 1749.94031, 517.41351, 27.70300+0.01,4.0,0.00000, 0.00000, -22.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",2);
				if(GetPlayerWantedLevelEx(playerid) > 0)
				{
    				new stringmaut[128];
				    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LS-LV{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
				    foreach(new i : Player)
				    {
        				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
				        {
            				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
				            SendClientMessage(i,COLOR_INFO,stringmaut);
				        }
				    }
				}
				return 1;
			}
		}
		else
		{
			if(MautStatus[6] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   			if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
      		SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-150);
			PlayerPlaySound(playerid, 1139, 1749.94031, 517.41351, 27.70300);
			MoveDynamicObject(MautSchranke[6], 1749.94031, 517.41351, 27.70300+0.01,4.0,0.00000, 0.00000, -22.00000);
			SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
			SetPVarInt(playerid,"MautStation",2);
			if(GetPlayerWantedLevelEx(playerid) > 0)
			{
   				new stringmaut[128];
			    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LS-LV{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
			    foreach(new i : Player)
			    {
       				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
			        {
           				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
			            SendClientMessage(i,COLOR_INFO,stringmaut);
			        }
			    }
			}
			return 1;
		}
  	}
   	else if(IsPlayerInRangeOfPoint(playerid,3.5,56.1354,-1525.3245,4.9989))//LS-SF
    {
		if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
  		{
    		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
      		{
				PlayerPlaySound(playerid, 1139, 50.20850, -1528.00586, 4.59290);
				MoveDynamicObject(MautSchranke[0], 50.20850, -1528.00586, 4.59290+0.01,4.0,0.00000, 0.00000, 84.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",3);
				return 1;
			}
			else
			{
				if(MautStatus[0] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   				if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
       			SetPVarInt(playerid,"NoPAYBACK",1);
				GivePlayerMoneyEx(playerid,-150);
				PlayerPlaySound(playerid, 1139, 50.20850, -1528.00586, 4.59290);
				MoveDynamicObject(MautSchranke[0], 50.20850, -1528.00586, 4.59290+0.01,4.0,0.00000, 0.00000, 84.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",3);
				if(GetPlayerWantedLevelEx(playerid) > 0)
				{
    				new stringmaut[128];
				    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LS-SF{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
				    foreach(new i : Player)
				    {
        				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
				        {
            				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
				            SendClientMessage(i,COLOR_INFO,stringmaut);
				        }
				    }
				}
				return 1;
			}
		}
		else
		{
			if(MautStatus[0] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   			if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
      		SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-150);
			PlayerPlaySound(playerid, 1139, 50.20850, -1528.00586, 4.59290);
			MoveDynamicObject(MautSchranke[0], 50.20850, -1528.00586, 4.59290+0.01,4.0,0.00000, 0.00000, 84.00000);
			SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
			SetPVarInt(playerid,"MautStation",3);
			if(GetPlayerWantedLevelEx(playerid) > 0)
			{
   				new stringmaut[128];
			    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LS-SF{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
			    foreach(new i : Player)
			    {
       				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
			        {
           				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
			            SendClientMessage(i,COLOR_INFO,stringmaut);
			        }
			    }
			}
			return 1;
		}
  	}
   	else if(IsPlayerInRangeOfPoint(playerid,3.5,49.5451,-1538.1730,5.1519))//SF-LS
    {
		if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
  		{
    		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
      		{
				PlayerPlaySound(playerid, 1139, 55.64380, -1535.61462, 4.65890);
				MoveDynamicObject(MautSchranke[1], 55.64380, -1535.61462, 4.65890+0.01,4.0,0.00000, 0.00000, 80.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",4);
				return 1;
			}
			else
			{
				if(MautStatus[1] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   				if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
       			SetPVarInt(playerid,"NoPAYBACK",1);
				GivePlayerMoneyEx(playerid,-150);
				PlayerPlaySound(playerid, 1139, 55.64380, -1535.61462, 4.65890);
				MoveDynamicObject(MautSchranke[1], 55.64380, -1535.61462, 4.65890+0.01,4.0,0.00000, 0.00000, 80.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",4);
				if(GetPlayerWantedLevelEx(playerid) > 0)
				{
    				new stringmaut[128];
				    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}SF-LS{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
				    foreach(new i : Player)
				    {
        				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
				        {
            				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
				            SendClientMessage(i,COLOR_INFO,stringmaut);
				        }
				    }
				}
				return 1;
			}
		}
 		else
   		{
     		if(MautStatus[1] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
       		if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
         	SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-150);
			PlayerPlaySound(playerid, 1139, 55.64380, -1535.61462, 4.65890);
			MoveDynamicObject(MautSchranke[1], 55.64380, -1535.61462, 4.65890+0.01,4.0,0.00000, 0.00000, 80.00000);
			SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
			SetPVarInt(playerid,"MautStation",4);
			if(GetPlayerWantedLevelEx(playerid) > 0)
			{
   				new stringmaut[128];
			    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}SF-LS{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
			    foreach(new i : Player)
			    {
       				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
			        {
           				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
			            SendClientMessage(i,COLOR_INFO,stringmaut);
			        }
			    }
			}
			return 1;
   		}
   	}
    else if(IsPlayerInRangeOfPoint(playerid,3.5,26.1980,-1338.1219,10.1589))//SFTunnel - LSTunnel
    {
		if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
      	{
   			if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
         	{
				PlayerPlaySound(playerid, 1139, 32.93180, -1338.09875, 9.97200);
				MoveDynamicObject(MautSchranke[2], 32.93180, -1338.09875, 9.97200+0.01,4.0,0.00000, 0.00000, -48.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",5);
				return 1;
			}
			else
			{
				if(MautStatus[2] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
				if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
				SetPVarInt(playerid,"NoPAYBACK",1);
				GivePlayerMoneyEx(playerid,-150);
				PlayerPlaySound(playerid, 1139, 32.93180, -1338.09875, 9.97200);
				MoveDynamicObject(MautSchranke[2], 32.93180, -1338.09875, 9.97200+0.01,4.0,0.00000, 0.00000, -48.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",5);
				if(GetPlayerWantedLevelEx(playerid) > 0)
				{
    				new stringmaut[128];
				    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}SF-LS Tunnel{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
				    foreach(new i : Player)
				    {
        				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
				        {
            				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
				            SendClientMessage(i,COLOR_INFO,stringmaut);
				        }
				    }
				}
				return 1;
			}
		}
		else
  		{
    		if(MautStatus[2] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
      		if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
        	SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-150);
			PlayerPlaySound(playerid, 1139, 32.93180, -1338.09875, 9.97200);
			MoveDynamicObject(MautSchranke[2], 32.93180, -1338.09875, 9.97200+0.01,4.0,0.00000, 0.00000, -48.00000);
			SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
			SetPVarInt(playerid,"MautStation",5);
			if(GetPlayerWantedLevelEx(playerid) > 0)
			{
   				new stringmaut[128];
			    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}SF-LS Tunnel{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
			    foreach(new i : Player)
			    {
       				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		        	{
           				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
			            SendClientMessage(i,COLOR_INFO,stringmaut);
			        }
			    }
			}
			return 1;
   		}
   	}
    else if(IsPlayerInRangeOfPoint(playerid,3.5,-1.1519,-1323.5649,11.2628))//LSTunnel - SFTunnel
    {
   		if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
     	{
      		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
        	{
				PlayerPlaySound(playerid, 1139, 55.64380, -1535.61462, 4.65890);
				MoveDynamicObject(MautSchranke[3], -9.03120, -1324.38770, 10.83550+0.01,4.0,0.00000, 0.00000, -51.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",6);
				return 1;
			}
			else
			{
				if(MautStatus[3] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   				if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
       			SetPVarInt(playerid,"NoPAYBACK",1);
				GivePlayerMoneyEx(playerid,-150);
				PlayerPlaySound(playerid, 1139, 55.64380, -1535.61462, 4.65890);
				MoveDynamicObject(MautSchranke[3], -9.03120, -1324.38770, 10.83550+0.01,4.0,0.00000, 0.00000, -51.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",6);
				if(GetPlayerWantedLevelEx(playerid) > 0)
				{
    				new stringmaut[128];
				    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LS-SF Tunnel{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
				    foreach(new i : Player)
				    {
        				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
				        {
            				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
				            SendClientMessage(i,COLOR_INFO,stringmaut);
				        }
				    }
				}
				return 1;
			}
		}
 		else
   		{
     		if(MautStatus[3] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
       		if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
         	SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-150);
			PlayerPlaySound(playerid, 1139, 55.64380, -1535.61462, 4.65890);
			MoveDynamicObject(MautSchranke[3], -9.03120, -1324.38770, 10.83550+0.01,4.0,0.00000, 0.00000, -51.00000);
			SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
			SetPVarInt(playerid,"MautStation",6);
			if(GetPlayerWantedLevelEx(playerid) > 0)
			{
   				new stringmaut[128];
			    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}LS-SF Tunnel{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
			    foreach(new i : Player)
			    {
       				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
			        {
           				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
			            SendClientMessage(i,COLOR_INFO,stringmaut);
		        	}
			    }
			}
			return 1;
   		}
   	}
	else if(IsPlayerInRangeOfPoint(playerid,3.5,523.5012,469.5414,18.9297) || IsPlayerInRangeOfPoint(playerid,3.5,518.9169,475.9107,18.9297))//LS - LV - LV - LS
 	{
   		if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
     	{
      		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
      		{
				PlayerPlaySound(playerid, 1139, 518.43420, 470.30151, 18.66560);
				MoveDynamicObject(MautSchranke[4], 518.43420, 470.30151, 18.66560+0.01,4.0,0.00000, 0.00000, 34.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",7);
				return 1;
			}
			else
			{
				if(MautStatus[4] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
   				if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
   				SetPVarInt(playerid,"NoPAYBACK",1);
				GivePlayerMoneyEx(playerid,-150);
				PlayerPlaySound(playerid, 1139, 518.43420, 470.30151, 18.66560);
				MoveDynamicObject(MautSchranke[4], 518.43420, 470.30151, 18.66560+0.01,4.0,0.00000, 0.00000, 34.00000);
				SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
				SetPVarInt(playerid,"MautStation",7);
				if(GetPlayerWantedLevelEx(playerid) > 0)
				{
    				new stringmaut[128];
				    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}7{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
				    foreach(new i : Player)
				    {
        				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
				        {
            				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
				            SendClientMessage(i,COLOR_INFO,stringmaut);
				        }
				    }
				}
				return 1;
			}
		}
 		else
   		{
     		if(MautStatus[4] == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Mautstation ist derzeit geschlossen.");
       		if(GetPlayerMoneyEx(playerid) < 150)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Maut-Gebühr beträgt 150$. Komm wieder, wenn du genügend Geld dabei hast.");
         	SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-150);
			PlayerPlaySound(playerid, 1139, 518.43420, 470.30151, 18.66560);
			MoveDynamicObject(MautSchranke[4], 518.43420, 470.30151, 18.66560+0.01,4.0,0.00000, 0.00000, 34.00000);
			SetTimerEx("MautSchrankeT", 5000, false,"i",playerid);
			SetPVarInt(playerid,"MautStation",7);
			if(GetPlayerWantedLevelEx(playerid) > 0)
			{
   				new stringmaut[128];
			    format(stringmaut,sizeof(stringmaut),"[Zentrale]: {FFFFFF}Der Gesuchte '{DC00FF}%s{FFFFFF}' soll die Mautstation '{DC00FF}7{FFFFFF}' vor wenigen Sekunden passiert haben.",SpielerInfo[playerid][sName]);
		    	foreach(new i : Player)
			    {
       				if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
			        {
           				SendClientMessage(i,COLOR_INFO,"[Zentrale]: {FFFFFF}Achtung, der Zoll meldet die Sichtung eines Gesuchten.");
			            SendClientMessage(i,COLOR_INFO,stringmaut);
			        }
			    }
			}
			return 1;
   		}
   	}
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich an keiner Mautstation.");
    return 1;
}