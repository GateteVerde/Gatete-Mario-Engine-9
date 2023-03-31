/// @description Draw the text and the message box

//Draw the screenshot.
freeze_render();

//Draw the message box
if (scale > 0.1) {
	
	draw_sprite_ext(spr_gui_global_message, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 68, scale, scale, 0, c_white, 1);
}

//If the text is being displayed
if (showing == 1) {

    //Increment the number of letters that should be displayed
    if (a <= string_length(text)) {
		
        a++;
	}
	
	//Set the font
	draw_set_font(global.gui_font);
	
	//Draw the text
	draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 96, camera_get_view_y(view_camera[0]) + 40, string_copy(text, 1, a), c_black, c_white, 1, 1, 0.5, 1);
}