/// @description Turn into a regular koopa

with (instance_create_depth(x, y, -2, obj_koopa_big)) {

	xspeed = 0.5 * sign(other.xspeed);
}
instance_destroy();