/// @description Stop all music and fanfares

//Stop music instance
audio_stop_sound(global.stream);

//Prevent it from playing
musicdisable = 1;

//Stop both pswitch and starman streams
audio_stop_sound(snd_pswitch);
audio_stop_sound(snd_starman);