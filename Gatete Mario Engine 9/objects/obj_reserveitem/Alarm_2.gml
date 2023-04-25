/// @description Item check

//If this item has a leaf sprite, turn into a real leaf
if (sprite_index == spr_leaf) {

	with (instance_create_depth(x, y, -1, obj_leaf_sprout)) {
	
		noscore = true;
		alarm[1] = 1;
	}
	
	//Destroy
	instance_destroy();
}

//Otherwise, if this item has a feather sprite, turn into a real feather
else if (sprite_index == spr_feather) {

	with (instance_create_depth(x, y,-1, obj_feather_sprout)) {
	
		noscore = true;
		alarm[1] = 1;
	}
	
	//Destroy
	instance_destroy();
}

//If this item has a fiery leaf sprite, turn into a real fiery leaf
else if (sprite_index == spr_fieryleaf) {

	with (instance_create_depth(x, y, -1, obj_fieryleaf_sprout)) {
	
		noscore = true;
		alarm[1] = 1;
	}
	
	//Destroy
	instance_destroy();
}

//If this item has a chill leaf sprite, turn into a real chill leaf
else if (sprite_index == spr_chillleaf) {

	with (instance_create_depth(x, y, -1, obj_chillleaf_sprout)) {
	
		noscore = true;
		alarm[1] = 1;
	}
	
	//Destroy
	instance_destroy();
}

//Otherwise
else {
	
	//If the sprite is one of the following, set the transformation sequence to 'Powerup'
	if (sprite_index == spr_fireflower)
	|| (sprite_index == spr_fireflower_cb)
	|| (sprite_index == spr_iceflower)
	|| (sprite_index == spr_iceflower_cb)
	|| (sprite_index == spr_superflower)
	|| (sprite_index == spr_superflower_cb)
	|| (sprite_index == spr_voltshroom)
	|| (sprite_index == spr_jumpinglui)
	|| (sprite_index == spr_windflower)
		sequence = 2;
		
	//Otherwise, set the sequence to 'Transform'
	else
		sequence = 4;
}