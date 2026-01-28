/// @description Render NPC

//Obtain sprite data
var _w = sprite_get_width(sprite_index);
var _h = sprite_get_height(sprite_index);
var _xoff = sprite_get_xoffset(sprite_index);
var _yoff = sprite_get_yoffset(sprite_index);	

//Draw NPC
draw_sprite_ext(sprite_index, 0, screen_round(x) + offset, screen_round(y) + 1, xscale, yscale, image_angle, c_white, image_alpha);

//Draw Ice Block
draw_sprite_stretched_ext(spr_enemy_ice, 0, screen_round(x) - _xoff + offset, screen_round(y) - _yoff + 1, _w, _h, c_white, image_alpha);