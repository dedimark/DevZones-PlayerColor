// ------ #include ------ //

#include <sourcemod>
#include <devzones>
#include <multicolors>

// ------ ConVar ------ //

ConVar ConVar_Broadcast;

// ------ #pragma ------ //

#pragma semicolon 1
#pragma newdecls required

// ------ myinfo ------ //

public Plugin myinfo = 
{
	name = "SM DEV ZONES - Player Color",
	author = "ByDexter",
	description = "",
	version = "1.0",
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnPluginStart()
{
	ConVar_Broadcast = CreateConVar("sm_zones_broadcast", "1", "Bölgeye giren oyuncuların ismi sohbetten yazsın mı");
	AutoExecConfig(true, "DevZones-playercolor", "ByDexter");
}

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if(client < 1 || client > MaxClients || !IsClientInGame(client) ||!IsPlayerAlive(client)) 
		return;
		
	if(StrContains(zone, "playercolor", false) == 0)
	{
		SetEntityRenderMode(client, RENDER_GLOW);
		SetEntityRenderColor(client, 0, 255, 0, 255);
		CPrintToChat(client, "{darkred}[ByDexter] {green}playercolor bölgesine {default}girdiniz.");
		if(ConVar_Broadcast.IntValue == 1)
		{
			CPrintToChatAll("{darkred}[ByDexter] {darkblue}%N {default}isimli oyuncu {green}playercolor bölgesine giriş yaptı.", client);
		}
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if(StrContains(zone, "playercolor", false) == 0)
	{
		SetEntityRenderMode(client, RENDER_NORMAL);
		SetEntityRenderColor(client, 255, 255, 255, 255);
		CPrintToChat(client, "{darkred}[ByDexter] {green}playercolor bölgesinden {default}ayrıldınız.");
	}
}