/// @description Draw Mario

//Set up the palette
pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible, spr_palette_mario_mega);

//Draw sprite
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();