/// @description Destroy

with (instance_create_depth(x, y+4, depth - 2, obj_smoke)) {

	sprite_index = spr_smoke_b;
}

instance_destroy();
