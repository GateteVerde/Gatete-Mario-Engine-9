/// @description Draw the block

//Manage "?" mark position
xx++;

//Draw the block
draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
draw_sprite_tiled_area_ext(sprite_index, 1, screen_round(x) + xx, screen_round(y), x + 2, y + 2, x + 29, y + 14, c_white, 1);