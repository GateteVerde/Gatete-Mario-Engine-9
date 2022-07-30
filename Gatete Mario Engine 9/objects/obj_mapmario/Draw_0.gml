/// @description Render me

//If the player is waiting
if (status = mapstate.wait)
	draw_sprite(spr_mapmario_wait, 0, screen_round(x), screen_round(y));

//Otherwise
else {

	//If the player is riding a yoshi
	if (global.mount == 1) {

	    pal_swap_set(spr_palette_yoshi, global.mountcolour);
	}
	
	#region MARIO
	
		//If Mario is riding yoshi
		if (global.mount == 1) {

			//Draw normally
			if (xscale == 1)
			    draw_sprite(yoshi_index, image_index, screen_round(x), screen_round(y)-4);
			else
			    draw_sprite_ext(yoshi_index, image_index, screen_round(x)+16, screen_round(y)-4, -1, 1, 0, c_white, 1);
		}
		
		//Otherwise
		else {
			
			//Draw normally
			if (xscale == 1)
			    draw_sprite(sprite_index, image_index, screen_round(x), screen_round(y)-4);
			else
			    draw_sprite_ext(sprite_index, image_index, screen_round(x)+16, screen_round(y)-4, -1, 1, 0, c_white, 1);			
		}
		
	#endregion
    
	//Reset the shader
	pal_swap_reset();
	
	#region ARROWS
	
		//Check for a panel
		var panel = collision_point(x+xorig, y+yorig, obj_levelpanel, 0, 0);
	
		//If Mario is in idle state
		if (is_ready == 0)
		&& (status = mapstate.idle) {
		
			//Check upper path
			var path_u = collision_point(x+xorig, y+yorig-9, obj_pathparent, 0, 0);
		
			//If there's a path and this one is visible
			if (path_u)
			&& (path_u.image_alpha == 1) {
		
				//If there's a panel
				if (panel)
				&& (panel.secretexit == 90)
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x), screen_round(y)-16, 8, 8, 1, 1, 90, c_red, 1);
				else
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x), screen_round(y)-16, 8, 8, 1, 1, 90, c_white, 1);
			}
			
			//Check lower path
			var path_d = collision_point(x+xorig, y+yorig+9, obj_pathparent, 0, 0);
			
			//If there's a path and this one is visible
			if (path_d)
			&& (path_d.image_alpha == 1) {
		
				//If there's a panel
				if (panel)
				&& (panel.secretexit == 270)
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x), screen_round(y)+16, 8, 8, 1, 1, 270, c_red, 1);
				else
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x), screen_round(y)+16, 8, 8, 1, 1, 270, c_white, 1);
			}
			
			//Check port path
			var path_l = collision_point(x+xorig-9, y+yorig, obj_pathparent, 0, 0);
		
			//If there's a path and this one is visible
			if (path_l)
			&& (path_l.image_alpha == 1) {
		
				//If there's a panel
				if (panel)
				&& (panel.secretexit == 180)
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x)-16, screen_round(y), 8, 8, 1, 1, 180, c_red, 1);
				else
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x)-16, screen_round(y), 8, 8, 1, 1, 180, c_white, 1);
			}
			
			//Check starboard path
			var path_r = collision_point(x+xorig+9, y+yorig, obj_pathparent, 0, 0);
			
			//If there's a path and this one is visible
			if (path_r)
			&& (path_r.image_alpha == 1) {
		
				//If there's a panel
				if (panel)
				&& (panel.secretexit == 0)
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x)+16, screen_round(y), 8, 8, 1, 1, 0, c_red, 1);
				else
					draw_sprite_custom_origin(spr_maparrows, -1, screen_round(x)+16, screen_round(y), 8, 8, 1, 1, 0, c_white, 1);
			}
		}
	#endregion	
}