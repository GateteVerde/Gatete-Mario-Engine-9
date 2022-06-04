/// @description Turn into a stunned bobomb

with (instance_create_depth(x, y, -2, obj_bobomb_down)) {

	dir = 1 * sign(other.xspeed);
}
instance_destroy();
