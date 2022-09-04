/// @description Draw score

//Align text
draw_set_halign(fa_center);

//Set the colour
draw_set_colour(c_white);

//Set up font
draw_set_font(font);

//If this object is giving extra lives, draw sprite
if (value < 0)
&& (value > -4)
&& (sprite_index > -1) {
	
	//Scale it up
	scale += 0.05;
	if (scale > 1) {
		
		scale = 1;
		alpha += 0.05;
	}
	
	//Stay in-view
	if (y < camera_get_view_y(view_camera[0]) + 32) {
		
		draw_sprite_custom_origin(sprite_index, 0, screen_round(x), screen_round(camera_get_view_y(view_camera[0]) + 32), 16, 8, scale, scale, 0, c_white, 1);
		if (alpha > 1)
			draw_sprite_custom_origin(sprite_index, 1, screen_round(x), screen_round(camera_get_view_y(view_camera[0]) + 32), 16, 8, scale, scale, 0, c_white, alpha-1);
	}
	else {
		
		draw_sprite_custom_origin(sprite_index, 0, screen_round(x), screen_round(y), 16, 8, scale, scale, 0, c_white, 1);
		if (alpha > 1)
			draw_sprite_custom_origin(sprite_index, 1, screen_round(x), screen_round(y), 16, 8, scale, scale, 0, c_white, alpha-1);
	}
}
else {
	
	//If this uses a bonus time sprite
	if (value < -3) {
		
		//Stay in view
		if (y < camera_get_view_y(view_camera[0]) + 32)
			draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(camera_get_view_y(view_camera[0]) + 32), 1, 1, 0, c_white, 1);
		else
			draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
	}
	
	//Otherwise
	else {
		
		//If the score is over 799
		if (value > 799) {
			
			//Set the big font
			draw_set_font(font_big);
			
			//Set vertical alignment
			draw_set_valign(fa_bottom);
			
			//Scale it up
			scale += 0.05;
			if (scale > 1)
				scale = 1;
			
			//Stay in view
			if (y < camera_get_view_y(view_camera[0]) + 32)
				draw_text_transformed(screen_round(x), screen_round(camera_get_view_y(view_camera[0]) + 32), string(value), scale, scale, 0);
			else
				draw_text_transformed(screen_round(x), screen_round(y), string(value), scale, scale, 0);
				
			//Reset vertical alignment
			draw_set_valign(fa_top);
		}
		
		//Otherwise
		else {

			//Stay in view
			if (y < camera_get_view_y(view_camera[0]) + 32)
				draw_text(screen_round(x), screen_round(camera_get_view_y(view_camera[0]) + 32), string(value));
			else
				draw_text(screen_round(x), screen_round(y), string(value));
		}
	}
}

//Reset alignment
draw_set_halign(fa_left);