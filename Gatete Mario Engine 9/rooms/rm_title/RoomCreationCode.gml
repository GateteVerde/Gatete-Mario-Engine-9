///Reset all global variables if the game was restarted

if (global.restart == true) {
	
	//Reset all global variables
	init_globals();
	
	//Replace sprites
	index_powerups();
	
	//Game is done with the restart
	global.restart = false;
}