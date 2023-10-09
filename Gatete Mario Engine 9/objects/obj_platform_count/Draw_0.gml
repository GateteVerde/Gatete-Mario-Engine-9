/// @description Render me

//Draw the platform
draw_self();

//Draw the number
if (image_speed == 0) {

	//Set the font
	draw_set_font(global.gui_font);
	
	//Align
	draw_set_halign(fa_center);
	
	//Draw the text
	draw_text_shadowed(round(bbox_left + bbox_right) / 2, y + 7, string(count), make_colour_rgb(248, 144, 0), c_white, 1, 1, 1, 1);
	
	//Reset colour and alignment
	draw_set_halign(fa_left);
}