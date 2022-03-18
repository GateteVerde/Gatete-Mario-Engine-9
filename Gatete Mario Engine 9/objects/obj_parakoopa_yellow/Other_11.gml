/// @description Turn into a regular yellow koopa

with (instance_create_depth(x, y, -2, obj_koopa_yellow)) {

	xspeed = 0.5 * sign(other.xscale);
}
instance_destroy();