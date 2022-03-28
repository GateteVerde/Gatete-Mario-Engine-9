/// @description Clappin' Chuck logic

//Inherit the parent event
event_inherited();

#region LOGIC
    
	//If clapping
	if (clap == 1) {

	    //If moving down
	    if (yspeed > 0) {
        
	        //Play 'Pop' sound
	        audio_play_sound(snd_pop, 0, false);
            
	        //End clap
	        clap = 0;
            
	        //Set clapping frame
	        image_index = 2;
	    }        
	}
   
	//If not jumping
	if (yadd == 0) {
    
	    //If the jumping frame is used
	    if (image_index != 0) {
        
	        //Set the regular sprite
	        image_speed = 0;
			image_index = 0;
            
	        //Jump again
	        alarm[0] = 15;
	    }
	}
#endregion

//If Mario does not exist or it's at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;    