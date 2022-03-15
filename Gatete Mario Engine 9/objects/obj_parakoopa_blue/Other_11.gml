/// @description Turn into a regular blue koopa

with (instance_create_depth(x, y, -2, obj_koopa_blue)) {

	xspeed = 0.8 * sign(other.xscale);
}
instance_destroy();