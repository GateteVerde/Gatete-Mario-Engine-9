/// @description Draw text

//Set palette
pal_swap_set(spr_palette_score, flash);

//Draw text
if (amount < 8)
	draw_sprite_ext(sprite_index, amount - 1, screen_round(x), screen_round(y), scale, scale, 1, c_white, 1);
else
	draw_sprite_ext(sprite_index, 7, screen_round(x), screen_round(y), scale, scale, 1, c_white, 1);

//Reset palette
pal_swap_reset();