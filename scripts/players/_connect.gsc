#include scripts\include\useful;

init(){
	precache();
	callbackSetup();
	
	level.players = [];
}

precache(){
	precacheStatusIcon("hud_status_connecting");
	precacheStatusIcon("hud_status_dead");
}

callbackSetup(){
	level.callbackPlayerConnect 	= ::Callback_PlayerConnect;
	level.callbackPlayerDisconnect 	= ::Callback_PlayerDisconnect;
	level.autoassign 				= scripts\players\_spawning::autoAssign;
	level.spectator 				= scripts\players\_spawning::joinSpectator;
	level.class 					= scripts\players\_spawning::processClass;
	level.allies 					= scripts\players\_spawning::joinAllies;
	level.axis						= scripts\players\_spawning::joinAxis;
	level.spawnClient				= scripts\players\_spawning::spawnPlayer;
}

Callback_PlayerConnect(){
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
}

Callback_PlayerDisconnect(){
	lpselfnum = self getEntityNumber();
	lpGuid = self getGuid();
	logPrint("Q;" + lpGuid + ";" + lpselfnum + ";" + self.name + "\n");
	
	level.players = removeFromArray(level.players, self);
	
	level notify( "disconnected", self );
	self notify( "disconnect" );
}