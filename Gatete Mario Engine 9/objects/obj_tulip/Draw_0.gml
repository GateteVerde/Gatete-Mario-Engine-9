/// @description Render tulip

//Render me
draw_sprite_ext(stem_sprite, stem_anim, screen_round(x), screen_round(y) + 1, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y) + 1, image_xscale, 1, 0, c_white, 1);

//Set font
draw_set_font(global.gui_font);

//If the tulip can show up the text
if (showing > 0) {
	
	//Get string width height
	var ww = string_width(varmsg) - 1;
	var hh = string_height(varmsg);
	
	//Render speech bubble
	draw_sprite_ext(spr_tulip_speech, 0, screen_round(x), screen_round(bbox_top) - 13 - (hh / 8), (ww / 8), hh / 8, 0, c_white, showing);
	draw_sprite_ext(spr_tulip_speech_arrow, 0, screen_round(x), screen_round(bbox_top) - 6, 1, 1, 0, c_white, showing);
	
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