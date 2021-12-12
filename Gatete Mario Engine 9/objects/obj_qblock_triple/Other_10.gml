/// @description Make coins come out if no item was selected

for (var i=0; i<3; i++) {

	//If this block contains a coin
	if (sprout[i] == cs_coin)
	|| ((sprout[i] == cs_coin_s) && (!instance_exists(obj_invincibility)))
		instance_create_depth(x + 8 + (i * 16), ystart - 16, -4, obj_block_coin);
		
	//Otherwise, if there's a balloon inside this block
	else if (sprout[i] = cs_balloon)
		instance_create_depth(x + 8 + (i * 16), ystart - 16, -2, obj_balloon)
}