/// @description Render me

if (in_water == 0) {
	
	//Set palette
	pal_swap_set(spr_palette_path, pal)
	
	//Draw it
	draw_sprite_ext(sprite_index, 1, screen_round(x), screen_round(y), 1, 1, 0, c_white, image_alpha);
	
	//Reset palette
	pal_swap_reset();
}
else
	draw_sprite_ext(sprite_index, 2, screen_round(x), screen_round(y), 1, 1, 0, c_white, image_alpha);