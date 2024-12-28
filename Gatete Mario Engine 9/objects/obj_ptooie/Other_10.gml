/// @description Custom death event

//Create smoke effect
with (instance_create_depth(x, y, -4, obj_smoke)) {

	sprite_index = spr_smoke;
	image_xscale = 1;
	image_yscale = 1;
}

//Destroy
instance_destroy();