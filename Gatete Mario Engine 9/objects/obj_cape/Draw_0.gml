/// @description Draw cape

//If the player is not transforming
if (instance_exists(obj_mario_transform))
|| (instance_exists(obj_wallrunner))
exit;

//If the player does exist
if (instance_exists(owner)) {
	
	//If actually flying, don't perform drawing logic of cape
	if (owner.fly != noone)
		return;

    //Only draw if the player has a cape
    if (global.powerup == cs_cape) {
		
		//Set palette
		pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
    
        //If the player is not riding a yoshi
        if (global.mount != 1) {
			
			if (owner.wallkick == 1)
				draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y)+1, image_xscale*-1, 1, image_angle, c_white, image_alpha);
			else {
				
				//If somersaulting, do not draw
				if (owner.somersault == 0) {
					
					//If the player is climbing
					if (owner.state == playerstate.climb) {
						
						if (owner.climbstyle == 1)
							draw_sprite_ext(spr_cape, 1, screen_round(x-7*sign(image_xscale)), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
						else
							draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
					}		
					else
						draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
				}
			}
		}
            
        //Otherwise, if the player is riding a yoshi
        else if (global.mount == 1) {
        
            if (instance_exists(obj_yoshi)) {
                
                if (obj_yoshi.f == 1)
                    draw_sprite_ext(sprite_index, image_index, screen_round(x-3*sign(obj_mario.xscale)), screen_round(y)-3, image_xscale, 1, 0, c_white, image_alpha);
                else
                    draw_sprite_ext(sprite_index, image_index, screen_round(x-3*sign(obj_mario.xscale)), screen_round(y)-7, image_xscale, 1, 0, c_white, image_alpha);
            }
        }
		
		//Stop shader
		pal_swap_reset();
    }
}