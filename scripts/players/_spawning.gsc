#include scripts\include\useful;
/**
 * @brief Moves player into a team where the least are, otherwise randomly
 *
 *
 * @returns nothing
 */
autoAssign(){
	self closeMenu();
	self closeInGameMenu();
	
	if( level.team["allies"].size > level.team["axis"].size )
		assign = "axis";
	else if( level.team["allies"].size < level.team["axis"].size )
		assign = "allies";
	else{
		if( randomint(2) )
			assign = "axis";
		else
			assign = "allies";
	}
	
	if ( assign != self.pers["team"] && (self.sessionstate == "playing" || self.sessionstate == "dead") ){
		self.switching_teams = true;
		self.joining_team = assign;
		self.leaving_team = self.pers["team"];
		self suicide();
	}
	
	self.pers["team"] = assign;
	self.team = assign;
	self.pers["class"] = undefined;
	self.class = undefined;
	self.pers["weapon"] = undefined;
	self.pers["savedmodel"] = undefined;
	
	if ( !isAlive( self ) )
		self.statusicon = "hud_status_dead";
	
	self openMenu( game[ "menu_changeclass_" + self.pers["team"] ] );
	self setclientdvar( "g_scriptMainMenu", game[ "menu_class_" + self.pers["team"] ] );
}

/**
 * @brief Lets a player join the allied team
 * @TODO Make it so that a player is given a message on team-switch in case the team is full/oversized and abort his selection
 *
 * @returns nothing
 */
joinAllies(){
	self closeMenu();
	self closeInGameMenu();
	
	assign = "allies";
	
	if ( assign != self.pers["team"] && (self.sessionstate == "playing" || self.sessionstate == "dead") ){
		self.switching_teams = true;
		self.joining_team = assign;
		self.leaving_team = self.pers["team"];
		self suicide();
	}
	
	self.pers["team"] = assign;
	self.team = assign;
	self.pers["class"] = undefined;
	self.class = undefined;
	self.pers["weapon"] = undefined;
	self.pers["savedmodel"] = undefined;
	
	if ( !isAlive( self ) )
		self.statusicon = "hud_status_dead";
	
	self openMenu( game[ "menu_changeclass_" + self.pers["team"] ] );
	self setclientdvar( "g_scriptMainMenu", game[ "menu_class_" + self.pers["team"] ] );
}

/**
 * @brief Lets a player join the axis team
 * @TODO Make it so that a player is given a message on team-switch in case the team is full/oversized and abort his selection
 *
 * @returns nothing
 */
joinAxis(){
	self closeMenu();
	self closeInGameMenu();
	
	assign = "axis";
	
	if ( assign != self.pers["team"] && (self.sessionstate == "playing" || self.sessionstate == "dead") ){
		self.switching_teams = true;
		self.joining_team = assign;
		self.leaving_team = self.pers["team"];
		self suicide();
	}
	
	self.pers["team"] = assign;
	self.team = assign;
	self.pers["class"] = undefined;
	self.class = undefined;
	self.pers["weapon"] = undefined;
	self.pers["savedmodel"] = undefined;
	
	if ( !isAlive( self ) )
		self.statusicon = "hud_status_dead";
	
	self openMenu( game[ "menu_changeclass_" + self.pers["team"] ] );
	self setclientdvar( "g_scriptMainMenu", game[ "menu_class_" + self.pers["team"] ] );
}

/**
 * @brief If he is not already, it puts a player into spectator team and spawns him in the air
 *
 *
 * @returns nothing
 */
joinSpectator(){
	if (self.pers["team"] != "spectator"){
		if ( isalive(self) )
			self suicide();
		
		self notify("join_spectator");
		level notify("spawned_spectator", self);
		
		self.pers["team"] = "spectator";
		self.sessionteam = "spectator";
		self.sessionstate = "spectator";
		
		spawns = getentarray("mp_global_intermission", "classname");
		if(spawns.size > 0){
			spawn = spawns[randomint(spawns.size)];
			origin = spawn.origin;
			angles = spawn.angles;
		}
		else{
			origin = (0,50,50);
			angles = (0,0,0);
		}
		self spawn( origin, angles );
	}
}

/**
 * @brief Spawns the player 
 *
 *
 * @returns nothing
 */
spawnPlayer(){

	self endon("disconnect");
	self endon("joined_spectators");
	self notify("spawned");
	self notify("end_respawn");

	resetTimeout();

	self.sessionteam = self.team;

	// hadSpawned = self.hasSpawned;

	self.sessionstate = "playing";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.statusicon = "";
	if ( level.hardcoreMode )
		self.maxhealth = 30;
	else
		self.maxhealth = 100;
	self.health = self.maxhealth;
	
	self.friendlydamage = undefined;
	self.hasSpawned = true;
	self.spawnTime = getTime();
	self.afk = false;
	self.lastStand = undefined;
	
	//self clearPerks();

	//self setClientDvar( "cg_thirdPerson", "0" );
	//self setDepthOfField( 0, 0, 512, 512, 4, 0 );
	//self setClientDvar( "cg_fov", "65" );
	
	// [[level.onSpawnPlayer]]();
	
	// self maps\mp\gametypes\_missions::playerSpawned();

	// level thread updateTeamStatus();
		
	// self maps\mp\gametypes\_class::setClass( self.class );
	// self maps\mp\gametypes\_class::giveLoadout( self.team, self.class );

	self freezeControls( false );
	self enableWeapons();
	// if ( game["state"] == "playing" )
	// {
		// team = self.team;
		
		// music = game["music"]["spawn_" + team];
		
		// thread maps\mp\gametypes\_hud_message::oldNotifyMessage( game["strings"][team + "_name"], undefined, game["icons"][team], game["colors"][team], music );
		// if ( isDefined( game["dialog"]["gametype"] ) && (!level.splitscreen || self == level.players[0]) )
		// {
			// self maps\mp\gametypes\_globallogic::leaderDialogOnPlayer( "gametype" );
			// if ( team == game["attackers"] )
				// self maps\mp\gametypes\_globallogic::leaderDialogOnPlayer( "offense_obj", "introboost" );
			// else
				// self maps\mp\gametypes\_globallogic::leaderDialogOnPlayer( "defense_obj", "introboost" );
		// }

		// self setClientDvar( "scr_objectiveText", maps\mp\gametypes\_globallogic::getObjectiveHintText( self.pers["team"] ) );			
		// thread maps\mp\gametypes\_hud::showClientScoreBar( 5.0 );
	// }

	if ( getdvar( "scr_showperksonspawn" ) == "" )
		setdvar( "scr_showperksonspawn", "1" );
		
	// if ( !level.splitscreen && getdvarint( "scr_showperksonspawn" ) == 1 && game["state"] != "postgame" )
	// {
		// perks = maps\mp\gametypes\_globallogic::getPerks( self );
		// self maps\mp\gametypes\_hud_util::showPerk( 0, perks[0], -50 );
		// self maps\mp\gametypes\_hud_util::showPerk( 1, perks[1], -50 );
		// self maps\mp\gametypes\_hud_util::showPerk( 2, perks[2], -50 );
		// self thread maps\mp\gametypes\_globallogic::hidePerksAfterTime( 3.0 );
		// self thread maps\mp\gametypes\_globallogic::hidePerksOnDeath();
	// }
	
	waittillframeend;
	self notify( "spawned_player" );

	self logstring( "S " + self.origin[0] + " " + self.origin[1] + " " + self.origin[2] );

	// self thread maps\mp\gametypes\_hardpoints::hardpointItemWaiter();
	
	//self thread testHPs();
	//self thread testShock();
	//self thread testMenu();
	
	if ( game["state"] == "postgame" )
	{
		assert( !level.intermission );
		// We're in the victory screen, but before intermission
		self freezePlayerForRoundEnd();
	}
}

/**
 * @brief Processes the class selection in the spawning menu
 *
 *
 * @returns nothing
 */
processClass( response )
{
	self closeMenu();
	self closeInGameMenu();
	
	// Fuck this... spawn them with default weapons
	self giveWeapon("ak47_mp");
	self givemaxammo("ak47_mp");
	self switchtoweapon("ak47_mp");
	self thread [[level.spawnClient]]();
}