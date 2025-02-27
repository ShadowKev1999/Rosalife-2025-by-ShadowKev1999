new
	            p_HideHelpDialogTimer[ MAX_PLAYERS ] = { -1, ... },
    PlayerText: p_HelpBoxTD 		[ MAX_PLAYERS ] = { PlayerText: INVALID_TEXT_DRAW, ... };

HelpDialog_OnPlayerConnect(playerid)
{
    p_HelpBoxTD[ playerid ] = CreatePlayerTextDraw(playerid, 30.000000, 161.000000, "... Loading Help ...");
	PlayerTextDrawBackgroundColour(playerid, p_HelpBoxTD[ playerid ], 255);
	PlayerTextDrawFont(playerid, p_HelpBoxTD[ playerid ], TEXT_DRAW_FONT_1);
	PlayerTextDrawLetterSize(playerid, p_HelpBoxTD[ playerid ], 0.219999, 1.200000);
	PlayerTextDrawColour(playerid, p_HelpBoxTD[ playerid ], -1);
	PlayerTextDrawSetOutline(playerid, p_HelpBoxTD[ playerid ], 0);
	PlayerTextDrawSetProportional(playerid, p_HelpBoxTD[ playerid ], true);
	PlayerTextDrawSetShadow(playerid, p_HelpBoxTD[ playerid ], 1);
	PlayerTextDrawUseBox(playerid, p_HelpBoxTD[ playerid ], true);
	PlayerTextDrawBoxColour(playerid, p_HelpBoxTD[ playerid ], 117);
	PlayerTextDrawTextSize(playerid, p_HelpBoxTD[ playerid ], 170.000000, 0.000000);
    return 1;
}

stock ShowPlayerHelpDialog( playerid, timeout, const format[], OPEN_MP_TAGS:...)
{

	if ( !IsPlayerConnected( playerid ) )
		return 0;


    PlayerTextDrawSetString( playerid, p_HelpBoxTD[ playerid ], format );
    PlayerTextDrawShow( playerid, p_HelpBoxTD[ playerid ] );

    KillTimer( p_HideHelpDialogTimer[ playerid ] );
    p_HideHelpDialogTimer[ playerid ] = -1;

   	if ( timeout != 0 ) {
   		p_HideHelpDialogTimer[ playerid ] = SetTimerEx( "HidePlayerHelpDialog", timeout, false, "d", playerid );
   	}
	return 1;
}

forward HidePlayerHelpDialog( playerid );
public HidePlayerHelpDialog( playerid )
{
	p_HideHelpDialogTimer[ playerid ] = -1;
	PlayerTextDrawHide( playerid, p_HelpBoxTD[ playerid ] );
}