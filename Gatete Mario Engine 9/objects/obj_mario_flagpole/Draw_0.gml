/// @description Draw Mario

//If Mario is riding a yoshi
if (global.mount == 1) {

    //If Mario is going down the flagpole
    if (ready < 2) {
    
        //Set Yoshi palette
        pal_swap_set(spr_palette_yoshi, obj_yoshi.colour);
        
        //Draw Yoshi
        draw_sprite_ext(spr_yoshi_flag, 0, screen_round(x)-8*sign(image_xscale), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
        
        //Reset palette
        pal_swap_reset();
		
		#region MARIO
        
	        //Set the palette
			pal_swap_set_player(spr_palette, spr_palette_invincible);

			//Draw Mario
			draw_sprite_ext(global.ride_sprite[global.powerup], obj_yoshi.f, screen_round(x)-8*sign(image_xscale), screen_round(y)+1+obj_yoshi.myy, image_xscale, 1, 0, c_white, image_alpha);
			
			//Draw cape
			if (global.powerup == cs_cape) {
			
				draw_sprite_ext(spr_cape, 1, screen_round(x-11*sign(image_xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
			}
			
			//Reset palette
			pal_swap_reset();
		
		#endregion
    }

    //Otherwise, if Mario is moving
    else {
    
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
				pal_swap_set_player(spr_palette, spr_palette_invincible);
				
				//Draw cape
				if (global.powerup == cs_cape) {
			
					if (yspeed < 0)
						draw_sprite_ext(spr_cape, 1, screen_round(x-3*sign(image_xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
					else
						draw_sprite_ext(spr_cape_fall, cape_anim, screen_round(x-3*sign(image_xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
				}

				//Draw Mario
				draw_sprite_ext(global.ride_sprite[global.powerup], obj_yoshi.f, screen_round(x), screen_round(y)+1+obj_yoshi.myy, image_xscale, 1, 0, c_white, image_alpha);

				//Reset palette
				pal_swap_reset();
		
			#endregion
        }
        
        //Otherwise, if Mario is not jumping
        else {
        
            //If Mario is not moving horizontally
            if (xspeed == 0) {
                
				#region MARIO
        
			        //Set the palette
					pal_swap_set_player(spr_palette, spr_palette_invincible);

					//Draw Mario
					draw_sprite_ext(global.clear_sprite[global.powerup], obj_yoshi.f, screen_round(x), screen_round(y)-9+obj_yoshi.myy, image_xscale, 1, 0, c_white, image_alpha);

					//Reset palette
					pal_swap_reset();
		
				#endregion               
                
                //Set Yoshi palette
                pal_swap_set(spr_palette_yoshi, obj_yoshi.colour);
                
                //Draw Yoshi
                if (obj_yoshi.mouthholder != noone)
                    draw_sprite_ext(spr_yoshi_warp, 1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
                else
                    draw_sprite_ext(spr_yoshi_warp, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
                    
                //Reset palette
                pal_swap_reset();       
            }
        
            //Otherwise, if Mario is moving horizontally
            else {
        
                //Set Yoshi palette
                pal_swap_set(spr_palette_yoshi, obj_yoshi.colour);
                
                //Draw Yoshi
                draw_sprite_ext(spr_yoshi, anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
                    
                //Reset palette
                pal_swap_reset();
				
				#region MARIO
        
			        //Set the palette
					pal_swap_set_player(spr_palette, spr_palette_invincible);
					
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
    }
}

//Otherwise, draw normally
else {
	
	//Set palette
	pal_swap_set_player(spr_palette, spr_palette_invincible);
	
	//Draw cape
	if ((global.powerup == cs_cape) && (ready >= 2)) {
		
		//If moving vertically
		if (yspeed != 0) {
			
			//If moving up
			if (yspeed < 0)
				draw_sprite_ext(spr_cape, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
			else
				draw_sprite_ext(spr_cape_fall, cape_anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
		}
		else {
			
			//If not moving horizontally
			if (xspeed == 0)
				draw_sprite_ext(spr_cape_climb, 1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
			else
				draw_sprite_ext(spr_cape_walk, cape_anim, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
		}
	}
	
	//Draw Mario
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
	
	//If Mario is sliding down the flagpole
	if ((global.powerup == cs_cape) && (ready < 2)) {
	
		draw_sprite_ext(spr_cape, 1, screen_round(x-7*sign(image_xscale)), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
	}
	
	//Reset palette
	pal_swap_reset();
}