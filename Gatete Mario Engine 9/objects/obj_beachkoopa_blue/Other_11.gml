/// @description Turn into a pancake

//If the enemy is not stunned
if (ready == 2) {

	with (instance_create_depth(x, y+1, -6, obj_stomped)) {

		sprite_index = spr_beachkoopa_blue_sq;
	}
	instance_destroy();
}