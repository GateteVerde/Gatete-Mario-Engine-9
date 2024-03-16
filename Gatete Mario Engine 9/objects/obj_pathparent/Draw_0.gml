/// @description Render me

//If in water
if (in_water != 0) {
	
	//Draw in water
	draw_sprite_ext(sprite_index, 2, x, y, 1, 1, 0, c_white, image_alpha);
	return;
}
	
//Set palette
if (pal > 0)
	pal_swap_set(spr_palette_path, pal);
	
//Draw it
if (image_alpha >= 1)

	draw_sprite(sprite_index, 1, x, y);
else

	draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, image_alpha);
	
//Reset palette
if (pal > 0)
	pal_swap_reset();