/// @description Render me

//Wings
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Blocks
draw_sprite_ext(sprite_index, 2, screen_round(x), screen_round(y) + block_offset_l, 1, 1, 0, c_white, 1);
draw_sprite_ext(sprite_index, 3, screen_round(x), screen_round(y) + block_offset_r, 1, 1, 0, c_white, 1);