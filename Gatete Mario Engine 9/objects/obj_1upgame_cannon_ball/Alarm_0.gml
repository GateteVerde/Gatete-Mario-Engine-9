/// @description Return to map

//Stop 'Minigame' music
audio_stop_sound(snd_minigame);
    
//Clear it
global.clear = 1;
    
//Return to the map
end_level();