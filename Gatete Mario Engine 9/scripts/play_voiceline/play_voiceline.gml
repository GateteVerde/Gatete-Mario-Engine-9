/// @description play_voiceline(sound, priority, loop)

function play_voiceline(sound, priority, loop) {
	
	//Stop sounds from the voice audio group
	audio_group_stop_all(audiogroup_voice);

	//Return
	return audio_play_sound(sound, priority, loop);
}