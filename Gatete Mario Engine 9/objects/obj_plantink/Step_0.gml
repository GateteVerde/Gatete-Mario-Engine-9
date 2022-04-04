/// @description Jumping Piranha Plant fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	y += yspeed;
	yspeed += yadd;
}

//Gravity
yadd = 0.1;

//Increment scale
scale += 0.05;
if (scale > 2) {
	
	//Destroy previous ink screen
	if (instance_exists(obj_inkscreen)) {
	
		with (obj_inkscreen)		
			ready = 1;
	}

	//Create 'Ink' screen
	instance_create_depth(0, 0, -50, obj_inkscreen);
	
	//Create splat effect
	with (instance_create_depth(x, y, -50, obj_smoke)) {
	
		sprite_index = spr_smoke_b;
		image_xscale = 2;
		image_yscale = 2;
		image_blend = c_black;
	}
	
	//Destroy
	instance_destroy();
}
