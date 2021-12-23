/// @description Turn coins into physical coins

//Create a physical coin
with (instance_create_layer(other.x + 8, other.y, "Main", obj_coinnpc)) {
	
	xspeed = random_range(-1, 1);
}

//Destroy
with (other) instance_destroy();