/// @description Draw the shoe

//If Mario does exist
if (instance_exists(obj_mario)) {
    
    //Set the shader
    pal_swap_set_player(spr_palette, spr_palette_invincible);
    
    //Only draw if the player is not crouched down
    if (obj_mario.crouch == false) {
    
		//If Mario is small
		if (global.powerup == cs_small)
			draw_sprite_ext(global.walk_sprite[global.powerup], 0, screen_round(x), screen_round(y)-8+(movement.y), obj_mario.xscale, 1, 0, c_white, 1);
		
		//Otherwise, if Mario is not small
		else {
			
			//Set head sprite in relation to currently available head sprite
			var headSprite = global.run_sprite[global.powerup];
			if (headSprite == -1)
				headSprite = global.kick_sprite[global.powerup];
			
			//Offset
			var yy = (global.powerup == cs_propeller) ? 2 : 0;
			
			//If Mario is facing right
			if (obj_mario.xscale == 1) {
				
				//If Mario has the cat powerup
				if (global.powerup == cs_bell)
					draw_sprite_part_ext(global.slide_sprite[global.powerup], 0, 0, 0, 16, 17, screen_round(x) - 8, screen_round(y) - 16 + (movement.y), 1, 1, c_white, 1);
				else
					draw_sprite_part_ext(headSprite, 0, 0, 0, 32, 16 + yy, screen_round(x) - 16, screen_round(y) - 15 - yy + (movement.y), 1, 1, c_white, 1);
			}
			
			//Otherwise, if Mario is facing left
			else {
				
				//If Mario has the Cat powerup
				if (global.powerup == cs_bell)
					draw_sprite_part_ext(global.slide_sprite[global.powerup], 0, 0, 0, 16, 17, screen_round(x) + 8, screen_round(y) - 16 + (movement.y), -1, 1, c_white, 1);
				else
					draw_sprite_part_ext(headSprite, 0, 0, 0, 32, 16 + yy, screen_round(x) + 16, screen_round(y) - 15 - yy + (movement.y), -1, 1, c_white, 1);
			}
		}
    }
    
    //Reset shader
    pal_swap_reset();
    
    //Draw the shoe on front
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1+(movement.y), obj_mario.xscale, 1, 0, c_white, 1);
}