/// @description Animate

//If this object is inside view, play 'Beep' sound
if (outside_view() == false) {

	audio_stop_sound(snd_beep);
	audio_play_sound(snd_beep, 0, false);
}

//Start animating
image_speed = 1;