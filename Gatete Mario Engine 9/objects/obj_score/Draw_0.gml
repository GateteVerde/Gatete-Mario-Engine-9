/// @description Draw score

//Align text
draw_set_halign(fa_center);

//Set the colour
draw_set_colour(c_white);

//Set up font
draw_set_font(font);

//If this object is giving extra lives, draw sprite
if (value < 0)
&& (sprite_index > -1) {
	
	//Scale it up
	scale += 0.05;
	if (scale > 1) {
		
		scale = 1;
		alpha += 0.05;
	}
	
	//Stay in-view
	if (y < camera_get_view_y(view_camera[0]) + 32) {
		
		draw_sprite_custom_origin(sprite_index, 0, x, camera_get_view_y(view_camera[0]) + 32, 16, 8, scale, scale, 0, c_white, 1);
		if (alpha > 1)
			draw_sprite_custom_origin(sprite_index, 1, x, camera_get_view_y(view_camera[0]) + 32, 16, 8, scale, scale, 0, c_white, alpha-1);
	}
	else {
		
		draw_sprite_custom_origin(sprite_index, 0, x, y, 16, 8, scale, scale, 0, c_white, 1);
		if (alpha > 1)
			draw_sprite_custom_origin(sprite_index, 1, x, y, 16, 8, scale, scale, 0, c_white, alpha-1);
	}
}
else {

	//Stay in view
	if (y < camera_get_view_y(view_camera[0]) + 32)
		draw_text(x, camera_get_view_y(view_camera[0]) + 32, string(value));
	else
		draw_text(x, y, string(value)); 
}

//Reset alignment
draw_set_halign(fa_left);