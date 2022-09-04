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
&& (sprite_index > -1)
	draw_sprite_custom_origin(sprite_index, 0, screen_round(x), screen_round(y), 16, 8, scale, scale, 0, c_white, 1);

//Otherwise, draw text
else {
		
	//If the score is over 799
	if (value > 799) {
			
		//Set the big font
		draw_set_font(font_big);
			
		//Set vertical alignment
		draw_set_valign(fa_bottom);

		//Draw text
		draw_text_transformed(screen_round(x), screen_round(y), string(value), scale, scale, 0);
				
		//Reset vertical alignment
		draw_set_valign(fa_top);
	}
		
	//Otherwise
	else
		draw_text(screen_round(x), screen_round(y), string(value));
}

//Reset alignment
draw_set_halign(fa_left);