main()
{
	maps\mp\_load::main();
	
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");;
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	thread wall_blue();
	thread wall_red();
	
}

wall_blue() {
	wall = getent ("wall_blue", "targetname");
	
	wall hide();
	wall notsolid();
}

wall_red() {
	wall = getent ("wall_red", "targetname");
	
	wall hide();
	wall notsolid();
}
