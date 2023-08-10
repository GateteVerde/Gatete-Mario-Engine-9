/// @description Render tulip

//Render me
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);

//If the tulip can show up the text
if (showing == 1) {
	
	//Get width of the string
	var _stub_width = ((8 * string_length(string(varmsg))) + 8) * (1.0 / sprite_get_width(spr_tulip_speech));
	
	//Draw box
	draw_sprite_ext(spr_tulip_speech, 0, screen_round(x) + (sprite_width / 2), screen_round(y) - 11, _stub_width, 1, 0, c_white, 1);
	draw_sprite_ext(spr_tulip_speech, 1, screen_round(x) + (sprite_width / 2), screen_round(y) - 4, 1, 1, 0, c_white, 1);
	
	//Align text
	draw_set_halign(fa_center);
	
	//Set font
	draw_set_font(global.gui_font);
		
	//Draw text
	draw_text_transformed_colour(screen_round(x) + (sprite_width / 2) + 1, screen_round(y) - 22, string(varmsg), 1, 1, 0, c_black, c_black, c_black, c_black, 0.25);
	draw_text_transformed_colour(screen_round(x) + (sprite_width / 2), screen_round(y) - 23, string(varmsg), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
	
	//Reset align
	draw_set_halign(fa_left);	
}