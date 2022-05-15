/// @description Enable gravity

//If this is a rinka projectile
if (rinka == 1) {
	
	//Turn into a regular rinka
	with (instance_create_depth(x, y, depth, obj_rinka)) {
		
		sprite_index = spr_lotusball_rinka;
	}
	
	//Destroy
	instance_destroy();
}

//Otherwise
else {

	//Gravity is enabled
	ready = 1;

	//Stop vertical speed
	yspeed = 0;

	//Turn around
	alarm[2] = 4;

	//Set horizontal speed
	xspeed = 0.5*sign(xspeed);
}
