/// @description Turn into a stunned bobomb

with (instance_create_depth(x, y, -2, obj_popomb_down)) {

	dir = 1 * sign(other.xspeed);
}
instance_destroy();