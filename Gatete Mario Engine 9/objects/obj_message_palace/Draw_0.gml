/// @description Display up the message

//Set the colour for the rectangle
draw_set_colour(c_black);

//Set the alpha
draw_set_alpha(alpha/2);

//Draw the rectangle
draw_roundrect((camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2) - 100, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 45, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2) + 100, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) + 28, false);

//Set the font
draw_set_font(global.gui_font);

//Set the colour
draw_set_colour(c_white);

//Set the alpha
draw_set_alpha(alpha);

//Align the text
draw_set_valign(fa_center);
draw_set_halign(fa_center);

//Draw the text
draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 8, "- SWITCH PALACE -\n" 
+ "\n"
+ "The power of the switch\n"
+ "you pressed will turn\n"
+ "\n"
+ "\n"
+ "into", c_black, c_white, 1, 1, 1, 1);

//Re-Align the text
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//Draw the blocks
draw_sprite_ext(sw, 1, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2) - 39, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) + 6, 1, 1, 0, c_black, alpha);
draw_sprite_ext(sw, 1, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2) - 40, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) + 5, 1, 1, 0, c_white, alpha);

draw_sprite_ext(sw, 0, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2) + 26, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) + 6, 1, 1, 0, c_black, alpha);
draw_sprite_ext(sw, 0, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2) + 25, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) + 5, 1, 1, 0, c_white, alpha);

//Reset alpha
draw_set_alpha(1);