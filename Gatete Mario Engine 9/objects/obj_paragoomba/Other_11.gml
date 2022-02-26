/// @description Turn into a regular goomba

with (instance_create_depth(x, y, -2, obj_goomba)) {

	xspeed = 0.5 * sign(other.xspeed);
}
instance_destroy();