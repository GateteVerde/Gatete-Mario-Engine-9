/// @description Loop the music

//Wait until all paths are done
if (global.clear == 0) 
&& (instance_number(obj_save) == 0) {

	//If the music is not disabled or the p-switch is active
	if (!audio_is_playing(global.mapstream)) {
	
		//Open INI
		ini_open("GME9Music.ini");
    
		//Read values
		mapmusic  = ini_read_string(inisection, "song_name", 0);
		loop_s      = ini_read_real(inisection, "loop_s", 0);
		loop_e      = ini_read_real(inisection, "loop_e", 1);
    
		//Close INI
		ini_close();
    
		//Add the sound
		global.mapstream = audio_create_stream(mapmusic);
    
		//Play it
		audio_loop_sound(global.mapstream, loop_s, loop_e);
	}
}