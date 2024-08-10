/// @description Manage menu choices and unpause

//Get key inputs
var _up		= input_check_pressed(input.up);
var _down	= input_check_pressed(input.down);
var _select = input_check_pressed(input.action_0);

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
	
			//Clear keys
			io_clear()
			
			//Make the player able to move
			with (obj_mapmario) status = mapstate.idle;
			
			//Make the map coordinator play music
			with (obj_mapcontrol) alarm[0] = 2;
			
			//Destroy
			instance_destroy();
		}
	}
#endregion

//If the menu is fully opened
if (scale_type == 1) {
	
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
		var _size = array_length(menu);
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
			
				//Play 'Coin' menu
				audio_play_sound(snd_coin, 0, false);
	
				//Set scale type
				scale_type = 2;
			} break;
			
			//Save and Continue
			case (1): {
			
				//Play 'Save' sound
				audio_play_sound(snd_save, 0, false);
				
				#region SAVE DATA
				
					//Save the game
					save(global.file);
					
					//If 'File A' exists, open 'Data A' ini
					if (global.file = "GME9SaveA.sav") {

						//Open INI
					    ini_open("GME9DataA.ini");
						
						//Write Data
						ini_write_real("Coins", "Data", global.starcoins);
						ini_write_real("Stars", "Data", global.powerstars);
						ini_write_real("Exits", "Data", global.cleared_levels);
						ini_write_real("Clear", "Completion", global.gameclear);
						
						//Close INI
					    ini_close();
					}
					
					//Otherwise if 'File B' exists, open Info B
					else if (global.file = "GME9SaveB.sav") {

						//Open INI
					    ini_open("GME9DataB.ini");
						
						//Write Data
						ini_write_real("Coins", "Data", global.starcoins);
						ini_write_real("Stars", "Data", global.powerstars);
						ini_write_real("Exits", "Data", global.cleared_levels);
						ini_write_real("Clear", "Completion", global.gameclear);
						
						//Close INI
					    ini_close();
					}
					
					//Otherwise, if 'File C' exists, open Info C
					else if (global.file = "GME9SaveC.sav") {

						//Open INI
					    ini_open("GME9DataC.ini");
						
						//Write Data
						ini_write_real("Coins", "Data", global.starcoins);
						ini_write_real("Stars", "Data", global.powerstars);
						ini_write_real("Exits", "Data", global.cleared_levels);
						ini_write_real("Clear", "Completion", global.gameclear);
						
						//Close INI
					    ini_close();
					}
				#endregion
				
				//Set scale type
				scale_type = 2;
			} break;
			
			//Quit Game
			case (2): {
				
				//Play 'Save' sound
				audio_play_sound(snd_save, 0, false);
			
				#region SAVE DATA
				
					//Save the game
					save(global.file);
					
					//If 'File A' exists, open 'Data A' ini
					if (global.file = "GME9SaveA.sav") {

						//Open INI
					    ini_open("GME9DataA.ini");
						
						//Write Data
						ini_write_real("Clear", "Completion", global.gameclear);
						
						//Close INI
					    ini_close();
					}
					
					//Otherwise if 'File B' exists, open Info B
					else if (global.file = "GME9SaveB.sav") {

						//Open INI
					    ini_open("GME9DataB.ini");
						
						//Write Data
						ini_write_real("Clear", "Completion", global.gameclear);
						
						//Close INI
					    ini_close();
					}
					
					//Otherwise, if 'File C' exists, open Info C
					else if (global.file = "GME9SaveC.sav") {

						//Open INI
					    ini_open("GME9DataC.ini");
						
						//Write Data
						ini_write_real("Clear", "Completion", global.gameclear);
						
						//Close INI
					    ini_close();
					}
				#endregion
				
				//Close application
				game_end();
			} break;
		}
	}
}