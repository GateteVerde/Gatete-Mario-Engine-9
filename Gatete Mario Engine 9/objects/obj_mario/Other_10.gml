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
	
		
		}
	
		//Otherwise, if Mario is riding Yoshi
		else if (global.mount == 1) {
	
		
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
		
				//Play 'Powerdown' sound
				audio_play_sound(snd_warp, 0, false);
			
				//Perform animation sequence
			    with (instance_create_depth(0, 0, -5, obj_mario_transform)) sequence = 3;
	
			    //Turn Mario into 'Super' Mario.
			    global.powerup = cs_big;
				
				//Exit
				exit;
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
					
						//Drop reserve item
						if (global.reserve_activated) {
						
							with (obj_levelcontrol) 
								event_user(2);
						}
						
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