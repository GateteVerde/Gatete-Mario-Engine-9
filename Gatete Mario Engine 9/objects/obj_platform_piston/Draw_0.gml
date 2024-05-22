/// @description Render me

//Draw stem
draw_sprite_ext(spr_platform_piston_stem, 0, screen_round(x + sprite_width / 2), screen_round(y) + 16, 1, room_height-ystart, 0, c_white, 1);

//Draw platform
draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), image_xscale, 1, 0, c_white, 1);