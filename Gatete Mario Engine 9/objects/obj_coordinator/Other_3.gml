/// @description Save screen type, keys and vertical syncronization

//Unload music audio group
audio_group_unload(audiogroup_music);

#region SAVE SETTINGS

	//Open the file
	var file = file_text_open_write("settings.dat");
	
	//Save colourblind settings
	file_text_write_string(file, string(colourblind))
	file_text_writeln(file);
	
	//Save fullscreen settings
	file_text_write_string(file, string(fullscreen));
	file_text_writeln(file);
			
	//Set music volume settings
	file_text_write_string(file, string(music_vol))
	file_text_writeln(file);
			
	//Set sound volume settings
	file_text_write_string(file, string(sound_vol))
	file_text_writeln(file);

	//Save filtering settings
	file_text_write_string(file, string(size));
	file_text_writeln(file);

	//Save vsync settings
	file_text_write_string(file, string(vsync));
	file_text_writeln(file);
	
	//Save showfps settings
	file_text_write_string(file, string(showfps));
	file_text_writeln(file);
	
	//Save autosave settings
	file_text_write_string(file, string(autosave));
	file_text_writeln(file);

	//Save 'Up' key
	file_text_write_string(file, string(global.key[input.up]));
	file_text_writeln(file);

	//Save 'Down' key
	file_text_write_string(file, string(global.key[input.down]));
	file_text_writeln(file);

	//Save 'Left' key
	file_text_write_string(file, string(global.key[input.left]));
	file_text_writeln(file);

	//Save 'Right' key
	file_text_write_string(file, string(global.key[input.right]));
	file_text_writeln(file);

	//Save 'Action 0' key
	file_text_write_string(file, string(global.key[input.action_0]));
	file_text_writeln(file);

	//Save 'Action 1' key
	file_text_write_string(file, string(global.key[input.action_1]));
	file_text_writeln(file);

	//Save 'Action 2' key
	file_text_write_string(file, string(global.key[input.action_2]));
	file_text_writeln(file);

	//Save 'Select' key
	file_text_write_string(file, string(global.key[input.select]));
	file_text_writeln(file);

	//Save 'Start' key
	file_text_write_string(file, string(global.key[input.start]));
	file_text_writeln(file);

	//Save 'Up' button
	file_text_write_string(file, string(global.button[input.up]));
	file_text_writeln(file);

	//Save 'Down' button
	file_text_write_string(file, string(global.button[input.down]));
	file_text_writeln(file);

	//Save 'Left' button
	file_text_write_string(file, string(global.button[input.left]));
	file_text_writeln(file);

	//Save 'Right' button
	file_text_write_string(file, string(global.button[input.right]));
	file_text_writeln(file);

	//Save 'Action 0' button
	file_text_write_string(file, string(global.button[input.action_0]));
	file_text_writeln(file);

	//Save 'Action 1' button
	file_text_write_string(file, string(global.button[input.action_1]));
	file_text_writeln(file);

	//Save 'Action 2' button
	file_text_write_string(file, string(global.button[input.action_2]));
	file_text_writeln(file);

	//Save 'Select' button
	file_text_write_string(file, string(global.button[input.select]));
	file_text_writeln(file);

	//Save 'Start' button
	file_text_write_string(file, string(global.button[input.start]));
	file_text_writeln(file);
	
	//Close the file
	file_text_close(file);
	
#endregion

//Free all surfaces
with (all) {
	
	//Free
	surface_free(application_surface);
	
	//If there's a 'surf' variable, free the surface
	if (variable_instance_exists(id, "surf"))
	&& (surface_exists(surf))
		surface_free(surf);
}

//Free game from all active timers
timer_system_room_end();