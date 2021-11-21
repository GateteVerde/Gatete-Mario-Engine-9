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

//Otherwise
else {
	
	//If the sprite is one of the following, set the transformation sequence to 'Powerup'
	if (sprite_index == spr_fireflower)
	|| (sprite_index == spr_iceflower)
	|| (sprite_index == spr_superflower)
	|| (sprite_index == spr_voltshroom)
		sequence = 2;
		
	//Otherwise, set the sequence to 'Transform'
	else
		sequence = 4;
}