init(){
	game["state"] = "playing";
	
	thread maps\mp\gametypes\_class::init();
	thread scripts\players\_connect::init();
	thread scripts\players\_players::init();
	thread scripts\players\_menus::init();
}