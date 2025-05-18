/// @description Handle menu navigation

//Get key inputs
var _up		= input_check_pressed(input.up);
var _down	= input_check_pressed(input.down);
var _select = input_check_pressed(input.action_0);

//Decrement delay
delay--;

//If the menu is waiting for input
if (start == 0) {

	if (_select) {
		
		//Play 'Coin' sound
		audio_play_sound(snd_coin, 0, false);
	
		//Start displaying menu
		start = 1;
		io_clear();
	}
}

//Otherwise if input has been given from the player, allow navigation
else if (start == 1) {

	//Manage menu index
	if (waiting == 0) {
	
		var _move = _down - _up;
		if ((_move != 0) && (delay <= 0)) {
	
			//Play 'Fireball' sound
			audio_play_sound(snd_fireball, 0, false);

			//Move index
			index += _move;
			
			//Set delay
			delay = 8;
	
			//Clamp values
			var _size = array_length(menu[sub_menu]);
			if (index < 0)
				index = _size - 1;
			else if (index >= _size)
				index = 0;
		}
	}
	
	#region VOLUME
	
		//Allow switching volume
		if (sub_menu == 2) {
			
			//Key Inputs
			var _left	= input_check(input.left);
			var _right	= input_check(input.right);
		
			//Music Volume
			if (index == 3) {
											
				//Key Inputs
				var _left	= input_check(input.left);
				var _right	= input_check(input.right);
						
				//If the 'Left' key is pressed
				if ((_left) && (delay <= 0)) {
						
					//If volume is lower than 1, do not increment
					if (obj_coordinator.music_vol > 0) {
						
						//Set delay
						delay = 4;
						
						//Decrement volume
						obj_coordinator.music_vol -= 0.01;
					}
				}
						
				//Otherwise if the 'Right' key is pressed
				else if ((_right) && (delay <= 0)) {
						
					//If volume is lower than 1, do not increment
					if (obj_coordinator.music_vol < 1) {
						
						//Set delay
						delay = 4;
						
						//Increment volume
						obj_coordinator.music_vol += 0.01;
					}
				}
			}
					
			//Sound Volume
			else if (index == 4) {
					
				//Key Inputs
				var _left	= input_check(input.left);
				var _right	= input_check(input.right);
						
				//If the 'Left' key is pressed
				if ((_left) && (delay <= 0)) {
						
					//If volume is lower than 1, do not increment
					if (obj_coordinator.sound_vol > 0) {
					
						//Play 'Fireball' sound
						audio_play_sound(snd_fireball, 0, false);
						
						//Set delay
						delay = 4;
						
						//Decrement volume
						obj_coordinator.sound_vol -= 0.01;
					}
				}
						
				//Otherwise if the 'Right' key is pressed
				else if ((_right) && (delay <= 0)) {
						
					//If volume is lower than 1, do not increment
					if (obj_coordinator.sound_vol < 1) {
					
						//Play 'Fireball' sound
						audio_play_sound(snd_fireball, 0, false);
						
						//Set delay
						delay = 4;
						
						//Increment volume
						obj_coordinator.sound_vol += 0.01;
					}
				}
			}
			
			//Sound Volume
			else if (index == 5) {
					
				//Key Inputs
				var _left	= input_check(input.left);
				var _right	= input_check(input.right);
						
				//If the 'Left' key is pressed
				if ((_left) && (delay <= 0)) {
						
					//If volume is lower than 1, do not increment
					if (obj_coordinator.sound_vol > 0) {
						
						//Set delay
						delay = 4;
						
						//Decrement volume
						obj_coordinator.voice_vol -= 0.01;
					}
				}
						
				//Otherwise if the 'Right' key is pressed
				else if ((_right) && (delay <= 0)) {
						
					//If volume is lower than 1, do not increment
					if (obj_coordinator.sound_vol < 1) {
						
						//Set delay
						delay = 4;
						
						//Increment volume
						obj_coordinator.voice_vol += 0.01;
					}
				}
			}	
		}
	#endregion

	//Manage option selection
	if ((_select) && (waiting == 0)) {

		//Switch between sub_menu options
		switch (sub_menu) {
	
			//Sub Menu 0: Main
			case (0): {
		
				//Switch between index options
				switch (index) {
			
					//FILE A
					case (0): {
						
						//Set file
						global.file = "GME9SaveA.sav";
											
						//If no curtain exists
						if (instance_number(obj_curtain_in) == 0) {
							
							//Play 'Enter Stage' sound
							audio_play_sound(snd_enterstage, 0, false);
						
							//Stop 'Title' sound
							audio_stop_sound(snd_title);

							//If the file exists
							if (file_exists(global.file)) {
								
								//Load file
								load(global.file);
					
								//Go to world map
								with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
									target = rm_worldmap;
							}
							else {
							
								//Go to the intro screen
								with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
									target = rm_intro;
							}
						}
					
					} break;
					
					//FILE B
					case (1): {
						
						//Set file
						global.file = "GME9SaveB.sav";
											
						//If no curtain exists
						if (instance_number(obj_curtain_in) == 0) {
							
							//Play 'Enter Stage' sound
							audio_play_sound(snd_enterstage, 0, false);
						
							//Stop 'Title' sound
							audio_stop_sound(snd_title);

							//If the file exists
							if (file_exists(global.file)) {
								
								//Load file
								load(global.file);
					
								//Go to world map
								with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
									target = rm_worldmap;
							}
							else {
							
								//Go to the intro screen
								with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
									target = rm_intro;
							}
						}
					
					} break;
					
					//FILE C
					case (2): {
						
						//Set file
						global.file = "GME9SaveC.sav";
											
						//If no curtain exists
						if (instance_number(obj_curtain_in) == 0) {
							
							//Play 'Enter Stage' sound
							audio_play_sound(snd_enterstage, 0, false);
						
							//Stop 'Title' sound
							audio_stop_sound(snd_title);

							//If the file exists
							if (file_exists(global.file)) {
								
								//Load file
								load(global.file);
					
								//Go to world map
								with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
									target = rm_worldmap;
							}
							else {
							
								//Go to the intro screen
								with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
									target = rm_intro;
							}
						}
					
					} break;
					
					//File Deletion
					case (3): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
						
						//Go to sub menu 1
						sub_menu = 1;
						index = 0;
					} break;
				
					//Options
					case (4): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Go to sub menu 2
						sub_menu = 2;
						index = 0;
					} break;
				
					//Exit
					case (5): {
					
						//End Game
						game_end();
					} break;
				}
			} break;
			
			//Sub Menu 1: File deletion
			case (1): {
			
				//Switch between index options
				switch (index) {
			
					//Delete File 1
					case (0): {
						
						//If the file exists
						if (file_exists("GME9SaveA.sav")) {
							
							//Play 'Thud' sound
							audio_play_sound(snd_thud, 0, false);
							
							//Delete file
							file_delete("GME9SaveA.sav");
							file_delete("GME9DataA.ini");
							
							//Reset text
							menu[0, 0] = "FILE A ..... NEW!";
							menu[1, 0] = "DELETE FILE A ..... NEW!";
							completion[0] = -1;
						}
						
						//Otherwise, play 'Wrong' sound
						else
							audio_play_sound(snd_wrong, 0, false);
					} break;
					
					//Delete File 2
					case (1): {
						
						//If the file exists
						if (file_exists("GME9SaveB.sav")) {
							
							//Play 'Thud' sound
							audio_play_sound(snd_thud, 0, false);
							
							//Delete file
							file_delete("GME9SaveB.sav");
							file_delete("GME9DataB.ini");
							
							//Reset text
							menu[0, 1] = "FILE B ..... NEW!";
							menu[1, 1] = "DELETE FILE B ..... NEW!";
							completion[1] = -1;
						}
						
						//Otherwise, play 'Wrong' sound
						else
							audio_play_sound(snd_wrong, 0, false);
					} break;
					
					//Delete File 3
					case (2): {
						
						//If the file exists
						if (file_exists("GME9SaveC.sav")) {
							
							//Play 'Thud' sound
							audio_play_sound(snd_thud, 0, false);
							
							//Delete file
							file_delete("GME9SaveC.sav");
							file_delete("GME9DataC.ini");
							
							//Reset text
							menu[0, 2] = "FILE C ..... NEW!";
							menu[1, 2] = "DELETE FILE C ..... NEW!";
							completion[2] = -1;
						}
						
						//Otherwise, play 'Wrong' sound
						else
							audio_play_sound(snd_wrong, 0, false);
					} break;
					
					//Back
					case (3): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Go to submenu 0
						sub_menu = 0;
						index = 0;
					} break;
				}
			} break;
		
			//Sub Menu 2: Settings
			case (2): {
		
				//Switch between index options
				switch (index) {
			
					//Keyboard Configuration
					case (0): {
						
						//If this game is being played on a mobile or a console, do not open it
						if (is_desktop() == false)
							audio_play_sound(snd_wrong, 0, false);
						
						//Otherwise
						else {
					
							//Play 'Coin' sound
							audio_play_sound(snd_coin, 0, false);
					
							//Go to sub menu 2
							sub_menu = 3;
							index = 0;
						}
					} break;
				
					//Window Size
					case (1): {
						
						//If this game is being played on HTML5, mobile or a console, do not open it
						if ((is_desktop() == false) || (os_type == os_browser))
							audio_play_sound(snd_wrong, 0, false);
						
						//Otherwise
						else {
					
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
								alarm[0] = 2;
				            }
						}
					} break;
					
					//Colourblind Mode
					case (2): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);

						//Toggle Auto-Save On/Off
						with (obj_coordinator) {
						
							colourblind = !colourblind;
						}
					} break;
				
					//Auto Save
					case (6): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);

						//Toggle Auto-Save On/Off
						with (obj_coordinator) {
						
							autosave = !autosave;
						}
					} break;
				
					//Toggle V-Sync
					case (7): {
				
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Toggle V-Sync On/Off
						with (obj_coordinator) {
					
							vsync = !vsync;
							alarm[0] = 2;
						}
					} break;
				
					//FPS
					case (8): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Display FPS
						with (obj_coordinator) {
						
							showfps = !showfps;
						}
					} break;
				
					//Credits
					case (9): {
					
						//If no curtain exists
						if (instance_number(obj_curtain_in) == 0) {
							
							//Play 'Enter Stage' sound
							audio_play_sound(snd_enterstage, 0, false);
						
							//Stop 'Title' sound
							audio_stop_sound(snd_title);
							
							//Go to the intro screen
							with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
								target = rm_credits;
						}
					} break;
				
					//Back
					case (10): {
					
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
					
						//Go to submenu 2
						sub_menu = 0;
						index = 0;
					} break;
				}
			} break;
		
			//Sub Menu 3: Keys
			case (3): {

				//Switch between index options
				switch (index) {
					
					//Reset all keys
					case (8): {

						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
						
						//Set all keys to default
						global.key[input.action_0] = vk_shift; 
						global.key[input.action_1] = vk_control; 
						global.key[input.action_2] = vk_space; 
						global.key[input.start] = vk_enter; 
						global.key[input.up] = vk_up; 
						global.key[input.down] = vk_down; 
						global.key[input.left] = vk_left; 
						global.key[input.right] = vk_right; 
					} break;
				
					//Back
					case (9): {
						
						//Play 'Coin' sound
						audio_play_sound(snd_coin, 0, false);
						
						//Go to submenu 2
						sub_menu = 2;
						index = 0;
					} break;
				
					//Default
					default: {
						
						//If not in waiting mode
						if (waiting == 0) {
						
							//Play 'Coin' sound
							audio_play_sound(snd_coin, 0, false);
						
							//Enter waiting mode
							waiting = 1;
						
							//Clear
							io_clear();
						}
					} break;
				} 
			} break;
		}
	}

	//If the game is waiting for a key
	if ((waiting == 1) && (keyboard_check_pressed(vk_anykey))) {
	
		//Check for a new key
		var newKey = keyboard_lastkey;
		
		//If the newKey pressed is the escape or f1-f12 keys, do not register it.
		if (newKey == vk_escape) 
		|| (newKey == vk_f1)
		|| (newKey == vk_f2)
		|| (newKey == vk_f3)
		|| (newKey == vk_f4)
		|| (newKey == vk_f5)
		|| (newKey == vk_f6)
		|| (newKey == vk_f7)
		|| (newKey == vk_f8)
		|| (newKey == vk_f9)
		|| (newKey == vk_f10)
		|| (newKey == vk_f11)
		|| (newKey == vk_f12) {
		
			//Play 'Wrong' sound
			audio_play_sound(snd_wrong, 0, false);
			
			//Set default key
			switch (index) {
			
				case (0): global.key[input.action_0] = vk_shift; break;
				case (1): global.key[input.action_1] = vk_control; break;
				case (2): global.key[input.action_2] = vk_space; break;
				case (3): global.key[input.start] = vk_enter; break;
				case (4): global.key[input.up] = vk_up; break;
				case (5): global.key[input.down] = vk_down; break;
				case (6): global.key[input.left] = vk_left; break;
				case (7): global.key[input.right] = vk_right; break;
			}
		}
		
		//Otherwise
		else {
		
			//Play 'Coin' sound
			audio_play_sound(snd_coin, 0, false);
			
			//Set default key
			switch (index) {
			
				//Shift
				case (0): {
					
					//If LShift or RShift is pressed, change it automatically to Shift so both can be used.
					if (newKey = vk_lshift)
					|| (newKey = vk_rshift)
						global.key[input.action_0] = vk_shift;
					else
						global.key[input.action_0] = newKey;
				} break;
				
				//Control
				case (1): {
					
					//If LControl or RControl is pressed, change it automatically to Control so both can be used.
					if (newKey = vk_lcontrol)
					|| (newKey = vk_rcontrol)
						global.key[input.action_1] = vk_control;
					else
						global.key[input.action_1] = newKey;
				} break;
				
				//Space
				case (2): global.key[input.action_2] = newKey; break;
				case (3): global.key[input.start] = newKey; break;
				case (4): global.key[input.up] = newKey; break;
				case (5): global.key[input.down] = newKey; break;
				case (6): global.key[input.left] = newKey; break;
				case (7): global.key[input.right] = newKey; break;
			}
		}
		
		//End waiting mode
		waiting = 0;
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

#region UPDATE FILE DATA

	#region FILE A
	
		//Check that FILE A info has not already been set
		if (completion[0] == -1) {
			
			//Update FILE A info
			if (file_exists("GME9DataA.ini")) {
	
				//Open INI
				ini_open("GME9DataA.ini");
		
				//Read data
				completion[0] = ini_read_real("Clear", "Completion", 0);
		
				//Close INI
				ini_close();
		
				//Print it
				menu[0, 0] = "FILE A ..... " + string_format(completion[0], 3, 0) + "%";
				menu[1, 0] = "DELETE FILE A ..... " + string_format(completion[0], 3, 0) + "%";
				
			}
			
			//Otherwise
			else {
				
				menu[0, 0] = "FILE A ..... NEW!";
				menu[1, 0] = "DELETE FILE A ..... NEW!";
				completion[0] = -1;
			}
		}
	#endregion
	
	#region FILE B
	
		//Check that FILE B info has not already been set
		if (completion[1] == -1) {
	
			//Update FILE B info
			if (file_exists("GME9DataB.ini")) {
	
				//Open INI
				ini_open("GME9DataB.ini");
		
				//Read data
				completion[1] = ini_read_real("Clear", "Completion", 0);
		
				//Close INI
				ini_close();
		
				//Print it
				menu[0, 1] = "FILE B ..... " + string_format(completion[1], 3, 0) + "%";
				menu[1, 1] = "DELETE FILE B ..... " + string_format(completion[1], 3, 0) + "%";
				
			}
			
			//Otherwise
			else {
				
				menu[0, 1] = "FILE B ..... NEW!";
				menu[1, 1] = "DELETE FILE B ..... NEW!";
				completion[1] = -1;
			}
		}
	#endregion
	
	#region FILE C
	
		//Check that FILE C info has not already been set
		if (completion[2] == -1) {
	
			//Update FILE C info
			if (file_exists("GME9DataC.ini")) {
	
				//Open INI
				ini_open("GME9DataC.ini");
		
				//Read data
				completion[2] = ini_read_real("Clear", "Completion", 0);
		
				//Close INI
				ini_close();
		
				//Print it
				menu[0, 2] = "FILE C ..... " + string_format(completion[2], 3, 0) + "%";
				menu[1, 2] = "DELETE FILE C ..... " + string_format(completion[2], 3, 0) + "%";
				
			}
			
			//Otherwise
			else {
				
				menu[0, 2] = "FILE C ..... NEW!";
				menu[1, 2] = "DELETE FILE C ..... NEW!";
				completion[2] = -1;
			}
		}
	#endregion
	
#endregion

//Update options
menu[menupage.options, 2] = (obj_coordinator.colourblind == false) ? "COLOURBLIND MODE: OFF" : "COLOURBLIND MODE: ON";
menu[menupage.options, 3] = "MUSIC VOLUME: " + string(round(obj_coordinator.music_vol * 100));
menu[menupage.options, 4] = "SOUND VOLUME: " + string(round(obj_coordinator.sound_vol * 100));
menu[menupage.options, 5] = (obj_coordinator.voice_vol > 0) ? "VOICE VOLUME: " + string(round(obj_coordinator.voice_vol * 100)) : "VOICE VOLUME: SHUT UP MARIO!";
menu[menupage.options, 6] = (obj_coordinator.autosave == false) ? "AUTO SAVE: OFF" : "AUTO SAVE: ON";
menu[menupage.options, 7] = (obj_coordinator.vsync == false) ? "V-SYNC: OFF" : "V-SYNC: ON";
menu[menupage.options, 8] = (obj_coordinator.showfps == false) ? "FPS: OFF" : "FPS: ON";

//Fix Bars
var _layerA = layer_get_id("Title_Bar_A");
layer_y(_layerA,0);
	
var _layerB = layer_get_id("Title_Bar_B");
layer_y(_layerB,global.gh-32);