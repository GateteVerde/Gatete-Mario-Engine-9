/// @description Render logo and disclaimer

//Logo
draw_sprite_ext(spr_title, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 48, 0.5, 0.5, 0, c_white, 1);

//Set font
draw_set_font(global.gui_font);

//Set text alignment
draw_set_valign(fa_center);
draw_set_halign(fa_center);

//Set colour
draw_set_colour(c_white);

//Text
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2) + 37, @"GATETE MARIO ENGINE 9 is a open-source
framework written to be used with 
GameMaker v2022.8 and above

This engine is licensed under the 
Berkeley Software Distribution 
3-Clause licence


All graphics, music, sounds and scenario
are copyright from Nintendo.


You can modify this screen with your logo!");

//Reset text alignment
draw_set_valign(fa_top);
draw_set_halign(fa_left);

/*Draw disclaimer
draw_sprite_ext(spr_disclaimer, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, c_white, 1);