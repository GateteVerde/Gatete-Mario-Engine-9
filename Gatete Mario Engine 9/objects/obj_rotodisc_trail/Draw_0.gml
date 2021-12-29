/// @description Render me

//Set the palette
pal_swap_set(spr_palette_rotodisc, pal);

//Draw it
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Reset the palette
pal_swap_reset();