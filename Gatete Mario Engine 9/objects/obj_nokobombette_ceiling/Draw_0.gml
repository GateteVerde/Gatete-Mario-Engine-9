/// @description Render me

if (ready == 0)
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+16, xscale, -1, 0, c_white, 1);
else
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
