/// @description Render tulip

//Render me
draw_sprite_ext(stem_sprite, stem_anim, screen_round(x), screen_round(y) + 1, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y) + 1, image_xscale, 1, 0, c_white, 1);

//Set font
draw_set_font(global.gui_font);

//If the tulip can show up the text
if (showing > 0) {
	
	//Render speech bubble
	#region

		//Render text background
		draw_set_alpha((showing / 100) * 80);
		draw_rectangle_colour(screen_round(x) - 4 - (string_width(varmsg) / 2), screen_round(bbox_top) - 5, ((screen_round(x) - 4 - (string_width(varmsg) / 2)) + string_width(varmsg)) + 9, screen_round(bbox_top) - 5 - (string_height(varmsg) + 9), c_black, c_black, c_black, c_black, 0);
		
		//Render text background outline
		draw_set_alpha(showing);
		draw_rectangle_colour(screen_round(x) - 4 - (string_width(varmsg) / 2), screen_round(bbox_top) - 5, ((screen_round(x) - 4 - (string_width(varmsg) / 2)) + string_width(varmsg)) + 9, screen_round(bbox_top) - 5 - (string_height(varmsg) + 9), c_white, c_white, c_white, c_white, 1);
		draw_triangle_colour(screen_round(x) - 4, screen_round(bbox_top) - 6, screen_round(x) + 4, screen_round(bbox_top) - 6, screen_round(x), screen_round(bbox_top) - 2, c_white, c_white, c_white, 0);
		
		//Reset alpha
		draw_set_alpha(1);

	#endregion
	
	//Set align
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);

	//Draw text
	draw_text_transformed_colour(screen_round(x) + 1, screen_round(bbox_top) - 8, string(varmsg), 1, 1, 0, c_black, c_black, c_black, c_black, showing);
	draw_text_transformed_colour(screen_round(x), screen_round(bbox_top) - 9, string(varmsg), 1, 1, 0, c_white, c_white, c_white, c_white, showing);
	
	//Reset align
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}