#define IsPlayerBoxing(%0) 			(g_boxingPlayerData[ %0 ] [ E_FIGHTING ])
#define SendBoxing(%0,%1) 			(SendClientMessage( %0, -1, "{B74AFF}[BOXING] {FFFFFF}" # %1))
#define SendBoxingGlobal(%0) 		(SendClientMessage( INVALID_PLAYER_ID, -1, "{B74AFF}[BOXING] {FFFFFF}" # %0))
#define IsPlayerNearBoxingArena(%0) (GetPlayerDistanceFromPoint( %0, 2654.885986, 1613.157958, 1506.269042 ) < 25.0)

/* ** Variables ** */
enum E_BOXER_DATA {
	bool: E_FIGHTING,
	E_OPPONENT,
	bool: E_INVITED,
	E_INVITE_TIMESTAMP,
	E_ROUNDS_SET,
	E_BET_AMOUNT_SET,
	bool: E_IS_HOST,
	E_SCORE,
	Float: E_PRIOR_HEALTH,
	Float: E_PRIOR_ARMOUR,
	E_PRIOR_WEP[ 12 ],
	E_PRIOR_WEP_AMMO[ 12 ],
	E_PRIOR_SKIN
};

enum E_ARENA_DATA {
	bool: E_OCCUPIED,
	E_CD_TIMER,
	E_CURRENT_ROUNDS,
	E_ROUNDS,
	E_BET
};

new g_boxingPlayerData 				[ MAX_PLAYERS ] [ E_BOXER_DATA ];
new g_boxingArenaData 				[ E_ARENA_DATA ];
new Text3D: arenaLabel 				= Text3D: INVALID_3DTEXT_ID;

/* ** Hooks ** */
Boxing_Init() {
	arenaLabel = CreateDynamic3DTextLabel( "Boxing Arena\n{FFFFFF}/boxing fight", COLOR_GREY, 2655.3022, 1613.6146, 1507.0977, 15.0 );
	return 1;
}

Boxer_OnPlayerConnect(playerid) {
	g_boxingPlayerData[ playerid ] [ E_FIGHTING ] = false;
	g_boxingPlayerData[ playerid ] [ E_OPPONENT ] = -1;
	g_boxingPlayerData[ playerid ] [ E_INVITED ] = false;
	g_boxingPlayerData[ playerid ] [ E_ROUNDS_SET ] = 1;
	g_boxingPlayerData[ playerid ] [ E_BET_AMOUNT_SET ] = 0;
	g_boxingPlayerData[ playerid ] [ E_IS_HOST ] = false;
	g_boxingPlayerData[ playerid ] [ E_SCORE ] = 0;
	return 1;
}

Boxer_OnPlayerDisconnect(playerid) {
	boxing_ForfeitMatch( playerid, g_boxingPlayerData[ playerid ] [ E_OPPONENT ] );
	return 1;
}


Boxer_OnPlayerDeath(playerid)
{
	boxing_ForfeitMatch( playerid, g_boxingPlayerData[ playerid ] [ E_OPPONENT ] );
	return 1;
}

/* ** Commands ** */
CMD:boxing( playerid, params[ ] ) {

	if ( !IsPlayerNearBoxingArena( playerid ) )
		return SendClientMessage( playerid, COLOR_RED, "Du musst dich an der Boxarena befinden." );

	if ( g_boxingArenaData[ E_OCCUPIED ] == true )
		return SendClientMessage( playerid, COLOR_RED, "Die Arena ist aktuell belegt, warte bis der Kampf beendet ist." );

	if ( GetPlayerWantedLevelEx( playerid ) )
		return SendClientMessage( playerid, COLOR_RED, "Du kannst an keinem Boxkampf teilnehmen, wenn du Gesucht wirst." );

	if ( !strcmp( params, "fight", true, 5 ) ) {

		new targetID, betAmount, rounds;

		if ( g_boxingPlayerData[ playerid ] [ E_FIGHTING ] == true )
			return SendClientMessage( playerid, COLOR_RED, "Du kämpfst bereits. Beende erst den aktuellen Kampf." );

		if ( sscanf( params[ 6 ], "uD(0)D(3)", targetID, betAmount, rounds ) )
			return SendClientMessage( playerid, COLOR_YELLOW, "Nutze: /boxing fight [PLAYER_ID] [Geldbetrag (0)] [Runden (3)]" );

		if ( ! IsPlayerConnected( targetID ) )
			return SendClientMessage( playerid, COLOR_RED, "Der Spieler ist nicht Online." );

		if ( targetID == playerid )
			return SendClientMessage( playerid, COLOR_RED, "Du kannst dich nicht selber herausfordern." );

		if ( !IsPlayerNearBoxingArena( targetID ) )
			return SendClientMessage( playerid, COLOR_RED, "Der ausgewählte Spieler befindet sich nicht an der Boxarena." );

		if ( GetPlayerMoneyEx( targetID ) < betAmount )
			return SendClientMessage( playerid, COLOR_RED, "Der ausgewählte Spieler hat nicht so viel Geld für diese Herausforderung." );

		if ( ! ( 0 <= betAmount <= 100000 ) )
			return SendClientMessage( playerid, COLOR_RED, "Bitte wähle einen Betrag zwischen $0 - $100000." );

		if ( rounds != 1 && rounds != 3 && rounds != 5 && rounds != 9 )
			return SendClientMessage( playerid, COLOR_RED, "Bitte wähle zwischen folgenden Runden 1, 3, 5, oder 9." );

		if ( g_boxingPlayerData[ targetID ] [ E_INVITED ] == true )
			return SendClientMessage( playerid, COLOR_RED, "Der Spieler wurde bereits zu einem Kampf herausgefordert." );

		if ( g_boxingPlayerData[ targetID ] [ E_FIGHTING ] == true )
			return SendClientMessage( playerid, COLOR_RED, "Der Spieler kämpft bereits. Warte bis der Spieler seinen Boxkampf beendet hat." );

		if ( GetPlayerWantedLevelEx( targetID ) )
			return SendClientMessage( playerid, COLOR_RED, "Du kannst nicht gegen einen Gesuchten Spieler kämpfen." );

		if ( g_boxingPlayerData[ playerid ] [ E_INVITED ] == true ) {
			SendBoxing( playerid, "Du hast deine Herausforderung gegen %s abgebrochen.", ReturnPlayerName( g_boxingPlayerData[ playerid ] [ E_OPPONENT ] ) );
			SendBoxing( g_boxingPlayerData[ playerid ] [ E_OPPONENT ], "%s hat seine Herausfordern abgebrochen.", ReturnPlayerName( playerid ) );
			ResetBoxingPlayerVariables( playerid, g_boxingPlayerData[ playerid ] [ E_OPPONENT ] );
		}

		g_boxingPlayerData[ playerid ] [ E_INVITED ] = true;
		g_boxingPlayerData[ playerid ] [ E_OPPONENT ] = targetID;
		g_boxingPlayerData[ playerid ] [ E_IS_HOST ] = true;
		g_boxingPlayerData[ playerid ] [ E_ROUNDS_SET ] = rounds;
		g_boxingPlayerData[ playerid ] [ E_BET_AMOUNT_SET ] = betAmount;
		g_boxingPlayerData[ targetID ] [ E_INVITED ] = true;
		g_boxingPlayerData[ targetID ] [ E_OPPONENT ] = playerid;
		g_boxingPlayerData[ targetID ] [ E_INVITE_TIMESTAMP ] = gettime() + 30000;

		if ( g_boxingPlayerData[ playerid ] [ E_BET_AMOUNT_SET ] == 0 ) {

			SendBoxing( playerid, "Du hast %s zu einem Boxkampf mit %i Runde(n) herausgefordert.", ReturnPlayerName( targetID ), g_boxingPlayerData[ playerid ] [ E_ROUNDS_SET ] );
			SendBoxing( playerid, "Um die Herausforderung abzubrechen, nutze /boxing [CANCEL]." );

			SendBoxing( targetID, "%s hat dich zu einem Boxkampf mit %i Runde(n) herausgefordert.", ReturnPlayerName( playerid ), g_boxingPlayerData[ playerid ] [ E_ROUNDS_SET ] );
			SendBoxing( targetID, "Um die Herausforderung anzunehmen oder abzulehnen, nutze /boxing [ACCEPT/DECLINE]." );

		} else {

			SendBoxing( playerid, "Du hast %s zu einem Boxkampf um %s mit %i Runde(n) herausgefordert.", ReturnPlayerName( targetID ), cash_format( g_boxingPlayerData[ playerid ] [ E_BET_AMOUNT_SET ] ), g_boxingPlayerData[ playerid ] [ E_ROUNDS_SET ] );
			SendBoxing( playerid, "Um die Herausforderung abzubrechen, nutze /boxing [CANCEL]." );

			SendBoxing( targetID, "%s hat dich zu einem Boxkampf um %s mit %i Runde(n) herausgefordert.", ReturnPlayerName( playerid ), cash_format( g_boxingPlayerData[ playerid ] [ E_BET_AMOUNT_SET ] ), g_boxingPlayerData[ playerid ] [ E_ROUNDS_SET ] );
			SendBoxing( targetID, "Um die Herausforderung anzunehmen oder abzulehnen, nutze /boxing [ACCEPT/DECLINE]." );

		}
		return 1;

	} else if ( !strcmp( params, "cancel", true, 6 ) ) {

		new opponent = g_boxingPlayerData[ playerid ] [ E_OPPONENT ];

		if ( g_boxingPlayerData[ playerid ] [ E_FIGHTING ] == true )
			return SendClientMessage( playerid, COLOR_RED, "Du befindest dich in einem Boxkampf. Nutze /boxing [FORFEIT] um aufzugeben." );

		if ( g_boxingPlayerData[ playerid ] [ E_IS_HOST ] == false )
			return SendClientMessage( playerid, COLOR_RED, "Du hast keine Herausforderung zum Abbrechen." );

		SendBoxing( opponent, "%s hat die Boxkampf Herausforderung abgebrochen.", SpielerInfo[playerid][sName] );
		SendBoxing( playerid, "Du hast die Boxkampf Herausforderung an %s abgebrochen.", SpielerInfo[opponent][sName] );
		ResetBoxingPlayerVariables( playerid, opponent );
		return 1;

	} else if ( !strcmp( params, "accept", true, 6 ) ) {

		new opponent = g_boxingPlayerData[ playerid ] [ E_OPPONENT ];

		if ( gettime() > g_boxingPlayerData[ playerid ] [ E_INVITE_TIMESTAMP ] && g_boxingPlayerData[ playerid ] [ E_INVITED ] ) {
			SendClientMessage( opponent, COLOR_WHITE, "%s hat versucht die Herausforderung anzunehmen, diese ist allerdings abgelaufen.", SpielerInfo[playerid][sName] );
			ResetBoxingPlayerVariables( playerid, opponent );
			return SendClientMessage( playerid, COLOR_RED, "Die Herausforderung ist abgelaufen." );
		}

		if ( g_boxingPlayerData[ playerid ] [ E_INVITED ] == false )
			return SendClientMessage( playerid, COLOR_RED, "Du hast keine Boxkampf Herausforderung zum Akzeptieren." );

		if ( opponent == -1 )
			return SendClientMessage( playerid, COLOR_RED, "Dein Herausforder ist nicht mehr verfügbar." );

		if ( !IsPlayerNearBoxingArena( opponent ) ) {

			SendClientMessage( playerid, COLOR_RED, "%s befindet sich nicht mehr an der Boxarena. Die Herausforderung wurde abgebrochen.", SpielerInfo[opponent][sName] );
			SendBoxing( opponent, "%s hat versucht deine Herausforderung anzunehmen, du befindest dich nicht mehr an der Boxarena.", SpielerInfo[playerid][sName] );
			return ResetBoxingPlayerVariables( playerid, opponent );

		}

		if ( GetPlayerMoneyEx( playerid ) < g_boxingPlayerData[ opponent ] [ E_BET_AMOUNT_SET ] ) {

			SendClientMessage( playerid, COLOR_RED, "Du hast nicht genug Geld, um an dem Boxkampf teilzunehmen." );
			SendClientMessage( opponent, COLOR_RED, "%s hat nicht genügend Geld, um an dem Boxkampf teilzunehmen.", ReturnPlayerName( playerid ) );
			return ResetBoxingPlayerVariables( playerid, opponent );

		} else if ( GetPlayerMoneyEx( opponent ) < g_boxingPlayerData[ opponent ] [ E_BET_AMOUNT_SET ] ) {

			SendClientMessage( opponent, COLOR_RED, "Du hast nicht genug Geld, um an dem Boxkampf teilzunehmen." );
			SendClientMessage( playerid, COLOR_RED, "%s hat nicht genügend Geld, um an dem Boxkampf teilzunehmen.", ReturnPlayerName( opponent ) );
			return ResetBoxingPlayerVariables( playerid, opponent );

		}

		g_boxingArenaData[ E_OCCUPIED ] = true;

		g_boxingPlayerData[ playerid ] [ E_FIGHTING ] = true;
		g_boxingPlayerData[ playerid ] [ E_INVITED ] = false;

		g_boxingPlayerData[ opponent ] [ E_FIGHTING ] = true;
		g_boxingPlayerData[ opponent ] [ E_INVITED ] = false;
		g_boxingPlayerData[ opponent ] [ E_IS_HOST ] = true;

		return StartMatch( playerid, opponent );

	} else if ( !strcmp( params, "decline", true, 7 ) ) {

		new opponent = g_boxingPlayerData[ playerid ] [ E_OPPONENT ];

		if ( g_boxingPlayerData[ playerid ] [ E_INVITED ] == false )
			return SendClientMessage( playerid, COLOR_RED, "Du hast keine Boxkampf Herausforderung erhalten." );

		if ( g_boxingPlayerData[ playerid ] [ E_OPPONENT ] == -1 )
			return SendClientMessage( playerid, COLOR_RED, "Dein Boxkampf Herausforderung ist abgelaufen." );

		SendBoxing( opponent, "%s hat deine Boxkampf Herausforderun abgelehnt.", ReturnPlayerName( playerid ) );

		SendBoxing( playerid, "Du hast die Boxkampf Herausforderung von %s abgelehnt.", ReturnPlayerName( opponent ) );

		return ResetBoxingPlayerVariables( playerid, opponent );

	} else if ( !strcmp( params, "forfeit", true, 7 ) ) {
		if ( ! boxing_ForfeitMatch( playerid, g_boxingPlayerData[ playerid ] [ E_OPPONENT ] ) ) {
			return SendClientMessage( playerid, COLOR_RED, "Du kämpfst nicht." );
		}
		return 1;
	}
	return SendClientMessage( playerid, COLOR_YELLOW, "Nutze: /boxing [FIGHT/CANCEL/ACCEPT/DECLINE/FORFEIT]" );
}

/* ** Functions ** */
stock StartMatch( playerid, targetID ) {

	if ( g_boxingPlayerData[ playerid ] [ E_FIGHTING ] && g_boxingPlayerData[ targetID ] [ E_FIGHTING ] ) {

		new Float:health_P, Float:armour_P, Float:health_T, Float:armour_T;

		ClearAnimations( playerid );
		GetPlayerHealth( playerid, health_P );
		GetPlayerArmour( playerid, armour_P );
		SetPlayerSpecialAction( playerid, SPECIAL_ACTION_NONE );
		g_boxingPlayerData[ playerid ] [ E_PRIOR_HEALTH ] = health_P;
		g_boxingPlayerData[ playerid ] [ E_PRIOR_ARMOUR ] = armour_P;
		g_boxingPlayerData[ playerid ] [ E_PRIOR_SKIN ] = GetPlayerSkin( playerid );
		SetPlayerSkin( playerid, 81 );

		ClearAnimations( targetID );
		GetPlayerHealth( targetID, health_T );
		GetPlayerArmour( targetID, armour_T );
		SetPlayerSpecialAction( targetID, SPECIAL_ACTION_NONE );
		g_boxingPlayerData[ targetID ] [ E_PRIOR_HEALTH ] = health_T;
		g_boxingPlayerData[ targetID ] [ E_PRIOR_ARMOUR ] = armour_T;
		g_boxingPlayerData[ targetID ] [ E_PRIOR_SKIN ] = GetPlayerSkin( targetID );
		SetPlayerSkin( targetID, 80 );

		// save weapons
		for( new iSlot = 0; iSlot != 12; iSlot++ ) {
			GetPlayerWeaponData( playerid, WEAPON_SLOT:iSlot, WEAPON:g_boxingPlayerData[ playerid ] [ E_PRIOR_WEP ] [ iSlot ], g_boxingPlayerData[ playerid ] [ E_PRIOR_WEP_AMMO ] [ iSlot ] );
			GetPlayerWeaponData( targetID, WEAPON_SLOT:iSlot, WEAPON:g_boxingPlayerData[ targetID ] [ E_PRIOR_WEP ] [ iSlot ], g_boxingPlayerData[ targetID ] [ E_PRIOR_WEP_AMMO ] [ iSlot ] );
		}

		g_boxingArenaData[ E_ROUNDS ] = g_boxingPlayerData[ targetID ] [ E_ROUNDS_SET ];
		g_boxingArenaData[ E_BET ] = g_boxingPlayerData[ targetID ] [ E_BET_AMOUNT_SET ];

		if ( g_boxingArenaData[ E_BET ] > 0 ) {
			GivePlayerMoneyEx( playerid, -g_boxingArenaData[ E_BET ] );
			GivePlayerMoneyEx( targetID, -g_boxingArenaData[ E_BET ] );
		}

		SetBoxingPlayerConfig( playerid, targetID );

		KillTimer( g_boxingArenaData[ E_CD_TIMER ] );
		g_boxingArenaData[ E_CD_TIMER ] = SetTimerEx( "boxingCountDown", 960, false, "d", 5 );

		SendBoxing( playerid, "Du kämpfst gegen %s, %i Runde(n). Viel Erfolg!", ReturnPlayerName( targetID ), g_boxingArenaData[ E_ROUNDS ] );
		SendBoxing( targetID, "Du kämpfst gegen %s, %i Runde(n). Viel Erfolg", ReturnPlayerName( playerid ), g_boxingArenaData[ E_ROUNDS ] );

		UpdateArenaScoreLabel( playerid, targetID );
		return true;

	} else {
		return SendClientMessage( playerid, COLOR_RED, "Es wurde ein Fehler festgestellt, versuch es erneut." );
	}
}

stock NextRound( playerid, targetID )
{
	UpdateArenaScoreLabel( playerid, targetID );
	SetBoxingPlayerConfig( playerid, targetID );
	KillTimer( g_boxingArenaData[ E_CD_TIMER ] );
	g_boxingArenaData[ E_CD_TIMER ] = SetTimerEx( "boxingCountDown", 960, false, "d", 5 );
	return 1;
}

stock EndMatch( playerid, targetID ) {

	new winnerid = g_boxingPlayerData[ targetID ] [ E_SCORE ] > g_boxingPlayerData[ playerid ] [ E_SCORE ] ? targetID : playerid;
	new loserid = winnerid == playerid ? targetID : playerid;

	if ( g_boxingArenaData[ E_BET ] <= 0 ) {
		SendBoxingGlobal( "%s hat einen Boxkampf gewonnen gegen %s gewonnen mit folgender Punkteanzahl %i!", ReturnPlayerName( winnerid ), ReturnPlayerName( loserid ), g_boxingPlayerData[ winnerid ] [ E_SCORE ] );
	} else {
		new winning_prize = floatround( float( g_boxingArenaData[ E_BET ] ) * 1.9 ); // We take 5% of the total pot
		GivePlayerMoneyEx( winnerid, winning_prize );
		SendBoxingGlobal( "%s hat einen Boxkampf gegen %s gewonnen und gewinnt %s mit folgender Punktezahl %i!", ReturnPlayerName( winnerid ), ReturnPlayerName( loserid ), cash_format( g_boxingArenaData[ E_BET ] ), g_boxingPlayerData[ winnerid ] [ E_SCORE ] );
	}

	boxing_RestorePlayer( playerid );
	boxing_RestorePlayer( targetID );

	SetPlayerPos( playerid, 2658.3181, 1607.2100, 1507.1793 );
	SetPlayerPos( targetID, 2652.0947, 1607.2100, 1507.1793 );

	ResetBoxingArenaVariables();
	ResetBoxingPlayerVariables( playerid, targetID );
	UpdateDynamic3DTextLabelText( arenaLabel, COLOR_GREY, "Boxing Arena\n{FFFFFF}/boxing fight" );
	return 1;
}

stock boxing_RestorePlayer( playerid )
{
	// user reported 0xff health, maybe spawn protection
	if ( g_boxingPlayerData[ playerid ] [ E_PRIOR_HEALTH ] > 100.0 ) g_boxingPlayerData[ playerid ] [ E_PRIOR_HEALTH ] = 100.0;
	if ( g_boxingPlayerData[ playerid ] [ E_PRIOR_ARMOUR ] > 100.0 ) g_boxingPlayerData[ playerid ] [ E_PRIOR_ARMOUR ] = 100.0;

	// set prior health
	SetPlayerHealth( playerid, g_boxingPlayerData[ playerid ] [ E_PRIOR_HEALTH ] );
	SetPlayerArmour( playerid, g_boxingPlayerData[ playerid ] [ E_PRIOR_ARMOUR ] );
	SetPlayerSkin( playerid, g_boxingPlayerData[ playerid ] [ E_PRIOR_SKIN ] );
	ResetPlayerWeapons( playerid );

	for ( new iSlot = 0; iSlot != 12; iSlot++ ) {
	    GivePlayerWeapon( playerid, WEAPON:g_boxingPlayerData[ playerid ] [ E_PRIOR_WEP ] [ iSlot ], g_boxingPlayerData[ playerid ] [ E_PRIOR_WEP_AMMO ] [ iSlot ] );
	}
}

stock boxing_ForfeitMatch( playerid, targetID ) {
	if ( ! g_boxingPlayerData[ playerid ] [ E_FIGHTING ] ) return 0;

	if ( g_boxingArenaData[ E_BET ] == 0 ) {
		SendBoxingGlobal( "%s hat einen Boxkampf gegen %s gewonnen.", ReturnPlayerName( targetID ), ReturnPlayerName( playerid ) );
	} else if ( g_boxingArenaData[ E_BET ] > 0 ) {
		GivePlayerMoneyEx( targetID, g_boxingArenaData[ E_BET ] );
		SendBoxingGlobal( "%s hat einen Boxkampf gegen %s gewonnen und gewinnt %s.", ReturnPlayerName( targetID ), ReturnPlayerName( playerid ), cash_format( g_boxingArenaData[ E_BET ] ) );
	}

	boxing_RestorePlayer( playerid );
	SetPlayerPos( playerid, 2658.3181, 1607.2100, 1507.1793 );

	if ( 0 <= targetID < MAX_PLAYERS ) {
		boxing_RestorePlayer( targetID );
		SetPlayerPos( targetID, 2652.0947, 1607.2100, 1507.1793 );
	}

	ResetBoxingArenaVariables();
	ResetBoxingPlayerVariables( playerid, targetID );
	UpdateDynamic3DTextLabelText( arenaLabel, COLOR_GREY, "Boxing Arena\n{FFFFFF}/boxing fight" );
	return 1;
}

stock SetBoxingPlayerConfig( playerid, targetID ) {

	SetPlayerPos( playerid, 2657.4133, 1615.7841, 1507.0977 );
	SetPlayerPos( targetID, 2653.1357, 1611.4575, 1507.0977 );

	SetPlayerFacingAngle( playerid, 136 );
	SetPlayerFacingAngle( targetID, 315 );

	SetCameraBehindPlayer( playerid );
	SetCameraBehindPlayer( targetID );

	SetPlayerHealth( playerid, 100.0 );
	SetPlayerHealth( targetID, 100.0 );

	SetPlayerArmour( playerid, 100.0 );
	SetPlayerArmour( targetID, 100.0 );

	ResetPlayerWeapons( playerid );
	ResetPlayerWeapons( targetID );

	TogglePlayerControllable( playerid, false );
	TogglePlayerControllable( targetID, false );
	return true;

}

forward boxingCountDown( time );
public boxingCountDown( time ) {

	if ( !time ) {
		foreach( new playerid : Player ) {
			if ( g_boxingPlayerData[ playerid ] [ E_FIGHTING ] == true ) {
				GameTextForPlayer( playerid, "~r~FIGHT!", 2000, 3 );
				PlayerPlaySound( playerid, 1057, 0.0, 0.0, 0.0 );
				TogglePlayerControllable( playerid, true );
			}
		}
		g_boxingArenaData[ E_CD_TIMER ] = -1;

	} else {
		foreach( new playerid : Player ) {
			if ( g_boxingPlayerData[ playerid ] [ E_FIGHTING ] == true ) {
                new szNormalString[16];
				format( szNormalString, sizeof( szNormalString ), "~y~%d", time );
				GameTextForPlayer( playerid, szNormalString, 2000, 3 );
				PlayerPlaySound( playerid, 1056, 0.0, 0.0, 0.0 );
			}
		}
		g_boxingArenaData[ E_CD_TIMER ] = SetTimerEx( "boxingCountDown", 960, false, "d", time - 1 );
	}
	return 1;
}

stock UpdateArenaScoreLabel( playerid, opponent ) {
    new szNormalString[128];
	format( szNormalString, sizeof( szNormalString ), "%s [ %i ] - [ %i ] %s", ReturnPlayerName( playerid ), g_boxingPlayerData[ playerid ] [ E_SCORE ], g_boxingPlayerData[ opponent ] [ E_SCORE ], ReturnPlayerName( opponent ) );
	return UpdateDynamic3DTextLabelText( arenaLabel, COLOR_YELLOW, szNormalString );
}

stock ResetBoxingPlayerVariables( playerid, targetID ) {

	g_boxingPlayerData[ playerid ] [ E_INVITED ] = false;
	g_boxingPlayerData[ playerid ] [ E_OPPONENT ] = -1;
	g_boxingPlayerData[ playerid ] [ E_IS_HOST ] = false;
	g_boxingPlayerData[ playerid ] [ E_FIGHTING ] = false;
	g_boxingPlayerData[ playerid ] [ E_SCORE ] = 0;
	TogglePlayerControllable( playerid, true );

	if ( 0 <= targetID < MAX_PLAYERS )
	{
		g_boxingPlayerData[ targetID ] [ E_INVITED ] = false;
		g_boxingPlayerData[ targetID ] [ E_OPPONENT ] = -1;
		g_boxingPlayerData[ targetID ] [ E_IS_HOST ] = false;
		g_boxingPlayerData[ targetID ] [ E_FIGHTING ] = false;
		g_boxingPlayerData[ targetID ] [ E_SCORE ] = 0;
		TogglePlayerControllable( targetID, true );
	}
	return 1;
}

stock ResetBoxingArenaVariables() {
	g_boxingArenaData[ E_OCCUPIED ] = false;
	g_boxingArenaData[ E_CURRENT_ROUNDS ] = 0;
	g_boxingArenaData[ E_ROUNDS ] = 0;
	g_boxingArenaData[ E_BET ] = 0;
	return 1;

}

/* Hooks */
Boxer_OnPlayerGiveDamage( playerid, damagedid)
{
    #pragma unused playerid
	if ( g_boxingPlayerData[ damagedid ] [ E_FIGHTING ] == true ) {

		new Float:currentArmour;

		GetPlayerArmour( damagedid, currentArmour );

		if ( currentArmour <= 0.0 ) {

			new opponent = g_boxingPlayerData[ damagedid ] [ E_OPPONENT ];

			g_boxingPlayerData[ opponent ] [ E_SCORE ] ++;
			g_boxingArenaData[ E_CURRENT_ROUNDS ] ++;

			if ( g_boxingArenaData[ E_CURRENT_ROUNDS ] == g_boxingArenaData[ E_ROUNDS ] ) {
				return EndMatch( damagedid, opponent );
			}

			SendBoxing( damagedid, "Du hast diese Runde verloren, die nächste Runde beginnt." );
			SendBoxing( opponent, "Du hast dieser Runde gewonnen, die nächste Runde beginnt." );

			SendBoxing( damagedid, "Runden %i - [ %s: %i ] - [ %s: %i ]", g_boxingArenaData[ E_ROUNDS ], ReturnPlayerName( damagedid ), g_boxingPlayerData[ damagedid ] [ E_SCORE ], ReturnPlayerName( opponent ), g_boxingPlayerData[ opponent ] [ E_SCORE ]  );
			SendBoxing( opponent, "Runden %i - [ %s: %i ] - [ %s: %i ]", g_boxingArenaData[ E_ROUNDS ], ReturnPlayerName( damagedid ), g_boxingPlayerData[ damagedid ] [ E_SCORE ], ReturnPlayerName( opponent ), g_boxingPlayerData[ opponent ] [ E_SCORE ]  );

			NextRound( damagedid, opponent );
		}
	}
	return 1;

}