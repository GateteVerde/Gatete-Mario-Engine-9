/// @description Disclaimer screen

//Reset all global variables if the game was restarted
if (global.restart == true) {
	
	//Reset all global variables
	init_globals();
	
	//Reset sprites
	index_powerups();
	
	//Game is done with the restart
	global.restart = false;
}

//Go to next screen
with (obj_coordinator) alarm[3] = 240;

//Create fade out transition
instance_create_depth(0, 0, -99, obj_fade_out);