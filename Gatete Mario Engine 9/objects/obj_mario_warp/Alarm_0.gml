/// @description Warp to the destination room

//If the destination is the world map
if (destination == rm_worldmap) {
	
	//Replace x and y position on the map
	if (pipetype != global.pipetype) {

		ds_map_replace(global.worldmap, "playerx", global.pipex);
		ds_map_replace(global.worldmap, "playery", global.pipey);
	}

	//Set clear state
	global.clear = 3;

	//Return to the map
	end_level();
}

//Otherwise
else {
	
	//If the destination is not another room
	if (destination != noone) {

		//Set exit type
		global.postchange = 1;

		//Set exit direction
		global.exit_dir = exit_dir;

		//Set warp id
		global.exit_id = exit_id;

		//If no curtain exists
		if (instance_number(obj_fade_in) == 0) {
	
			with (instance_create_depth(0, 0, -100, obj_fade_in))
				target = other.destination;
		}
	}
	
	//Otherwise, allow exit from pipe
	else {
		
		ready = 1;
		ready2 = 1;
	}
}