/// @description Handle menu navigation

//Get key inputs
var _up		= input_check_pressed(input.up);
var _down	= input_check_pressed(input.down);
var _select = input_check_pressed(input.action_0);

//Manage menu index
var _move = _down - _up;
if (_move != 0) {
	
	//Play 'Fireball' sound
	audio_play_sound(snd_fireball, 0, false);

	//Move index
	index += _move;
	
	//Clamp values
	var _size = array_length_2d(menu, sub_menu);
	if (index < 0)
		index = _size - 1;
	else if (index >= _size)
		index = 0;
}

//Manage option selection
if (_select) {
	
	//If not waiting for a key
	if (waiting == 0) {

		//Switch between sub_menu options
		switch (sub_menu) {
	
			//Sub Menu 0: Main
			case (0): {
		
				//Switch between index options
				switch (index) {
			
					//Start Game
					case (0): {
					
						//If no curtain exists
						if (instance_number(obj_curtain_in) == 0) {
					
							//Play 'Enter Stage' sound
							audio_play_sound(snd_enterstage, 0, false);
					
							//Go to the file selection screen
							with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in)) {
							
								target = rm_worldmap;
							}
						}
					
					} break;
				
					//Options
					case (1): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Go to sub menu 1
						sub_menu = 1;
						index = 0;
					} break;
				
					//Exit
					case (2): {
					
						//End Game
						game_end();
					} break;
				}
			} break;
		
			//Sub Menu 1: Settings
			case (1): {
		
				//Switch between index options
				switch (index) {
			
					//Keyboard Configuration
					case (0): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Go to sub menu 2
						sub_menu = 2;
						index = 0;
					} break;
				
					//Window Size
					case (1): {
					
						//Play 'Coin' sound
		                audio_play_sound(snd_coin, 0, false);
            
		                //Switch filter
		                with (obj_coordinator) {
							
							//If the game is not in fullscreen mode
							if (fullscreen == false) {
							
								//If the window size is lower than 3
								if (size < 3) {
									
									size++;
								}
								else if (size == 3)
									fullscreen = true;
							}
							
							//Otherwise, if the screen is in fullscreen mode
							else if (fullscreen == true) {
							
								size = 1;
								fullscreen = false;
							}
							
							//Set size
							alarm[0] = 1;
		                }
					} break;
				
					//Auto Save
					case (2): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);

						//Toggle Auto-Save On/Off
						with (obj_coordinator) {
						
							autosave = !autosave;
						}
					} break;
				
					//Toggle V-Sync
					case (3): {
				
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Toggle V-Sync On/Off
						with (obj_coordinator) {
					
							vsync = !vsync;
							alarm[0] = 1;
						}
					} break;
				
					//FPS
					case (4): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Display FPS
						with (obj_coordinator) {
						
							showfps = !showfps;
						}
					} break;
				
					//Credits
					case (5): {
					
						//Play 'Wrong' sound
						audio_play_sound(snd_wrong, 0, false);
					} break;
				
					//Back
					case (6): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Go to submenu 0
						sub_menu = 0;
						index = 0;
					} break;
				}
			} break;
		
			//Sub Menu 2: Keys
			case (2): {

				//Switch between index options
				switch (index) {
				
					//Back
					case (9): {
						
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
						
						//Go to submenu
						sub_menu = 1;
						index = 0;
					} break;
				} 
			} break;
		}
	}
}

//Update keys
key[0] = string(key_to_string(global.key[input.action_0]));
key[1] = string(key_to_string(global.key[input.action_1]));
key[2] = string(key_to_string(global.key[input.action_2]));
key[3] = string(key_to_string(global.key[input.start]));
key[4] = string(key_to_string(global.key[input.up]));
key[5] = string(key_to_string(global.key[input.down]));
key[6] = string(key_to_string(global.key[input.left]));
key[7] = string(key_to_string(global.key[input.right]));

//Update options
menu[menupage.options, 2] = (obj_coordinator.autosave == false) ? "Auto Save: Off" : "Auto Save: On";
menu[menupage.options, 3] = (obj_coordinator.vsync == false) ? "V-Sync: Off" : "V-Sync: On";
menu[menupage.options, 4] = (obj_coordinator.showfps == false) ? "FPS: Off" : "FPS: On";