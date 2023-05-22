/// @description Render me

//If the player is riding a kuribo shoe
if (global.mount == 2) {
		
	#region RENDER MARIO
		
		//Set palette
		pal_swap_set_player(global.palette[global.player].main, spr_palette_invincible);
			
		#region CAPE
			
			//If Mario has the cape powerup
			if (global.powerup == cs_cape) {
			
				//If not moving vertically
				if ((vspeed == 0) && (abs(hspeed) > 0.1))
					draw_sprite_ext(spr_cape_walk, -1, screen_round(x), screen_round(y), image_xscale, 1, 0, c_white, 1);
					
				//Otherwise, if moving vertically
				else if (vspeed != 0)
					draw_sprite_ext(spr_cape, 0, screen_round(x), screen_round(y), image_xscale, 1, 0, c_white, 1);
			}
			
		#endregion

		//If Mario is small
		if (global.powerup == cs_small)
			draw_sprite_ext(global.walk_sprite[cs_small], 0, screen_round(x), screen_round(y)-8, image_xscale, 1, 0, c_white, 1);
		
		//Otherwise, if Mario is not small
		else {
			
			//Offset
			var yy = (global.powerup == cs_propeller) ? 2 : 0;
			
			//If Mario is facing right
			if (image_xscale == 1) {
				
				//If Mario has the cat powerup
				if (global.powerup == cs_bell)
					draw_sprite_part_ext(global.walk_sprite[cs_bell], 0, 0, 0, 16, 17, screen_round(x) - 8, screen_round(y) - 16, 1, 1, c_white, 1);
				else
					draw_sprite_part_ext(global.run_sprite[global.powerup], 0, 0, 0, 32, 16 + yy, screen_round(x) - 16, screen_round(y) - 15 - yy, 1, 1, c_white, 1);
			}
			
			//Otherwise, if Mario is facing left
			else {
				
				//If Mario has the Cat powerup
				if (global.powerup == cs_bell)
					draw_sprite_part_ext(global.walk_sprite[cs_bell], 0, 0, 0, 16, 17, screen_round(x) + 8, screen_round(y) - 16, -1, 1, c_white, 1);
				else
					draw_sprite_part_ext(global.run_sprite[global.powerup], 0, 0, 0, 32, 16 + yy, screen_round(x) + 16, screen_round(y) - 15 - yy, -1, 1, c_white, 1);
			}
		}
			
		//Reset palette
		pal_swap_reset();
			
	#endregion
		
	//Draw the shoe on front
	draw_sprite_ext(obj_kuriboshoe.sprite_index, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
}
	
//Otherwise, if the player is riding a yoshi
else if (global.mount == 1) {

	#region RENDER YOSHI
        
        //Set the shader
        pal_swap_set(spr_palette_yoshi, obj_yoshi.colour);
            
        //Draw yoshi
		if (obj_yoshi.mouthholder == noone)
			draw_sprite_ext(spr_yoshi, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
		else
			draw_sprite_ext(spr_yoshi_fm, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
            
        //Reset shader
        pal_swap_reset();
	
	#endregion

	//Set up the shader
	pal_swap_set_player(global.palette[global.player].main, spr_palette_invincible);
				
	//Draw Mario
	draw_sprite_ext(global.ride_sprite[global.powerup], 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
			
	//Draw the cape
	if ((global.powerup == cs_cape) && (abs(hspeed) > 0.1)) {
				
		draw_sprite_ext(spr_cape_walk, image_index, screen_round(x)-4*sign(image_xscale), screen_round(y)-2, image_xscale, 1, 0, c_white, 1);
	}				

	//Reset shader
	pal_swap_reset();
}
	
//Otherwise, if the player is not riding anything
else {

	//If the player is holding something and is not moving vertically
	if (holding == 1) {

		if (global.powerup == cs_small)
		    draw_sprite_ext(myitem, myframe, screen_round(x)+(10*image_xscale), screen_round(y)-2, 1, 1, 0, c_white, 1);
		else
		    draw_sprite_ext(myitem, myframe, screen_round(x)+(10*image_xscale), screen_round(y)-4, 1, 1, 0, c_white, 1);
	}
		
	#region RENDER MARIO
		
		//Set the palette
		pal_swap_set_player(global.palette[global.player].main, spr_palette_invincible);
			
		//Draw the cape
		if (global.powerup == cs_cape) {
				
			draw_sprite_ext(spr_cape_climb, 1, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
		}
				
		//Draw Mario
		draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
			
		//Reset shader
		pal_swap_reset();
		
	#endregion
}