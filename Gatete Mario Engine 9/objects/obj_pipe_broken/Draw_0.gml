/// @description Draw the pipe

//Set the palette
pal_swap_set(spr_palette_pipe, palette);

//Draw pipe
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), 1, image_yscale, image_angle, c_white, 1);

//Reset the palette
pal_swap_reset();