/// @description Render tulip

//Render me
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);

//If the tulip can show up the text
if (showing > 0) {
	
	//Get width of the string
	var _stub_width = ((4 * string_length(string(varmsg))) + 4) * (1 / sprite_get_width(spr_tulip_speech));
	
	//Draw box
	draw_sprite_ext(spr_tulip_speech, 0, screen_round(x) + (sprite_width / 2), screen_round(y) - 11, _stub_width * 1.1, 1, 0, c_white, showing);
	draw_sprite_ext(spr_tulip_speech, 1, screen_round(x) + (sprite_width / 2), screen_round(y) - 4, 1, 1, 0, c_white, showing);
	
	//Align text
	draw_set_halign(fa_center);
	
	//Set font
	draw_set_font(fnt_tulip);
		
	//Draw text
	draw_text_transformed_colour(screen_round(x) + (sprite_width / 2) + 1, screen_round(y) - 26, string(varmsg), 1, 1, 0, c_black, c_black, c_black, c_black, showing / 10);
	draw_text_transformed_colour(screen_round(x) + (sprite_width / 2), screen_round(y) - 27, string(varmsg), 1, 1, 0, c_black, c_black, c_black, c_black, showing);
	
	//Reset align
	draw_set_halign(fa_left);	
}