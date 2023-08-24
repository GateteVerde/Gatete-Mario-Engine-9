/// @description Collision with enemies

//If this enemy is not a rollippo
if (other.object_index == obj_rollippo) {

	//Play 'Bumper' sound
	audio_play_sound(snd_bumper, 0, false);

	with (other) {

		//If the Rollippo is not rolling
		if (ready == 0) {
            
		    //Rolling state
		    ready = 1;
	
			//No longer stomp
			stomp = -1;
	
			//No longer turn on ledges
			turn_on_ledges = false;
    
		    //Sprite
		    sprite_index = spr_rollippo_roll;
    
		    //Stop animation
		    image_speed = 0;
		}

		//Double movement speed
		xspeed = (other.x < x) ? 2.5 : -2.5;

		//Do a little hop
		if (yspeed == 0) {
	
			yspeed = -1.5;
			y--;
		}
	}
}

//Otherwise
else {

	//If the enemy is rolling and is vulnerable
	if ((ready == 1) && (other.vulnerable < 99)) {

		#region GET POINTS BASED ON ENEMIES HIT
	
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
	
		//With the enemy
		with (other) {
	
			killer_id = other.id;
			event_user(0);
		}
	
		//Create spin thump
	    with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
			sprite_index = spr_spinthump;
	}
}