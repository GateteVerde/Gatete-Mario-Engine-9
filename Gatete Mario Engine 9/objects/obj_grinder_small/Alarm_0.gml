/// @description Play 'Engine' sound

alarm[0] = 7;
if (outside_view() == false) {

	audio_stop_sound(snd_engine);
	audio_play_sound(snd_engine, 0, false);
}