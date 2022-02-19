/// @description Draw the player

//If the player is riding a yoshi
if (global.mount == 1) {
        
    //Set Yoshi palette
    pal_swap_set(spr_palette_yoshi, obj_yoshi.colour);
    
    //Draw Yoshi
    draw_sprite_ext(spr_yoshi, anim, round(x), round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
        
    //Reset palette
    pal_swap_reset();
    
    #region MARIO
	
		//Set palette
		pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
		
		//Draw Mario
		draw_sprite_ext(global.ride_sprite[global.powerup], 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
		
		//Draw cape
		if (global.powerup == cs_cape) {
			
			draw_sprite_ext(spr_cape_walk, cape_anim, screen_round(x-3*sign(image_xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
		}
		
		//Reset
		pal_swap_reset();
	#endregion
}

//Otherwise, draw normally
else {
	
	//Draw cape
	if (global.powerup == cs_cape) {
			
		draw_sprite_ext(spr_cape_walk, cape_anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
	}
	
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
}