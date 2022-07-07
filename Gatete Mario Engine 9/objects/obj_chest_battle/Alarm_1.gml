/// @description Clear the level and stop the music.

//If the stream is playing
if (audio_is_playing(global.stream)) {
    
    //Stop the stream...
    audio_stop_sound(global.stream);
    
    //...and free it from memory
    audio_destroy_stream(global.stream);
    global.stream = noone;
}

//Clear the level
global.clear = 1;

//Return to map
end_level();