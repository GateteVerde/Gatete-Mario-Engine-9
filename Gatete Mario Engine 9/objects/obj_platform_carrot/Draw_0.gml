/// @description Render me

//Draw the platform
draw_self();

//Draw the carrot part
draw_sprite_stretched_ext(spr_platform_carrot_stem, -1, screen_round(bbox_left + bbox_right) / 2 - 16, y + 32, 32, ((ystart + 32)-(y + 32)), c_white, 1);