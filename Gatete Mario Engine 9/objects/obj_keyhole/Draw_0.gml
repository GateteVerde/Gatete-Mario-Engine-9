/// @description Draw both keyhole and animation

//Draw the keyhole
if (ready < 2)
    draw_sprite(spr_keyhole, 0, x, y);
    
//Otherwise, if the animation has started
if (ready > 0) && (ready < 4) {
	
	//Draw the animation
    draw_sprite_ext(spr_keyhole_anim, 0, x+8, y+16, scale, scale, 0, c_white, 1);
	
	//If the keyhole has grown to it's full size
	if (ready == 3) {
		
		if (surface_exists(clip_surface))
            draw_surface(clip_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
	}
	
	//Otherwise, draw sprites normally
	else {
    
	    //If the player was riding a yoshi
	    if (global.mount == 1) {
        
		    //Set palette
		    pal_swap_set(spr_palette_yoshi, global.mountcolour);
            
		    //Draw Yoshi
		    draw_sprite_ext(ms, mi, mx, my, md, 1, 0, c_white, 1);
            
		    //Reset shader
		    pal_swap_reset();
			
			#region MARIO
			
				//Set palette
				pal_swap_set_player(global.palette[global.player].main, spr_palette_invincible);
            
				//Draw Mario
			    draw_sprite_ext(global.ride_sprite[global.powerup], 0, mx, my, md, 1, 0, c_white, 1);
            
				//Draw the cape
				if (global.powerup == cs_cape) {
					
					draw_sprite_ext(spr_cape, 1, mx-(3*sign(md)), my-7, md, 1, 0, c_white, 1);
				}
			
				//Reset palette
				pal_swap_reset();
			
			#endregion
	    } 
    
	    //Otherwise, draw the player normally
	    else {
			
			//Draw the cape
			if (global.powerup == cs_cape) {
			
				draw_sprite_ext(spr_cape, 0, mx, my, md, 1, 0, c_white, 1);
			}
        
	        draw_sprite_ext(spr_key, 0, kx, ky, kd, 1, 0, c_white, 1);
			
			//Set palette
			pal_swap_set_player(global.palette[global.player].main, spr_palette_invincible);
			
			//Draw Mario
	        draw_sprite_ext(ms, mi, mx, my, md, 1, 0, c_white, 1);
			
			//Reset palette
			pal_swap_reset();   
	    }
	}
}