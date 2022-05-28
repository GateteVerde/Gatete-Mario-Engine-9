/// @description Render me

//Set direction
var _dir = point_direction(x, y, xprevious, yprevious);

//Render me
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, _dir - 180, c_white, 1);
