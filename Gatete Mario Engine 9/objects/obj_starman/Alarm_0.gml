/// @description Leave a trail

alarm[0] = 1;
with (instance_create_depth(x, y, depth + 1, obj_starman_trail))
	image_index = other.image_index;