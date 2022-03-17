/// @description Turn into a regular red koopa

with (instance_create_depth(x, y, -2, obj_koopa_big_red)) {

	xspeed = 0.5 * sign(other.xscale);
}
instance_destroy();