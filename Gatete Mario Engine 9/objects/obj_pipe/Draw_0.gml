/// @description Draw the pipe

//Set the palette
pal_swap_set(spr_palette_pipe, pal);

//Draw the pipe
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1);

//Reset the palette
pal_swap_reset();