/// @description Thrown enemy logic

if (sprite_height > 16)
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), image_xscale, -1, 0, c_white, 1);
else
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+16, image_xscale, -1, 0, c_white, 1);