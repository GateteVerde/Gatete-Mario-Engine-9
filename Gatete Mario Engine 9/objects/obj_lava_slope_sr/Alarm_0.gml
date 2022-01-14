/// @description Create collision if required

//If this lava object is not upside down
if (image_yscale != -1)
	mycol = instance_create_layer(x, y, "Main", obj_slope_steep_r);