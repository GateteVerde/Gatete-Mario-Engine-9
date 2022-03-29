/// @description Custom Stomp script

//Turn into a pancake
with (instance_create_depth(x, y+1, -6, obj_stomped)) {

	sprite_index = spr_dinotorch_sq;
	image_xscale = other.xscale;
}
	
//Destroy
instance_destroy();