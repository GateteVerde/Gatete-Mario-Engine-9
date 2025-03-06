/// @description Render tulip

//Render me
draw_sprite_ext(stem_sprite, stem_anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);

//If the tulip can show up the text
if (showing > 0) {
	
	//Get string width/height
	var ww = string_width(varmsg) / 8;
	var hh = string_height(varmsg) / 8;
	
	//Render speech bubble
	draw_sprite_ext(spr_tulip_speech, 0, screen_round(x), screen_round(y) - 16 - hh, ww, hh, 0, c_white, showing);
	draw_sprite_ext(spr_tulip_speech, 1, screen_round(x), screen_round(y) - 16 - hh, ww, hh, 0, c_white, showing);
	
	//Set align
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	
	//Set font
	draw_set_font(global.gui_font);

	//Draw text
	draw_text_transformed_colour(screen_round(x) + (sprite_width / 2) + 1, screen_round(y) - 16, string(varmsg), 1, 1, 0, c_black, c_black, c_black, c_black, showing);
	draw_text_transformed_colour(screen_round(x) + (sprite_width / 2), screen_round(y) - 17, string(varmsg), 1, 1, 0, c_white, c_white, c_white, c_white, showing);
	
	//Reset align
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}