/// @description Check level panel

//Find nearest panel
check = collision_point(x+xorig, y+yorig, obj_levelpanel, 0, 0);

//Handle the visual "clear levels" in the Title Screen
with (check) {

	//If Mario didn't warp
	if ((global.clear < 3) && (paneltype != 3)) {
	
		if (is_undefined(ds_map_find_value(global.worldmap_beaten, string(id) + "_" + string(global.clear)))) {
		
			//Note this...
			global.cleared_levels++;
			
			//...and remember it.
			ds_map_replace(global.worldmap_beaten, string(id) + "_" + string(global.clear), 1);
		}
	}
}

//If the level has been cleared with the normal exit
if (global.clear == 1) {

	//If this panel is a toad house, minigame house or switch palace, do not open paths
	if (check.paneltype >= 2) {
	
		//Allow the game to be saved
		savegame = true;
		
		//Mark the panel as beaten
		with (check) {
		
			ds_map_replace(global.worldmap, id, 2);
			alarm[2] = 1;
			exit;
		}
	}
	
	//Otherwise
	else {
		
		//If this panel is a ghost, fortress or castle: allow to save the game
		if (check.paneltype == 1) then savegame = true;
		
		//If the level has not been beaten yet
		if (check.beaten != 1) {
			
			//Mark the panel as beaten
			with (check) {
				
				ds_map_replace(global.worldmap, id, 2);
				alarm[2] = 1;
			}
			
			//Open adyacent paths
			alarm[2] = 32;
		}
		
		//Otherwise
		else {
			
			//End clear sequence
			global.clear = 0;
		
			//Make Mario able to move
			alarm[10] = 32;
			
			//Loop the music
			with (obj_mapcontrol) alarm[0] = 32;
		}
	}
}

//Otherwise if the level has been cleared with the secret exit, open secret path
else if (global.clear == 2)
	alarm[3] = 32;

//Otherwise if Mario warped through a pipe, open all paths in all 4 directions
else if (global.clear == 3)
	alarm[4] = 32;