/// @description Make a coin come out if no item was selected

if (sprout == cs_coin)
|| ((sprout == cs_coin_s) && (!instance_exists(obj_invincibility)))
	instance_create_depth(x + 16, ystart - 16, -4, obj_block_coin);