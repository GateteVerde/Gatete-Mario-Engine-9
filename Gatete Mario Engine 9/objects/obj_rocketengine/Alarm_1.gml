/// @description Stop engine

//If Mario does not exist or it does exist and it's not transforming
if (!instance_exists(obj_mario))
|| ((instance_exists(obj_mario)) && (instance_exists(obj_mario_transform))) {

	alarm[1] = 1;
	exit;
}

//Set the sprite
sprite_index = spr_rocketengine_st;

//Do not animate.
image_speed = 0;
image_index = 3;

//Set up frames.
alarm[2] = 2;

//Set up light frame
if (light != -1)
    with (light) image_index = 0;
