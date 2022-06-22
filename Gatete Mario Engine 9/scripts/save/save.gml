/// @function save(file);

function save() {

	//Open the file
	var file = file_text_open_write(argument[0]);
	
	//Save Switch Palace variables into the Map structure
	ds_map_replace(global.worldmap, "YSwitch", global.palace_y);
	ds_map_replace(global.worldmap, "GSwitch", global.palace_g);
	ds_map_replace(global.worldmap, "RSwitch", global.palace_r);
	ds_map_replace(global.worldmap, "BSwitch", global.palace_b);
	
	//Save lives into map structure
	ds_map_replace(global.worldmap, "Lives", lives);
	
	//Save Score into map structure
	ds_map_replace(global.worldmap, "Score", score);
	
	//Save Coins
	ds_map_replace(global.worldmap, "Coins", global.coins);
	
	//Save Powerup
	ds_map_replace(global.worldmap, "Powerup", global.powerup);
	
	//Save Reserve Item
	ds_map_replace(global.worldmap, "Reserve", global.reserve);
	
	//Save Yoshi
	ds_map_replace(global.worldmap, "Yoshi", global.mount);
	ds_map_replace(global.worldmap, "Yoshi Colour", global.mountcolour);
	
	//Save Star Coins
	for (var i=0; i<3; i++) {
	
		for (var j=0; j<global.levelmax; j++) {
			
			ds_map_replace(global.worldmap, "Star Coin 1", ds_map_find_value(global.sc[0], j));
			ds_map_replace(global.worldmap, "Star Coin 2", ds_map_find_value(global.sc[1], j));
			ds_map_replace(global.worldmap, "Star Coin 3", ds_map_find_value(global.sc[2], j));
		}
	}
	
	//Save Collected Star Coins
	ds_map_replace(global.worldmap, "Star Coins", global.starcoins);
	
	//Save Collected Power Stars
	ds_map_replace(global.worldmap, "Power Stars", global.powerstars);
	
	//Save Game Clear
	ds_map_replace(global.worldmap, "Game Clear", global.gameclear);
	
	//Turn the world map data structure into a string and write it
	file_text_write_string(file, ds_map_write(global.worldmap));
	file_text_writeln(file);

	//Turn the beaten world map data structure into a string and write it
	file_text_write_string(file, ds_map_write(global.worldmap_beaten));
	file_text_writeln(file);
	
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
		ini_write_real("Progress", "Exits", global.cleared_levels);
		ini_write_real("Progress", "Star Coins", global.starcoins);
		ini_write_real("Progress", "Power Stars", global.powerstars);
		ini_write_real("Progress", "Game Clear", global.gameclear);
		
		//Ini Close
		ini_close();
	}
}