init(){

	precache();
	level.team = [];
	level.team["axis"] = [];
	level.team["allies"] = [];
	thread onPlayerConnected();
}

precache(){

}

onPlayerConnected(){
	while(1){
		level waittill( "connected", player );
		// Do something with player
		player [[level.spectator]]();
	}
}