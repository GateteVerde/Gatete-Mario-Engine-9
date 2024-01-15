/// @description Decrement alpha

image_alpha -= fade_rate;
if (image_alpha < fade_rate)
	instance_destroy();