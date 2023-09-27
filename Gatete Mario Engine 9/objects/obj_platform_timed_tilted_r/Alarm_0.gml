/// @description Decrement timer

if (ready == 1) {

	//Decrement time
	if (time > 1) {
		
		//Play 'Carrot' sound
		audio_play_sound(snd_carrotplat, 0, false);
		
		//Decrement time
		time--;
		
		//Repeat
		alarm[0] = 60;
	}
	
	//Otherwise, if the timer is 1
	else if (time == 1) {
		
		//Play 'Carrot Fall' sound
		audio_play_sound(snd_carrotplat_fall, 0, false);
	
		//End timer
		time = 0;
		
		//Set gravity
		ready = 2;
		gravity = 0.1;
	}
}