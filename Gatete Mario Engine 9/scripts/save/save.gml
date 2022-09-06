/// @function save(file);

function save() {

	//Open the file
	var file = file_text_open_write(argument[0]);
	
	//Turn the world map data structure into a string and write it
	file_text_write_string(file, ds_map_write(global.worldmap));
	file_text_writeln(file);
	
	//Turn the beaten world map data structure into a string and write it
	file_text_write_string(file, ds_map_write(global.worldmap_beaten));
	file_text_writeln(file);
	
	//Turn the card minigame data structure into a string, and write it
	file_text_write_string(file, ds_map_write(global.cardgame));
	file_text_writeln(file);
	
	//Turn the card minigame pattern into a string and write it
	file_text_write_string(file, base64_encode(string(global.cardpattern)));
	file_text_writeln(file);
	
	//Turn the star coin data structure into a string and write it
	for (var i = 0; i < 3; i++) {

	    file_text_write_string(file, ds_map_write(global.sc[i]));
	    file_text_writeln(file);
	}
	
	//Save cleared levels
	file_text_write_string(file, base64_encode(string(global.cleared_levels)));
	file_text_writeln(file);
	
	//Save world
	file_text_write_string(file, base64_encode(string(global.world)));
	file_text_writeln(file);
	
	//Save Yellow Switch Palace data
	file_text_write_string(file, base64_encode(string(global.palace_y)));
	file_text_writeln(file);
	
	//Save Green Switch Palace data
	file_text_write_string(file, base64_encode(string(global.palace_g)));
	file_text_writeln(file);
	
	//Save Red Switch Palace data
	file_text_write_string(file, base64_encode(string(global.palace_r)));
	file_text_writeln(file);
	
	//Save Blue Switch Palace data
	file_text_write_string(file, base64_encode(string(global.palace_b)));
	file_text_writeln(file);
	
	//Save lives
	file_text_write_string(file, base64_encode(string(lives)));
	file_text_writeln(file);
	
	//Save score
	file_text_write_string(file, base64_encode(string(score)));
	file_text_writeln(file);
	
	//Save coins
	file_text_write_string(file, base64_encode(string(global.coins)));
	file_text_writeln(file);
	
	//Save powerup
	file_text_write_string(file, base64_encode(string(global.powerup)));
	file_text_writeln(file);
	
	//Save reserve item
	file_text_write_string(file, base64_encode(string(global.reserve)));
	file_text_writeln(file);
	
	//Save Yoshi
	file_text_write_string(file, base64_encode(string(global.mount)));
	file_text_writeln(file);
	
	//Save Yoshi colour
	file_text_write_string(file, base64_encode(string(global.mountcolour)));
	file_text_writeln(file);
	
	//Save Star Coin amount
	file_text_write_string(file, base64_encode(string(global.starcoins)));
	file_text_writeln(file);
	
	//Save Power Star amount
	file_text_write_string(file, ds_map_write(global.powerstars));
	file_text_writeln(file);
	
	//Save Inventory
	var powerup_count = 27;
	for (var i=0; i<powerup_count; i++) {
	
		file_text_write_string(file, base64_encode(string(global.inventory[i])));
		file_text_writeln(file);
	}
	
	//Save Star Houses
	for (var i=1; i<=8; i++) {
	
		file_text_write_string(file, base64_encode(string(global.star_house[i])));
		file_text_writeln(file);
	}
	
	//Save Game Completion percentage
	file_text_write_string(file, base64_encode(string(global.gameclear)));
	file_text_writeln(file);
	
	//Close file
	file_text_close(file);
}