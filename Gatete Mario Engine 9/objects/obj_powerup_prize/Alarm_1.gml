/// @description Create a powerup

//If this item has a leaf sprite, turn into a real leaf
if (sprite_index == spr_leaf) {

	with (instance_create_layer(x, y, "Main", obj_leaf_sprout))
		alarm[1] = 1;
}

//Otherwise, if this item has a feather sprite, turn into a real feather
else if (sprite_index == spr_feather) {

	with (instance_create_layer(x, y, "Main", obj_feather_sprout))
		alarm[1] = 1;
}

//If this item has a fiery leaf sprite, turn into a real fiery leaf
else if (sprite_index == spr_fieryleaf) {

	with (instance_create_layer(x, y, "Main", obj_fieryleaf_sprout))
		alarm[1] = 1;
}

//If this item has a chill leaf sprite, turn into a real chill leaf
else if (sprite_index == spr_chillleaf) {

	with (instance_create_layer(x, y, "Main", obj_chillleaf_sprout))
		alarm[1] = 1;
}

//Otherwise
else {

	with (sprite_create_object(sprite_index, x, y, -2))
		move_after_landing = 1;
}

//Destroy
instance_destroy();