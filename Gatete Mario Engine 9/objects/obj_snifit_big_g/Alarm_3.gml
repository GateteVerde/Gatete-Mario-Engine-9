/// @description Spit another pellet

//Shoot a ball in the facing direction
with (instance_create_depth(x+4*sign(xscale), y, -2, obj_snifit_pellet)) {
	
	sprite_index = spr_snifit_pellet_big;
	xspeed = 1.5*other.xscale;
}