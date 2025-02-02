/// @description Take points off the time, and add to the score

//If there's time left
if (global.timer > 0) {

	//If the timer is greater than 100
	if (global.timer > 99) {
	
		global.timer -= 100;
		alarm[0] = 2;
		score += (obj_hud.multiplier * 100);
	}
	
	//Otherwise, if the timer is greater than 10
	else if (global.timer > 9) {
	
		global.timer -= 10;
		alarm[0] = 2;
		score += (obj_hud.multiplier * 10);
	}
	
	//Otherwise, if the timer is greater than 0
	else if (global.timer > 0) {
	
		global.timer--;
		alarm[0] = 2;
		score += (obj_hud.multiplier * 1);
	}
	
	//If the timer is greater than 1, play 'Count' sound
	if (global.timer > 1)
		audio_play_sound(snd_count, 0, false);
	else
		audio_play_sound(snd_count_end, 0, false);
}