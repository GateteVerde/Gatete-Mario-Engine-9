/// @description Render platform

//Set palette
pal_swap_set(spr_palette_yoshi, colour);

//Draw outline
draw_sprite_stretched_ext(sprite_index, -1, xstart, ystart, sprite_width, sprite_height, c_white, (global.mount == 1) ? 1 : 0.5);

//Reset palette
pal_swap_reset();