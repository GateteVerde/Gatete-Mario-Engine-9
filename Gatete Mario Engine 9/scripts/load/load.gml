/// @function load(file);

function load() {

	//Open the file
	var file = file_text_open_read(argument[0]);
	
	//Read the state of the world map structure
	ds_map_read(global.worldmap, file_text_read_string(file));
	file_text_readln(file);

	//Read the state of the beaten world map data structure
	ds_map_read(global.worldmap_beaten, file_text_read_string(file));
	file_text_readln(file);
	
	//Load state of switch palaces fro map structure
	global.palace_y = ds_map_find_value(global.worldmap, "YSwitch");
	global.palace_g = ds_map_find_value(global.worldmap, "GSwitch");
	global.palace_r = ds_map_find_value(global.worldmap, "RSwitch");
	global.palace_b = ds_map_find_value(global.worldmap, "BSwitch");
	
	//Load lives
	lives = ds_map_find_value(global.worldmap, "Lives");
	
	//Load score
	score = ds_map_find_value(global.worldmap, "Score");
	
	//Load coins
	global.coins = ds_map_find_value(global.worldmap, "Coins");
	
	//Load powerup
	global.powerup = ds_map_find_value(global.worldmap, "Powerup");
	
	//Load reserve item
	global.reserve = ds_map_find_value(global.worldmap, "Reserve");
	
	//Load Yoshi
	global.mount = ds_map_find_value(global.worldmap, "Yoshi");
	global.mountcolour = ds_map_find_value(global.worldmap, "Yoshi Colour");
	
	//Load star coins
	for (var i=0; i<3; i++) {
	
		for (var j=0; j<global.levelmax; j++) {
		
			global.sc[0, j] = ds_map_find_value(global.worldmap, "Star Coin 1");
			global.sc[1, j] = ds_map_find_value(global.worldmap, "Star Coin 2");
			global.sc[2, j] = ds_map_find_value(global.worldmap, "Star Coin 3");
		}
	}
	
	//Load collected star coins
	global.starcoins = ds_map_find_value(global.worldmap, "Star Coins");
	
	//Load collected power stars
	global.powerstars = ds_map_find_value(global.worldmap, "Power Stars");
	
	//Load game clear
	global.gameclear = ds_map_find_value(global.worldmap, "Game Clear");

	//Close file
	file_text_close(file);
	
	//INI file variable
	var inifile = -1;
	
	//Switch between files
	switch (argument[0]) {
	
		case ("GME9SaveA.sav"): inifile = "GME9InfoA.ini"; break;
		case ("GME9SaveB.sav"): inifile = "GME9InfoB.ini"; break;
		case ("GME9SaveC.sav"): inifile = "GME9InfoC.ini"; break;
		case ("GME9SaveD.sav"): inifile = "GME9InfoD.ini"; break;
	}
	
	//If the ini exists
	if (inifile != -1) {
		
		//Open INI
		ini_open(inifile);
		
		//Write data
		ini_read_real("Progress", "Exits", global.cleared_levels);
		
		//Ini Close
		ini_close();
	}
}