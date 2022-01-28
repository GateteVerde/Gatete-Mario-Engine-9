/// @description Clear the level and stop the music.

//Stop music
audio_stop_sound(snd_minigame);

//Clear it
global.clear = 1;

//Return to map
end_level();