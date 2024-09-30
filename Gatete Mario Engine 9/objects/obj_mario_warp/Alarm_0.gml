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
		
		//If the destination is the same room
		if (destination == room) {

			//Turn barrier off
			obj_levelcontrol.barrier = false;
			obj_levelcontrol.alarm[7] = 3;
		
			//Set exit direction
			global.exit_dir = exit_dir;

			//Set warp id
			global.exit_id = exit_id;
		
			//With the node
			with (obj_warp_node) {
			
				if (myid == global.exit_id) {
			
					//Move the player into this node
					obj_mario_warp.x = x;
					obj_mario_warp.y = y;
				
					//Make the player able to exit the pipe
					obj_mario_warp.ready = 1;
					obj_mario_warp.ready2 = 1;
				
					//Set up the exit direction
					obj_mario_warp.direction = global.exit_dir;
				}
			}
		
			//Create fade object
			instance_create_depth(0, 0, -99, obj_fade_warp);			
		}
		
		//Otherwise
		else {

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
	}
	
	//Otherwise, allow exit from pipe
	else {
		
		ready = 1;
		ready2 = 1;
	}
}