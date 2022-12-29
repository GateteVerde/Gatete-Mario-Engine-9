///Reset all global variables if the game was restarted

//Play 'Coin' sound
audio_play_sound(snd_coin, 0, false);

//Go to next screen
with (obj_coordinator) alarm[3] = 240;

if (global.restart == true) {
	
	//Reset all global variables
	init_globals();
	
	//Game is done with the restart
	global.restart = false;
}

//Create disclaimer
instance_create_depth(0, 0, 10, obj_disclaimer);

//Create fade out transition
instance_create_depth(0, 0, -99, obj_fade_out);