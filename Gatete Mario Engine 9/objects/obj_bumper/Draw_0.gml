/// @description Render me

//If bumped
if (ready == 1) {

	scale += 0.05;
	if (scale > 1.2) {
	
		scale = 1.2;
		ready = 2;
	}
}

//Otherwise, if scaled enough
else if (ready == 2) {

	scale -= 0.05;
	if (scale < 1) {
	
		scale = 1;
		ready = 0;
	}
}

//Render me
if (ready > 0)
	draw_sprite_ext(sprite_index, 2, screen_round(x), screen_round(y), scale, scale, 0, c_white, 1);
else
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);