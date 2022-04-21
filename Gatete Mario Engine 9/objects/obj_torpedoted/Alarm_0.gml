/// @description Leave a trail

//Temporary variable
var xx = (xscale = 1) ? -16 : 16;

//Repeat the process
alarm[0] = 2;

//Generate a bubble
with (instance_create_depth(x + xx, y + random_range(4, 12), -4, obj_smoke)) {

	sprite_index = spr_bubble;
	vspeed = -0.135;
	image_alpha = random_range(0.25, 0.5);
}
