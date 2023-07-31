/// @description Mario climb logic

#region UPDATE PALETTE
	
	//If Mario is invincible
	if (instance_exists(obj_invincibility)) {
    
		//If the starman is about to end
		if (obj_invincibility.alarm[0] < 120) {

			//Set up palette
			isflashing += 0.01;
			if (isflashing > 6.99)
				isflashing = 1;
		}
			
		//Otherwise
		else {
	
			//Set up palette
			isflashing += 0.05;
			if (isflashing > 6.99)
				isflashing = 1;
		}
	}
	else
	    isflashing = 0;
#endregion

//Set sprite
sprite_index = global.climb_sprite[global.powerup];

//If the player is about to climb up
if (ready == 0) {

    //If the beanstalk does not exist
    if (!instance_exists(myvine)) {
    
        //Make the player climb up
        ready = 1;
    
        //Move up
        vspeed = -1;
    }
}

//Otherwise, if the player is climbing already
else {
	
	#region PLAY SOUND
	
		//Increment climb
	    climb++;
    
	    //If climb hits 7, reset and play a sound
	    if (climb > 7) {
    
	        //Reset climb
	        climb = 0;
        
	        //Play a sound
	        audio_play_sound(snd_climb, 0, false);        
	    }
	#endregion
	
	//If the player reached the ystart position
	if (y < ystart) {
	
		//Create a controllable player
		with (instance_create_depth(x, ystart, -5, obj_mario)) {
		
			//Set climbing state
			state = playerstate.climb;
		}
		
		//Destroy
		instance_destroy();
	}
}