COMMAND:insurance(playerid, params[]) {
    new string[256], merkercount = 0;

    if(SpielerInfo[playerid][sHealthInsurance] != -1) {
        new timestamp = SpielerInfo[playerid][sHealthInsuranceTime] - gettime();

        if(floatround(timestamp/86400) > 0)
        {
            format(string, sizeof(string), "Krankenversicherung (%i Tage) - Verbleibende Zeit: %i Tage - Gebühren: %i $\n",
            HealthInsuranceTime[SpielerInfo[playerid][sHealthInsurance]], timestamp/86400, HealthInsuranceCosts[SpielerInfo[playerid][sHealthInsurance]]);
        }
        else if(floatround(timestamp/3600) > 0)
        {
            format(string, sizeof(string), "Krankenversicherung (%i Tage) - Verbleibende Zeit: %i Stunden - Gebühren: %i $\n",
            HealthInsuranceTime[SpielerInfo[playerid][sHealthInsurance]], timestamp/3600, HealthInsuranceCosts[SpielerInfo[playerid][sHealthInsurance]]);
        }
        else if(floatround(timestamp/60) > 0 || floatround(timestamp%60) > 0)
        {
            format(string, sizeof(string), "Krankenversicherung (%i Tage) - Verbleibende Zeit: %i:%02d Minuten - Gebühren: %i $\n",
            HealthInsuranceTime[SpielerInfo[playerid][sHealthInsurance]], timestamp/60,timestamp%60, HealthInsuranceCosts[SpielerInfo[playerid][sHealthInsurance]]);
        }
        merkercount++;
    }
    if(!merkercount) return SendClientMessage(playerid, COLOR_GREY, "Du besitzt aktuell keine Versicherung. Du kannst eine Versicherung in der Stadthalle in Los Santos abschließen");
    ShowPlayerDialog(playerid, DIALOG_NULL, DIALOG_STYLE_MSGBOX, "{FF0000}RSL: {FFFFFF}Meine Versicherungen", string, "Schließen", "");
    return 1;
}