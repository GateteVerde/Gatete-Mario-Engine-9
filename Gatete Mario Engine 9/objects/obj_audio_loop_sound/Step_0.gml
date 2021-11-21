/// @description Loop _audio

if (audio_is_playing(_audio)) {
	
    if (audio_sound_get_track_position(_audio) >= _loop_end-_transition_delay)
        audio_sound_set_track_position(_audio, _loop_begin);
}
else
    instance_destroy();