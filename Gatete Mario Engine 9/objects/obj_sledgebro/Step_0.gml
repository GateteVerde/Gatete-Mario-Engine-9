/// @description Sledge Bro logic

//Inherit the parent event
event_inherited();
	
#region Face towards Mario

	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xscale = -1;
	else
		xscale = 1;
	
#endregion

#region Stun Mario

	//Make the ground shake after jumping
	if (yadd == 0)
	&& (jumping == 1) {

	    //Play 'Thud' sound
	    audio_play_sound(snd_thud, 0, false);
    
		//Shake the screen
		shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);    
    
	    //Reset count
	    jumping = 0;
    
	    //Set horizontal speed.
	    xspeed = prevxspeed;
    
	    //Stun the player if possible
	    if (instance_exists(obj_mario)) {
    
	        //If the player is not on the ground
	        if (obj_mario.state != playerstate.jump)
	            with (obj_mario) stuntime = 60;
	    }
    
		//Create smoke effect
		with (instance_create_depth(x, y, -6, obj_smoke)) sprite_index = spr_supersmash;
		with (instance_create_depth(x, y, -6, obj_smoke)) {
	
			sprite_index = spr_supersmash;
			image_xscale = -1;
		}
	}
#endregion

//Turn around
if ((xspeed > 0) && (x > xstart+16))
|| ((xspeed < 0) && (x < xstart-16))
	xspeed = -xspeed;