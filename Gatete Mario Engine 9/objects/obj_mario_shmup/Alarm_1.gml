/// @description Generate bubbles if underwater

if (subpop == true) {

	//Repeat the process
	alarm[1] = 2;

	//Generate a bubble
	with (instance_create_depth(x -16, y + random_range(4, 12), -4, obj_smoke)) {

		sprite_index = spr_bubble;
		vspeed = -0.135;
		image_alpha = random_range(0.25, 0.5);
	}
}