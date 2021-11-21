/// @description Draw cape

//If the player is not transforming
if (instance_exists(obj_mario_transform))
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
        if (global.mount == 0) {
			
			if (owner.wallkick == 1)
				draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y)+1, image_xscale*-1, 1, image_angle, c_white, image_alpha);
			else {
				
				//If somersaulting, do not draw
				if (owner.somersault == 0)
					draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
			}
		}
            
        //Otherwise, if the player is riding a yoshi
        else {
        
            /*if (instance_exists(obj_yoshi)) {
                
                if (obj_yoshi.f == 1)
                    draw_sprite_ext(sprite_index, image_index, screen_round(x-3*sign(obj_playerparent.xscale)), screen_round(y)-5+yy, image_xscale, 1, 0, c_white, image_alpha);
                else
                    draw_sprite_ext(sprite_index, image_index, screen_round(x-3*sign(obj_playerparent.xscale)), screen_round(y)-7+yy, image_xscale, 1, 0, c_white, image_alpha);
            }
            else if instance_exists(obj_player_transform) {
            
                if (obj_player_transform.riderframe == 1)
                    draw_sprite_ext(sprite_index, image_index, screen_round(x-3*sign(obj_playerparent.xscale)), screen_round(y)-5+yy, image_xscale, 1, 0, c_white, image_alpha);
                else
                    draw_sprite_ext(sprite_index, image_index, screen_round(x-3*sign(obj_playerparent.xscale)), screen_round(y)-7+yy, image_xscale, 1, 0, c_white, image_alpha);            
            }*/	
        }
		
		//Stop shader
		pal_swap_reset();
    }
}