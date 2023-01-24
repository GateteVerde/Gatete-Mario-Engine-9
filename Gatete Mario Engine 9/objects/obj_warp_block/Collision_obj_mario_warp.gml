/// @description Warp to the destination room

//Set exit type
global.postchange = 2;

//Set warp id
global.exit_id = exit_id;

//If no curtain exists
if (instance_number(obj_fade_in) == 0) {
	
	with (instance_create_depth(0, 0, -100, obj_fade_in))
		target = other.destination;
}