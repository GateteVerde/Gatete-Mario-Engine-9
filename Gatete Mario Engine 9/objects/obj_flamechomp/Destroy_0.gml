/// @description Generate a new Flame Chomp if this didn't blew up

if (sprite_index != spr_flamechomp_flash) {

	with (instance_create_layer(x, ystart, "Main", obj_enemy_respawn)) 
		sprite_index = spr_flamechomp;
}
