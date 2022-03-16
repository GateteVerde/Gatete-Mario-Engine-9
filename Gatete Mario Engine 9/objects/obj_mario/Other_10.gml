/// @description Damage the player

//If not invincible
if (invulnerable == 0) {

	//Give Mario temporary invulnerability
	event_user(7);
	
	//Blow bubble
	with (obj_hippo_bubble) event_user(1);

	//If Mario is riding something
	if (global.mount > 0) {

		//If Mario is riding a shoe
		if (global.mount == 2) {
	
		    //Play 'Power Lost' sound
		    audio_play_sound(snd_powerlost, 0, false);
    
		    //Forget it
		    global.mount = 0;
    
		    //With the shoe
		    with (obj_kuriboshoe) {
    
		        //Create flying shoe
		        with (instance_create_depth(x, y, -6, obj_kuriboshoe_lost)) {
        
		            sprite_index = other.sprite_index;
		            image_xscale = -1;
		            hspeed = -1;
		        }
        
		        //Destroy
		        instance_destroy();
		    }
		}
	
		//Otherwise, if Mario is riding Yoshi
		else if (global.mount == 1) {
	
			with (obj_yoshi) {
                
                //Create a scared yoshi
                with (instance_create_depth(x, y, -2, obj_yoshi_runaway)) {
					
					colour = other.colour;
					xspeed = 2 * obj_mario.xscale;
				}
                    
                //Destroy
                instance_destroy();
            }
		}
	}

	//Otherwise
	else {

		//If Mario is frozen
		if (freezetime > 0) {
	
		
		}
	
		//Otherwise
		else {
	
			//If Mario does have a powerup
			if (global.powerup > cs_big) {
				
				//If Mario is flying with the cape
				if (global.powerup == cs_cape) 
				&& (instance_number(obj_mario_fly) > 0) {
					
					//Play 'Power Lost' sound
					audio_play_sound(snd_powerlost, 0, false);
					
					//Force end flight
					with (obj_mario_fly) instance_destroy();
					
					//Give Mario back flying privileges
					fly = noone;
					enable_gravity = true;
					flying = false;
					jumpstyle = 1;
					jumping = 0;
				
					//Exit
					exit;
				}
				
				//Otherwise
				else {
		
					//Play 'Powerdown' sound
					audio_play_sound(snd_warp, 0, false);
			
					//Perform animation sequence
				    with (instance_create_depth(0, 0, -5, obj_mario_transform)) sequence = 3;
	
				    //Turn Mario into 'Super' Mario.
				    global.powerup = cs_big;
				
					//Exit
					exit;
				}
			}
		
			//Otherwise
			else {
		
				//If Mario has a safeguard
				if (global.safeguard > 0) {
			
					//Play 'Damage' sound
					audio_play_sound(snd_damage, 0, false);
				
					//Knock back
					yspeed = -2;
					xspeed = -2 * sign(xscale);
				
					//Decrement safeguard
					global.safeguard--;
				}
			
				//Otherwise
				else {
			
					//If Mario is big
					if (global.powerup == cs_big) {
						
						//Play 'Powerdown' sound
						audio_play_sound(snd_warp, 0, false);
						
						//Perform animation sequence
					    with (instance_create_depth(0, 0, -5, obj_mario_transform)) sequence = 1;
						
						//Turn Mario into 'Small' Mario.
					    global.powerup = cs_small;
					}
				
					//Otherwise
					else if (global.powerup < cs_big) {
						
						//Create death object
						with (instance_create_depth(x, y, -5, obj_mario_dead)) {
						
							//If Mario has the tiny powerup
							if (global.powerup == cs_tiny)
								sprite_index = spr_mario_dead_tiny;
						}
						
						//Destroy
						instance_destroy();
					}
				}
			}
		}
	}
}