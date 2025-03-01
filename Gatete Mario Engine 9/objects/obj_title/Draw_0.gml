/// @description Draw menu

//Set up font
draw_set_font(global.gui_font_menu);

#region COG WHEELS

	#region ALPHA / ANIM
	
		//Update alpha
		alpha += (sub_menu < 2) ? -0.0125 : 0.0125;
		
		//Update title y position
		yy = (sub_menu < 2) ? lerp(yy, 0, 0.1) : lerp(yy, 96, 0.1);
		
		//Update anim
		anim += 0.5;
		
		//Cap alpha
		if (alpha < 0)
			alpha = 0;
		else if (alpha > 0.25)
			alpha = 0.25;
	#endregion
	
	//Draw cogwheels
	draw_sprite_ext(spr_gui_cogwheel, anim, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, 1, 1, 0, c_white, alpha);
	draw_sprite_ext(spr_gui_cogwheel, anim, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, 1, 1, 0, c_white, alpha);
#endregion

#region TITLE

	//Draw title
	draw_sprite_ext(spr_title, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 64 - yy, (global.gw/sprite_get_width(spr_title)), (global.gw/sprite_get_width(spr_title)), 0, c_white, 1);
#endregion

#region MENU

//If the menu is waiting for input
if (start == 0) {
	
	//Set text alignment
	draw_set_halign(fa_center)
	
	//Draw text
	if (display == 1) {
		
		draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 + 48, "PRESS " + string(key_to_string(global.key[input.action_0])) + " TO BEGIN!", c_black, c_white, 1, 1, 0.5, 1);
	}
	
	//Reset text alignment
	draw_set_halign(fa_left);
}

//Otherwise if input has been given from the player, display menu
else if (start == 1) {

	//Set text alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);

	//Line spacing
	var _gap = 12;
	var _yy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24 - (_gap * array_length_2d(menu, sub_menu));

	//Draw menu items
	for (var i=0; i<array_length(menu[sub_menu]); ++i) { 
	
		//Sets the colour of the highlighted option
		var _colour = (i == index) ? c_white : c_ltgray;
	
		//Draw the text
		draw_text_shadowed(camera_get_view_x(view_camera[0]) + 32, _yy + (_gap * i), menu[sub_menu, i], c_black, _colour, 1, 1, 0.5, 1);
	
		//Draw cursor
		if (i == index) {
			
			cursor = (sub_menu == 1) ? spr_gui_cursor_b : spr_gui_cursor;
			draw_sprite_ext(cursor, anim, camera_get_view_x(view_camera[0]) + 12, _yy + (_gap * i) - 8, 1, 1, 0, c_white, 1);
		}
	}

	//Set horizontal alignment
	draw_set_halign(fa_right);

	//Draw keys
	if (sub_menu == 3) {

		for (var i=0; i<array_length(key); ++i) {
	
			//Sets the colour of the highlighted option
			var _colour = (i == index) ? c_white : c_ltgray;
		
			//Draw the text
			draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 32, _yy + (_gap * i), string_upper(key[i]), c_black, _colour, 1, 1, 0.5, 1);
		}
	
		//If in waiting mode
		if (waiting == 1) {
		
			draw_set_halign(fa_center);
			draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24, "PRESS A KEY....", c_black, c_red, 1, 1, 0.5, 1);
			draw_set_halign(fa_left);
		}
	}
	
	//Reset vertical text alignment
	draw_set_valign(fa_top);
}
#endregion

//Draw copyright and reset horizontal text alignment
draw_set_halign(fa_center);
draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24 + (yy / 2), "MARIO IS (C) FROM NINTENDO\n2023-2025 GREEN BARON GAMES", c_black, c_white, 1, 1, 0.5, 1);
draw_set_halign(fa_left);