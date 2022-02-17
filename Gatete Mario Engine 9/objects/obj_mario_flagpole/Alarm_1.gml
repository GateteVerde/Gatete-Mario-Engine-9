/// @description Take points off the time, and add to the score

//If there is no time left
if (global.timer == 0) 
    alarm[2] = 1;

//Otherwise
else {
	
	//If the timer is greater than 100
	if (global.timer > 99) {
	
		global.timer -= 100;
		alarm[1] = 2;
		score += 5000;
	}
	
	//Otherwise, if the timer is greater than 10
	else if (global.timer > 9) {
	
		global.timer -= 10;
		alarm[1] = 2;
		score += 500;
	}
	
	//Otherwise, if the timer is greater than 0
	else if (global.timer > 0) {
	
		global.timer--;
		alarm[1] = 2;
		score += 50;
	}
	
	//If the timer is greater than 1, play 'Count' sound
	if (global.timer > 1)
		audio_play_sound(snd_count, 0, false);
	else
		audio_play_sound(snd_count_end, 0, false);
}