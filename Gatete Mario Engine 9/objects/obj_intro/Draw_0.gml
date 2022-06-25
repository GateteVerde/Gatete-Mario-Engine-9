/// @description Draw the letter and text

//Draw the letter background
draw_sprite_ext(spr_letter, -1, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, 1, 1, 0, c_white, 1);

//Sets the font
draw_set_font(global.gui_font);

//Draws the text of the letter
draw_text_shadowed(camera_get_view_x(view_camera[0]) + 64, camera_get_view_y(view_camera[0]) + 40,"Hello!\n"
+ "Welcome to the newest version \n"
+ "of Gatete Mario Engine \n"
+ " \n"
+ "This engine was written by \n"
+ "the GMEngine Team. \n"
+ " \n"
+ "There's a lot of features on \n"
+ "this engine, some of them never \n"
+ "seen before in a fangame. \n"
+ " \n"
+ "I hope you enjoy this engine as \n"
+ "much as us programming it. \n"
+ " \n"
+ " \n"
+ " \n"
+ "        - The GMEngine Team -", c_black, c_black, 1, 1, 0.25, 1);
