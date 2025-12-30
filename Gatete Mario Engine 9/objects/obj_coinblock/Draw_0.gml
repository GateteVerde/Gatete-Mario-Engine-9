/// @description Render me

//Draw object
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Set text
draw_set_font(global.gui_font);
draw_text(bbox_right + 2, bbox_top, string(hspeed));