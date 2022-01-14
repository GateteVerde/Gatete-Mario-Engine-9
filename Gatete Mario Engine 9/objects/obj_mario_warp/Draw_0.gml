/// @description Render me

//If the player can move
if (canmove == 1) {

	//If the player is holding something and is not moving vertically
	if ((holding == 1) && (vspeed == 0)) {

	    if (global.powerup == cs_small)
	        draw_sprite_ext(myitem, myframe, screen_round(x)+(10*image_xscale), screen_round(y)-2, 1, 1, 0, c_white, 1);
	    else
	        draw_sprite_ext(myitem, myframe, screen_round(x)+(10*image_xscale), screen_round(y)-4, 1, 1, 0, c_white, 1);
	}

	//Set the palette
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);

	//Draw cape
	if (vspeed != 0)
	&& (global.powerup == cs_cape) {

	    draw_sprite_ext(spr_cape_climb, 1, screen_round(x), screen_round(y), image_xscale, 1, 0, c_white, 1);
	}

	//Draw the player
	draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), image_xscale, 1, 0, c_white, 1);

	//Draw cape
	if (vspeed == 0)
	&& (global.powerup == cs_cape) {

	    draw_sprite_ext(spr_cape_walk, image_index, screen_round(x), screen_round(y), image_xscale, 1, 0, c_white, 1);
	}

	//Reset shader
	pal_swap_reset();

	//If the player is holding something and it is moving vertically
	if ((holding == 1) && (vspeed != 0)) {
		
	    if (global.powerup == cs_small)
	        draw_sprite_ext(myitem, myframe, screen_round(x), screen_round(y)-2, 1, 1, 0, c_white, 1);
	    else
	        draw_sprite_ext(myitem, myframe, screen_round(x), screen_round(y)-4, 1, 1, 0, c_white, 1);
	}
}