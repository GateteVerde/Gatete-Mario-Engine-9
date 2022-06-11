/// @description Spit a pellet

//Shoot a ball in the facing direction
with (instance_create_depth(x+4*sign(xscale), y+6, -2, obj_snifit_pellet)) {
	
	xspeed = 1.5*other.xscale;
}

//Repeat the process
alarm[2] = 90;
