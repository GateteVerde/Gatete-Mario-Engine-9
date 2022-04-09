/// @description Turn into a stunned galoomba

with (instance_create_depth(x, y, -2, obj_nokobomb_down)) {

	dir = 1 * sign(other.xspeed);
}
instance_destroy();