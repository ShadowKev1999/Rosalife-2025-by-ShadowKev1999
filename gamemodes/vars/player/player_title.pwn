#define MAX_SERVER_TITLES       (12)

enum {
    TITLE_GLADIATOR,
    TITLE_RICHMAN,
    TITLE_FACTION,
    TITLE_LOTTO,
    TITLE_GOODGUY,
    TITLE_JAILBROTHER,
    TITLE_PSYCHO,
    TITLE_KNIFER,
    TITLE_CRIMINAL,
    TITLE_KNIFEMAN,
    TITLE_LEVELJUNKIE,
    TITLE_TEAMMEMBER,
}
enum E_SERVER_TITLES {
    tName[32],
    tDescription[64],
    tAmount,
}

new ServerTitles[MAX_SERVER_TITLES][E_SERVER_TITLES] = {
    {"Gladiator", "10.000 Morde", 10000},
    {"Richman", "Besitze 1.000.000 $", 1000000},
    {"Fraktionsmitglied", "Werde Mitglied einer Fraktion.", 1},
    {"Glückspilz", "Gewinne beim Lotto", 1},
    {"Gute Nudel", "Erhalte diesen Titel von einem Teammitglied", 1},
    {"Knastbruder", "50x im Knast gewesen", 50},
    {"Psychopath", "2.000 Morde", 2000},
    {"Schlitzer", "1.000 Morde", 1000},
    {"Schwerverbrecher", "300 Verbrechen", 300},
    {"Sensenmann", "5.000 Morde", 5000},
    {"Suchtbolzen", "Du bist Level 25.", 25},
    {"Teammitglied", "Du bist Teil des redv-reallife.de Team.", 1}
};

new PlayerTitle[MAX_PLAYERS][MAX_SERVER_TITLES][2];
