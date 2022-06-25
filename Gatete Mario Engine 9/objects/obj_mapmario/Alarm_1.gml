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

	#region SAVE DATA
				
		//Save the game
		save(global.file);
					
		//If 'File A' exists, open 'Data A' ini
		if (global.file = "GME9SaveA.sav") {

			//Open INI
			ini_open("GME9DataA.ini");
						
			//Write Data
			ini_write_real("Coins", "Data", global.starcoins);
			ini_write_real("Stars", "Data", global.powerstars);
			ini_write_real("Exits", "Data", global.cleared_levels);
			ini_write_real("Clear", "Completion", global.gameclear);
						
			//Close INI
			ini_close();
		}
					
		//Otherwise if 'File B' exists, open Info B
		else if (global.file = "GME9SaveB.sav") {

			//Open INI
			ini_open("GME9DataB.ini");
						
			//Write Data
			ini_write_real("Coins", "Data", global.starcoins);
			ini_write_real("Stars", "Data", global.powerstars);
			ini_write_real("Exits", "Data", global.cleared_levels);
			ini_write_real("Clear", "Completion", global.gameclear);
						
			//Close INI
			ini_close();
		}
					
		//Otherwise, if 'File C' exists, open Info C
		else if (global.file = "GME9SaveC.sav") {

			//Open INI
			ini_open("GME9DataC.ini");
						
			//Write Data
			ini_write_real("Coins", "Data", global.starcoins);
			ini_write_real("Stars", "Data", global.powerstars);
			ini_write_real("Exits", "Data", global.cleared_levels);
			ini_write_real("Clear", "Completion", global.gameclear);
						
			//Close INI
			ini_close();
		}
	#endregion
	
	//Set status
	status = mapstate.idle;
	
	//Play music
	with (obj_mapcontrol) alarm[0] = 2;
	
	//Display "Game Saved!" text at the top-right corner
	with (obj_hud_map) show_saved = 2;
}

//Otherwise, ask the player to save
else {

	instance_create_depth(0, 0, -99, obj_save);
}

//End save game mode
savegame = 0;