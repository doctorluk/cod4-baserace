execClientCommand(cmd)
{
	self setClientDvar("ui_clientcmd", cmd);
	self openMenuNoMouse(game["menu_clientcmd"]);
	self closeMenu(game["menu_clientcmd"]);
}

freezePlayerForRoundEnd()
{	
	self closeMenu();
	self closeInGameMenu();	
	self freezeControls( true );
}

unfreezePlayerForRoundEnd()
{	
	self closeMenu();
	self closeInGameMenu();
	
	self freezeControls( false );
}

freezeAll(){
	level.freezePlayers = true;
	for(i = 0; i < level.players.size; i++){
		p = level.players[i];
		if( !isReallyPlaying(p) )
			continue;
		p freezePlayerForRoundEnd();
	}
}

unfreezeAll(){
	level.freezePlayers = false;
	for(i = 0; i < level.players.size; i++){
		p = level.players[i];
		p unfreezePlayerForRoundEnd();
	}
}

isReallyPlaying(player){
	if( !isDefined( player ) )
		return false;
	
	if( player.sessionstate != "playing" )
		return false;
		
	return true;
}

playSoundOnAllPlayers(sound, delay){
	if( isDefined( delay ) && delay >= 0.05 )
		wait delay;
	for(i = 0; i < level.players.size; i++)
		level.players[i] playlocalsound(sound);
}

pressesAnyButton(){

	if( self adsbuttonpressed() || self attackbuttonpressed() || self fragbuttonpressed() || self meleebuttonpressed() || self secondaryoffhandbuttonpressed() || self usebuttonpressed() )
		return true;
		
	return false;

}

removeFromArray(array, item)
{
	for (i = 0; i<array.size; i++)
	{
		if (array[i] == item)
		{
			for (; i<array.size - 1; i++)
			{
				array[i] = array[i+1];
			}
			array[array.size-1] = undefined;
			return array;
		}
	}
	return array;
}

arrayContains(array, item){
	for(i = 0; i < array.size; i++){
		if(array[i] == item)
			return true;
	}
	return false;
}