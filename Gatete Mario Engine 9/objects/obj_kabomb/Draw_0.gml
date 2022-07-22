/// @description Render me

//Set palette
pal_swap_set(spr_palette_kabomb, pal);

//Render me
draw_sprite_ext(sprite_index, -1, screen_round(x) + xoffset, screen_round(y) + 1 + yoffset, xscale, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();