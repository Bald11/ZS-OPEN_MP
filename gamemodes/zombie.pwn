//----------------------------------------------------------//
//                                                          //
//  ZOMBIE SURVIVAL                                         //
//  A zombie server developed by Bald_11 and Humanoid       //
//                                                          //
//----------------------------------------------------------//


//-------------------- INCLUDES ----------------------------//

#include <open.mp>

#pragma tabsize 0

//-------------------- DEFINES -----------------------------//



//---------------- FORWARD DECLARATION ----------------------//


forward SpawnPlayerCheckpoint(playerid);




//-------------------- DEFINES TEAMS-----------------------------//
#define TEAM_HUMANS = 0
#define TEAM_ZOMBIES = 1
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
//---------------------------------------
#define DIALOG_ID_CHECKPOINT 1
#define DIALOG_NULL 0









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
    	format(message, sizeof(message), "%s (%d) has joined the war from Unknown", playername, playerid);
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
    new Float:offsetX = 2.0;
    new Float:offsetY = 2.0;
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
	ShowPlayerDialog(playerid, DIALOG_NULL, DIALOG_STYLE_LIST, "Shop", "Weapons\nKits\nSpecial Skins", "Select", "Close");

	return 1;
}