/// @description Kill NPCs with shells

//If the enemy is vulnerable
if (other.vulnerable < 99) {
	
	//If the other enemy is a kicked koopa shell
	if (other.object_index == obj_shell_kicked) {
		
        //If the id is greater than the other id
        if (id > other.id) {
    
            //Play 'Kick' sound
            audio_play_sound(snd_kick, 0, false);
			
			#region KILL
			
				//Get killer id
				killer_id = other.id;
			
			    //Destroy both NPCs
			    with (other) {
		
					killer_id = other.id;
					event_user(0);
				}
	
				#region KILL
	
					//Kill NPC
					imdead = instance_create_depth(x, y, -6, obj_enemy_dead);
		
					//Hereby sprite
					imdead.sprite_index = sprite_index;

					//Hereby frame
					imdead.image_index = image_index;

					//Hereby facing direction
					imdead.image_xscale = xscale;
		
					//Set horizontal speed
					#region
					
						if (other.x < x)
							imdead.hspeed = 1;
						else
							imdead.hspeed = -1;
					
					#endregion
					
					//Destroy
					instance_destroy();
					
				#endregion
				
			#endregion
            
            //Create 'Spinthump' effect
            with (instance_create_depth(round(bbox_left+bbox_right)/2, round(bbox_top+bbox_bottom)/2, -4, obj_smoke)) sprite_index = spr_spinthump;
        
            //Get 1000 points
            with (instance_create_depth(x, y, -2, obj_score)) 
                value = 1000;
        }    
	}
	
	//Otherwise
	else {
		
		#region COMBO
	
			//200
			if (hitcombo == 0) {
		
				audio_play_sound(snd_kick_2, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 200;
			}
		
			//400
			else if (hitcombo == 1) {
		
				audio_play_sound(snd_kick_3, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 400;
			}
		
			//800
			else if (hitcombo == 2) {
		
				audio_play_sound(snd_kick_4, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 800;
			}
		
			//1000
			else if (hitcombo == 3) {
		
				audio_play_sound(snd_kick_5, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 1000;
			}
		
			//2000
			else if (hitcombo == 4) {
		
				audio_play_sound(snd_kick_6, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 2000;
			}
		
			//4000
			else if (hitcombo == 5) {
		
				audio_play_sound(snd_kick_7, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 4000;
			}
		
			//8000
			else if (hitcombo == 6) {
		
				audio_play_sound(snd_kick_8, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 8000;
			}
		
			//1-UP
			else if (hitcombo > 6) {
		
				audio_play_sound(snd_kick, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = -1;
			}
			hitcombo++;
		
		#endregion
		
		//Destroy both NPCs
		with (other) {
			
			killer_id = other.id;
			event_user(0);
		}
	}
	
	//Create spin thump
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
		sprite_index = spr_spinthump;
}