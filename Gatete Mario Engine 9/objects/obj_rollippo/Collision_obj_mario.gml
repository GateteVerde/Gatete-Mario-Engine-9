/// @description Collision with Mario

//If not rolling
if (ready == 0)
	event_inherited();
	
//Otherwise
else {
	
	//Play 'Bumper' sound
	audio_play_sound(snd_bumper, 0, false);

	//Double movement speed
	xspeed = (obj_mario.x < x) ? 2.5 : -2.5;

	//Do a little hop
	if (yspeed == 0) {
	
		yspeed = -1.5;
		y--;
	}
    
	//Set motion
	other.xspeed = lengthdir_x(4, point_direction(x, y, other.x, other.y));
	other.yspeed = lengthdir_y(4, point_direction(x, y, other.x, other.y));
    
	//If the 'Jump' key is held
	if (other.y < y-24)
	&& (input_check(input.action_0)) {
			
	    other.jumping = 1;
		audio_stop_sound(snd_bumper);
		audio_play_sound(snd_bumper_high, 0, false);
	}
	else
	    other.jumping = 2;
}