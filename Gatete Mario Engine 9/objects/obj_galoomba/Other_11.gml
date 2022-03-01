/// @description Turn into a stunned galoomba

with (instance_create_depth(x, y, -2, obj_galoomba_down)) {

	dir = other.xscale;
}
instance_destroy();