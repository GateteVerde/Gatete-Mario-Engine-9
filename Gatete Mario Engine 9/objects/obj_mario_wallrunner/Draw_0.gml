/// @description Render Mario

//Set palette
pal_swap_set_player(spr_palette, spr_palette_invincible);

//Draw cape
if (global.powerup == cs_cape) {

	draw_sprite_ext(spr_cape_walk, -1, screen_round(x), screen_round(y), 1, xscale, image_angle, c_white, obj_mario.image_alpha);
}

//Draw Mario
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, xscale, image_angle, c_white, obj_mario.image_alpha);

//Reset shader
pal_swap_reset();