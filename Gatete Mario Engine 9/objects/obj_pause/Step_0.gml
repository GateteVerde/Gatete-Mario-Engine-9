/// @description Manage menu choices and unpause

//Get key inputs
var _up		= input_check_pressed(input.up);
var _down	= input_check_pressed(input.down);
var _select = input_check_pressed(input.action_0);
var _pause  = input_check_pressed(input.start);

//Decrement delay
delay--;

#region ALPHA + SCALE

	//Manage alpha
	alpha = (0.2 * scale);

	//If the pause menu is opening
	if (scale_type == 0) {

		//Increment scale
		scale += 0.1;
		if (scale > 1) {
	
			scale = 1;
			scale_type = 1;
		}
	}

	//Otherwise, if the pause menu is closing
	else if (scale_type == 2) {

		//Decrement scale
		scale -= 0.1;
		if (scale < 0) {
	
			//Delete sprite
			sprite_delete(snapshot);
		
			//Activate all instances
			instance_activate_all();
			
			//Resume timelines
			timeline_running = 1;
			
			#region RESUME SOUNDS
			
				//Resume 'Spin' sound
				audio_resume_sound(snd_spin);

				//Resume 'Skid' sound
				audio_resume_sound(snd_skid);

				//Resume 'Climb' sound
				audio_resume_sound(snd_climb);

				//Resume 'P-Meter' sound
				audio_resume_sound(snd_pmeter);
				
				//Resume 'Rain' sound
				audio_resume_sound(snd_rain);
			#endregion
		
			//Destroy
			instance_destroy();
		}
	}
#endregion

//If the menu is fully opened
if (scale_type == 1) {

	//Close the menu
	if (_pause){

		//Play 'Pause' menu
		audio_play_sound(snd_pause, 0, false);
	
		//Set scale type
		scale_type = 2;
		io_clear();
	}
	
	//Navigate through menu
	var _move = _down - _up;
	if ((_move != 0) && (delay <= 0)) {
	
		//Play 'Fireball' sound
		audio_play_sound(snd_fireball, 0, false);

		//Move index
		index += _move;
		
		//Set delay
		delay = 8;
	
		//Clamp values
		var _size = array_length_1d(menu);
		if (index < 0)
			index = _size - 1;
		else if (index >= _size)
			index = 0;
	}
	
	//If the player selected a option
	if (_select) {
	
		//Switch between selected option
		switch (index) {
		
			//Continue
			case (0): {
			
				//Play 'Pause' menu
				audio_play_sound(snd_pause, 0, false);
	
				//Set scale type
				scale_type = 2;
				io_clear();
			} break;
			
			//Options
			case (1): {
			
				//If the level has not been beaten yet, play 'Wrong' sound.
				if (global.beaten == false)
					audio_play_sound(snd_wrong, 0, false);
					
				//Otherwise, if the level has been beaten
				else {
				
					//Play 'Coin' sound
					audio_play_sound(snd_coin, 0, false);
					
					//Force end level music
					if (audio_is_playing(global.stream)) {
    
					    //Stop the stream...
					    audio_resume_sound(global.stream);
    
					    //...and free it from memory
					    audio_destroy_stream(global.stream);
					    global.stream = noone;
					}
					
					//Return to map
					end_level();
				}
			} break;
			
			//Quit Game
			case (2): {
			
				game_end();
			} break;
		}
	}
}