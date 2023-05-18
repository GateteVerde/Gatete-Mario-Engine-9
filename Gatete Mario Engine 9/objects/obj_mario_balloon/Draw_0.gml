/// @description Draw Mario

//Set up the palette
pal_swap_set_player(spr_palette, spr_palette_invincible, spr_palette_mega);

//Draw cape
if (deflate == 1)
&& (global.powerup == cs_cape) {

	draw_sprite_ext(spr_cape_climb, -1, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, 1);
}

//Draw sprite
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();