/// @description Give the required amount of score

switch (value) {
	
	//1-UP
	case (-1): {
		
		//Play 'Lucky' sound
		audio_play_sound(global.voiceline_lucky, 0, false);
		
		//Set up the sprite
		sprite_index = spr_score_1up;
		
		//If the game is still giving extra lives
		if (obj_coordinator.addlives == 0) {
			
			//Play '1-UP' sound
			audio_play_sound(snd_1up, 0, false);
		
			//Add extra lives
			lives++;
		}
		else
			obj_coordinator.addlives++;
	} break;
	
	//Score
	default: score += value; break;
}