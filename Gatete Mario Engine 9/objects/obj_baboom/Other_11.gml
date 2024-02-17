/// @description Turn into a stunned baboom

with (instance_create_depth(x, y, -2, obj_baboom_down)) {

	dir = 1 * sign(other.xspeed);
}
instance_destroy();