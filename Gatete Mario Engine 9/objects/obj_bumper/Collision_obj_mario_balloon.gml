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
}