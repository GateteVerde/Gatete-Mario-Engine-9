/// @description Decrement alpha

image_alpha -= 0.1;
if (image_alpha < 0.1)
	instance_destroy();