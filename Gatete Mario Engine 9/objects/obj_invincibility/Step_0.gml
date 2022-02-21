/// @description Invincibility logic

//If the player gets a mega mushroom, dies or clears a level
if (global.powerup == cs_mega)
&& (instance_exists(obj_mario_dead)) {

	//Stop 'Starman' sound
	audio_stop_sound(snd_starman);

	//Destroy
	instance_destroy();
	exit;
}

//Otherwise
else {

	//If Mario does exist.
	if (instance_exists(obj_mario)) {

	    //Snap into the player position.
	    x = obj_mario.x;
	    y = obj_mario.y;
    
	    //With Mario
	    with (obj_mario) {
    
	        //Stay invincible
	        invulnerable = true;
		
			//Stay visible
			if (image_alpha < 1)
				image_alpha = 1;
	    }
    
	    //Get the mask from the player
	    mask_index = obj_mario.mask_index;
		
		//Get the horizontal speed from the player
		xspeed = min(1, obj_mario.xspeed);
	}

	//Otherwise, if Mario is doing another action
	else {

	    //Set object to follow
	    follow_which_mario()
		
		//If there's other object using this
		if (follow != noone) {
    
		    //Snap into the following object position.
		    x = follow.x;
		    y = follow.y;
		}
	}
}

//Warn the player that the starman effect is running out
if ((warning == 0) && (alarm[0] <= 120)) {

    //Play 'Switch Timer' sound
    audio_play_sound(snd_switch_timer, 0, false);
    
    //Warn
    warning = 1;
}
else if ((warning == 1) && (alarm[0] > 120)) 
    warning = 0;