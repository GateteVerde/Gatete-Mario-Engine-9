/// @description Turn into a regular galoomba

with (instance_create_depth(x, y, -2, obj_galoomba_down)) {

	dir = 1 * sign(other.xspeed);
}
instance_destroy();