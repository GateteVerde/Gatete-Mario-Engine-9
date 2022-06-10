/// @description Leave a trail

alarm[1] = 2;
with (instance_create_depth(x, y, depth + 1, obj_cannonball_spike_trail))	
	image_index = other.image_index;