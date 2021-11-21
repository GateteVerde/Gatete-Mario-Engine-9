/// @description Increment scale

//Port scale to both image_xscale / image_yscale
image_xscale = scale;
image_yscale = scale;

//Increment scale
scale += 0.075;
if (scale > 1.5)
	instance_destroy();	