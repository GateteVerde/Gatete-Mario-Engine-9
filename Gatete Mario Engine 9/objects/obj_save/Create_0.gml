/// @description Pause menu

//Play 'Message' menu
audio_play_sound(snd_message, 0, false);

//Menu variables
menu[0] = "Continue";
menu[1] = "Save and Continue";
menu[2] = "Save and Quit";

//Delay
delay = 0;

//Index
index = 0;

//Scale
alpha = 0;
scale = 0;
scale_type = 0;