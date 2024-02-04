/// @description Bounce against the bumper

//If the bumper is not bouncing
if (ready == 0) {
	
	//Play 'Bumper' sound
	audio_play_sound(snd_bumper, 0, false);
	
	//Bounce
	ready = 1;
    
    //Set motion
    other.xspeed = lengthdir_x(4, point_direction(x, y, other.x, other.y));
	other.yspeed = lengthdir_y(4, point_direction(x, y, other.x, other.y));
	
	//Force end groundpound
	other.groundpound = 0;
    
	//If the 'Jump' key is held
	if (other.y < y-12)
    && (input_check(input.action_0)) {
			
        other.jumping = 1;
		audio_stop_sound(snd_bumper);
		audio_play_sound(snd_bumper_high, 0, false);
	}
    else
        other.jumping = 2;
}