/// @description Load file and begin music stream

//Open INI
ini_open("GME9Music.ini");
    
//Read values
levelmusic  = ini_read_string(inisection, "song_name", 0);
loop_s      = ini_read_real(inisection, "loop_s", 0);
loop_e      = ini_read_real(inisection, "loop_e", 1);
    
//Close INI
ini_close();
    
//Add the sound
global.stream = audio_create_stream(levelmusic);
    
//Play it
audio_loop_sound(global.stream, loop_s, loop_e);