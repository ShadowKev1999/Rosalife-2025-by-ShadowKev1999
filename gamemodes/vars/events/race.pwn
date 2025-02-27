#define MAX_RACES                       20
#define MAX_RACECPS                     35

new
    Float:RaceInfo[MAX_RACES][MAX_RACECPS][3],
	RaceInfoUsed[MAX_RACES][MAX_RACECPS],
	RaceName[MAX_RACES][32],
	RaceCreated[MAX_RACES],
    RaceStarted = -1,
	RaceMaxCps = 0,
	RaceBestzeit[MAX_PLAYERS],
	RaceZeitAfterRace[MAX_PLAYERS],
	RaceWinner,
    RCountDownTimer,
    RCountdownSec,
    PlayerText:RACEdraw[MAX_PLAYERS][6],
    InviteInRace[MAX_PLAYERS],
	RaceCps[MAX_PLAYERS],
	MakeRace[MAX_PLAYERS] = -1;