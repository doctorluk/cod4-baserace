#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

precache(){
	precacheModel("com_crate01");
}

test(){

	level.blueCrates = [];
	level.redCrates = [];
	level.cratePosition = [];
	
	level.cratePosition[0] = getEnt( "point_blue" , "targetname" ); // RED
	level.cratePosition[1] = getEnt( "point_red" , "targetname" ); // BLUE
	
	thread createCrate( 0 , level.cratePosition[0] );
	thread createCrate( 1 , level.cratePosition[1] );	
}

createCrate(teamID, spawntarget){

	crate = spawn("script_model", spawntarget.origin );
	crate.angles = spawntarget.angles;
	crateTrigger = spawn( "trigger_radius", crate.origin, 0, 20, 20 );
	
	wait 0.05;
	
	crate setModel("com_crate01");
	crate.trigger = crateTrigger;
	crate.teamID = teamID;
	
	if( !teamID )
		level.redCrates[level.redCrates.size] = crate;
	else
		level.blueCrates[level.blueCrates.size] = crate;
	
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

	crate.trigger delete();
	crate delete();
}