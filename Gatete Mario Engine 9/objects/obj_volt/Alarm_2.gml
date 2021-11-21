/// @description Leave a trail

alarm[2] = 2;
with (instance_create_depth(x-8+random(16), y-8+random(16), -1, obj_sparkle)) {
	
    sprite_index = spr_sparkle_b;
	shrink_rate = 0.05;
}