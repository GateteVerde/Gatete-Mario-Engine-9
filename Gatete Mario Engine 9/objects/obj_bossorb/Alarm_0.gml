/// @description Create boss orb

//Create goal orb
switch (winged) {
	
	//No
	case (0): {
		
		//Play 'Chest' sound
		audio_play_sound(snd_chest, 0, false);
		
		//Create a regular orb
		with (instance_create_depth(x, y, -2, obj_goalorb)) {
			
			secret_exit = other.secret_exit;
			multiplier = other.multiplier;
		}
		
		//Create smoke effect
		instance_create_depth(x, y+8, -6, obj_smoke);
	} break;
	
	//Yes
	case (1): {
	
		with (instance_create_depth(x, y, -2, obj_goalorb_winged)) {
			
			secret_exit = other.secret_exit;
			multiplier = other.multiplier;
		}
	} break;
}

//Destroy
instance_destroy();