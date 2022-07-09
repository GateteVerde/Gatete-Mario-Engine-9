/// @description Render background and draw the text

//Draw menu background
draw_sprite_ext(spr_gui_global_pause, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, scale, scale, 0, c_white, 1);

//Set up font
draw_set_font(global.gui_font);

//If the menu background is fully scaled
if (scale_type == 1) {

	//Set alignment
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);

	//Draw menu items
	for (var i=0; i<array_length_1d(menu); ++i) { 
	
		//Sets the colour of the highlighted option
		var _colour = (i == index) ? c_white : c_gray;
		
		//Set colour
		draw_set_colour(_colour);
		
		#region TEXT
		
			//Draw arrow
			if (i == index) {

				draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - 12 + (12 * i), "{                   }", c_white, c_white, c_white, c_white, 1);
			}
			
			//Draw option
			draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - 12 + (12 * i), string(menu[i]), _colour, _colour, _colour, _colour, 1);
		#endregion
		
		//Reset colour
		draw_set_colour(c_white);
	}

	//Set alignment
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}