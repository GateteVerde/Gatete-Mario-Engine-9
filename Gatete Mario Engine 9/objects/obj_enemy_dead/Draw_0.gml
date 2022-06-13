/// @description Render dead enemy

if (sprite_index != -1) {

	if (sprite_height > 16)
		draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y), sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2, image_xscale, 1, angle, c_white, 1);
	else
		draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y), sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2, image_xscale, -1, angle, c_white, 1);
}