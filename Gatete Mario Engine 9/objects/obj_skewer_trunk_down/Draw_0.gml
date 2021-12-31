/// @description Render me

//Base
draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Trunk
draw_sprite_tiled_area_ext(sprite_index, 1, screen_round(x), screen_round(y), x, parent.y+16, x+64, y-1, c_white, 1);