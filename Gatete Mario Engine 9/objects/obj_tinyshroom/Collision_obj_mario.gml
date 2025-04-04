/// @description Get 'Tiny' player status

//Force dismount Yoshi
if (instance_exists(obj_yoshi)) {
	
	with (obj_yoshi) event_user(1);
}

//Force dismount kuribo shoes
if (instance_exists(obj_kuriboshoe)) {

	with (obj_kuriboshoe) event_user(0);
}

//Get 1000 points
with (instance_create_depth(x, y, -6, obj_score)) value = 1000;

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) beam = true;

//If the player is not Tiny and does not have the Mega powerup
if (global.powerup != cs_tiny) {

	//If the powerup is the mega mushroom
	if (global.powerup == cs_mega) {
		
		//Play 'Reserve' sound
		audio_play_sound(snd_reserve, 0, false);
		
		//Play 'Thank You' sound
		play_voiceline(global.voiceline_thankyou, 0, false);
	
		//Add a 'Tiny' shroom to the reserve box
		if (global.reserve != cs_tiny)
			global.reserve = cs_tiny;
	}
	
	else {

		//Play 'Mini' sound.
		audio_play_sound(snd_mini, 0, false);
		
		//Play 'Jwin' sound
		play_voiceline(global.voiceline_jwin, 0, false);
        
		//Perform animation sequence
		with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
		
			if (global.powerup >= cs_big)
				sequence = -3;
			else
				sequence = -2;
		}
	
		//Turn Mario into 'Tiny' Mario.
		global.powerup = cs_tiny;
	}
}
else {

	//Play 'Reserve' sound
	audio_play_sound(snd_reserve, 0, false);
	
	//Play 'Thank You' sound
	play_voiceline(global.voiceline_thankyou, 0, false);
	
	//Add a 'Tiny' shroom to the reserve box
	if (global.reserve != cs_tiny)
		global.reserve = cs_tiny;
}

//Destroy
instance_destroy();