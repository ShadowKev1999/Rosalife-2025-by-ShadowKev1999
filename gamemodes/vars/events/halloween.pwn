#define Halloween::						Halloween_

#define	MAX_HALLOWEEN_GIFTS		        (50)
#define REFRESH_HALLOWEEN_GIFTS		    (2*60*60*1000) //alle 2 Stunden

new STREAMER_TAG_PICKUP:Halloween::Pickup[MAX_HALLOWEEN_GIFTS],
	Float:				Halloween::SpawnZoneRectangle[4],
						Halloween::SpawnZoneType,
						Halloween::Timer;

new HalloweenPickupModel[][1] = {
    {19320},	//pumpkin
    {19527},	//cauldron
    {19339}		//coffin
};