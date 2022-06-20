/// @description Draw menu

//Set text alignment
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

//Set up font
draw_set_font(global.gui_font_menu);

//Line spacing
var _gap = 12;
var _yy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16 - (_gap * array_length_2d(menu, sub_menu));

//Draw menu items
for (var i=0; i<array_length_2d(menu, sub_menu); ++i) { 
	
	//Sets the colour of the highlighted option
	var _colour = (i == index) ? c_white : c_ltgray;
	
	//Draw the text
	draw_text_shadowed(camera_get_view_x(view_camera[0]) + 32, _yy + (_gap * i), string_upper(menu[sub_menu, i]), c_black, _colour, 1, 1, 0.5, 1);
	
	//Draw cursor
	if (i == index) {
		
		draw_sprite_ext(spr_gui_cursor, 0, camera_get_view_x(view_camera[0]) + 12, _yy + (_gap * i) - 8, 1, 1, 0, c_white, 1);
	}
}

//Set horizontal alignment
draw_set_halign(fa_right);

//Draw keys
if (sub_menu == 2) {

	for (var i=0; i<array_length_1d(key); ++i) {
	
		//Sets the colour of the highlighted option
		var _colour = (i == index) ? c_white : c_ltgray;
		
		//Draw the text
		draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 32, _yy + (_gap * i), string_upper(key[i]), c_black, _colour, 1, 1, 0.5, 1);
	}
	
	//If in waiting mode
	if (waiting == 1) {
		
		draw_set_halign(fa_center);
		draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, "PRESS A KEY....", c_black, c_red, 1, 1, 0.5, 1);
		draw_set_halign(fa_left);
	}
}

//Reset text alignment
draw_set_valign(fa_top);
draw_set_halign(fa_left);