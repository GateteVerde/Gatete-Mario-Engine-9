/// @description Render me

//Update arrow animation
anim += 0.2;

//If not moving, draw the null screen
if (ready == 0)
	draw_sprite_ext(spr_platform_lift_null, 0, screen_round(x), screen_round(y) + 8, image_xscale, 1, 0, c_white, 1);

//Otherwise if moving, draw_arrows
else {
	
	#region PALETTE SETUP
		if (vspeed > 0)
			pal = 0;
		else
			pal = 1;
	#endregion
	
	//Set up palette
	pal_swap_set(spr_palette_elevator_lift, pal);
	
	//If the platform does not move horizontally
	if (sideways == 0) {

		//If moving up
		if (vspeed < 0)
			draw_sprite_ext(spr_platform_lift_arrow, anim, screen_round(x), screen_round(y) + 24, image_xscale, -1, 0, c_white, 1);
			
		//Otherwise, if moving down
		else if (vspeed > 0)
			draw_sprite_ext(spr_platform_lift_arrow, anim, screen_round(x), screen_round(y) + 8, image_xscale, 1, 0, c_white, 1);
	}
	
	//Otherwise
	else {
	
		//If moving left
		if (sideways == -1) {
			
			//If moving up
			if (vspeed < 0)
				draw_sprite_ext(spr_platform_lift_arrow_left, anim, screen_round(x), screen_round(y) + 24, image_xscale, -1, 0, c_white, 1);
			
			//Otherwise, if moving down
			else if (vspeed > 0)
				draw_sprite_ext(spr_platform_lift_arrow_left, anim, screen_round(x), screen_round(y) + 8, image_xscale, 1, 0, c_white, 1);			
		}
		
		//Otherwise, if moving right
		else if (sideways == 1) {
		
			//If moving up
			if (vspeed < 0)
				draw_sprite_ext(spr_platform_lift_arrow_right, anim, screen_round(x), screen_round(y) + 24, image_xscale, -1, 0, c_white, 1);
			
			//Otherwise, if moving down
			else if (vspeed > 0)
				draw_sprite_ext(spr_platform_lift_arrow_right, anim, screen_round(x), screen_round(y) + 8, image_xscale, 1, 0, c_white, 1);					
		}
	}
	
	//Reset palette
	pal_swap_reset();
}
//Last, render the platform
draw_sprite_ext(sprite_index, ison, x, y, image_xscale, 1, 0, c_white, 1);