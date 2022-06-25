/// @description Go to the map

if (!audio_is_playing(snd_intro)) {

    if (instance_number(obj_fade_in) == 0) {
		
        with (instance_create_depth(0, 0, -99, obj_fade_in)) 
			target = rm_worldmap;
	}
}