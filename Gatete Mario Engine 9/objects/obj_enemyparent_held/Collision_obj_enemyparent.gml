/// @description Kill enemy by throwing another enemy

//If this NPC is being held or it's not being held and it's moving
if (held == true) 
|| ((held == false) && (yspeed != 0)) {
	
	//If this enemy was thrown upwards
	if (thrown_up == true) {
		
		//If this is a shell object
		if (is_shell == true) {
			
			#region POINTS
	
				//200
				if (hitcombo == 0) {
		
					audio_play_sound(snd_kick_2, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = 200;
				}
		
				//400
				else if (hitcombo == 1) {
		
					audio_play_sound(snd_kick_3, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = 400;
				}
		
				//800
				else if (hitcombo == 2) {
		
					audio_play_sound(snd_kick_4, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = 800;
				}
		
				//1000
				else if (hitcombo == 3) {
		
					audio_play_sound(snd_kick_5, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = 1000;
				}
		
				//2000
				else if (hitcombo == 4) {
		
					audio_play_sound(snd_kick_6, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = 2000;
				}
		
				//4000
				else if (hitcombo == 5) {
		
					audio_play_sound(snd_kick_7, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = 4000;
				}
		
				//8000
				else if (hitcombo == 6) {
		
					audio_play_sound(snd_kick_8, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = 8000;
				}
		
				//1-UP
				else if (hitcombo > 6) {
		
					audio_play_sound(snd_kick, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
						value = -1;
				}
			
				//Increment combo
				hitcombo++;
				
			#endregion
			
			//Destroy both NPCs
			with (other) {
		
				killer_id = other.id;
				event_user(0);
			}
		}
			
		//If this is not a shell
		else if (is_shell == false) {
			
			//Play 'Kick' sound
			audio_play_sound(snd_kick, 0, false);
			
			//Destroy both NPCs
			with (other) {
		
				killer_id = other.id;
				event_user(0);
			}
				
			//Kill
			#region
	
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
					if (other.x < x)
						imdead.hspeed = 1;
					else
						imdead.hspeed = -1;		
				#endregion
					
			#endregion
				
			//Get 1000 points
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score)) value = 1000;
	
			//Destroy
			instance_destroy();
		}
	}
		
	//Otherwise
	else {
				
		//Play 'Kick' sound
		audio_play_sound(snd_kick, 0, false);
			
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
			if (other.x < x)
				imdead.hspeed = 1;
			else
				imdead.hspeed = -1;		
		#endregion
				
		//Get 1000 points
		with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score)) value = 1000;
	
		//Destroy
		instance_destroy();
	}
    
    //Create spin thump
    with (instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -6, obj_smoke)) 
		sprite_index = spr_spinthump;
}