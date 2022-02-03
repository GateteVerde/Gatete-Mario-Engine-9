/// @description Give the required amount of score

switch (value) {
	
	//+ 50 Second
	case (-6): {
		
		//Set sprite
		sprite_index = spr_score_time_50;
		
		//Only increase if there's time left
		if (obj_levelcontrol.leveltime > 0)
		&& (global.timer > 0)
			global.timer += 50;
	} break;
	
	//+ 20 Second
	case (-5): {
		
		//Set sprite
		sprite_index = spr_score_time_20;
		
		//Only increase if there's time left
		if (obj_levelcontrol.leveltime > 0)
		&& (global.timer > 0)
			global.timer += 20;
	} break;
	
	//+ 10 Second
	case (-4): {
		
		//Set sprite
		sprite_index = spr_score_time_10;
		
		//Only increase if there's time left
		if (obj_levelcontrol.leveltime > 0)
		&& (global.timer > 0)
			global.timer += 10;
	} break;

	//3-UP
	case (-3): {
		
		//Set up the sprite
		sprite_index = spr_score_3up;
		
		//If the game is still giving extra lives
		if (obj_coordinator.addlives == 0) {
			
			//Play '1-UP' sound
			audio_play_sound(snd_1up, 0, false);
		
			//Add extra lives
			lives++;
			
			//With the coordinator
			with (obj_coordinator) {
			
				addlives += 2;
				alarm[2] = 30;
			}
		}
		else {
			
			//Set up the sprite
			sprite_index = spr_score_3up;
			
			//Increment additional lives
			obj_coordinator.addlives += 3;
		}
	} break;
	
	//2-UP
	case (-2): {
		
		//Set up the sprite
		sprite_index = spr_score_2up;
		
		//If the game is still giving extra lives
		if (obj_coordinator.addlives == 0) {
			
			//Play '1-UP' sound
			audio_play_sound(snd_1up, 0, false);
		
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