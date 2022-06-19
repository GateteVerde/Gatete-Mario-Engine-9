/// @description Turn into a regular walrus

with (instance_create_depth(x, y, -2, obj_walrus)) {

	xspeed = 0.5 * sign(other.xspeed);
}
instance_destroy();