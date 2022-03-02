/// @description Turn into a stunned galoomba

with (instance_create_depth(x, y, -2, obj_galoomba)) {

	xspeed = 0.5 * sign(other.xspeed);
}
instance_destroy();