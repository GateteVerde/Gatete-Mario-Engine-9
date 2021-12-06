/// @function reset_globals(keep_powerup);
/// @param keep_powerup If set to false, set 'Small' powerup.

function reset_globals(keep_powerup) {
	
	//Reset powerup if set to true
	global.powerup = (keep_powerup) ? global.powerup : cs_small;

	//Reset time
	global.timer = 0;

	//Reset berries
	global.berries = 0;

	//Reset red coins
	global.coins_red = 0;
	
	//Reset silver coins
	global.coins_silver = 0;

	//Reset starman and pswitch
	global.starman = 0;
	global.pswitch = 0;
	global.gswitch = 0;

	//Reset pwing effect
	global.pwing = 0;

	//Reset Mario Start! text
	global.mariostart = false;

	//Disable 'Return to map' option
	global.levelbeat = 0;

	//Reset on/off blocks
	global.on_off_block = 0;
	
	//Reset held variables
	global.carrieditem = noone;
	global.carriedsprite = noone;

	//Reset all door states
	ds_map_clear(global.doors);

	//Reset ace coins
	ds_map_clear(global.acecoins);

	//Reset red coin rings
	ds_map_clear(global.redrings);
}