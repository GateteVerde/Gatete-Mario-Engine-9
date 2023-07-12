/// @description Restart the game when both ALT+R are pressed

if (keyboard_check_pressed(ord("R"))) {

	//Stop playing all sounds
	audio_stop_all();
	
	//Replace sprites
	index_powerups();
	
	//Go to the title screen
	if (instance_number(obj_fade_in) == 0) {
	
		with (instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -99, obj_fade_in))
			target = rm_initialize;
	}
	
	//Game is being restarted
	global.restart = true;
}