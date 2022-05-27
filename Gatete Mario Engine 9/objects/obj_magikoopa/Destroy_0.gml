/// @description Generate a new Magikoopa

with (instance_create_depth(-1000, -1000, depth, obj_enemy_respawn)) {

	sprite_index = spr_magikoopa;
	xmin = other.xmin;
	xmax = other.xmax;
}
