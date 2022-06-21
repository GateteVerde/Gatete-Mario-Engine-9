/// @description Pause menu

//Play 'Pause' menu
audio_play_sound(snd_pause, 0, false);

//Scale
scale = 0;

//Snapshot freeze
snapshot = -1;

//Menu variables
menu[0] = "Continue";
menu[1] = (global.levelbeat == 1) ? "Return to World Map" : "Cannot Quit Level";
menu[2] = "Quit Game";

//Index
index = 0;

//Delay snapshot creation
alarm[0] = 2;