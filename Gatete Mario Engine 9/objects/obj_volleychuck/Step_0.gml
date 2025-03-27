/// @description Volley Chuck logic

//Inherit the parent event
event_inherited();

#region LOGIC
    
	//If throwing a ball
	if (ready == 1) {

	    //If moving down
	    if (yspeed > 0) {
        
	        //Play 'Pop' sound
	        audio_play_sound(snd_kick, 0, false);
            
	        //End clap
	        ready = 2;
            
	        //Set kick frame
	        image_index = 2;
			
			//Generate kick effect
			with (instance_create_depth(x+13*sign(xscale), y + 8, -4, obj_smoke)) sprite_index = spr_spinthump;
			
			//Generate a ball
			with (instance_create_depth(x+13*sign(xscale), y, -2, obj_passinchuck_football)) {
    
				//Set sprite
				sprite_index = spr_volleychuck_ball;
				image_speed = 0;
				image_index = 2;
	
				//Motion
			    xspeed = 3*sign(other.xscale);
				yspeed = 3;
			}
	    }        
	}
	
	//Otherwise, if moving down
	else if (ready == 2) {
		
		//If there's no gravity
		if (yadd == 0) {

			//Chuck has landed
			ready = 0;
		
			//Animate
			image_speed = 1;
			image_index = 3;
		}
	}
#endregion

//If Mario does not exist or it's at the left
if (ready == 0) {

	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
	    xscale = -1;
	else
	    xscale = 1;
}