/// @description Turn coins into physical coins

//If the coin is visible and it is not an outline
if (other.visible == 1)
&& (other.sprite_index != spr_coin_outline) {

	//Create a physical coin
	with (instance_create_layer(other.x + 8, other.y, "Main", obj_coinnpc)) {
	
		xspeed = random_range(-1, 1);
	}

	//Destroy
	with (other) instance_destroy();
}