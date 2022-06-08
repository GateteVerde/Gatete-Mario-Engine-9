/// @description Render me

//Set frame
var subimg = (direct == 45 || direct == 225) ? 0 : 1;

//Render cannon
draw_sprite_ext(sprite_index, subimg, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);