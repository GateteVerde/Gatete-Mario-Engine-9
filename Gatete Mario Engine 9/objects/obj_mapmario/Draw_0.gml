/// @description Render me

//If the player is waiting
if (status = mapstate.wait)
	draw_sprite(spr_mapmario_wait, 0, screen_round(x), screen_round(y));

//Otherwise
else {

	//If the player is riding a yoshi
	if (global.mount == 1) {

	    pal_swap_set(spr_palette_yoshi, global.mountcolour);
	}

	//Draw normally
	if (xscale == 1)
	    draw_sprite(sprite_index, image_index, screen_round(x), screen_round(y)-4);
	else
	    draw_sprite_ext(sprite_index, image_index, screen_round(x)+16, screen_round(y)-4, -1, 1, 0, c_white, 1);
    
	//Reset the shader
	pal_swap_reset();
}