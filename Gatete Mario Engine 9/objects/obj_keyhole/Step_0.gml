/// @description Key animation logic

//Keyhole growing
if (ready == 1) {

    scale += 0.02;
    if (scale >= 1)
        ready = 2;
}

//The player fades out
else if (ready == 2) {

    fade -= 0.1;
    if (fade <= 0)
        ready = 3;
}

//Keyhole shrinking
else if (ready == 3) {
	
	//Shrink keyhole
    scale -= 0.02;

    //After the keyhole shrinks, free the surfaces
    if (scale <= 0) {
		
        ready = 4
	    if (surface_exists(mask_surface))
	        surface_free(mask_surface);
	    if (surface_exists(clip_surface))
	        surface_free(clip_surface);
    }
}

#region SURFACE

	if (ready == 3) {

		//If 'mask_surface' does not exist
		if (!surface_exists(mask_surface)) {
	
			mask_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
		}

		//Set 'mask_surface' as the surface target
		surface_set_target(mask_surface);
		
		//Clear black
		draw_clear(c_black);

		//Set subtractive blend mode
	    gpu_set_blendmode(bm_subtract);
		
	    //Cut out keyhole animation
	    draw_sprite_ext(spr_keyhole_anim, 0, x+8 - camera_get_view_x(view_camera[0]), y+16 - camera_get_view_y(view_camera[0]), scale, scale, 0, c_white, 1)
	    
		//Reset blend mode
	    gpu_set_blendmode(bm_normal);
		
		//Reset surface target
	    surface_reset_target();
	    
		//If 'clip_surface' does not exist, create it.
	    if (!surface_exists(clip_surface)) {

	        clip_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	    }
		
		//Set 'mask_surface' as the surface target
		surface_set_target(clip_surface);
		
		//Clear black alpha
		draw_clear_alpha(c_black, 0);
		
		//Draw things relative to clip-surface
		#region
		
		    //If the player was riding a yoshi
		    if (global.mount == 1) {
        
			    //Set palette
			    pal_swap_set(spr_palette_yoshi, global.mountcolour);
            
			    //Draw Yoshi
			    draw_sprite_ext(ms, mi, mx - camera_get_view_x(view_camera[0]), my - camera_get_view_y(view_camera[0]), md, 1, 0, c_white, 1);
            
			    //Reset shader
			    pal_swap_reset();
			
				#region MARIO
			
					//Set palette
					pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star);
            
					//Draw Mario
				    draw_sprite_ext(global.ride_sprite[global.powerup], 0, mx - camera_get_view_x(view_camera[0]), my - camera_get_view_y(view_camera[0]), md, 1, 0, c_white, 1);
            
					//Draw the cape
					if (global.powerup == cs_cape) {
					
						draw_sprite_ext(spr_cape, 1, mx-(3*sign(md)) - camera_get_view_x(view_camera[0]), my - 7 - camera_get_view_y(view_camera[0]), md, 1, 0, c_white, 1);
					}
			
					//Reset palette
					pal_swap_reset();
			
				#endregion
		    } 
    
		    //Otherwise, draw the player normally
		    else {
			
				//Draw the cape
				if (global.powerup == cs_cape) {
			
					draw_sprite_ext(spr_cape, 0, mx - camera_get_view_x(view_camera[0]), my - camera_get_view_y(view_camera[0]), md, 1, 0, c_white, 1);
				}
        
		        draw_sprite_ext(spr_key, 0, kx - camera_get_view_x(view_camera[0]), ky - camera_get_view_y(view_camera[0]), kd, 1, 0, c_white, 1);
			
				//Set palette
				pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star);
			
				//Draw Mario
		        draw_sprite_ext(ms, mi, mx - camera_get_view_x(view_camera[0]), my - camera_get_view_y(view_camera[0]), md, 1, 0, c_white, 1);
			
				//Reset palette
				pal_swap_reset();   
		    }	
		#endregion
		
		//Set subtractive blend mode
	    gpu_set_blendmode(bm_subtract);
		
		//Draw the surface
		draw_surface(mask_surface, 0, 0);
		
		//Reset blend mode
		gpu_set_blendmode(bm_normal);
		
		//Reset surface target
		surface_reset_target();
	}
#endregion