#include scripts\include\useful;

init(){
	precache();
	callbackSetup();
	
	level.players = [];
	level.console = 0;
	level.splitscreen = 0;
}

precache(){
	precacheStatusIcon("hud_status_connecting");
	precacheStatusIcon("hud_status_dead");
}

callbackSetup(){
	level.callbackPlayerConnect = ::Callback_PlayerConnect;
	level.callbackPlayerDisconnect = ::Callback_PlayerDisconnect;
	level.autoassign = scripts\players\_players::autoAssign;
	level.spectator = scripts\players\_players::joinSpectator;
	level.class = maps\mp\gametypes\_globallogic::menuClass;
	// level.allies = maps\mp\gametypes\_globallogic::menuAllies;
	// level.axis = maps\mp\gametypes\_globallogic::menuAxis;
}

Callback_PlayerConnect()
{
	self waittill("begin");
	
	iprintln( self.name + " ^7connected." );
	
	lpselfnum = self getEntityNumber();
	self.guid = self getGuid();
	
	self setclientdvar("g_scriptMainMenu", game["menu_team"]);
	
	logPrint("J;" + self.guid + ";" + lpselfnum + ";" + self.name + "\n");
	
	waittillframeend;
	
	level.players[level.players.size] =  self;
	self.pers["team"] = "free";
	
	level notify("connected", self);
	
	self thread scripts\players\_players::joinSpectator();
}

Callback_PlayerDisconnect()
{
	lpselfnum = self getEntityNumber();
	lpGuid = self getGuid();
	logPrint("Q;" + lpGuid + ";" + lpselfnum + ";" + self.name + "\n");
	
	level.players = removeFromArray(level.players, self);
	
	level notify( "disconnected", player );
	self notify( "disconnect" );
}