/// @description Transform into Mega Mario

//Get 1000 points
with (instance_create_depth(x, y, -6, obj_score)) value = 1000;

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) beam = true;

//If Mario is not in the mega form
if (global.powerup != cs_mega) {

	//Play 'Powerup / Mega' sound.
	audio_play_sound(snd_powerup_mega, 0, false);
	
	//Destroy invincibility object
	with (obj_invincibility) instance_destroy();
        
	//Perform animation sequence
	with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
		
		sequence = 5
	}
	
	//Turn Mario into 'Super' Mario.
	global.powerup = cs_mega;
}

//Otherwise
else {
	
	//Play 'Powerup' sound
	audio_play_sound(snd_powerup, 0, false);
	
	//If the timer exists
	if (instance_exists(obj_megashroom_timer)) {

	    //Extend the timer on his megashroom_timer
	    obj_megashroom_timer.alarm[0] = 840;
	    obj_megashroom_timer.alarm[1] = 1;
    
	    //Deny megashroom_timer end.
	    if (obj_megashroom_timer.alarm[1] > 0)    
	        obj_megashroom_timer.alarm[1] = -1; 
	}
}

//Destroy
instance_destroy();