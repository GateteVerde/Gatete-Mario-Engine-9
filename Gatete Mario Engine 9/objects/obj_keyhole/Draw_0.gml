/// @description Draw both keyhole and animation

//Draw the keyhole
if (ready < 2)
    draw_sprite(spr_keyhole, 0, x, y);
    
//Otherwise, if the animation has started
if (ready != 0) {
	
	//Draw the animation
    draw_sprite_ext(spr_keyhole_anim, 0, x+8, y+16, scale, scale, 0, c_white, 1);
    
    //If the player was riding a yoshi
    if (global.mount == 1) {

		//Draw the player and the key during the animation
        if (ready == 1)
        || (ready == 2) {
        
	        //Set palette
	        pal_swap_set(spr_palette_yoshi, global.mountcolour);
            
	        //Draw Yoshi
	        draw_sprite_ext(ms, mi, mx, my, md, 1, 0, c_white, obj_goalgate_fade);
            
	        //Reset shader
	        pal_swap_reset();
			
			#region MARIO
			
				//Set palette
				pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
            
				//Draw Mario
		        draw_sprite_ext(global.ride_sprite[global.powerup], 0, mx, my, md, 1, 0, c_white, fade);
            
				//Draw the cape
				if (global.powerup == cs_cape) {
					
					draw_sprite_ext(spr_cape, 1, mx-(3*sign(md)), my-7, md, 1, 0, c_white, fade);
				}
			
				//Reset palette
				pal_swap_reset();
			
			#endregion
		}
    } 
    
    //Otherwise, draw the player normally
    else {
        
        //Draw the player and the key during the animation
        if (ready == 1)
        || (ready == 2) {
			
			//Draw the cape
			if (global.powerup == cs_cape) {
			
				draw_sprite_ext(spr_cape, 0, mx, my, md, 1, 0, c_white, fade);
			}
        
            draw_sprite_ext(spr_key, 0, kx+8-10, ky, kd, 1, 0, c_white, fade);
			
			//Set palette
			pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
			
			//Draw Mario
            draw_sprite_ext(ms, mi, mx, my, md, 1, 0, c_white, fade);
			
			//Reset palette
			pal_swap_reset();
        }        
    }
}