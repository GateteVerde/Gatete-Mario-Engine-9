/// @description Draw lightning volt

if (abs(xspeed) > 0)
	draw_sprite_ext(sprite_index, -1, round(x), round(y), 1, 1, 0, c_white, 1);
else
	draw_sprite_ext(sprite_index, -1, round(x), round(y), 1, 1, 90, c_white, 1);