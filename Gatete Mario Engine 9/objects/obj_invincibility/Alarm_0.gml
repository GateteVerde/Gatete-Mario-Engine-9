/// @description End invincibility

//Stop 'Starman' sound
audio_stop_sound(snd_starman);

//Play the music from the level
obj_levelcontrol.alarm[0] = 2;

//Destroy
alarm[1] = 60;