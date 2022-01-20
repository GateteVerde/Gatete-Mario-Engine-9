/// @description Render me

if (in_water == 0)
	draw_sprite_ext(sprite_index, 1, screen_round(x), screen_round(y), 1, 1, 0, c_white, image_alpha);
else
	draw_sprite_ext(sprite_index, 2, screen_round(x), screen_round(y), 1, 1, 0, c_white, image_alpha);