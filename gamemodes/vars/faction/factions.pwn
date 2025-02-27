enum FrakDaten
{
	fiFrakID,
	fiFrakKasse,
	fiFrakMembers,
	fiFrakGVerbrecher,
	fiCarRespawn,
	fiCarRespawnTimer,
	fiMats,
	fiDrogen,
	fiBomb,
	fiGFAktiv,
	fiWarGegner,
	fiWarPoints,
	fiSkinordnung,
    fiBaseZugang,
    fiBaseheal,
    fiBnd[20],
    fiGangpunkte,
    fiDrogenUpgrade,
    fiAmmunationUpgrade,
    fiBasehealUpgrade,
    fiGangzonenUpgrade,
    fiMatsUpgrade,
    fiGangFightDisabled,
    fiMasken,
    fiKidnapCMD,
    fiSelldrugsCMD,
    fiGangfightCMD,
    fiBasehealCMD,
    fiMaskeCMD
}
new FrakInfo[20][FrakDaten];

enum ObjectInfo
{
	ID,
	Ersteller[MAX_PLAYER_NAME],
	FID,
	dbID,
	RID[5],
	ObjectID,
	Float:oPosX,
	Float:oPosY,
	Float:oPosZ,
	Float:oPosA,
	bool:Erstellt,
	Geschwindigkeit,
	Kaputt,
	Rauch,
	BlitzerOrt[32]
}
new Blitzer[MAX_BLITZER][ObjectInfo];
new NagelBand[MAX_NAGELBAENDER][ObjectInfo];
new RoadBlock[MAX_SPERREN][ObjectInfo];
new SchildInfo[MAX_SCHILDER][ObjectInfo];