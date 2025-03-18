/// @description Force end particles and stop 'Rain' sound

//Destroy particle system
part_system_destroy(system);

//End 'Rain' sound if it is playing
if (audio_is_playing(snd_rain))
	audio_stop_sound(snd_rain);