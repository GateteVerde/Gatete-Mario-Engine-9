/// @description Render 'No Item' sign if set to true

if (!allow_hold)
	draw_sprite_ext(spr_noitemsign, 0, screen_round(x) + 16, screen_round(y) + 32, 1, 1, 0, c_white, 1);