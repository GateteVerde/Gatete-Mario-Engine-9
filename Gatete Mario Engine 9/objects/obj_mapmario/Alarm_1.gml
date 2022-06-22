/// @description Save the game

//Normal exit
if (savegame == 0)
&& (obj_coordinator.autosave == 0) {

	status = mapstate.idle;
	with (obj_mapcontrol) alarm[0] = 2;
	exit;
}

//If auto save is enabled
if (obj_coordinator.autosave == 1) {

	//Save the game
	save(global.file);
	save_ini(global.ini_file);
	
	//Set status
	status = mapstate.idle;
	
	//Display "Game Saved!" text at the bottom-right corner
	with (obj_hud_map) {
	
		show_saved = true;
		alarm[1] = 90;
	}
}

//Otherwise, ask the player to save
else {

	//Create save menu
	instance_create_depth(0, 0, -99, obj_save);
}

//End save game mode
savegame = 0;