#include scripts\include\useful;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

precache(){
	precacheModel("com_crate01");
}

test(){
	level.blueCrates = [];
	level.redCrates = [];
	level.cratePositions = [];
	level.walls = [];
	
	level.cratePositions[0] = getEnt( "point_blue" , "targetname" ); // RED PICK UP
	level.cratePositions[1] = getEnt( "point_red" , "targetname" ); // BLUE PICK UP
	
	level.walls["axis"] = getent ("wall_red", "targetname");
	level.walls["allies"] = getent ("wall_blue", "targetname");
	
	thread createCrate( 0 , level.cratePositions[0] );
	thread createCrate( 1 , level.cratePositions[1] );
	
	thread createConstructionTrigger( (1313, 385, 92), "allies" );
	thread createConstructionTrigger( (-146, 385, 95), "axis" );
}

createConstructionTrigger(position, team/*, type, team, radius, height*/){
	trigger = spawn( "trigger_radius", position, 0, 20, 20 );
	while(1){
		trigger waittill("trigger", player);
		
		if( !isReallyPlaying(player) || !player.carriesCrate || player.pers["team"] != team )
			continue;
		
		player playsound("construct_base");
		player playsound( player.pers["team"] + "_wohoo" );
		wait 5;
		level.walls[team] show();
		level.walls[team] solid();
		break;
	}
}

createCollectableTrigger(height, radius){
	if( !isDefined( self ) )
		return;
	if( !isDefined( height ) )
		height = 20;
	if( !isDefined( radius ) )
		radius = 20;
		
	trigger = spawn( "trigger_radius", self.origin, 0, height, radius );
	self.trigger = trigger;
}

createCrate(teamID, spawntarget){
	crate = spawn("script_model", spawntarget.origin );
	crate.angles = spawntarget.angles;
	
	wait 0.05;
	
	crate setModel("com_crate01");
	crate.teamID = teamID;
	
	if( !teamID )
		level.redCrates[level.redCrates.size] = crate;
	else
		level.blueCrates[level.blueCrates.size] = crate;
	
	crate createCollectableTrigger(20, 20);
	crate thread watchCratePickup();
}

watchCratePickup(){
	self endon("death");
	self.trigger endon("death");
	
	while(1){
		self.trigger waittill("trigger", player);
		
		if( player.pers["team"] == "axis" && self.teamID == 0 )
			player thread pickupCrate(self);
		else if( player.pers["team"] == "allies" && self.teamID == 1 )
			player thread pickupCrate(self);
		else
			player iprintlnbold("Wrong crate!");
	}
	
}

pickupCrate(crate){
	self iprintlnbold("You've picked up a crate!");
	
	self playSoundOnPlayers( self.pers["team"] + "_obj_taken", self.pers["team"] );
	
	self.carriesCrate = true;

	crate.trigger delete();
	crate delete();
}