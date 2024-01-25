/// @description Loop the music

//Wait until all paths are done
if (global.clear == 0) 
&& (obj_mapmario.is_ready == 0)
&& (instance_number(obj_save) == 0) 
&& (instance_number(obj_mapopener) == 0) {

	//If the music is not disabled or the p-switch is active
	if (!audio_is_playing(global.mapstream)) {
	
		//Open INI
		ini_open("GME9Music.ini");
    
		//Read values
		mapmusic    = ini_read_string("World Map", "world_" + string(global.world), 0);
		loop_s      = ini_read_real("World Map", "loop_s" + string(global.world), 0);
		loop_e      = ini_read_real("World Map", "loop_e" + string(global.world), 1);
    
		//Close INI
		ini_close();
    
		//Add the sound
		global.mapstream = audio_create_stream(mapmusic);
		
		//Set stream volume
		audio_sound_gain(global.mapstream, obj_coordinator.music_vol, 0);
    
		//Play it
		audio_loop_sound(global.mapstream, loop_s, loop_e);
	}
}