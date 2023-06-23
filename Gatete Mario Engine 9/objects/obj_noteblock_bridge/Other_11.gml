/// @description Make a powerup sprout downwards

//Sprout out an item if there's any
if (sprout != cs_coin) {
	
	//Otherwise, if there's a powerup inside
	if (sprout >= cs_big)
	&& ((global.powerup == cs_tiny) || (global.powerup == cs_small))
		sprout = cs_big;
        
    //Create the item
	with (sprite_create_object(macro_get_sprite(sprout), x+8, ystart+16, 10)) {
	
		if (variable_instance_exists(id, "move_after_landing"))
			move_after_landing = true;
	}
}

//Do not sprout more items
sprout = cs_coin;