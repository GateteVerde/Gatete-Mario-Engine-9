/// @description Load screen type, keys and vertical syncronization

//SETTINGS LOAD
#region LOAD

	//If 'settings.dat' file does exist
	if (file_exists("settings.dat")) {
	
		//Load and read it
		var file = file_text_open_read("settings.dat");
		
		//Set fullscreen mode based on read value
		fullscreen = real(file_text_read_string(file));
		file_text_readln(file);
		
		//Set screen size based on read value
		size = real(file_text_read_string(file));
		file_text_readln(file);
		
		//Set v-sync based on the read value
		vsync = real(file_text_read_string(file));
		file_text_readln(file);
		
		//Keyboard Keys
		#region KEYBOARD KEYS
		
			//Set saved 'up' key
			global.key[input.up] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'down' key
			global.key[input.down] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'left' key
			global.key[input.left] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'right' key
			global.key[input.right] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Action 0' Key (Default: Shift)
			global.key[input.action_0] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Action 1' Key (Default: Control)
			global.key[input.action_1] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Action 2' Key (Default: Space)
			global.key[input.action_2] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Select' Key (Default: Backspace)
			global.key[input.select] = real(file_text_read_string(file));
			file_text_readln(file);
    
			//Set saved 'Start' Key (Default: Enter)
			global.key[input.start] = real(file_text_read_string(file));
			file_text_readln(file);
		
		#endregion
		
		//Controller Keys
		#region CONTROLLER KEYS
		
			//Set saved 'Up' button
			global.button[input.up] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Down' button
			global.button[input.down] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Left' button
			global.button[input.left] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Right' button
			global.button[input.right] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Action 0' button (Default: A)
			global.button[input.action_0] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Action 1' button (Default: X)
			global.button[input.action_1] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Action 2' button (Default: B)
			global.button[input.action_2] = real(file_text_read_string(file));
			file_text_readln(file);
		
			//Set saved 'Select' button (Default: Backspace)
			global.button[input.select] = real(file_text_read_string(file));
			file_text_readln(file);
    
			//Set saved 'Start' button (Default: Enter)
			global.button[input.start] = real(file_text_read_string(file));
		
		#endregion
		
		//Close the file
		file_text_close(file);
	}
	
	//Otherwise, if the file does not exist
	else {
	
		//Default fullscreen value
		fullscreen = 0;
		
		//Default window size
		size = 2;
		
		//Default v-sync value
		vsync = 1;
		
		//Keyboard Keys
		#region KEYBOARD KEYS
		
			//Up key
			global.key[input.up] = vk_up;
    
			//Down key
			global.key[input.down] = vk_down;
    
			//Left key
			global.key[input.left] = vk_left;
    
			//Right key
			global.key[input.right] = vk_right;
    
			//Action 1 (Shift)
			global.key[input.action_0] = vk_shift;
    
			//Action 2 (Control)
			global.key[input.action_1] = (os_type != os_macosx) ? vk_control : vk_lcommand;
    
			//Action 3 (Space)
			global.key[input.action_2] = vk_space;
    
			//Select Key
			global.key[input.select] = vk_backspace;
    
			//Start Key
			global.key[input.start] = vk_enter;
			
		#endregion
		
		//Controller Keys
		#region CONTROLLER KEYS
		
			//D-Pad Up
			global.button[input.up] = gp_padu;
    
			//D-Pad Down
			global.button[input.down] = gp_padd;
    
			//D-Pad Left
			global.button[input.left] = gp_padl;
    
			//D-Pad Right
			global.button[input.right] = gp_padr;
    
			//Action 0 (A)
			global.button[input.action_0] = gp_face1;
    
			//Action 1 (X)
			global.button[input.action_1] = gp_face3;
    
			//Action 2 (B)
			global.button[input.action_2] = gp_face2;
    
			//Select (Select)
			global.button[input.select] = gp_select;
    
			//Start (Start)
			global.button[input.start] = gp_start;
		#endregion
	}
	
#endregion

// Apply camera settings
alarm[0] = 1;