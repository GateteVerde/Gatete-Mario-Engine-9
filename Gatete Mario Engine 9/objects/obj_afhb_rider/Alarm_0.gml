/// @description Change facing direction and toss hammers

//If the object is outside the view
if (outside_view() == true) {

	alarm[0] = 1;
	exit;
}

//Play 'Hammer' sound
audio_play_sound(snd_hammer, 0, false);

//If facing right
if (xscale == 1) {

	//Face to the left
	xscale = -1;
	
	//Throw a hammer to the left
	with (instance_create_depth(x-16, y, -2, obj_hammerbro_hammer)) {
	
		xspeed = -1;
		image_xscale = -1;
	}
}

//Otherwise, if facing left
else if (xscale == -1) {
	
	//Face to the right
	xscale = 1;
	
	//Throw a hammer to the right
	with (instance_create_depth(x+16, y, -2, obj_hammerbro_hammer)) {
	
		xspeed = 1;
		image_xscale = 1;
	}	
}

//Repeat the process
alarm[0] = time;