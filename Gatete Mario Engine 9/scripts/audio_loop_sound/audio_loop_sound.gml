/// @description audio_loop_sound(sound, sample_begin, sample_end)
/// @param sound
/// @param sample_begin
/// @param sample_end

function audio_loop_sound() {
	
	_audio = audio_play_sound(argument[0], 1, true);
	audio_sound_loop_start(_audio, argument[1]);
	audio_sound_loop_end(_audio, argument[2]);
	
	return _audio;
}