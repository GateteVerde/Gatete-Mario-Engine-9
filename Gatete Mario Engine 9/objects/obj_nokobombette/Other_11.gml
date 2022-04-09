/// @description Turn into a stunned galoomba

with (instance_create_depth(x, y, -2, obj_nokobomb_down)) {

	sprite_index = spr_nokobombette_down;
	image_speed = 1;
	dir = 1 * sign(other.xspeed);
}
instance_destroy();