/// @description Render me

if (ready == 0)
	draw_sprite(sprite_index, -1, screen_round(x), screen_round(y));
else
	draw_sprite_ext(spr_cherry_get, -1, screen_round(x) + 8, screen_round(y) + 8, scale, scale, angle, c_white, 1);