#define MAX_NEWS_PAPER                      (5)
#define MAX_LINES_NEWSPAPER                 (8)

#define MAX_DRUCKER_FARBE_IN_LAGER          (50)
#define MAX_DRUCKER_PAPIER_IN_LAGER         (100)

#define DRUCKER_FARBE_PER_TIME              (2)
#define DRUCKER_PAPIER_PER_TIME             (5)

#define DRUCKER_FARBEN_LAGER_POS 			1664.2772,732.2159,10.8203
#define DRUCKER_PAPIER_LAGER_POS 			1219.5972,188.6564,20.0033

#define IT_LAGER_POS                        755.7433,-1358.0035,13.5136
#define NEWSPAPER_GET_POS                   645.2206,-1368.4070,13.6298

enum ServerLager_enum {
	drucker_farbe,
	drucker_papier,

	it_lager_papier,
	it_lager_farbe,

	it_newspaper_price,
	it_lager_newspaper,
	it_lager_newspaper_id,

	Text3D:it_lager_label,
	Text3D:it_newspaper_lager_label,
	Text3D:druckerfarbe_label,
	Text3D:druckerpapier_label
}
new ServerLager[ServerLager_enum];

enum newsPaper_enum
{
	SlotUsed,
	dbID,
	Title[32],
	Lines,
}
new NewsPaper[MAX_NEWS_PAPER][newsPaper_enum],
	NewsPaperLine[MAX_NEWS_PAPER][MAX_LINES_NEWSPAPER],
	NewsPaperLines[MAX_NEWS_PAPER][MAX_LINES_NEWSPAPER][64];