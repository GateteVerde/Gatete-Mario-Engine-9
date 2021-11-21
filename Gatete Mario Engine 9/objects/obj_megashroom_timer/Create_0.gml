/// @description The power of the mega shroom!

//Prepare to end mega mushroom power
alarm[0] = 900;

//Play the mega shroom theme if it is not playing
alarm[1] = 1;

//Generate sparkles
alarm[2] = 1;

//Warn player
warning = 0;

//Object to follow up
owner = noone;

//Stop 'Invincibility' sound if it is playing
if (audio_is_playing(snd_starman))
	audio_stop_sound(snd_starman);