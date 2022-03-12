/// @description Get 'Big' player status

//Get 1000 points
with (instance_create_depth(x, y, -6, obj_score)) value = 1000;

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) beam = true;

//Give Mario temporary invulnerability
with (other) event_user(7);

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
			else
				sequence = 0;
		}
	
	    //Turn Mario into 'Super' Mario.
	    global.powerup = cs_big;
	}
    
	//Otherwise, get a reserve mushroom
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

//Otherwise
else {

	//Play 'Reserve' sound
	audio_play_sound(snd_reserve, 0, false);
	
	//Get a mushroom in reserve
	if (global.reserve == cs_small)
		global.reserve = cs_big;
}

//Destroy
instance_destroy();