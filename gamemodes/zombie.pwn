//----------------------------------------------------------//
//                                                          //
//  ZOMBIE SURVIVAL                                         //
//  A zombie server developed by Bald_11 and Humanoid       //
//                                                          //
//----------------------------------------------------------//


//-------------------- INCLUDES ----------------------------//

#include <open.mp>
#include <zcmd>

#pragma tabsize 0

//-------------------- DEFINES -----------------------------//



//---------------- FORWARD DECLARATION ----------------------//


//---------------- FORWARD DECLARATION ----------------------//
forward SpawnPlayerCheckpoint(playerid);
forward DestroyObjectTimer(objectid);

//-------------------- DEFINES TEAMS-----------------------------//
#define TEAM_HUMANS 0
#define TEAM_ZOMBIES 1
//-------------------- DEFINES COLORS-----------------------------//

#define COLOR_HUMAN 0x08ff41AA
#define COLOR_ZOMBIE 0xff0d00AA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_LIME 0x10F441AA
#define COLOR_MAGENTA 0xFF00FFFF
#define COLOR_NAVY 0x000080AA
#define COLOR_AQUA 0xFF000000
#define COLOR_CRIMSON 0xDC143CAA
#define COLOR_FLBLUE 0x6495EDAA
#define COLOR_BISQUE 0xFFE4C4AA
#define COLOR_BLACK 0x000000AA
#define COLOR_CHARTREUSE 0x7FFF00AA
#define COLOR_BROWN 0xA52A2AAA
#define COLOR_CORAL 0xFF7F50AA
#define COLOR_GOLD 0xB8860BAA
#define COLOR_GREENYELLOW 0xADFF2FAA
#define COLOR_INDIGO 0x4B00B0AA
#define COLOR_IVORY 0xFFFF82AA
#define COLOR_LAWNGREEN 0x7CFC00AA
#define COLOR_SEAGREEN 0x20B2AAAA
#define COLOR_LIMEGREEN 0x32CD32AA
#define COLOR_MIDNIGHTBLUE 0X191970AA
#define COLOR_MAROON 0x800000AA
#define COLOR_OLIVE 0x808000AA
#define COLOR_ORANGERED 0xFF4500AA
#define COLOR_WELCOME 0x00ccffAA
//----------------------- DEFINES DIALOGS -----------------------//
#define DIALOG_ID_CHECKPOINT 0
#define DIALOG_SHOPCHECKPOINT 1
#define DIALOG_WEAPONSHOP 2
#define DIALOG_KITSHOP 3
#define DIALOG_SKINSHOP 4








main()
{
	print("\n\n----------------------------------");
	print("B&H Zombies VS Humans Loaded.\n");
	print("----------------------------------\n");
}



public OnPlayerConnect(playerid)
{
	new playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playername, sizeof(playername));
    new message[128];
    format(message, sizeof(message), "%s(%d) has joined the war from Unknown", playername, playerid);
    SendClientMessageToAll(COLOR_WELCOME, message);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerSpawn(playerid)
{
	SpawnPlayerCheckpoint(playerid);
	return 1;
}

public SpawnPlayerCheckpoint(playerid)
{
    new Float:playerPos[3];
    GetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2]);
    new Float:offsetX = 5.0;
    new Float:offsetY = 5.0;
    new Float:checkpointPos[3];
    checkpointPos[0] = playerPos[0] + offsetX;
    checkpointPos[1] = playerPos[1] + offsetY;
    checkpointPos[2] = playerPos[2];
    SetPlayerCheckpoint(0, checkpointPos[0], checkpointPos[1], checkpointPos[2], 3.0);
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("Zombies And Humans/TDM/RP");
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Humans Shop", "Weapons And Ammunition\nKits\nSpecial Skins", "Select", "Close");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == 1)
    {
        if (response)
{
    if (listitem == 0)
    {
        ShowPlayerDialog(playerid, 2, DIALOG_STYLE_TABLIST_HEADERS, "Weapons And Ammunition", "Weapon\tPrice\tAmmo\n\
    9mm Pistol\t\t\n\
    Silenced Pistol\t\t\n\
    Shotgun\t\t\n\
    Micro Uzi\t\t\n\
    Tec 9\t\t\n\
    Mp5\t\t\n\
    AK-47\t\t", "Purchase", "Close");
    }
    else if (listitem == 1)
    {
        ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Kit Shop", "Cure Kit - 10 Coins - Cures Infections\nMedic Kit - 10 Coins - Fully Heals You", "Purchase", "Close");
        return 1;
    }
    else if (listitem == 2)
    {
        ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Skin Shop", "Catalina - 500 Cash\nRyder - 1000 Cash\nTruth - 1000 Cash\nMaccer - 1000 Cash", "Purchase", "Close");
        return 1;
    }
}
    if (dialogid == 4)
{
    if (response)
    {
        if (listitem == 0)
        {
            SetPlayerSkin(playerid, 298);
            return 0;
        }
        else if (listitem == 1)
        {
            SetPlayerSkin(playerid, 271);
            return 0;
        }
        else if (listitem == 2)
        {
            SetPlayerSkin(playerid, 1);
            return 0;
        }
        else if (listitem == 3)
        {
            SetPlayerSkin(playerid, 2);
            return 0;
        }
    }
}

    }
    return 1;
}

CMD:place(playerid, params[])
{   
    new Float:playerPos[3];
    GetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2]);
    new Float:offsetX = 5.0;
    new Float:offsetY = 5.0;
    new Float:offsetZ = 5.0;
    new Float:ObjectPos[3];
    ObjectPos[0] = playerPos[0] + offsetX;
    ObjectPos[1] = playerPos[1] + offsetY;
    ObjectPos[2] = playerPos[2] + offsetZ;
    new objectid = CreateObject(5259, ObjectPos[0], ObjectPos[1], ObjectPos[2], Float:0.0, Float:0.0, Float:0.0);
    SetTimerEx("DestroyObjectTimer", 5000, false, "i", objectid);
    return 1;
}

public DestroyObjectTimer(objectid)
{
    if (IsValidObject(objectid))
    {
        DestroyObject(objectid);
    }
    return 0;
}
