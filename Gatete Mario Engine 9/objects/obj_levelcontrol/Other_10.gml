/// @description Stop all music and fanfares

//Stop music instance
audio_stop_sound(global.stream);
global.stream = -1;

//Prevent it from playing
musicdisable = 1;

//Stop both pswitch, starman and megashroom
audio_stop_sound(snd_pswitch);
audio_stop_sound(snd_starman);
audio_stop_sound(snd_megashroom);