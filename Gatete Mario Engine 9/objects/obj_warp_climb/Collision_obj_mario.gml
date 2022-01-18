/// @description Warp to the destination room

//If Mario is climbing
if (other.state == playerstate.climb) {

	//Set exit type
	global.postchange = 3;

	//Set warp id
	global.exit_id = exit_id;

	//If no curtain exists
	if (instance_number(obj_fade_in) == 0) {
	
		with (instance_create_depth(0, 0, -100, obj_fade_in))
			target = other.destination;
	}
}