/// @description Turn into a pancake

with (instance_create_depth(x, y+1, -6, obj_stomped)) {

	sprite_index = spr_goomba_red_sq;
}
instance_destroy();