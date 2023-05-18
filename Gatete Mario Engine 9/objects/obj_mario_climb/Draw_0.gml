/// @description Render me

//If the player is holding something and it is moving vertically
if (holding == 1) {
		
	if (global.powerup == cs_small)
		draw_sprite_ext(myitem, myframe, screen_round(x), screen_round(y)-2, 1, 1, 0, c_white, 1);
	else
		draw_sprite_ext(myitem, myframe, screen_round(x), screen_round(y)-4, 1, 1, 0, c_white, 1);
}

//Set palette
pal_swap_set_player(spr_palette, spr_palette_invincible);

//Draw the cape
if (global.powerup == cs_cape) {
				
	draw_sprite_ext(spr_cape_climb, 1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
}

//Draw Mario
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();