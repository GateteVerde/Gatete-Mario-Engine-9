/// @description Render me

//Set palette
pal_swap_set(spr_palette_cloudrus, pal);

//Render me
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();
