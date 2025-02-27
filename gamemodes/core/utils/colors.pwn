#define COL_GREEN               	"{6EF83C}"
#define COL_RED                 	"{F81414}"
#define COL_BLUE		           	"{00C0FF}"
#define COL_GOLD                	"{FFDC2E}"
#define COL_GREY                    "{C0C0C0}"
#define COL_WHITE                 	"{FFFFFF}"
#define COL_ORANGE                  "{EE9911}"
#define COL_YELLOW                  "{FFFF00}"
#define COL_AC                      "{FF7500}"
#define COL_ADMIN                 	"{6DFF05}"

#define COLOR_GOLD                  0xFFDC2EFF


//Farben - redv-reallife.de Reloaded
#define COLOR_YELLOW 0xFB944FFF //jetzt wie COLOR_ORANGE - ehemals 0xFFDC00FF
#define COLOR_BLUE 0x00AFFFFF //html 00AFFF
#define COLOR_RED 0xCD2626FF //html CD262F
#define COLOR_SORRY 0xFF0000FF
#define COLOR_ERRORTEXT 0xAFAFAFAA
#define COLOR_SUPER 0x00FF64FF
#define COLOR_GREY 0xD2D2D2FF
#define COLOR_INFO 0x00CDFFFF
#define COLOR_PURPLE 0xC2A2DAAA
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_ICP 0xFFC800FF
#define COLOR_GANGFIGHT 0xFF7800FF
#define COLOR_JOB 0x91480CE5
#define COLOR_GREEN 0x009300FF
#define COLOR_NEWS 0xFFAD00FF
#define COLOR_LIGHTGREEN 0xB9FF00FF
#define COLOR_ORANGE 0xFB944FFF
#define COLOR_CLUB 0x3592D7FF
#define COLOR_CHAT_MUTED 0xFF8282FF // Pink
#define COLOR_NME 0xB360FDFF //Neue Me Farbe
#define     TEAM_OAMT_COLOR     0x3592D7FF

#define     COLOR_HEX_WHITE     "{FFFFFE}"
#define     COLOR_HEX_ORANGE    "{FF6731}"
#define     COLOR_HEX_RED       "{FF1705}"
#define     COLOR_HEX_LIGHTBLUE "{2E94D0}"
#define     COLOR_HEX_BLUE      "{0077FF}"
#define     COLOR_HEX_GREEN     "{15951F}"
#define     COLOR_HEX_GREENA    "{00CC00}"
#define     COLOR_HEX_YELLOW    "{FFFF00}"
#define     COLOR_HEX_BLACK     "{000000}"
#define     COLOR_HEX_PINK      "{AF00FF}"
#define     COLOR_HEX_GRAU      "{555555}"
#define     COLOR_HEX_DARKRED   "{A52A2A}"

/* ** Functions ** */
stock setRed( color, red ) // Set the red intensity on a colour.
{
	if ( red > 0xFF )
	    red	= 0xFF;
	else if ( red < 0x00 )
	    red	= 0x00;

	return ( color & 0x00FFFFFF ) | ( red << 24 );
}

stock setGreen( color, green ) // Set the green intensity on a colour.
{
	if ( green > 0xFF )
	    green	= 0xFF;
	else if ( green < 0x00 )
	    green	= 0x00;

	return ( color & 0xFF00FFFF ) | ( green << 16 );
}

stock setBlue( color, blue ) // Set the blue intensity on a colour.
{
	if ( blue > 0xFF )
	    blue	= 0xFF;
	else if ( blue < 0x00 )
	    blue	= 0x00;

	return ( color & 0xFFFF00FF ) | ( blue << 8 );
}

stock setAlpha( color, alpha ) // Set the alpha intensity on a colour.
{
	if ( alpha > 0xFF )
	    alpha	= 0xFF;
	else if ( alpha < 0x00 )
	    alpha	= 0x00;

	return ( color & 0xFFFFFF00 ) | alpha;
}

stock stripRed( color ) // Remove all red from a colour.
	return ( color ) & 0x00FFFFFF;

stock stripGreen( color ) // Remove all green from a colour.
	return ( color ) & 0xFF00FFFF;

stock stripBlue( color ) // Remove all blue from a colour.
	return ( color ) & 0xFFFF00FF;

stock stripAlpha( color ) // Remove all alpha from a colour.
	return ( color ) & 0xFFFFFF00;

stock fillRed( color ) // Fill all red in a colour.
	return ( color ) | 0xFF000000;

stock fillGreen( color ) // Fill all green in a colour.
	return ( color ) | 0x00FF0000;

stock fillBlue( color ) // Fill all blue in a colour.
	return ( color ) | 0x0000FF00;

stock fillAlpha( color ) // Fill all alpha in a colour.
	return ( color ) | 0x000000FF;

stock getRed( color ) // Get the intensity of red in a colour.
	return ( color >> 24 ) & 0x000000FF;

stock getGreen( color ) // Get the intensity of green in a colour.
	return ( color >> 16 ) & 0x000000FF;

stock getBlue( color ) // Get the intensity of blue in a colour.
	return ( color >> 8 ) & 0x000000FF;

stock getAlpha( color ) // Get the intensity of alpha in a colour.
	return ( color ) & 0x000000FF;

stock makeColor( red=0, green=0, blue=0, alpha=0 ) // Make a colour with the specified intensities.
	return ( setAlpha( setBlue( setGreen( setRed( 0x00000000, red ), green ), blue ), alpha ) );

stock setColor( color, red = -1, green = -1, blue = -1, alpha = -1 ) // Set the properties of a colour.
{
	if ( red != -1 )
	    color = setRed    ( color, red );
	if ( green != -1 )
	    color = setGreen  ( color, green );
	if ( blue != -1 )
	    color = setBlue   ( color, blue );
	if ( alpha != -1 )
	    color = setAlpha  ( color, alpha );

	return color;
}
