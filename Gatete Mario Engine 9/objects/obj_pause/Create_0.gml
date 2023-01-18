/// @description Pause menu

//Play 'Pause' menu
audio_play_sound(snd_pause, 0, false);

//Snapshot freeze
snapshot = -1;

//Menu variables
menu[0] = "Continue";
menu[1] = (global.beaten == 1) ? "Return to Map" : "Cannot Quit Level";
menu[2] = "Quit Game";

//Index
index = 0;

//Scale
alpha = 0;
scale = 0;
scale_type = 0;

//Pause timelines
timeline_running = 0;

#region PAUSE SOUNDS

	//Stop 'Spin' sound
	audio_pause_sound(snd_spin);

	//Stop 'Skid' sound
	audio_pause_sound(snd_skid);

	//Stop 'Climb' sound
	audio_pause_sound(snd_climb);

	//Stop 'P-Meter' sound
	audio_pause_sound(snd_pmeter);
	
#endregion

//Delay snapshot creation
alarm[0] = 2;