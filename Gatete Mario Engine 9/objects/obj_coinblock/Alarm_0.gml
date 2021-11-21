/// @description Begin movement sequence

//Play 'P-Balloon' sound
audio_play_sound(snd_pballoon, 0, false);

//Make it visible
visible = false;

//Move to the appropiate position
ready2 = 1;

//Create freeze
repeat (2) {
	
	freeze_create(false);
}

//Delay visibility
alarm[1] = 2;