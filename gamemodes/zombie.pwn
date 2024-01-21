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


main()
{
	print("\n\n----------------------------------");
	print("Project ZS Loaded.\n");
	print("----------------------------------\n");
}

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid,"~w~SA-MP: ~r~Bare Script",5000,5);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("Bare Script");
	return 1;
}
