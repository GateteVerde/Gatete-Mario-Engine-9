/// @description Render Pipe

//Set the palette
pal_swap_set(spr_palette_pipe, palette);

//Bottom
draw_sprite_ext(sprite_index, 1, screen_round(x), screen_round(y), 1, image_yscale, 0, c_white, 1);

//Top
draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Reset the palette
pal_swap_reset();