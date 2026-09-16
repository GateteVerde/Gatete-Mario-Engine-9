/// @description Kill with the power of invincibility

//If the enemy is vulnerable
if (other.vulnerable < 99) {

	#region GET POINTS BASED ON ENEMIES HIT
	
		//If no consecutive points can be earnt
		if (global.no_starman_combo == true) {
			
	        audio_play_sound(snd_kick, 0, false);
	        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
	            value = 200;
		}
				
		//Otherwise
		else {
	
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
		
			//1-UP / 2-UP (If Wiggler)
			else if (hitcombo > 6) {
		
				//If Mario has killed 7 or more enemies and the next enemy is a wiggler, win 2 extra lifes instead.
				if (hitcombo >= 7) 
				&& ((other.object_index == obj_wiggler) || (other.object_index == obj_wiggler_body)) {
			
					audio_play_sound(snd_kick, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
						value = -2;				
				}
			
				//Otherwise, gain a extra life
				else {
				
					audio_play_sound(snd_kick, 0, false);
					with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
						value = -1;
				}
			}
			hitcombo++;
		}
	#endregion
	
	//With the enemy
	with (other) {
	
		killer_id = other.id;
		event_user(0);
	}
	
	//Create spin thump
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
		sprite_index = spr_spinthump;
}
