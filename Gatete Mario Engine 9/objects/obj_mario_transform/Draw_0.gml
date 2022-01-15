/// @description Render me

//If Mario is riding a Kuribo shoe
if (global.mount == 2) {
	
	//Set palette
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);

	//Draw Mario
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, direct, image_yscale, 0, c_white, 1);
	
	//Reset palette
	pal_swap_reset();
	
	//Draw Kuribo Shoe
    draw_sprite_ext(shoesprite, 0, screen_round(x), screen_round(y)+1, direct, 1, 0, c_white, 1);
}

//Otherwise, if Mario is riding a Yoshi
else if (global.mount == 1) {
	
	//Pal swap set
	pal_swap_set(spr_palette_yoshi, yoshicolour);
		
    //Draw Yoshi
    draw_sprite_ext(yoshisprite, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
	
	//Set palette
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible, spr_palette_mario_mega);
    
    //Draw the player
    if (sequence == 3) {
    
        if (image_xscale == 1)
            draw_sprite_ext(sprite_index, -1, screen_round(x)-4, screen_round(y)-9, 1, 1, 0, c_white, 1);
        else if (image_xscale == -1)
            draw_sprite_ext(sprite_index, -1, screen_round(x)+4, screen_round(y)-9, 1, 1, 0, c_white, 1);
    }
    else {
    
        if (image_xscale == 1)
            draw_sprite_ext(sprite_index, -1, screen_round(x)-4, screen_round(y)-9, 1, 1, 0, c_white, 1);
        else if (image_xscale == -1)
            draw_sprite_ext(sprite_index, -1, screen_round(x)+4, screen_round(y)-9, -1, 1, 0, c_white, 1);
    }
	
	//Reset palette
	pal_swap_reset();
}

//Otherwise
else {
	
	//Set palette
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible, spr_palette_mario_mega);
	
	//Draw Mario
	if (sequence != 5)
	&& (sequence != 6)
		draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, direct, image_yscale, 0, c_white, 1);
	else {
	
		if (sequence == 5)
			draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y)+1, 16, 32, image_xscale*direct, image_xscale, 0, c_white, 1);
		else
			draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y)+1, sprite_get_xoffset(sprite_index), 32, image_xscale*direct, image_xscale, 0, c_white, 1);
	}
	
	//Reset palette
	pal_swap_reset();
}