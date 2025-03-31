/// @description Turn into a pancake

//Create a stomped enemy
with (instance_create_depth(x, y+1, -6, obj_stomped)) {

	sprite_index = spr_beachkoopa_blue_sq;
}
	
//Destroy
instance_destroy();