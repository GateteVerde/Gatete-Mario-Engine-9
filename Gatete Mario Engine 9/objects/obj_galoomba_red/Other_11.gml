/// @description Turn into a stunned galoomba

with (instance_create_depth(x, y, -2, obj_galoomba_down)) {

	sprite_index = spr_galoomba_red_down;
	dir = 1 * sign(other.xspeed);
}
instance_destroy();