/// @description Draw Mario

//If Mario is riding Yoshi
if (global.mount == 1) {

	#region RENDER YOSHI
        
	    //Set the shader
	    pal_swap_set(spr_palette_yoshi, global.mountcolour);
            
	    //Draw yoshi
		draw_sprite_ext(spr_yoshi, 0, screen_round(xstart), screen_round(ystart)+1, 1, 1, 0, c_white, 1);
            
	    //Reset shader
	    pal_swap_reset();
	
	#endregion

	//Set up the shader
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
				
	//Draw Mario
	draw_sprite_ext(global.ride_sprite[global.powerup], 0, screen_round(xstart), screen_round(ystart)+1, 1, 1, 0, c_white, 1);
			
	//Draw the cape
	if (global.powerup == cs_cape) {
				
		draw_sprite_ext(spr_cape, 1, screen_round(xstart)-4, screen_round(ystart)-7, 1, 1, 0, c_white, 1);
	}				

	//Reset shader
	pal_swap_reset();
}

//Otherwise
else {
	
	if (ready == 0) {
		
		//Draw the cape
		if (global.powerup == cs_cape) {
				
			draw_sprite_ext(spr_cape_walk, 0, screen_round(xstart), screen_round(ystart)+1, 1, 1, 0, c_white, 1);
		}
		
		//Draw Mario
		draw_sprite_ext(global.spin_sprite[global.powerup], 1, screen_round(xstart), screen_round(ystart)+1, 1, 1, 0, c_white, 1);
	}
	
	//Otherwise
	else if (ready == 1) {
	
		//Draw Mario
		draw_sprite_ext(global.spin_sprite[global.powerup], 2, screen_round(xstart), screen_round(ystart)+1, 1, 1, 0, c_white, 1);
		
		//Draw the cape
		if (global.powerup == cs_cape) {
				
			draw_sprite_ext(spr_cape_climb, 0, screen_round(xstart), screen_round(ystart)+1, 1, 1, 0, c_white, 1);
		}
	}
}