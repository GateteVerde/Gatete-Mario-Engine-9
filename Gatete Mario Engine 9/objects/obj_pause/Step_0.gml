/// @description Manage menu choices and unpause

//Get key inputs
var _up		= input_check_pressed(input.up);
var _down	= input_check_pressed(input.down);
var _select = input_check_pressed(input.action_0);
var _pause  = input_check_pressed(input.start);

//If the game is not paused
if (_pause) {

	//Play 'Pause' sound
	audio_play_sound(snd_pause, 0, false);
	
	//Delete sprite
	sprite_delete(snapshot);
		
	//Activate all instances
	instance_activate_all();
		
	//Destroy
	instance_destroy();
	
	//Clear keys
	io_clear();
}