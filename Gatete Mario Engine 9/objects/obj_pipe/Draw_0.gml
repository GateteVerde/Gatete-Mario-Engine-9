/// @description Draw the pipe

//Set the palette
pal_swap_set(spr_palette_pipe, palette);

//Draw the pipe
draw_sprite_ext(sprite_index, 0, x, y, 1, image_yscale, 0, c_white, 1);

//Reset the palette
pal_swap_reset();