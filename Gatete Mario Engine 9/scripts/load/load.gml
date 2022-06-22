/// @function load(file);

function load() {

	//Open the file
	var file = file_text_open_read(argument[0]);
	
	//Load the world map data structure
	ds_map_read(global.worldmap, file_text_read_string(file));
	file_text_readln(file);

	//Load the beaten world map data structure
	ds_map_read(global.worldmap_beaten, file_text_read_string(file));
	file_text_readln(file);
	
	//Load the star coin data
	for (var i = 0; i < 3; i++) {

		ds_map_read(global.sc[i], file_text_read_string(file));
	    file_text_readln(file);
	}
	
	//Load cleared levels
	global.cleared_levels = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load world
	global.world = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Yellow Switch Palace data
	global.palace_y = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Green Switch Palace data
	global.palace_g = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Red Switch Palace data
	global.palace_r = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Blue Switch Palace data
	global.palace_b = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load lives
	lives = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load score
	score = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load coins
	global.coins = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load powerup
	global.powerup = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load reserve item
	global.reserve = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Yoshi
	global.mount = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Yoshi colour
	global.mountcolour = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Star Coin amount
	global.starcoins = real(base64_decode(file_text_read_string(file)));
	file_text_readln(file);
	
	//Load Power Stars amount
	ds_map_read(global.powerstars, file_text_read_string(file));
	file_text_readln(file);
	
	//Load Inventory
	var powerup_count = 27;
	for (var i=0; i<powerup_count; i++) {
	
		global.inventory[i] = real(base64_decode(file_text_read_string(file)));
		file_text_readln(file);
	}
	
	//Load Star Houses
	for (var i=1; i<=8; i++) {
	
		global.star_house[i] = real(base64_decode(file_text_read_string(file)));
		file_text_readln(file);
	}
	
	//Close file
	file_text_close(file);
}