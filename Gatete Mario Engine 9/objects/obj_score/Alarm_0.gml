/// @description Give the required amount of score

switch (value) {

	//3-UP
	case (-3): {
		
		//If the game is still giving extra lives
		if (obj_coordinator.addlives == 0) {
			
			//Play '1-UP' sound
			audio_play_sound(snd_1up, 0, false);
	
			//Set up the sprite
			sprite_index = spr_score_3up;
		
			//Add extra lives
			lives++;
			
			//With the coordinator
			with (obj_coordinator) {
			
				addlives += 2;
				alarm[2] = 30;
			}
		}
		else
			obj_coordinator.addlives += 3;
	} break;
	
	//2-UP
	case (-2): {
		
		//If the game is still giving extra lives
		if (obj_coordinator.addlives == 0) {
			
			//Play '1-UP' sound
			audio_play_sound(snd_1up, 0, false);
	
			//Set up the sprite
			sprite_index = spr_score_3up;
		
			//Add extra lives
			lives++;
			
			//With the coordinator
			with (obj_coordinator) {
			
				addlives += 1;
				alarm[2] = 30;
			}
		}
		else
			obj_coordinator.addlives += 2;
	} break;
	
	//1-UP
	case (-1): {
		
		//If the game is still giving extra lives
		if (obj_coordinator.addlives == 0) {
			
			//Play '1-UP' sound
			audio_play_sound(snd_1up, 0, false);
	
			//Set up the sprite
			sprite_index = spr_score_1up;
		
			//Add extra lives
			lives++;
		}
		else
			obj_coordinator.addlives++;
	} break;
	
	//Score
	default: score += value; break;
}