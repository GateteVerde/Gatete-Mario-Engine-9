/// @description Collision with Mario

//If Mario is invulnerable or is on the mega form, exit
if (instance_exists(obj_invincibility))
|| (global.powerup == cs_mega)
exit;

//If the enemy is invulnerable to stomp or the player is invulnerable.
if (stomp != -1)
|| (other.invulnerable == -1) {

    //If the player is sliding down a slope
    if ((other.sliding) || ((global.powerup == cs_football) && (other.run == true)))
    && (vulnerable < 99) {

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
    
    //Otherwise, if the player is not sliding
    else {
    
        //If the player is above the enemy and moving down
        if (other.bbox_bottom < bbox_top-yspeed+5) {
    
            //If the player is spin jumping
            if (stomp != 3)
            && (stomp != 4)
            && ((other.jumpstyle == 1) || (global.mount > 0)) {
    
                //If this enemy is not immune to spin jumps
                if (stomp == 0)
                || (stomp == 5)
                || ((stomp == 1) && (global.mount > 0)) {
                
                    //Create spin smoke effect
                    instance_create_depth(round(bbox_left+bbox_right)/2, round(bbox_top+bbox_bottom)/2, -6, obj_spinsmoke);
                    
					#region COMBO
					
						//200
				        if (other.hitcombo == 0) 
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = 200;
						
						//400
				        else if (other.hitcombo == 1)
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = 400;
				        
						//800
				        else if (other.hitcombo == 2)
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = 800;
				        
						//1000
				        else if (other.hitcombo == 3)
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = 1000;
				        
						//2000
				        else if (other.hitcombo == 4)
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = 2000;
				        
						//4000
				        else if (other.hitcombo == 5)
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = 4000;
				        
						//8000
				        else if (other.hitcombo == 6)
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = 8000;
				        
						//1-UP
				        else if (other.hitcombo > 6)
				            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				                value = -1;
					#endregion
                    
                    //Increment combo
                    other.hitcombo++;
                    
                    //Bounce against if riding or just stop
                    if (global.mount > 0) {
                    
                        //Bounce
                        with (other) event_user(1);
                        
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
                    }
                        
                    //Destroy
                    instance_destroy();
                }
                
                //Otherwise, spin on spiky enemies
                else {
                
                    //Play 'Stomp' sound
                    audio_play_sound(snd_stomp, 0, false);
                    
                    //Create spin smoke
                    with (instance_create_depth(other.x, other.bbox_bottom, -6, obj_smoke)) sprite_index = spr_spinthump;
                    
                    //Bounce
                    with (other) event_user(1);
                }    
            }
    
            //Regular stomp
            else if ((stomp == 0) || (stomp == 4) || (stomp == 5))
            && (other.swimming == false) {
            
                //Play 'Stomp' sound
                audio_play_sound(snd_stomp, 0, false);
            
                //Prevent certain enemies from getting double stomped
                if (yspeed < 0) {
                
                    y = yprevious;
                    if (other.yspeed > 0)
                        other.y = other.yprevious;
                }
                
				//If Mario is tiny
				if (global.powerup != cs_tiny) {
				
	                //If the enemy does give points
	                if (stomp == 0) {
                
						#region COMBO
					
							//200
					        if (other.hitcombo == 0) 
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = 200;
						
							//400
					        else if (other.hitcombo == 1)
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = 400;
					        //800
					        else if (other.hitcombo == 2)
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = 800;
				        
							//1000
					        else if (other.hitcombo == 3)
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = 1000;
				        
							//2000
					        else if (other.hitcombo == 4)
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = 2000;
				        
							//4000
					        else if (other.hitcombo == 5)
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = 4000;
				        
							//8000
					        else if (other.hitcombo == 6)
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = 8000;
				        
							//1-UP
					        else if (other.hitcombo > 6)
					            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
					                value = -1;
						#endregion
                    
	                    //Increment combo
	                    other.hitcombo++;
						
						//Stomp the enemy
						if (other.groundpound == 2) {
						
							//Set killer id and kill enemy
							killer_id = obj_mario;
							event_user(0);
						}
						else
							event_user(1);
	                }
					
					//Otherwise
					else if (stomp == 4) {
						
						//If Mario is doing a groundpound
						if (other.groundpound == 2) {
					
							#region COMBO
					
								//200
						        if (other.hitcombo == 0) 
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = 200;
						
								//400
						        else if (other.hitcombo == 1)
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = 400;
						        //800
						        else if (other.hitcombo == 2)
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = 800;
				        
								//1000
						        else if (other.hitcombo == 3)
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = 1000;
				        
								//2000
						        else if (other.hitcombo == 4)
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = 2000;
				        
								//4000
						        else if (other.hitcombo == 5)
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = 4000;
				        
								//8000
						        else if (other.hitcombo == 6)
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = 8000;
				        
								//1-UP
						        else if (other.hitcombo > 6)
						            with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
						                value = -1;
							#endregion
                    
		                    //Increment combo
		                    other.hitcombo++;
						
							//Set killer id and kill enemy
							killer_id = obj_mario;
							event_user(0);
						}
						
						//Otherwise
						else
							event_user(1);
					}
				}
				
				//Make Mario bounce
				with (other) {
					
					if (groundpound == 0)
						event_user(1);
				}
                
                //Create spin smoke
                with (instance_create_depth(other.x, other.bbox_bottom, -4, obj_smoke)) 
					sprite_index = spr_spinthump;            
            }
        }
    
        //Otherwise, hurt the player
        else
            with (other) event_user(0);
    } 
}