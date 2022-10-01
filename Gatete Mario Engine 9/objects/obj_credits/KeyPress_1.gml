/// @description Go to title

//If the credits cutscene can be exited
if (ready == 5) {
        
    //Stop the stream...
    audio_stop_sound(global.stream);
    
    //...and free it from memory
    audio_destroy_stream(global.stream);
    global.stream = noone;
	
	//Go to the title screen
	if (instance_number(obj_fade_in) == 0) {
	
		with (instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -99, obj_fade_in))
			target = rm_init;
	}
	
	//Game is being restarted
	global.restart = true;
}