/// @description Render me

if (freeze == false)
	draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y), 32, 32, xscale, 1, direction, c_white, 1);
else
	draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y), 32, 32, xscale, 1, new_dir, c_white, 1);
