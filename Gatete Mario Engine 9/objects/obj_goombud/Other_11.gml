/// @description Turn into a stunned goombud

with (instance_create_depth(x, y, -2, obj_galoomba_down)) {

	sprite_index = spr_goombud_down;
	dir = 1 * sign(other.xspeed);
}
instance_destroy();