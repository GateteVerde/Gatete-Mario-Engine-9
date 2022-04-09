/// @description Render me

//Obtain direction
var direct = (speed = 0) ? save_dir : direction;

//Render me
draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y), 8, 8, xscale, 1, direct + turn, c_white, 1);
