/// @description Turn coins into physical coins

//Create a physical coin
with (instance_create_layer(other.x, other.y, "Main", obj_coinnpc_big)) {
	
	sprite_index = spr_coin_30;
	xspeed = random_range(-1, 1);
}

//Destroy
with (other) instance_destroy();