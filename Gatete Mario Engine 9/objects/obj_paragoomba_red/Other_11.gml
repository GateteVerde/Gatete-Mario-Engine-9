/// @description Turn into a regular red goomba

with (instance_create_depth(x, y, -2, obj_goomba_red)) {

	xspeed = 0.5 * sign(other.xspeed);
}
instance_destroy();