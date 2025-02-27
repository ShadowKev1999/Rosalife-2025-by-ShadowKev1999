#define     MAX_ROBBERIES       (40)
#define     ATTACH_INDEX        (1)     // required for SetPlayerAttachedObject
#define     PLACE_COOLDOWN      (45)     // a robbery place can't be robbed again for x minutes (Default: 45)

enum
{
    DIALOG_ROBBERY = 7500,
    // admin
    DIALOG_ADD_ROBBERY_1,
    DIALOG_ADD_ROBBERY_2,
    DIALOG_ADD_ROBBERY_3,
    DIALOG_ADD_ROBBERY_FINAL,
    DIALOG_REMOVE_ROBBERY
}
 
enum    E_ROBBERY
{
    // robbery name
    rName[32],
    // pos data
    Float: rPosX,
    Float: rPosY,
    Float: rPosZ,
    IntID,
    VWID,
    // robbery data
    Amount,
    ReqTime,
    SafeTime,
    // record
    RecordAmount,
    RecordBy[MAX_PLAYER_NAME],
    // temp
    OccupiedBy,
    Cooldown,
    Timer,
    Checkpoint,
    Text3D: Label,
    bool: Exists
}
 
enum    _:E_ROBBERY_STAGE
{
    STAGE_CRACKING,
    STAGE_OPENING,
    STAGE_ROBBING
}
 
enum    E_PLAYER_ROBBERY
{
    SafeObject[2],
    MoneyStolen,
    RobID,
    RobTime,
    RobStage,
    RobberyTimer
}
 
new
    RobberyData[MAX_ROBBERIES][E_ROBBERY];
    
new
    PlayerRobberyData[MAX_PLAYERS][E_PLAYER_ROBBERY],
    PlayerText: RobberyText[MAX_PLAYERS] = {PlayerText: -1, ...};

Robbery_FindFreeID()
{
    for(new i; i < MAX_ROBBERIES; i++) if(!RobberyData[i][Exists]) return i;
    return -1;
}
 
Robbery_Cooldown(id)
{
    RobberyData[id][Cooldown] = PLACE_COOLDOWN * 60;
    RobberyData[id][Timer] = SetTimerEx("ResetPlace", 1000, true, "i", id);
    
    new string[160];
    format(string, sizeof(string), "Überfall(%d)\n\n{FFFFFF}%s\n{2ECC71}%s - %s {FFFFFF}alle {F1C40F}5 {FFFFFF}Sekunden.\n{E74C3C}Verfügbar in %s", id, RobberyData[id][rName], formatInt(floatround(RobberyData[id][Amount] / 4)), formatInt(RobberyData[id][Amount]), ConvertToMinutes(RobberyData[id][Cooldown]));
    UpdateDynamic3DTextLabelText(RobberyData[id][Label], 0xF1C40FFF, string);
    return 1;
}
 
Robbery_InitPlayer(playerid)
{
    PlayerRobberyData[playerid][SafeObject][0] = PlayerRobberyData[playerid][SafeObject][1] = PlayerRobberyData[playerid][RobID] = PlayerRobberyData[playerid][RobberyTimer] = -1;
    PlayerRobberyData[playerid][MoneyStolen] = PlayerRobberyData[playerid][RobTime] = PlayerRobberyData[playerid][RobStage] = 0;
    
    RobberyText[playerid] = CreatePlayerTextDraw(playerid, 40.000000, 295.000000, "_");
    PlayerTextDrawBackgroundColour(playerid, RobberyText[playerid], 255);
    PlayerTextDrawFont(playerid, RobberyText[playerid], TEXT_DRAW_FONT_1);
    PlayerTextDrawLetterSize(playerid, RobberyText[playerid], 0.240000, 1.100000);
    PlayerTextDrawColour(playerid, RobberyText[playerid], -1);
    PlayerTextDrawSetOutline(playerid, RobberyText[playerid], 1);
    PlayerTextDrawSetProportional(playerid, RobberyText[playerid], true);
    PlayerTextDrawSetSelectable(playerid, RobberyText[playerid], false);
    
    SetPVarInt(playerid, "robberyID", -1);
    
    // preload anims
    //ApplyAnimation(playerid, "COP_AMBIENT", "null", 0.0, false, false, false, false, false);
    //ApplyAnimation(playerid, "ROB_BANK", "null", 0.0, false, false, false, false, false);
    return 1;
}
 
Robbery_ResetPlayer(playerid, check = 0)
{
    new id = PlayerRobberyData[playerid][RobID];
    if(check && id != -1 && PlayerRobberyData[playerid][MoneyStolen] > 0) Robbery_Cooldown(id);
    if(id != -1 && RobberyData[id][OccupiedBy] == playerid) RobberyData[id][OccupiedBy] = -1;
 
    for(new i; i < 2; i++) if(IsValidDynamicObject(PlayerRobberyData[playerid][SafeObject][i])) DestroyDynamicObject(PlayerRobberyData[playerid][SafeObject][i]);
    KillTimer(PlayerRobberyData[playerid][RobberyTimer]);
    RemovePlayerAttachedObject(playerid, ATTACH_INDEX);
    if(!IsPlayerInAnyVehicle(playerid)) ClearAnimations(playerid);
    PlayerTextDrawHide(playerid, RobberyText[playerid]);
    Streamer_Update(playerid);
    
    PlayerRobberyData[playerid][SafeObject][0] = PlayerRobberyData[playerid][SafeObject][1] = PlayerRobberyData[playerid][RobberyTimer] = -1;
    PlayerRobberyData[playerid][MoneyStolen] = PlayerRobberyData[playerid][RobTime] = PlayerRobberyData[playerid][RobStage] = 0;
    
    SetPVarInt(playerid, "robberyID", -1);
    return 1;
}

stock DynamicRobberyInit()
{
    print("  [Robberies] Initializing...");
    for(new i; i < MAX_ROBBERIES; i++)
    {
        RobberyData[i][OccupiedBy] = RobberyData[i][Timer] = RobberyData[i][Checkpoint] = -1;
        RobberyData[i][Label] = Text3D: -1;
    }
    mysql_tquery(sqlHandle, "SELECT * FROM robberies", "onRobberiesLoaded");
    return 1;
}
 
stock DynamicRobberyExit()
{
    foreach(new i : Player)
    {
        if(!IsPlayerConnected(i)) continue;
        Robbery_ResetPlayer(i);
        PlayerTextDrawDestroy(i, RobberyText[i]);
    }
    
    print("  [Robberies] Unloaded.");
    return 1;
}
 
stock DynamicRobberyConnect(playerid)
{
    Robbery_InitPlayer(playerid);
    return 1;
}
 
stock DynamicRobberyDisconnect(playerid)
{
    Robbery_ResetPlayer(playerid);
    return 1;
}
 
stock DynamicRobberyDeath(playerid, killerid)
{
    if(IsPlayerConnected(killerid) && PlayerRobberyData[playerid][MoneyStolen] > 0)
    {
        new string[144], name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        format(string, sizeof(string), "[ROBBERY] {FFFFFF}Du hast den Räuber {F1C40F}%s(%d) {FFFFFF}getötet und erhälst das gestohlene Geld. {2ECC71}(%s)", name, playerid, formatInt(PlayerRobberyData[playerid][MoneyStolen]));
        SendClientMessage(killerid, 0x3498DBFF, string);
        
        Robbery_Cooldown(PlayerRobberyData[playerid][RobID]);
    }
    
    Robbery_ResetPlayer(playerid);
    return 1;
}
 
stock DynamicRobberyStateChange(playerid, PLAYER_STATE:newstate)
{
    if(newstate != PLAYER_STATE_WASTED) Robbery_ResetPlayer(playerid);
    return 1;
}
 
stock DynamicRobberyKeyChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    if(PRESSED(KEY_NO) && PlayerRobberyData[playerid][RobberyTimer] != -1) Robbery_ResetPlayer(playerid, 1);
    return 1;
}
 
stock DynamicRobberyDynEntCheckpoint(playerid, checkpointid)
{
    if(!IsPlayerInAnyVehicle(playerid))
    {
        for(new i; i < MAX_ROBBERIES; i++)
        {
            if(!RobberyData[i][Exists]) continue;
            if(checkpointid == RobberyData[i][Checkpoint])
            {
                SetPVarInt(playerid, "robberyID", i);
 
                if(!IsPlayerConnected(RobberyData[i][OccupiedBy]) && RobberyData[i][Timer] == -1)
                {
                    new title[64];
                    format(title, sizeof(title), "{F1C40F}Robbery: {FFFFFF}%s", RobberyData[i][rName]);
                    ShowPlayerDialog(playerid, DIALOG_ROBBERY, DIALOG_STYLE_MSGBOX, title, "Möchtest du diesen Standort ausrauben", "Ausrauben", "Abbrechen");
                }
 
                break;
            }
        }
    }
    
    return 1;
}
 
stock DynamicRobberyDynLeaCheckpoint(playerid)
{
    if(PlayerRobberyData[playerid][RobberyTimer] != -1)
    {
        if(PlayerRobberyData[playerid][MoneyStolen] > 0)
        {
            new id = PlayerRobberyData[playerid][RobID];
            if(id != -1) Robbery_Cooldown(id);
            
            new string[128];
            format(string, sizeof(string), "~n~~n~~n~~b~~h~~h~Robbery abgebrochen~n~~w~Beute: ~g~~h~~h~%s", formatInt(PlayerRobberyData[playerid][MoneyStolen]));
            GameTextForPlayer(playerid, string, 3000, 3);
            GivePlayerMoneyEx(playerid, PlayerRobberyData[playerid][MoneyStolen]);
        }
        
        Robbery_ResetPlayer(playerid);
    }
    
    SetPVarInt(playerid, "robberyID", -1);
    return 1;
}
 
stock DynamicRobberyDialog(playerid, dialogid, response, const inputtext[])
{
    switch(dialogid)
    {
        /* ---------------------------------------------------------------------- */
        case DIALOG_ROBBERY:
        {
            if(!response) return 1;
            if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Der Befehl kann nicht innerhalb eines Fahrzeuges verwendet werden.");
            new id = GetPVarInt(playerid, "robberyID");
            if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht an einem Ort, den du überfallen könntest.");
            if(IsPlayerConnected(RobberyData[id][OccupiedBy])) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Dieser Standort wird bereits ausgeraubt.");
            if(!IsPlayerInDynamicCP(playerid, RobberyData[id][Checkpoint])) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht an einem Ort, den du überfallen könntest.");
            new Float: x, Float: y, Float: z, Float: a;
            GetPlayerPos(playerid, x, y, z);
            GetPlayerFacingAngle(playerid, a);
            
            x += (1.25 * floatsin(-a, degrees));
            y += (1.25 * floatcos(-a, degrees));
            PlayerRobberyData[playerid][SafeObject][0] = CreateDynamicObject(19618, x, y, z-0.55, 0.0, 0.0, a, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
 
            a += 90.0;
            x += (0.42 * floatsin(-a, degrees)) + (-0.22 * floatsin(-(a - 90.0), degrees));
            y += (0.42 * floatcos(-a, degrees)) + (-0.22 * floatcos(-(a - 90.0), degrees));
            PlayerRobberyData[playerid][SafeObject][1] = CreateDynamicObject(19619, x, y, z-0.55, 0.0, 0.0, a + 270.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
            
            PlayerRobberyData[playerid][MoneyStolen] = 0;
            PlayerRobberyData[playerid][RobID] = id;
            PlayerRobberyData[playerid][RobTime] = RobberyData[id][SafeTime];
            PlayerRobberyData[playerid][RobStage] = STAGE_CRACKING;
            PlayerRobberyData[playerid][RobberyTimer] = SetTimerEx("Robbery", 1000, true, "ii", playerid, id);
            RobberyData[id][OccupiedBy] = playerid;
            
            SetPlayerAttachedObject(playerid, ATTACH_INDEX, 18634, 6, 0.054000, 0.013999, -0.087999, -94.399963, -25.899974, 175.799911);
            ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_LOOP", 4.0, true, false, false, false, 0);
            
            new string[128];
            format(string, sizeof(string), "~b~~h~Robbery~n~~n~~w~Safe knacken...~n~Erfolgreich in ~r~%s", ConvertToMinutes(RobberyData[id][SafeTime]));
            PlayerTextDrawSetString(playerid, RobberyText[playerid], string);
            PlayerTextDrawShow(playerid, RobberyText[playerid]);
            
            if(RobberyData[id][RecordAmount] > 0)
            {
                format(string, sizeof(string), "[ROBBERY] {F1C40F}%s {FFFFFF}hält den Rekord von {2ECC71}%s {FFFFFF}Beute.", RobberyData[id][RecordBy], formatInt(RobberyData[id][RecordAmount]));
                SendClientMessage(playerid, 0x3498DBFF, string);
            }
            
            SendClientMessage(playerid, 0x3498DBFF, "[ROBBERY] {FFFFFF}Du kannst mit {F1C40F}~k~~CONVERSATION_NO~ {FFFFFF}den Überfall abbrechen.");
            Streamer_Update(playerid);
            return 1;
        }
        /* ---------------------------------------------------------------------- */
        case DIALOG_ADD_ROBBERY_1:
        {
            if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
            if(!response) return 1;
            if(isnull(inputtext)) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_1, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 1)", "{E74C3C}Du musst einen Namen eingeben.\n\n{FFFFFF}Gib einen Namen für diesen Überfall ein:", "Weiter", "Abbrechen");
            SetPVarString(playerid, "robberyName", inputtext);
            ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_2, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 2)", "Safe knacken (in Sekunden):", "Weiter", "Zurück");
            return 1;
        }
        /* ---------------------------------------------------------------------- */
        case DIALOG_ADD_ROBBERY_2:
        {
            if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
            if(!response) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_1, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 1)", "Gib einen Namen für diesen Überfall ein:", "Weiter", "Abbrechen");
            if(isnull(inputtext)) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_2, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 2)", "{E74C3C}Fehlerhafte Eingabe.\n\n{FFFFFF}Safe knacken (in Sekunden):", "Weiter", "Zurück");
            SetPVarInt(playerid, "robberySafeDur", strval(inputtext));
            ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_3, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 3)", "Länge des Raubes (in Sekunden, Zeit muss durch 5 teilbar sein)", "Weiter", "Zurück");
            return 1;
        }
        /* ---------------------------------------------------------------------- */
        case DIALOG_ADD_ROBBERY_3:
        {
            if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
            if(!response) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_2, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 2)", "Safe knacken (in Sekunden):", "Weiter", "Zurück");
            if(isnull(inputtext)) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_3, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 3)", "{E74C3C}Fehlerhafte Eingabe.\n\n{FFFFFF}Länge des Raubes (in Sekunden, Zeit muss durch 5 teilbar sein):", "Weiter", "Zurück");
            new dur = strval(inputtext);
            if(dur < 1 || (dur % 5) != 0) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_3, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 3)", "{E74C3C}Fehlerhafte Eingabe.\n\n{FFFFFF}Länge des Raubes (in Sekunden, Zeit muss durch 5 teilbar sein):", "Weiter", "Zurück");
            SetPVarInt(playerid, "robberyDur", dur);
            ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_FINAL, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 4)", "Geldbetrag:", "Fertigstellen", "Zurück");
            return 1;
        }
        /* ---------------------------------------------------------------------- */
        case DIALOG_ADD_ROBBERY_FINAL:
        {
            if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
            if(!response) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_3, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 3)", "Länge des Raubes (in Sekunden, Zeit muss durch 5 teilbar sein):", "Weiter", "Zurück");
            if(isnull(inputtext)) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_FINAL, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 4)", "{E74C3C}Fehlerhafte Eingabe.\n\n{FFFFFF}Geldbetrag:", "Fertigstellen", "Zurück");
            if(strval(inputtext) < 1) return ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_FINAL, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 4)", "{E74C3C}Fehlerhafte Eingabe.\n\n{FFFFFF}Geldbetrag:", "Fertigstellen", "Zurück");
 
            new id = Robbery_FindFreeID();
            if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du kannst keine weiteren Überfälle erstellen.");
            new Float: x, Float: y, Float: z, vwid = GetPlayerVirtualWorld(playerid), intid = GetPlayerInterior(playerid), string[160];
            GetPlayerPos(playerid, x, y, z);
 
            GetPVarString(playerid, "robberyName", RobberyData[id][rName], 32);
            RobberyData[id][rPosX] = x;
            RobberyData[id][rPosY] = y;
            RobberyData[id][rPosZ] = z;
            RobberyData[id][IntID] = intid;
            RobberyData[id][VWID] = vwid;
            RobberyData[id][Amount] = strval(inputtext);
            RobberyData[id][ReqTime] = GetPVarInt(playerid, "robberyDur");
            RobberyData[id][SafeTime] = GetPVarInt(playerid, "robberySafeDur");
            RobberyData[id][RecordAmount] = 0;
            RobberyData[id][RecordBy][0] = EOS;
            
            RobberyData[id][OccupiedBy] = -1;
            RobberyData[id][Cooldown] = 0;
            RobberyData[id][Timer] = -1;
            
            RobberyData[id][Checkpoint] = CreateDynamicCP(x, y, z, 1.25, vwid, intid, .streamdistance = 5.0);
 
            format(string, sizeof(string), "Überfall(%d)\n\n{FFFFFF}%s\n{2ECC71}%s - %s {FFFFFF}alle {F1C40F}5 {FFFFFF}Sekunden.\n{2ECC71}Verfügbar", id, RobberyData[id][rName], formatInt(floatround(RobberyData[id][Amount] / 4)), formatInt(RobberyData[id][Amount]));
            RobberyData[id][Label] = CreateDynamic3DTextLabel(string, 0xF1C40FFF, x, y, z + 0.25, 10.0, _, _, 1, vwid, intid);
            
            RobberyData[id][Exists] = true;

            new query[256];
            mysql_format(sqlHandle, query, sizeof(query),
            "INSERT INTO `robberies` (id, name, posx, posy, posz, interiorid, virtualworld, amount, requiredtime, safetimer) VALUES (%d, '%s', %f, %f, %f, %d, %d, %d, %d, %d)",
            id, RobberyData[id][rName], x, y, z, intid, vwid, RobberyData[id][Amount], RobberyData[id][ReqTime], RobberyData[id][SafeTime]);
            mysql_tquery(sqlHandle, query);    
        
            SendClientMessage(playerid, 0x3498DBFF, "[ROBBERY] {FFFFFF}Überfall erstellt.");
            return 1;
        }
        /* ---------------------------------------------------------------------- */
        case DIALOG_REMOVE_ROBBERY:
        {
            if(!response) return 1;
            if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
            new id = strval(inputtext);
            if(!RobberyData[id][Exists]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Der ausgewähle Überfall existiert nicht.");
            foreach(new i : Player)
            {
                if(!IsPlayerConnected(i)) continue;
                if(PlayerRobberyData[i][RobID] == id) Robbery_ResetPlayer(i);
            }
            
            if(RobberyData[id][Timer] != -1) KillTimer(RobberyData[id][Timer]);
            DestroyDynamicCP(RobberyData[id][Checkpoint]);
            DestroyDynamic3DTextLabel(RobberyData[id][Label]);
            
            RobberyData[id][OccupiedBy] = RobberyData[id][Timer] = RobberyData[id][Checkpoint] = -1;
            RobberyData[id][Label] = Text3D: -1;
            RobberyData[id][Exists] = false;

            new query[128];
            mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `robberies` WHERE `id` = %d", id);
            mysql_tquery(sqlHandle, query);

            SendClientMessage(playerid, 0x3498DBFF, "[ROBBERY] {FFFFFF}Überfall entfernt.");
            return 1;
        }
        /* ---------------------------------------------------------------------- */
    }
    
    return 0;
}
 
forward Robbery(playerid, id);
public Robbery(playerid, id)
{
    new string[128];
    if(PlayerRobberyData[playerid][RobTime] > 1) {
        PlayerRobberyData[playerid][RobTime]--;
 
        switch(PlayerRobberyData[playerid][RobStage])
        {
            case STAGE_CRACKING:
            {
                format(string, sizeof(string), "~b~~h~Robbery~n~~n~~w~Safe knacken...~n~Erfolgreich in ~r~%s", ConvertToMinutes(PlayerRobberyData[playerid][RobTime]));
                PlayerTextDrawSetString(playerid, RobberyText[playerid], string);
            }
            
            case STAGE_OPENING:
            {
                format(string, sizeof(string), "~b~~h~Robbery~n~~n~~w~Safe oeffnen...~n~Erfolgreich in ~r~%s", ConvertToMinutes(PlayerRobberyData[playerid][RobTime]));
                PlayerTextDrawSetString(playerid, RobberyText[playerid], string);
            }
 
            case STAGE_ROBBING:
            {
                if(PlayerRobberyData[playerid][RobTime] % 5 == 0)
                {
                    PlayerRobberyData[playerid][MoneyStolen] += RandomEx(floatround(RobberyData[id][Amount] / 4), RobberyData[id][Amount]);
                    PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
                }
                
                format(string, sizeof(string), "~b~~h~Robbery~n~~n~~w~Beute: ~g~~h~~h~%s~n~Erfolgreich in ~r~%s", formatInt(PlayerRobberyData[playerid][MoneyStolen]), ConvertToMinutes(PlayerRobberyData[playerid][RobTime]));
                PlayerTextDrawSetString(playerid, RobberyText[playerid], string);
            }
        }
    }else if(PlayerRobberyData[playerid][RobTime] == 1) {
        switch(PlayerRobberyData[playerid][RobStage])
        {
            case STAGE_CRACKING:
            {
                new Float: x, Float: y, Float: z, Float: a;
                GetDynamicObjectPos(PlayerRobberyData[playerid][SafeObject][1], x, y, z);
                GetDynamicObjectRot(PlayerRobberyData[playerid][SafeObject][1], a, a, a);
                MoveDynamicObject(PlayerRobberyData[playerid][SafeObject][1], x, y, z+0.015, 0.005, 0.0, 0.0, a+230.0);
                
                PlayerRobberyData[playerid][RobTime] = 4;
                PlayerRobberyData[playerid][RobStage] = STAGE_OPENING;
                PlayerTextDrawSetString(playerid, RobberyText[playerid], "~b~~h~Robbery~n~~n~~w~Safe oeffnen...~n~Erfolgreich in ~r~00:04");
                RemovePlayerAttachedObject(playerid, ATTACH_INDEX);
                ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Open", 4.0, false, false, false, false, 0, SYNC_ALL);
                PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
            }
            
            case STAGE_OPENING:
            {
                PlayerRobberyData[playerid][RobTime] = RobberyData[id][ReqTime];
                PlayerRobberyData[playerid][RobStage] = STAGE_ROBBING;
                SetPlayerAttachedObject(playerid, ATTACH_INDEX, 1550, 1, 0.029999, -0.265000, 0.017000, 6.199993, 88.800003, 0.0);
                format(string, sizeof(string), "~b~~h~Robbery~n~~n~~w~Beute: ~g~~h~~h~$0~n~Erfolgreich in ~r~%s", ConvertToMinutes(RobberyData[id][ReqTime]));
                PlayerTextDrawSetString(playerid, RobberyText[playerid], string);
                ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.0, true, false, false, false, 0, SYNC_ALL);
                PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
            }
 
            case STAGE_ROBBING:
            {
                Robbery_Cooldown(id);
 
                format(string, sizeof(string), "~n~~n~~n~~b~~h~~h~Robbery Complete~n~~w~Beute: ~g~~h~~h~%s", formatInt(PlayerRobberyData[playerid][MoneyStolen]));
                GameTextForPlayer(playerid, string, 3000, 3);
                GivePlayerMoneyEx(playerid, PlayerRobberyData[playerid][MoneyStolen]);
                PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
 
                new __name[MAX_PLAYER_NAME];
                GetPlayerName(playerid, __name, MAX_PLAYER_NAME);
                format(string, sizeof(string), "[ROBBERY] {FFFFFF}%s(%d) hat {2ECC71}%s {FFFFFF}aus {F1C40F}%s {FFFFFF}gestohlen.", __name, playerid, formatInt(PlayerRobberyData[playerid][MoneyStolen]), RobberyData[id][rName]);
                ProxDetector(10.0, playerid, string, 0x3498DBFF,0x3498DBFF,0x3498DBFF,0x3498DBFF,0x3498DBFF);
 
                if(PlayerRobberyData[playerid][MoneyStolen] > RobberyData[id][RecordAmount])
                {
                    RobberyData[id][RecordAmount] = PlayerRobberyData[playerid][MoneyStolen];
                    format(RobberyData[id][RecordBy], 24, "%s", __name);
                    
                    SendClientMessage(playerid, 0x3498DBFF, "[ROBBERY] {FFFFFF}Du hast einen neuen Rekord aufgestellt!");
                    
                    format(string, sizeof(string), "[ROBBERY] {FFFFFF}Deshalb erhälst du 15 Prozent Bonus {2ECC71}(%s)", formatInt(floatround(PlayerRobberyData[playerid][MoneyStolen] * 0.15)));
                    SendClientMessage(playerid, 0x3498DBFF, string);
                    
                    GivePlayerMoneyEx(playerid, floatround(PlayerRobberyData[playerid][MoneyStolen] * 0.15));
                    
                    new query[128];
                    mysql_format(sqlHandle, query, sizeof(query), "UPDATE `robberies` SET `recamount` = %d, `recby` = '%s' WHERE `id` = %d",
                    RobberyData[id][RecordAmount], RobberyData[id][RecordBy], id);
                    mysql_tquery(sqlHandle, query);
                }

                SetPlayerWantedLevelEx(playerid, GetPlayerWantedLevelEx(playerid) +3);
                SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Überwachungskamera hat dich bemerkt und die Bilder an die Polizei weitergegeben.");
                format(string, sizeof(string), "ZENTRALE: AN ALLE EINHEITEN !! Überfall auf %s", RobberyData[id][rName]);
                SendCopMessage(COLOR_BLUE, string);
                format(string,sizeof(string),"ZENTRALE: Der Täter wurde identifiziert. Verbrecher %s", SpielerInfo[playerid][sName]);
                SendCopMessage(COLOR_BLUE,string);
                
                Robbery_ResetPlayer(playerid);
            }
        }
    }
    
    return 1;
}
 
forward ResetPlace(id);
public ResetPlace(id)
{
    new string[160];
    if(RobberyData[id][Cooldown] > 1) {
        RobberyData[id][Cooldown]--;
 
        format(string, sizeof(string), "Überfall(%d)\n\n{FFFFFF}%s\n{2ECC71}%s - %s {FFFFFF}alle {F1C40F}5 {FFFFFF}Sekunden.\n{E74C3C}Verfügbar in %s", id, RobberyData[id][rName], formatInt(floatround(RobberyData[id][Amount] / 4)), formatInt(RobberyData[id][Amount]), ConvertToMinutes(RobberyData[id][Cooldown]));
        UpdateDynamic3DTextLabelText(RobberyData[id][Label], 0xF1C40FFF, string);
    }else if(RobberyData[id][Cooldown] == 1) {
        KillTimer(RobberyData[id][Timer]);
        RobberyData[id][Cooldown] = 0;
        RobberyData[id][Timer] = -1;
        
        format(string, sizeof(string), "Überfall(%d)\n\n{FFFFFF}%s\n{2ECC71}%s - %s {FFFFFF}alle {F1C40F}5 {FFFFFF}Sekunden.\n{2ECC71}Verfügbar", id, RobberyData[id][rName], formatInt(floatround(RobberyData[id][Amount] / 4)), formatInt(RobberyData[id][Amount]));
        UpdateDynamic3DTextLabelText(RobberyData[id][Label], 0xF1C40FFF, string);
    }
    
    return 1;
}
 
CMD:createrobbery(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    new id = Robbery_FindFreeID();
    if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Es können keine weiteren Überfälle erstellt werden.");
    ShowPlayerDialog(playerid, DIALOG_ADD_ROBBERY_1, DIALOG_STYLE_INPUT, "{F1C40F}Robbery: {FFFFFF}Hinzufügen (Schritt 1)", "Nenne eine Bezeichnung für diesen Überfall", "Weiter", "Abbrechen");
    return 1;
}
 
CMD:removerobbery(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    new string[1024], total;
    format(string, sizeof(string), "ID\tName\n");
    
    for(new i; i < MAX_ROBBERIES; i++)
    {
        if(!RobberyData[i][Exists]) continue;
        format(string, sizeof(string), "%s%d\t%s\n", string, i, RobberyData[i][rName]);
        total++;
    }
    
    if(total == 0) {
        SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Es wurden noch keine Überfälle erstellt.");
    }else{
        ShowPlayerDialog(playerid, DIALOG_REMOVE_ROBBERY, DIALOG_STYLE_TABLIST_HEADERS, "{F1C40F}Robbery: {FFFFFF}Entfernen", string, "Entfernen", "Abbrechen");
    }
    
    return 1;
}

forward onRobberiesLoaded();
public onRobberiesLoaded() {
    print("  [Robberies] Loading robbery data...");

    new rows;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            new id, label[160];
            cache_get_value_name_int(i, "id", id);

            cache_get_value_name(i, "name", RobberyData[id][rName]);
            cache_get_value_name_float(i, "posx", RobberyData[id][rPosX]);
            cache_get_value_name_float(i, "posy", RobberyData[id][rPosY]);
            cache_get_value_name_float(i, "posz", RobberyData[id][rPosZ]);

            cache_get_value_name_int(i, "interiorid", RobberyData[id][IntID]);
            cache_get_value_name_int(i, "virtualworld", RobberyData[id][VWID]);
            cache_get_value_name_int(i, "amount", RobberyData[id][Amount]);
            cache_get_value_name_int(i, "requiredtime", RobberyData[id][ReqTime]);
            cache_get_value_name_int(i, "safetimer", RobberyData[id][SafeTime]);
            cache_get_value_name_int(i, "recamount", RobberyData[id][RecordAmount]);
            cache_get_value_name(i, "recby", RobberyData[id][RecordBy]);

            RobberyData[id][Checkpoint] = CreateDynamicCP(RobberyData[id][rPosX], RobberyData[id][rPosY], RobberyData[id][rPosZ], 1.25, RobberyData[id][VWID], RobberyData[id][IntID], .streamdistance = 5.0);
 
            format(label, sizeof(label), "Überfall(%d)\n\n{FFFFFF}%s\n{2ECC71}%s - %s {FFFFFF}alle {F1C40F}5 {FFFFFF}Sekunden.\n{2ECC71}Verfügbar", id, RobberyData[id][rName], formatInt(floatround(RobberyData[id][Amount] / 4)), formatInt(RobberyData[id][Amount]));
            RobberyData[id][Label] = CreateDynamic3DTextLabel(label, 0xF1C40FFF, RobberyData[id][rPosX], RobberyData[id][rPosY], RobberyData[id][rPosZ] + 0.25, 10.0, _, _, 1, RobberyData[id][VWID], RobberyData[id][IntID]);
            
            RobberyData[id][Exists] = true;
        }
        return 1;
    }
    printf("  [Robberies] Loaded %d robberies.", rows);
    return 1;
}