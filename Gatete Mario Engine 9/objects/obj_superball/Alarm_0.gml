/// @description Leave a trail

alarm[0] = 1;
with (instance_create_depth(x, y, -1, obj_smoke_fade)) {
	
    sprite_index = other.sprite_index;
	image_speed = 0;
	image_index = 1;
}