/// @description audio_loop_sound(sound, sample_begin, sample_end)
/// @param sound
/// @param sample_begin
/// @param sample_end

function audio_loop_sound() {

	//Create audio object
	var _als = instance_create_depth(16, 16, -1000, obj_audio_loop_sound)
	
	//Set up parameters
	with (_als) {

	    _audio = audio_play_sound(argument[0], 1, true);
	    _loop_begin = argument[1];
	    _loop_end = argument[2];
	    _transition_delay = 0.05; //<-- DO NOT MODIFY
	}
	return _als._audio;
}