/// @description Warp to the destination room

//If the destination is the same room
if (destination == room) {
	
	//Turn barrier off
	obj_levelcontrol.barrier = false;
	obj_levelcontrol.alarm[7] = 3;

	//Set warp id
	global.exit_id = exit_id;
		
	//With the node
	with (obj_warp_node) {
			
		if (myid == global.exit_id) {
					
			obj_mario_door.x = x;
			obj_mario_door.y = y;
					
			//Create player to new destination
			with (obj_mario_door) event_user(0);
		}
	}
		
	//Create fade object
	instance_create_depth(0, 0, -99, obj_fade_warp);
}

//Otherwise
else {

	//Set exit type
	global.postchange = 0;

	//Set warp id
	global.exit_id = exit_id;

	//Go to the destination room
	if (instance_number(obj_fade_in) == 0) {
	
		with (instance_create_depth(0, 0, -100, obj_fade_in))
			target = other.destination;
	}
}