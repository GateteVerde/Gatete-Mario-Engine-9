/// @description Placeholder title screen

//Center the text
draw_set_valign(fa_center);
draw_set_halign(fa_center);

//Set up font
draw_set_font(global.gui_font);

//Draw text
draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, "PRESS START!", c_black, c_white, 1, 1, 0.5, 1);

//Reset text alignment
draw_set_valign(fa_top);
draw_set_halign(fa_left);