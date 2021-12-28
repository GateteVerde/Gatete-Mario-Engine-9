/// @description Force end P-Meter

//Allow Mario to fly again
flying = 0;
	
//Reset pmeter
pmeter = 0;
	
//End run
run = false;
	
//Stop 'P-Meter' sound
if (audio_is_playing(snd_pmeter))
	audio_stop_sound(snd_pmeter);