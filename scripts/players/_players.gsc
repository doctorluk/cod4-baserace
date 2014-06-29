init(){

	precache();
	level.team = [];
	level.team["axis"] = [];
	level.team["allies"] = [];
	thread onPlayerConnect();
	thread onPlayerDisconnect();
}

precache(){

}

onPlayerConnect(){
	while(1){
		level waittill( "connected", player );
		// Do something with player
		player [[level.spectator]]();
	}
}

onPlayerDisconnect(){
	while(1){
		level waittill( "disconnected", player );
		// Do something with player
	}
}

Callback_PlayerDamage( eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime ){
}

Callback_PlayerKilled( eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration ){
}

Callback_PlayerLastStand( eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration ){
}