/// @description Draw berry briefly

if (berry != noone)
	draw_sprite_ext(berry, 0, screen_round(x) + 4 * sign(obj_yoshi.image_xscale), screen_round(y), 1, 1, 0, c_white, 1);