/// @description Make a coin or a balloon come out if no item was selected

//If there's a coin inside this block
if (sprout == cs_coin)
|| ((sprout == cs_coin_s) && (!instance_exists(obj_invincibility))) {
	
	if (bottom == false)
		instance_create_depth(x + 8, ystart - 16, -4, obj_block_coin);
	else
		instance_create_depth(x + 8, ystart + 16, -4, obj_block_coin_down)
}
	
//Otherwise, if there's a balloon inside this block
else if (sprout = cs_balloon) {
	
	if (bottom == false)
		instance_create_depth(x + 8, ystart - 16, -2, obj_balloon);
	else
		instance_create_depth(x + 8, ystart + 16, -2, obj_balloon);
}

//Otherwise, if a coin snake is inside this block
else if (sprout = cs_snake) {

	if (bottom == false)
		instance_create_depth(x, ystart, 10, obj_coin_snake);
	else {
	
		with (instance_create_depth(x, ystart, 10, obj_coin_snake)) {
		
			yspeed = 1;
			nextdir = 270;
		}
	}
}