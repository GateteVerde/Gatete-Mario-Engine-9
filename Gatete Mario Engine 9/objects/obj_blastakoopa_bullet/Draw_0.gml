/// @description Render me

if (freeze == false)
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, yy, direction, c_white, 1);
else
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, yy, new_dir, c_white, 1);
