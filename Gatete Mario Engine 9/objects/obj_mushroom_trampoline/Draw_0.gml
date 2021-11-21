/// @description Draw platform

//Draw mushroom
draw_sprite_custom_origin(sprite_index, 0, screen_round(x), screen_round(y), 40, 20, xscale, yscale, 0, c_white, 1);

//Draw stem
draw_sprite_ext(sprite_index, 1, screen_round(x), screen_round(y)+20, 1, 1, 0, c_white, 1);