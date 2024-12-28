/// @description Stop music

//If the stream is playing
if (audio_is_playing(global.stream)) {
    
    //Stop the stream...
    audio_stop_sound(global.stream);
    
    //...and free it from memory
    audio_destroy_stream(global.stream);
    global.stream = noone;
}