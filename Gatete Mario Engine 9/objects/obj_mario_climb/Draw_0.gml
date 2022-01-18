/// @description Render me

//Set palette
pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);

//Draw Mario
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();