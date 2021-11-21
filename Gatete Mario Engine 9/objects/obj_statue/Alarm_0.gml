/// @description Make the statue blink.

alarm[0] = 1;
if (instance_exists(owner)) {

	if (owner.image_alpha != 1)
	    owner.image_alpha = 1;
	else
	    owner.image_alpha = 0;
}