/// @description Jump

//Play 'Firework Whistle' sound
audio_play_sound(snd_firework_whistle, 0, false);

//Stop 'Fuse' sound
audio_stop_sound(fuse);

//Set vertical speed
yspeed = -4;

//Blow up
alarm[2] = 24;