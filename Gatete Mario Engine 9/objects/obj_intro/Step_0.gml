/// @description Go to the map

#region INTRO SKIP

	//If the intro song is not playing, go to map
	if (!audio_is_playing(snd_intro)) {

	    if (instance_number(obj_fade_in) == 0) {
		
	        with (instance_create_depth(0, 0, -99, obj_fade_in)) 
				target = rm_worldmap;
		}
	}

#endregion

//If the fade out object does not exist
if (!instance_exists(obj_fade_out)) {

	//If the player presses any key...
	if (input_check_pressed(input.start))
		audio_stop_sound(snd_intro);
}