/// @description Render me

//If the donut is respawning
if (scale > 0)
	draw_sprite_custom_origin(sprite_index, 0, xstart, ystart, 8, 0, scale, scale, 0, c_white, 1);
	
//Otherwise
else {

	//If the donut is shaking
	if (ready == 1)
		draw_sprite_ext(sprite_index, 1, screen_round(x) + offset, screen_round(y), 1, 1, 0, c_white, 1);
	else
		draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
}