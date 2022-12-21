/// @description Render

//Set up the palette
pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible, spr_palette_mario_mega);

//Render me
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), image_xscale, 1, image_angle, c_white, alpha);

//Reset the palette
pal_swap_reset();