/// @description Shatter egg

shard = instance_create_depth(x, y + 8, -2, obj_shard);
with (shard) {

	//Set sprite
	sprite_index = spr_egg_bits;
	image_speed = 0;
	image_index = 3;
	
	//Set motion
	motion_set(45, 6);
}

shard = instance_create_depth(x, y + 8, -2, obj_shard);
with (shard) {

	//Set sprite
	sprite_index = spr_egg_bits;
	image_speed = 0;
	image_index = 1;
	
	//Set motion
	motion_set(60, 6);
}

shard = instance_create_depth(x, y + 8, -2, obj_shard);
with (shard) {

	//Set sprite
	sprite_index = spr_egg_bits;
	image_speed = 0;
	image_index = 0;
	
	//Set motion
	motion_set(120, 6);
}

shard = instance_create_depth(x, y + 8, -2, obj_shard);
with (shard) {

	//Set sprite
	sprite_index = spr_egg_bits;
	image_speed = 0;
	image_index = 2;
	
	//Set motion
	motion_set(135, 6);
}

//Make it invisible
visible = 0;

//A Yoshi has born
alarm[2] = 16;

//Create some smoke
instance_create_depth(x, y + 8, -6, obj_smoke);