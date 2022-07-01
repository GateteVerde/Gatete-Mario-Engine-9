/// @description Grow until it is out of the block

//If not frozen
if (freeze == false) {

	y += yspeed;
	scale += 0.015625;
}

//If the size is the default sprite size
if (scale > 1) {

	//Turn into a real mega mushroom
	with (instance_create_depth(x, y, -2, obj_megashroom)) {
		
		alarm[10] = 1;
	}
	
	//Destroy
	instance_destroy();
}