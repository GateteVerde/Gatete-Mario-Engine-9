/// @description Check if the player collected all coins and give him a prize for doing so.

//If the ring is active.
if (sprite_index == spr_coin_red_ring_active) {

    //If there's not red coins.
    if (instance_number(obj_coin_red) == 0) {
    
        //Play 'Release' sound
        audio_play_sound(snd_release, 0, false);
        
        //Stop 'Timer' sounds
        audio_stop_sound(snd_timer_end);
        audio_stop_sound(snd_timer);
        
        //Create a powerup
        with (instance_create_layer(0, 0, "Main", obj_powerup_prize)) {
			
			//If this ring gives a Mini Mushroom
			if (other.sprout == cs_tiny)
				sprite_index = spr_tinyshroom;
				
			//Otherwise, if this ring gives a Mega Mushroom
			else if (other.sprout == cs_mega)
				sprite_index = spr_megashroom;
				
			//Otherwise, check Mario's state and give the specific powerup
			else {
				
				//If Mario does have the Mega Mushroom, give a 1-UP automatically
				if (global.powerup == cs_mega)
					sprite_index = spr_1up;
				
				//Otherwise
				else {
					
					//If the ring does give a powerup based on actual state
					if (other.progressive == true) {
        
			            //If the player is small
						if (global.powerup == cs_tiny)
			            && (global.powerup == cs_small)            
			                sprite_index = spr_mushroom;
            
			            //Otherwise, if the player is big
			            else if (global.powerup == cs_big)            
			                sprite_index = macro_get_sprite(other.sprout);
            
			            //Otherwise, get a life.
			            else
			                sprite_index = spr_1up;
					}
					else {
					
						//If Mario does not have the powerup the ring gives
						if (global.powerup != other.sprout)
							sprite_index = macro_get_sprite(other.sprout);
						else
							sprite_index = spr_1up;
					}
				}
			}
        }
        
        //Destroy the ring
        instance_destroy();
    }
	
	//Reduce scale
	scale -= 0.05;
	if ((scale < 0.05) && (visible == true)) {
		
		//Make it invisible
		visible = false;
		
		//Create a ring effect
		with (instance_create_depth(x, y, -2, obj_blend_ring)) image_blend = make_colour_rgb(248, 144, 32);
	}
}