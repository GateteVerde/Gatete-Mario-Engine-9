/// @description Get 'Big' player status or restore health

//Get 1000 points
with (instance_create_depth(x, y, -6, obj_score)) value = 1000;

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) beam = true;

//If health mode is active
if (global.hp_mode > 0) {
	
	//Play 'Powerup' sound
	audio_play_sound(snd_powerup, 0, false);
	
	//Increment hp
	global.hp++;
	if (global.hp > global.hp_max)
		global.hp = global.hp_max;
}

//Otherwise
else {

	//If Mario does not have the mega form
	if (global.powerup != cs_mega) {

		//If Mario is tiny or small
		if (global.powerup == cs_tiny)
		|| (global.powerup == cs_small) {
	
			//Play 'Powerup' sound.
			audio_play_sound(snd_powerup, 0, false);
        
		    //Perform animation sequence
		    with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
		
				if (global.powerup == cs_tiny)
					sequence = -1;
				else {
					
					if (instance_exists(obj_mario_shmup))
						sequence = 2;
					else
						sequence = 0;
				}
			}
	
		    //Turn Mario into 'Super' Mario.
		    global.powerup = cs_big;
		}
    
		//Otherwise, get a reserve mushroom (But only in non-shmup stages)
		else {
			
			//If Mario is on a plane/submarine
			if (instance_exists(obj_mario_shmup))
				audio_play_sound(snd_reserve, 0, false);
				
			//Otherwise
			else {
		
				//If there's not a item in reserve
				if (global.reserve == cs_small) {
					
					//Play 'Reserve' box
					audio_play_sound(snd_reserve, 0, false);
		
					//Reserve a mushroom
			        global.reserve = cs_big;
				}
	
				//Otherwise, if there's an item in reserve
				else
					audio_play_sound(snd_reserve, 0, false);
			}
		}
	}

	//Otherwise
	else {

		//Play 'Reserve' sound
		audio_play_sound(snd_reserve, 0, false);
	
		//Get a mushroom in reserve
		if (global.reserve == cs_small)
			global.reserve = cs_big;
	}
}

//Destroy
instance_destroy();