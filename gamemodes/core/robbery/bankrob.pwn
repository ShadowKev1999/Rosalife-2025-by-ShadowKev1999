public BankrobTimer()
{
	Bankrob = 0;
	BankRobGeldSackSpawned[0] = 0;
	BankRobGeldSackSpawned[1] = 0;
	BankRobAmLaufen = 0;
	BankAttacker = 0;
	BankRobVan = INVALID_VEHICLE_ID;
}

public PlayerBankrob(playerid)
{
	new string[224];
	if(PlayerBankRobSec[playerid] != 0)
	{
    	PlayerBankRobSec[playerid]--;
    	format(string,sizeof(string),"~w~ NOCH ~b~ %d Sekunden ~w~ BIS ZUM NEUEN GELDBEUTEL",PlayerBankRobSec[playerid]);
		PlayerTextDrawSetString(playerid, BankraubTD[playerid][5], string);
	}
	else if(PlayerBankRobSec[playerid] == 0)
	{
	    PlayerBankRobSec[playerid] = 60;
		PlayerTextDrawSetString(playerid, BankraubTD[playerid][5], "~w~ NOCH ~b~ 60 Sekunden ~w~ BIS ZUM NEUEN GELDBEUTEL");

		new Random_Geld = 7000+random(14000);
		if(BankRobVan == INVALID_VEHICLE_ID)
		{
			BankRobGeld[0] = Random_Geld;
			BankRobGeldSack[0] = CreateDynamicObject(1550,GeldSack[0][0],GeldSack[0][1],GeldSack[0][2],GeldSack[0][3],GeldSack[0][4],GeldSack[0][5]);
	 	    BankRobGeldSackLabel[0] = CreateDynamic3DTextLabel("{FFFFFF}Benutze '{FF0000}N'{FFFFFF}\num den Geldsack aufzuheben", 0x008080FF, GeldSack[0][0],GeldSack[0][1],GeldSack[0][2], 5.0);
	        PlayerTextDrawSetString(playerid, BankraubTD[playerid][4], "~w~ GELDBEUTEL IN DER BANK: ~b~ 1");
			SendClientMessage(playerid,COLOR_YELLOW,"Hebe die Geldsäcke mit der N Taste auf und bringe sie in das Fluchtfahrzeug.");
			SendClientMessage(playerid,COLOR_INFO,"Das Fluchtfahrzeug befindet sich am roten Marker.");
			SetPlayerCheckpointEx(playerid,1737.5449,-1717.7615,13.2283,5.0);

 			new vehicleid;
			vehicleid = CreateVehicle(482,1737.5449,-1717.7615,13.2283,89.4347,0,0,-1);
			FahrzeugInfo[vehicleid][fModelID] = 482;
			LinkVehicleToInterior(vehicleid,GetPlayerInterior(playerid));
			SetVehicleVirtualWorld(vehicleid,GetPlayerVirtualWorld(playerid));
			FahrzeugInfo[vehicleid][fTank] = VehicleData[FahrzeugInfo[vehicleid][fModelID]-400][vehLiter];
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehicleid, false, false, false, false, false, false, false);

			FahrzeugInfo[vehicleid][fDatabaseID] = 0; FahrzeugInfo[vehicleid][fErstellt] = true;
			FahrzeugInfo[vehicleid][fPosition][0] = 1737.5449; FahrzeugInfo[vehicleid][fPosition][1] = -1717.7615; FahrzeugInfo[vehicleid][fPosition][2] = 13.2283; FahrzeugInfo[vehicleid][fPosition][3] = 178.9112; FahrzeugInfo[vehicleid][fColor][1] = 0;
			format(FahrzeugInfo[vehicleid][fKennzeichen], 0, "Bankrob"); FahrzeugInfo[vehicleid][fAbgeschleppt] = 0; FahrzeugInfo[vehicleid][fParkkralle] = 0; FahrzeugInfo[vehicleid][fKilometer] = 0; FahrzeugInfo[vehicleid][fColor][0] = 0; FahrzeugInfo[vehicleid][fPaintjob] = 3;
			FahrzeugInfo[vehicleid][fTank] = VehicleData[GetVehicleModel(vehicleid)-400][vehLiter]; FahrzeugInfo[vehicleid][fRang] = 0; FahrzeugInfo[vehicleid][fFraktion] = 0; FahrzeugInfo[vehicleid][fGruppe] = 0; FahrzeugInfo[vehicleid][fAutohaus] = 0;
			FahrzeugInfo[vehicleid][fNebenjob] = 0; FahrzeugInfo[vehicleid][fGarage] = 0; FahrzeugInfo[vehicleid][fGPark] = 0; FahrzeugInfo[vehicleid][fFahrschule] = 0; FahrzeugInfo[vehicleid][fSupmobil] = 0;
			FahrzeugInfo[vehicleid][fZiviroller] = 0; FahrzeugInfo[vehicleid][fImportCar] = 0; FahrzeugInfo[vehicleid][fKurrierCar] = 0; FahrzeugInfo[vehicleid][fPreis] = 0; FahrzeugInfo[vehicleid][fBesitzer] = 0; format(FahrzeugInfo[vehicleid][fBesitzer], 0, ""); FahrzeugInfo[vehicleid][fBesitzerID] = 0; FahrzeugInfo[vehicleid][fJobEXP] = 0; FahrzeugInfo[vehicleid][fBankrob] = BankAttacker;

			FahrzeugInfo[vehicleid][fTuning][0] = 0;
			FahrzeugInfo[vehicleid][fTuning][1] = 0;
			FahrzeugInfo[vehicleid][fTuning][2] = 0;
			FahrzeugInfo[vehicleid][fTuning][3] = 0;
			FahrzeugInfo[vehicleid][fTuning][4] = 0;
			FahrzeugInfo[vehicleid][fTuning][5] = 0;
			FahrzeugInfo[vehicleid][fTuning][6] = 0;
			FahrzeugInfo[vehicleid][fTuning][7] = 0;
			FahrzeugInfo[vehicleid][fTuning][8] = 0;
			FahrzeugInfo[vehicleid][fTuning][9] = 0;
			FahrzeugInfo[vehicleid][fTuning][10] = 0;
			FahrzeugInfo[vehicleid][fTuning][11] = 0;
			FahrzeugInfo[vehicleid][fTuning][12] = 0;
			FahrzeugInfo[vehicleid][fTuning][13] = 0;

			SetVehicleNumberPlate(vehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);

			Motor[vehicleid] = false;
			Licht[vehicleid] = false;
			DOOR[vehicleid] = false;
			Motorhaube[vehicleid] = false;
			Kofferraum[vehicleid] = false;

			SetVehicleHealth(vehicleid,7500);
			BankRobVan = vehicleid;

			BankRobGeldSackSpawned[0]++;
			BankRobGeldSackSpawned[1]++;
			return 1;
		}
	 	else if(BankRobGeldSackSpawned[1] == 1)
		{
			BankRobGeldSack[BankRobGeldSackSpawned[1]] = CreateDynamicObject(1550,GeldSack[BankRobGeldSackSpawned[1]][0],GeldSack[BankRobGeldSackSpawned[1]][1],GeldSack[BankRobGeldSackSpawned[1]][2],GeldSack[BankRobGeldSackSpawned[1]][3],GeldSack[BankRobGeldSackSpawned[1]][4],GeldSack[BankRobGeldSackSpawned[1]][5]);
	    	BankRobGeldSackLabel[BankRobGeldSackSpawned[1]] = CreateDynamic3DTextLabel("{FFFFFF}Benutze '{FF0000}N'{FFFFFF}\num den Geldsack aufzuheben", 0x008080FF, GeldSack[BankRobGeldSackSpawned[1]][0],GeldSack[BankRobGeldSackSpawned[1]][1],GeldSack[BankRobGeldSackSpawned[1]][2], 5.0);
            if(BankRobGeldSackSpawned[0] == 0)
			{
	        	PlayerTextDrawSetString(playerid, BankraubTD[playerid][4], "~w~ GELDBEUTEL IN DER BANK: ~b~ 1");
	        }
	        else if(BankRobGeldSackSpawned[0] == 1)
	        {
	            PlayerTextDrawSetString(playerid, BankraubTD[playerid][4], "~w~ GELDBEUTEL IN DER BANK: ~b~ 2");
	        }
			BankRobGeld[BankRobGeldSackSpawned[1]] = Random_Geld;
			BankRobGeldSackSpawned[0]++;
			BankRobGeldSackSpawned[1]++;
			return 1;
		}
	 	else if(BankRobGeldSackSpawned[1] > 1 && BankRobGeldSackSpawned[1] < 9)
		{
			BankRobGeldSackSpawned[0]++;
			BankRobGeldSackSpawned[1]++;
			BankRobGeldSack[BankRobGeldSackSpawned[1]] = CreateDynamicObject(1550,GeldSack[BankRobGeldSackSpawned[1]][0],GeldSack[BankRobGeldSackSpawned[1]][1],GeldSack[BankRobGeldSackSpawned[1]][2],GeldSack[BankRobGeldSackSpawned[1]][3],GeldSack[BankRobGeldSackSpawned[1]][4],GeldSack[BankRobGeldSackSpawned[1]][5]);
	 	    BankRobGeldSackLabel[BankRobGeldSackSpawned[1]] = CreateDynamic3DTextLabel("{FFFFFF}Benutze '{FF0000}N'{FFFFFF}\num den Geldsack aufzuheben", 0x008080FF, GeldSack[BankRobGeldSackSpawned[1]][0],GeldSack[BankRobGeldSackSpawned[1]][1],GeldSack[BankRobGeldSackSpawned[1]][2], 5.0);
			BankRobGeld[BankRobGeldSackSpawned[1]] = Random_Geld;
			format(string,sizeof(string),"~w~ GELDBEUTEL IN DER BANK: ~b~ %d",BankRobGeldSackSpawned[0]);
	        PlayerTextDrawSetString(playerid, BankraubTD[playerid][4], string);
			return 1;
		}
		else if(BankRobGeldSackSpawned[1] == 9)
		{
		    KillTimer(PlayerBankRobTimer[playerid]);
		    SendClientMessage(playerid,COLOR_SUPER,"Das komplette Geld wurde in Säcke gepackt.");
     		format(string,sizeof(string),"~r~ Kein Geldsack mehr vorhanden",PlayerBankRobSec[playerid]);
			PlayerTextDrawSetString(playerid, BankraubTD[playerid][5], string);
		    return 1;
		}
	}
	return 1;
}