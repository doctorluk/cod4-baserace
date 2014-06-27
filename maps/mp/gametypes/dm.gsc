#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

main()
{
	if(getdvar("mapname") == "mp_background")
		return;

	maps\mp\gametypes\_callbacksetup::SetupCallbacks();
	
	level.teamBased = true;
	level.console = 0;
	level.splitscreen = 0;
	level.onlineGame = true;
	
	level.callbackStartGameType = ::Callback_StartGameType;
	level.script = toLower( getDvar( "mapname" ) );
	
	maps\mp\_baserace::precache();
	thread maps\mp\_baserace::test();
}

Callback_StartGameType()
{
	setClientNameMode("auto_change");
	
	thread scripts\baserace\_init::init();
}