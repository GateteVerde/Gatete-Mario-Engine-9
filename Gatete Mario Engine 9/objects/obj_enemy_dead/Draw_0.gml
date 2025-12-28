/// @description Render dead enemy

if (sprite_index != -1) {

	if (sprite_height > 24)
		draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y), sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2, image_xscale, image_yscale, 0, c_white, 1);
	else {
		
		//Render it
		if (sprite_index == spr_phanto)
			draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y), sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2, 0.5, 0.5, 0, c_white, 1);
		else {

			//If the death sprite is one of the following, do not apply angle
			if (sprite_index == spr_wiggler)
			|| (sprite_index == spr_wiggler_body)
			|| (sprite_index == spr_wiggler_mad)
			|| (sprite_index == spr_wiggler_mad_body)
				draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y), sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2, image_xscale, -1, 0, c_white, 1);
			else
				draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y), sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2, image_xscale, 1, angle, c_white, 1);
		}
	}
}