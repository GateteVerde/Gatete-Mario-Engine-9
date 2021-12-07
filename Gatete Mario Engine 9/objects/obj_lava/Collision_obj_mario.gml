/// @description Insta-kill Mario

//Create Mario death object
with (instance_create_depth(other.x, other.y, -5, obj_mario_dead)) {

	image_blend = c_gray;
	alarm[2] = 1;
}

//Destroy real Mario object
with (other) instance_destroy();