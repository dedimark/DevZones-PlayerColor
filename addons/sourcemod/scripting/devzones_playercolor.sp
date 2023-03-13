#include <sourcemod>
#include <devzones>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "SM DEV ZONES - Player Color", 
	author = "ByDexter", 
	description = "", 
	version = "1.1", 
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if (IsValidClient(client) && StrContains(zone, "setcolor", false) != -1)
	{
		char colors[25];
		int clr[4];
		
		Format(colors, 25, "%s%s%s", colors[0], colors[1], colors[2]);
		clr[0] = StringToInt(colors);
		Format(colors, 25, "%s%s%s", colors[4], colors[5], colors[6]);
		clr[1] = StringToInt(colors);
		Format(colors, 25, "%s%s%s", colors[8], colors[9], colors[10]);
		clr[2] = StringToInt(colors);
		Format(colors, 25, "%s%s%s", colors[12], colors[13], colors[14]);
		clr[3] = StringToInt(colors);
		
		SetEntityRenderColor(client, clr[0], clr[1], clr[2], clr[3]);
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if (IsValidClient(client) && StrContains(zone, "setcolor", false) != -1)
	{
		SetEntityRenderColor(client, 255, 255, 255, 255);
	}
}

bool IsValidClient(int client, bool nobots = true)
{
	if (client <= 0 || client > MaxClients || !IsClientConnected(client) || (nobots && IsFakeClient(client)))
	{
		return false;
	}
	return IsClientInGame(client);
} 