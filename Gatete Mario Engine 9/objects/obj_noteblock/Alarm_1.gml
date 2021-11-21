/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Sprout out an item if there's any
if (sprout != cs_coin) {
	
	//Otherwise, if there's a powerup inside
	if (sprout >= cs_big)
	&& ((global.powerup == cs_tiny) || (global.powerup == cs_small))
		sprout = cs_big;
        
    //Create the item
    if (sprout != cs_coin)
        with (instance_create_depth(x+8, y, 10, obj_powerup_sprout))       
            sprite_index = macro_get_sprite(other.sprout);
}

//Do not sprout more items
sprout = cs_coin;

//Allow block to be bumped again
ready = 0;