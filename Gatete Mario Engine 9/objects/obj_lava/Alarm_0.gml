/// @description Create collision if required

//If this lava object is not tilted
if (image_angle == 0) {

	mycol = instance_create_layer(x, y, "Main", obj_semisolid);
	with (mycol)
		image_xscale = other.image_xscale;
}