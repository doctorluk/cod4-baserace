init(){

	precache();
	level.team = [];
	level.team["axis"] = [];
	level.team["allies"] = [];
}

precache(){

}

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