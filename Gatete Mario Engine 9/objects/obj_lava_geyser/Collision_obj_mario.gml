/// @description Insta-kill Mario

//Create Mario death object
with (instance_create_depth(other.x, other.y, -5, obj_mario_dead)) {

	//Set gray palette
	image_blend = c_gray;
	alarm[2] = 1;
}

//Destroy Mario
with (obj_mario) instance_destroy();