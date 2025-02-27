// purpose: convert integer into dollar string (large credit to Slice - i just added a prefix parameter)
stock number_format( { _, Float, Text3D, Menu, Text, DB, DBResult, bool, File }: variable, prefix = '\0', decimals = -1, thousand_seperator = ',', decimal_point = '.')
{
    static
        s_szReturn[ 32 ],
        s_szThousandSeparator[ 2 ] = { ' ', EOS },
        s_iDecimalPos,
        s_iChar,
        s_iSepPos
    ;

	format( s_szReturn, sizeof( s_szReturn ), "%d", variable );

	if ( decimals > 0 )
	{
		strcat( s_szReturn, "." );

		while ( decimals-- )
			strcat( s_szReturn, "0" );
	}
    

    s_iDecimalPos = strfind( s_szReturn, "." );

    if ( s_iDecimalPos == -1 )
        s_iDecimalPos = strlen( s_szReturn );
    else
        s_szReturn[ s_iDecimalPos ] = decimal_point;

    if ( s_iDecimalPos >= 4 && thousand_seperator )
    {
        s_szThousandSeparator[ 0 ] = thousand_seperator;

        s_iChar = s_iDecimalPos;
        s_iSepPos = 0;

        while ( --s_iChar > 0 )
        {
            if ( ++s_iSepPos == 3 && s_szReturn[ s_iChar - 1 ] != '-' )
            {
                strins( s_szReturn, s_szThousandSeparator, s_iChar );

                s_iSepPos = 0;
            }
        }
    }

    if ( prefix != '\0' )
    {
        static
            prefix_string[ 2 ];

        prefix_string[ 0 ] = prefix;
        strins( s_szReturn, prefix_string, s_szReturn[ 0 ] == '-' ); // no point finding -
    }
    return s_szReturn;
}

// purpose: return raw distance without square root
stock Float: GetDistanceFromPlayerSquared( playerid, Float: x1, Float: y1, Float: z1 ) {
    new
        Float: x2, Float: y2, Float: z2;

    if( !GetPlayerPos( playerid, x2, y2, z2 ) )
        return FLOAT_INFINITY;

    x1 -= x2;
    x1 *= x1;
    y1 -= y2;
    y1 *= y1;
    z1 -= z2;
    z1 *= z1;
    return ( x1 + y1 + z1 );
}

stock randarg( ... )
	return getarg( random( numargs( ) ) );


stock Float:Distance(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2) // http://forum.sa-mp.com/showpost.php?p=2919962&postcount=2
	return floatsqroot((((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2))+((z1-z2)*(z1-z2))));


stock formatInt(intVariable, iThousandSeparator = ',', iCurrencyChar = '$')
{
    /*
        By Kar
        https://gist.github.com/Kar2k/bfb0eafb2caf71a1237b349684e091b9/8849dad7baa863afb1048f40badd103567c005a5#file-formatint-function
    */
    static
        s_szReturn[ 32 ],
        s_szThousandSeparator[ 2 ] = { ' ', EOS },
        s_szCurrencyChar[ 2 ] = { ' ', EOS },
        s_iVariableLen,
        s_iChar,
        s_iSepPos,
        bool:s_isNegative
    ;
 
    format( s_szReturn, sizeof( s_szReturn ), "%d", intVariable );
 
    if(s_szReturn[0] == '-')
        s_isNegative = true;
    else
        s_isNegative = false;
 
    s_iVariableLen = strlen( s_szReturn );
 
    if ( s_iVariableLen >= 4 && iThousandSeparator)
    {
        s_szThousandSeparator[ 0 ] = iThousandSeparator;
 
        s_iChar = s_iVariableLen;
        s_iSepPos = 0;
 
        while ( --s_iChar > _:s_isNegative )
        {
            if ( ++s_iSepPos == 3 )
            {
                strins( s_szReturn, s_szThousandSeparator, s_iChar );
 
                s_iSepPos = 0;
            }
        }
    }
    if(iCurrencyChar) {
        s_szCurrencyChar[ 0 ] = iCurrencyChar;
        strins( s_szReturn, s_szCurrencyChar, _:s_isNegative );
    }
    return s_szReturn;
}
 
stock RandomEx(min, max) //Y_Less
    return random(max - min) + min;



stock ConvertToMinutes(time)
{
    // http://forum.sa-mp.com/showpost.php?p=3223897&postcount=11
    new string[15];//-2000000000:00 could happen, so make the string 15 chars to avoid any errors
    format(string, sizeof(string), "%02d:%02d", time / 60, time % 60);
    return string;
}

stock IsPlayerInWaterEx(playerid)
{
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid, x, y, z);
    if((x >= -1408.0629 && y >= 2021.0587 && x <= -460.9319 && y <= 2861.4893) ||//Represa do deserto de Las Venturas
	(x >= 1269.5886 && y >= -810.4507 && x <= 1288.8916 && y <= -800.5959) ||//Piscina de uma casa em VineWood (Mad Dog's Mansion)
	(x >= 1086.6010 && y >= -683.6998 && x <= 1103.0225 && y <= -662.1832) ||//Piscina de uma casa em VineWood (Perto Mad Dog's Mansion)
	(x >= 169.6879 && y >= -1392.6630 && x <= 281.5444 && y <= -1168.9749) ||// 2 Piscinas em VineWood
	(x >= -828.3018 && y >= -2107.1487 && x <= -443.5032 && y <= -1855.6273) ||//Lago da árvore caída, ou Lago Morto
	(x >= 1198.9982 && y >= -2407.0581 && x <= 1275.7397 && y <= -2341.6262) ||//Lago perto do aeroporto Los Santos
	(x >= 2293.1467 && y >= -1432.5869 && x <= 2331.7388 && y <= -1397.6476) ||//Lago perto da Igreja Los Santos
	(x >= 1915.3196 && y >= -1236.2382 && x <= 2016.6565 && y <= -1167.9290) ||//Park Glen Los Santos
	(x >= -2747.1692 && y >= -510.1152 && x <= -2663.2468 && y <= -411.4905) ||//Lago em San Fierro
	(x >= 1838.8041 && y >= 1463.2024 && x <= 2035.4167 && y <= 1703.0480) ||//Cascata do Login em Las Venturas
	(x >= 2049.6646 && y >= 1843.3029 && x <= 2119.9021 && y <= 1983.5464) ||//Navio Pirata em Las Venturas
	(x >= 2094.9255 && y >= 1085.2852 && x <= 2179.1790 && y <= 1183.0610) ||//Frente de um Cascino em Las Venturas
	(x >= 2545.3718 && y >= 2347.7112 && x <= 2593.6794 && y <= 2403.8040))//Piscina de um prédio em Las Venturas
	{
			return 1;
    }
    return 0;
}

stock ApplyAnimationEx(playerid, const animlib[], const animname[], Float:fDelta, bool:loop, bool:lockx, bool:locky, bool:freeze, time, FORCE_SYNC:forcesync = SYNC_NONE)
{
    ApplyAnimation(playerid, animlib, "null", fDelta, loop, lockx, locky, freeze, time, forcesync);
    return ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}

stock IsPlayerSwimmingEx(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		new animlib[32], animname[32];
		GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);

		if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_GLIDE", true)) return 1;
		else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_BREAST", true)) return 1;
		else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_CRAWL", true)) return 1;
		else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_DIVE_UNDER", true)) return 1;
		else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_DIVE_GLIDE", true)) return 1;
		else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_UNDER", true)) return 1;
		else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_TREAD", true)) return 1;
	}
	return 0;
}

stock IsPlayerAnWasser(playerid)
{
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid, x, y, z);
    if((x >= -1408.0629 && y >= 2021.0587 && x <= -460.9319 && y <= 2861.4893) ||
    (x >= 1269.5886 && y >= -810.4507 && x <= 1288.8916 && y <= -800.5959) ||
    (x >= 1086.6010 && y >= -683.6998 && x <= 1103.0225 && y <= -662.1832) ||
    (x >= 169.6879 && y >= -1392.6630 && x <= 281.5444 && y <= -1168.9749) ||
    (x >= -828.3018 && y >= -2107.1487 && x <= -443.5032 && y <= -1855.6273) ||
    (x >= 1198.9982 && y >= -2407.0581 && x <= 1275.7397 && y <= -2341.6262) ||
    (x >= 2293.1467 && y >= -1432.5869 && x <= 2331.7388 && y <= -1397.6476) ||
    (x >= 1915.3196 && y >= -1236.2382 && x <= 2016.6565 && y <= -1167.9290) ||
    (x >= -2747.1692 && y >= -510.1152 && x <= -2663.2468 && y <= -411.4905) ||
    (x >= 1838.8041 && y >= 1463.2024 && x <= 2035.4167 && y <= 1703.0480) ||
    (x >= 2049.6646 && y >= 1843.3029 && x <= 2119.9021 && y <= 1983.5464) ||
    (x >= 2094.9255 && y >= 1085.2852 && x <= 2179.1790 && y <= 1183.0610) ||
    (x >= 2545.3718 && y >= 2347.7112 && x <= 2593.6794 && y <= 2403.8040))
    {
		return 1;
    }
    return 0;
}

stock Float:GetDistanceBetweenPlayersEx(p1,p2)
{
    new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
    if(!IsPlayerConnectedEx(p1) || !IsPlayerConnectedEx(p2))
    {
        return -1.00;
    }
    GetPlayerPos(p1,x1,y1,z1);
    GetPlayerPos(p2,x2,y2,z2);
    return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

public Float:GetDistanceBetweenObjects(object1,object2)
{
    new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
    if(!IsValidObject(object1) || !IsValidObject(object2))
    {
        return -1.00;
    }
    GetObjectPos(object1,x1,y1,z1);
    GetObjectPos(object2,x2,y2,z2);
    return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

stock GetVehicleDriverEx(vehicleid)
{
    for(new i=1; i < MAX_VEHICLES; i++)
    {
        if(!IsPlayerConnectedEx(i)) continue;
        if(GetPlayerState(i) != PLAYER_STATE_DRIVER) continue;
        if(GetPlayerVehicleID(i) == vehicleid)
        {
            return i;
        }
    }
    return -1;
}

stock IsVehicleInRangeOfPoint(vehicleid,Float:radi,Float:x,Float:y,Float:z)
{
    if(IsValidVehicle(vehicleid))
	{
		new Float:oldposx,Float:oldposy,Float:oldposz,Float:tempposx,Float:tempposy,Float:tempposz;
	  	GetVehiclePos(vehicleid,oldposx,oldposy,oldposz);
	   	tempposx = (oldposx -x);
	    tempposy = (oldposy -y);
	    tempposz = (oldposz -z);
	    if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	    {
	   		return 1;
	    }
	    return 0;
    }
    return 1;
}

stock WaffenName(waffenid)
{
	new wpname[24];
	switch(waffenid)
	{
		case 0:{wpname="Faust";}
		case 1:{wpname="Schlagring";}
		case 2:{wpname="Golfschläger";}
		case 3:{wpname="Schlagstock";}
		case 4:{wpname="Knife";}
		case 5:{wpname="Baseballschläger";}
		case 6:{wpname="Schaufel";}
		case 7:{wpname="Billiardköl";}
		case 8:{wpname="Katana";}
		case 9:{wpname="Chainsaw";}
		case 10:{wpname="Lila Dildo";}
		case 11:{wpname="Dildo";}
		case 12:{wpname="Vibrator";}
		case 13:{wpname="Silberner Vibrator";}
		case 14:{wpname="Blumen";}
		case 15:{wpname="Gehstock";}
		case 16:{wpname="Granate";}
		case 17:{wpname="Tränengas";}
		case 18:{wpname="Molotov Cocktail";}
		case 22:{wpname="9MM Glock";}
		case 23:{wpname="Schallgedämpfte 9MM";}
		case 24:{wpname="Desert Eagle";}
		case 25:{wpname="Shotgun";}
		case 26:{wpname="Sawnoff Shotgun";}
		case 27:{wpname="Combat Shotgun";}
		case 28:{wpname="Micro SMG/Uzi";}
		case 29:{wpname="MP5";}
		case 30:{wpname="AK-47";}
		case 31:{wpname="M4";}
		case 32:{wpname="Tec-9";}
		case 33:{wpname="Country Rifle";}
		case 34:{wpname="Sniper";}
		case 35:{wpname="Raketenwerfer";}
		case 36:{wpname="Flugabwehrrakete";}
		case 37:{wpname="Flammenwerfer";}
		case 38:{wpname="Minigun";}
		case 39:{wpname="C4";}
		case 40:{wpname="C4-Auslöser";}
		case 41:{wpname="Sprühdose";}
		case 42:{wpname="Feuerlöscher";}
		case 43:{wpname="Kamera";}
		case 44:{wpname="Nachtsichgerät";}
		case 45:{wpname="Thermalsichgerät";}
		case 46:{wpname="Fallschirm";}
	}
	return wpname;
}

stock ProxDetector(Float:radi, playerid, const text[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnectedEx(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnectedEx(i))
			{
			    if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid))
			    {
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					if(((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						SendClientMessage(i, col1, text);
					}
					else if(((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						SendClientMessage(i, col2, text);
					}
					else if(((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						SendClientMessage(i, col3, text);
					}
					else if(((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						SendClientMessage(i, col4, text);
					}
					else if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						SendClientMessage(i, col5, text);
					}
				}
			}
		}
	}
	return 1;
}

stock ProxDetectorDynActor(Float:radi, actorid, const text[],col1,col2,col3,col4,col5)
{
	if(IsValidDynamicActor(actorid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetDynamicActorPos(actorid, oldposx, oldposy, oldposz);
		
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnectedEx(i))
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				if(((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				{
					SendClientMessage(i, col1, text);
				}
				else if(((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				{
					SendClientMessage(i, col2, text);
				}
				else if(((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				{
					SendClientMessage(i, col3, text);
				}
				else if(((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				{
					SendClientMessage(i, col4, text);
				}
				else if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendClientMessage(i, col5, text);
				}
			}
		}
	}
	return 1;
}

stock GetAge(const string[]) {
	new var0, var1, var2, Date[3], age;
	sscanf(string, "p<.>iii", var0, var1, var2);
    if(var0 > 31 || var0 <= 0)return 0;
    if(var1 > 12 || var1 <= 0)return 0;
    getdate(Date[0],Date[1],Date[2]);
    if(var2 > Date[0] || var2 < 1900)return 0;
	age = Date[0] - var2 - ((Date[1] < var1)? 1 : ((Date[1] == var1 && Date[2] < var0)? 1 : 0));
	return age;
} 

/*stock GetAge(const Birthday[16])
{
	new D,M,Y,Age;
	getdate(Y,M,D);
	for(new i = strlen(Birthday); i > -1; i--)
	{
		if(Birthday[i] == '.')
		{
			new Tmp[32];
			for(new o = i-1; o > -1; o--)
			{
				if(Birthday[o] == '.')
				{
					strmid(Tmp,Birthday,o+1,i);
					if(strval(Tmp)>=M)
					{
						strmid(Tmp,Birthday,0,o);
						if(strval(Tmp)>D)
						{
							strmid(Tmp,Birthday,i+1,strlen(Birthday));
							Age = Y-strval(Tmp)-1;
							break;
						}
					}
					strmid(Tmp,Birthday,i+1,strlen(Birthday));
					Age = Y-strval(Tmp)-1;
					break;
				}
			}
		}
	}
	return Age;
}
*/
stock GetClosestVehicle(playerid, Float:range)
{
	new Float:p_X, Float:p_Y, Float:p_Z, Float:Distance, Float:PretendentDistance = range +1, Pretendent;
    GetPlayerPos(playerid, p_X, p_Y, p_Z);
    for(new vehicleid=1; vehicleid < MAX_VEHICLES; vehicleid++)
    {
        Distance = GetVehicleDistanceFromPoint(vehicleid, p_X, p_Y, p_Z);
        if(Distance <= range && Distance <= PretendentDistance)
        {
            Pretendent = vehicleid;
            PretendentDistance = Distance;
        }
    }
    return Pretendent;
}

stock RemovePlayerWeaponEx(playerid, WaffenID)
{
	//SetPlayerAmmo(playerid,WaffenID,0);
 	new AlteWaffe[12], AlteAmmo[12], Waffe = 0, Ammo = 0;
 	for(new Slot = 0; Slot != 12; Slot++)
    {
        GetPlayerWeaponData(playerid, Slot, Waffe, Ammo);

        if(Waffe != WaffenID)
        {
        	GetPlayerWeaponData(playerid, Slot, AlteWaffe[Slot], AlteAmmo[Slot]);
        }
    }

    ResetPlayerWeapons(playerid);
    for(new Slot = 0; Slot != 12; Slot++)
    {
     	GivePlayerWeapon(playerid, AlteWaffe[Slot], AlteAmmo[Slot]);
    }
    return 1;
}

GetPosInFront(Float:z_angle, Float:distance, &Float:x, &Float:y, &Float:z)
{

	x += distance * floatsin(-z_angle, degrees);
	y += distance * floatcos(-z_angle, degrees);

	#pragma unused z
	return 1;
}

public IsPlayerConnectedEx(playerid)
{
	if(playerid == INVALID_PLAYER_ID || !IsPlayerConnected(playerid) || IsPlayerNPC(playerid))return false;
	return true;
}

stock IsPlayerInArea(playerid, Float:MinX, Float:MaxX, Float:MinY, Float:MaxY)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	#pragma unused z
    if(x >= MinX && x <= MaxX && y >= MinY && y <= MaxY) { return 1; }
    return 0;
}

stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, &Float:z, &Float:a, Float:distance)
{
	GetPlayerPos(playerid, x, y ,z);
	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleZAngle(GetPlayerVehicleID(playerid),a);
	}
	else
	{
		GetPlayerFacingAngle(playerid, a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
	return 0;
}

stock Float:GetDistanceBetweenPoints(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2) //By Gabriel "Larcius" Cordes
{
	return floatadd(floatadd(floatsqroot(floatpower(floatsub(x1,x2),2)),floatsqroot(floatpower(floatsub(y1,y2),2))),floatsqroot(floatpower(floatsub(z1,z2),2)));
}

stock Float:DistanceCameraTargetToLocation(Float:CamX, Float:CamY, Float:CamZ, Float:ObjX, Float:ObjY, Float:ObjZ, Float:FrX, Float:FrY, Float:FrZ)
{
	new Float:TGTDistance;

	// get distance from camera to target
	TGTDistance = floatsqroot((CamX - ObjX) * (CamX - ObjX) + (CamY - ObjY) * (CamY - ObjY) + (CamZ - ObjZ) * (CamZ - ObjZ));

	new Float:tmpX, Float:tmpY, Float:tmpZ;

	tmpX = FrX * TGTDistance + CamX;
	tmpY = FrY * TGTDistance + CamY;
	tmpZ = FrZ * TGTDistance + CamZ;

	return floatsqroot((tmpX - ObjX) * (tmpX - ObjX) + (tmpY - ObjY) * (tmpY - ObjY) + (tmpZ - ObjZ) * (tmpZ - ObjZ));
}

stock Pressing(playerid)
{
	new keys, updown, leftright;
	GetPlayerKeys(playerid, keys, updown, leftright);
	return keys;
}

stock IsInWaterCar(playerid)
{
    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 407 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 601){return 1;}
	return 0;
}

stock HasExtinguisher(playerid)
{
    if(GetPlayerWeapon(playerid) == 42 && !IsPlayerInAnyVehicle(playerid))
	{
		return 1;
	}
	return 0;
}

stock IsPlayerFlyAnim(playerid)
{
    if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        new animlib[32], animname[32];
        GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);

        if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_GLIDE", true)) return 1;
        else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_BREAST", true)) return 1;
        else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_CRAWL", true)) return 1;
        else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_DIVE_UNDER", true)) return 1;
        else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_DIVE_GLIDE", true)) return 1;
        else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_UNDER", true)) return 1;
        else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_TREAD", true)) return 1;

    }
    return 0;
}

stock IsPlayerInWater(playerid)
{
	new Float:X, Float:Y, Float:Z, an = GetPlayerAnimationIndex(playerid);
	GetPlayerPos(playerid, X, Y, Z);
	if((1544 >= an >= 1538 || an == 1062 || an == 1250) && (Z <= 0 || (Z <= 41.0 && IsPlayerInArea(playerid, -1387, -473, 2025, 2824))) ||
	(1544 >= an >= 1538 || an == 1062 || an == 1250) && (Z <= 2 || (Z <= 39.0 && IsPlayerInArea(playerid, -1387, -473, 2025, 2824))))
	{
	    return 1;
 	}
 	return 0;
}

stock IsACar(carid)
{
    if(carid == 400 || carid == 401 || carid == 402 || carid == 404 || carid == 405 || carid == 406
    || carid == 407 || carid == 408 || carid == 409 || carid == 410 || carid == 411 || carid == 412 || carid == 413
    || carid == 415 || carid == 416 || carid == 418 || carid == 419 || carid == 420 || carid == 421
    || carid == 422 || carid == 423 || carid == 424 || carid == 426 || carid == 427 || carid == 428 || carid == 429
    || carid == 431 || carid == 433 || carid == 434 || carid == 436 || carid == 437 || carid == 438
    || carid == 439 || carid == 440 || carid == 442 || carid == 445 || carid == 451 || carid == 458 || carid == 459
    || carid == 466 || carid == 467 || carid == 470 || carid == 474
    || carid == 475 || carid == 477 || carid == 478 || carid == 479 || carid == 480 || carid == 482 || carid == 483
    || carid == 489 || carid == 490 || carid == 491 || carid == 492 || carid == 494 || carid == 495 || carid == 496 || carid == 498
    || carid == 500 || carid == 502 || carid == 503 || carid == 504 || carid == 505 || carid == 506 || carid == 507 || carid == 508
    || carid == 516 || carid == 517 || carid == 518 || carid == 526
    || carid == 527 || carid == 528 || carid == 529 || carid == 531 || carid == 532 || carid == 533 || carid == 534
    || carid == 535 || carid == 536 || carid == 540 || carid == 541 || carid == 542 || carid == 543 || carid == 544
    || carid == 545 || carid == 546 || carid == 547 || carid == 549 || carid == 550 || carid == 551 || carid == 552
    || carid == 554 || carid == 555 || carid == 558 || carid == 559 || carid == 560 || carid == 561 || carid == 562
    || carid == 565 || carid == 566 || carid == 567 || carid == 568 || carid == 575 || carid == 576 || carid == 579
    || carid == 580 || carid == 582 || carid == 585 || carid == 587 || carid == 588 || carid == 589
    || carid == 596 || carid == 597 || carid == 598 || carid == 599 || carid == 600 || carid == 601 || carid == 602
    || carid == 603 || carid == 604 || carid == 605 || carid == 609)
    {
        return 1;
    }
    return 0;
}

stock Func_GetDistance( Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2 )
{
    return floatround( floatsqroot( ( ( x1 - x2 ) * ( x1 - x2 ) ) + ( ( y1 - y2 ) * ( y1 - y2 ) ) + ( ( z1 - z2 ) * ( z1 - z2 ) ) ) );
}

public Float:GetPlayerPacketLoss(playerid)
{
    new stats[401], stringstats[70],len = strfind(stats, "Packetloss: "),Float:packetloss = 0.0;
    GetPlayerNetworkStats(playerid, stats, sizeof(stats));
    if(len != -1)
	{
        strmid(stringstats, stats, len, strlen(stats));
        new len2 = strfind(stringstats, "%");
        if(len != -1)
		{
            strdel(stats, 0, strlen(stats)),strmid(stats, stringstats, len2-3, len2),packetloss = floatstr(stats);
  		}
    }
    return packetloss;
}

stock Peeing(playerid)
{
	return GetPlayerSpecialAction(playerid) == 68;
}

stock Float:GetDistance( Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2 )
{
	return  floatsqroot( ( ( x1 - x2 ) * ( x1 - x2 ) ) + ( ( y1 - y2 ) * ( y1 - y2 ) ) + ( ( z1 - z2 ) * ( z1 - z2 ) ) );
}

stock SelectTextDrawEx(playerid)
{
    SetPVarInt(playerid,"TextDrawSelect",1);
    return SelectTextDraw(playerid);
}

stock GetXYInFrontOfVehicle(vehicleid, &Float:xs, &Float:ys, &Float:zs, Float:distance)
{
	new Float:as;
	GetVehiclePos(vehicleid,xs,ys,zs);

	GetVehicleZAngle(vehicleid, as);

	xs += (distance * floatsin(-as, degrees));
	ys += (distance * floatcos(-as, degrees));
	return 1;
}

stock randomEx(min, max)
{
    new rand = random(max-min)+min;
    return rand;
}

stock SendSplitMessage(playerid, color, const message[])
{
	if(playerid == INVALID_PLAYER_ID)return 1;
	if(strlen(message) > 128)
	{
	    new chat_line[2][128];
	    strmid(chat_line[0],message,0,128,128);
	    SendClientMessage(playerid,color,chat_line[0]);
	    strmid(chat_line[1],message,128,254,128);
	    SendClientMessage(playerid,color,chat_line[1]);
	    return 1;
	}
	else SendClientMessage(playerid,color,message);
	return 1;
}

stock GetKeyName(keyid)
{
	new keyname[24];
	switch(keyid)
	{
	    case 0:{keyname="Keine Taste";}
	    case 8192:{keyname="Numpad 4";}
	    case 16384:{keyname="Numpad 6";}
	    case 65536:{keyname="Taste Z";}
	    case 1024:{keyname="Linkes ALT";}
	    case 320:{keyname="Mausrad-Klick";}
	}
	return keyname;
}

stock SendRoundMessage(Float:x, Float:y, Float:z, color, const text[] , Float:distance = 20.0)
{
    for(new i = 0 ; i < MAX_PLAYERS ; i++)
    {
        if(IsPlayerInRangeOfPoint(i, distance , x,y,z))
        {
            SendClientMessage(i, color, text);
        }
    }
    return 1;
}

stock JaNein(Variable)
{
	new ausgabe[5];
	switch(Variable)
	{
	    case 0:{ausgabe="Nein";}
	    case 1:{ausgabe="Ja";}
	}
	return ausgabe;
}

stock GetXYInFrontOfActor(actorid, &Float:x, &Float:y, Float:distance)
{
	// Created by Y_Less, just modified by me

	new Float:a;

	GetActorPos(actorid, x, y, a);
	GetActorFacingAngle(actorid, a);
	
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}

stock Float:floatrandomEx(Float:max, Float:m2 = 0.0, dp = 3)
{
    new Float:mn = m2;
    if(m2 > max) {
        mn = max,
        max = m2;
    }
    m2 = floatpower(10.0, dp);

    return floatadd(floatdiv(float(random(floatround(floatmul(floatsub(max, mn), m2)))), m2), mn);
}