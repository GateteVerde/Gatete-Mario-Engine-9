/// @description Render me

//Draw the platform
draw_self();

//Draw the middle part
draw_sprite(spr_platform_buoy_middle, -1, screen_round(bbox_left + bbox_right) / 2, y - 16);