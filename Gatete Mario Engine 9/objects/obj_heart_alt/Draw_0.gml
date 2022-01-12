/// @description Render me

if (ready == 0)
	draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y), 8, 8, scale * dir, scale, 0, c_white, 1);
else
	draw_sprite_ext(spr_heart_alt_get, -1, screen_round(x) + 8, screen_round(y) + 8, scale * dir, scale, angle, c_white, 1);