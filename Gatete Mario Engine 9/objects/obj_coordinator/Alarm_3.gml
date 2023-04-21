/// @description Go to logo screen

//If no curtain exists
if (instance_number(obj_fade_in) == 0) {
	
	with (instance_create_depth(0, 0, -100, obj_fade_in))
		target = rm_logo;
}