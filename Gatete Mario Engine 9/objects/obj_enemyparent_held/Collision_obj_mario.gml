/// @description Make Mario able to interact with the NPC

//If Mario is invulnerable or is on the mega form, exit
if (instance_exists(obj_invincibility))
|| (global.powerup == cs_mega)
exit;

//If the player is sliding down a slope
if ((other.sliding) || ((global.powerup == cs_football) && (other.run == true)))
&& (vulnerable < 99) {
	
	#region COMBO

	    //Get points based on combo
	    if (other.hitcombo == 0) { //200 points
        
	        audio_play_sound(snd_kick_2, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 200;
	    }
	    else if (other.hitcombo == 1) { //400 points
        
	        audio_play_sound(snd_kick_3, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 400;
	    }
	    else if (other.hitcombo == 2) { //800 points
        
	        audio_play_sound(snd_kick_4, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 800;
	    }
	    else if (other.hitcombo == 3) { //1000 points
        
	        audio_play_sound(snd_kick_5, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 1000;
	    }
	    else if (other.hitcombo == 4) { //2000 points
        
	        audio_play_sound(snd_kick_6, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 2000;
	    }
	    else if (other.hitcombo == 5) { //4000 points
        
	        audio_play_sound(snd_kick_7, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 4000;
	    }
	    else if (other.hitcombo == 6) { //8000 points
        
	        audio_play_sound(snd_kick_8, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 8000;
	    }
	    else if (other.hitcombo > 6) { //1-UP
    
	        audio_play_sound(snd_kick, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = -1;
	    }
	
	#endregion
    
    //Kill the enemy
	killer_id = obj_mario;
    event_user(0);        
        
    //Create 'Spinthump' effect
    with (instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom)/2, -6, obj_smoke)) sprite_index = spr_spinthump;
                
    //Increment hitcombo but only when sliding
    other.hitcombo++;
		
	//Reset if dashing thru as Football Mario
	if ((global.powerup == cs_football) && (other.run))
		other.hitcombo = 0;
}

//Otherwise, perform 'obj_holdparent' collision event of obj_mario
else {
	
	//If the item is not held
	if (held == false) {
        
	    //If the player can hold the item
	    if (can_hold()) 
	    && (inwall == false)
		&& (other.climbstyle == 0) {
    
	        //Make the player hold it
	        other.holding = 2;
        
	        //Hold
	        held = 1;
        
	        //Stop movement
	        yspeed = 0;
	        yadd = 0;
	    }
		
		//Otherwise
		else {
			
			//If the player is above and it's riding either a yoshi or a kuribo shoe
            if ((global.mount > 0) 
			|| (other.jumpstyle == 1)) 
			&& (other.bbox_bottom < bbox_top-yspeed+5) {
                
                //Make the player bounce
                if (instance_exists(obj_yoshi))
                || (instance_exists(obj_kuriboshoe)) {
                
                    with (obj_mario) 
						event_user(1);
                }
                
                //Create projectiles if the player is wearing a baburu or pentaro shoe
                if (global.mount == 2) {
                
                    //If this is a baburu shoe, create two fireballs
                    if (global.mountcolour = 1) {
                    
                        with (instance_create_depth(x+12, y+8, -2, obj_fireball)) xspeed = 1.5;
                        with (instance_create_depth(x-12, y+8, -2, obj_fireball)) xspeed = -1.5;
                    }

                    //Otherwise, if this is a pentaro shoe, create two ice balls
                    else if (global.mountcolour = 4) {
                                                
                        with (instance_create_depth(x+12, y+8, -2, obj_iceball)) xspeed = 1.5;
                        with (instance_create_depth(x-12, y+8, -2, obj_iceball)) xspeed = -1.5;                                
                    }
                }
                
                //Create spin smoke effect
                instance_create_depth(round(bbox_left+bbox_right)/2, round(bbox_top+bbox_bottom)/2, -6, obj_spinsmoke);
                
                #region COMBO

				    //Get points based on combo
				    if (other.hitcombo == 0) { //200 points
        
				        audio_play_sound(snd_kick_2, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = 200;
				    }
				    else if (other.hitcombo == 1) { //400 points
        
				        audio_play_sound(snd_kick_3, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = 400;
				    }
				    else if (other.hitcombo == 2) { //800 points
        
				        audio_play_sound(snd_kick_4, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = 800;
				    }
				    else if (other.hitcombo == 3) { //1000 points
        
				        audio_play_sound(snd_kick_5, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = 1000;
				    }
				    else if (other.hitcombo == 4) { //2000 points
        
				        audio_play_sound(snd_kick_6, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = 2000;
				    }
				    else if (other.hitcombo == 5) { //4000 points
        
				        audio_play_sound(snd_kick_7, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = 4000;
				    }
				    else if (other.hitcombo == 6) { //8000 points
        
				        audio_play_sound(snd_kick_8, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = 8000;
				    }
				    else if (other.hitcombo > 6) { //1-UP
    
				        audio_play_sound(snd_kick, 0, false);
				        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				            value = -1;
				    }
	
				#endregion
                
                //Increment hitcombo
                other.hitcombo++;
                
                //Destroy
                instance_destroy();                   
            }
            
            else if (yspeed >= 0) 
			&& (other.bbox_bottom > bbox_top-yspeed+5) {
				
				//Play 'Kick' sound
				audio_play_sound(snd_kick, 0, false);
                
                //Create hit
                with (instance_create_depth(x, y+8, -4, obj_smoke)) sprite_index = spr_spinthump;
                
                //Make the player visually kick the item
                with (obj_mario) {
					
					kicking = 2;
					alarm[5] = 10;
				}
                    
                //Set the vertical speed
                yspeed = -2;
                y--;
                
                //Set the horizontal speed
				if (obj_mario.x < x)
					xspeed = 2;
				else
					xspeed = -2;
                
                //Boost movement
                while (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))   
                    y--;
            }			
		}
	}
}