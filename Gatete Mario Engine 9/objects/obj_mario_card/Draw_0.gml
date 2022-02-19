/// @description Draw Mario

//If Mario is riding a yoshi
if (global.mount == 1) {
    
    //If Mario is jumping
    if (yspeed != 0) {
        
        //Set Yoshi palette
        pal_swap_set(spr_palette_yoshi, obj_yoshi.colour);
            
        //If moving up, draw yoshi jumping
        if (yspeed < 0)
            draw_sprite_ext(spr_yoshi_jump, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);

        //Otherwise, draw yoshi falling
        else
            draw_sprite_ext(spr_yoshi_jump, 1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);        
                
        //Reset palette
        pal_swap_reset();
            
		#region MARIO
        
		    //Set the palette
			pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
				
			//Draw cape
			if (global.powerup == cs_cape) {
			
				if (yspeed < 0)
					draw_sprite_ext(spr_cape, 1, screen_round(x-3*sign(image_xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
				else
					draw_sprite_ext(spr_cape_fall, -1, screen_round(x-3*sign(image_xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
			}

			//Draw Mario
			draw_sprite_ext(global.ride_sprite[global.powerup], obj_yoshi.f, screen_round(x), screen_round(y)+1+obj_yoshi.myy, image_xscale, 1, 0, c_white, image_alpha);

			//Reset palette
			pal_swap_reset();
		
		#endregion
    }
        
    //Otherwise, if Mario is not jumping
    else {
        
        //Set Yoshi palette
        pal_swap_set(spr_palette_yoshi, obj_yoshi.colour);
                
        //Draw Yoshi
        draw_sprite_ext(spr_yoshi, anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
                    
        //Reset palette
        pal_swap_reset();
				
		#region MARIO
        
			//Set the palette
			pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
					
			//Draw cape
			if (global.powerup == cs_cape) {
			
				draw_sprite_ext(spr_cape_walk, cape_anim, screen_round(x-3*sign(image_xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
			}

			//Draw Mario
			draw_sprite_ext(global.ride_sprite[global.powerup], 0, screen_round(x), screen_round(y)+1+obj_yoshi.myy, image_xscale, 1, 0, c_white, image_alpha);

			//Reset palette
			pal_swap_reset();
				
		#endregion
    }
}

//Otherwise, draw normally
else {
	
	//Set palette
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
	
	//Draw cape
	if (global.powerup == cs_cape) {
		
		if (yspeed != 0)
			draw_sprite_ext(spr_cape_fall, cape_anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
		else
			draw_sprite_ext(spr_cape_walk, cape_anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
	}
	
	//Draw Mario
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, image_xscale, image_yscale, 0, c_white, image_alpha);
	
	//Reset palette
	pal_swap_reset();
}