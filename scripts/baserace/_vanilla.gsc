/*
*
*	Setting vanilla variables for CoD4
*
*/
init(){
	level.hardcoreMode = getDvarInt("scr_hardcore");
	level.teamBased = true;
	level.onlineGame = true;
	level.console = false;
	level.splitscreen = false;
	game["state"] = "playing";
}