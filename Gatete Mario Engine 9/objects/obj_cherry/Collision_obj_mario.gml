/// @description Collect the cherry

//If not collected yet
if (ready == 0) {

	//Play 'Cherry' sound
	audio_play_sound(snd_cherry, 0, false);
	
	//Collect
	ready = 1;
	
	//Get 100 points
	with (instance_create_depth(x + 8, y, -6, obj_score)) value = 100;
	
	//Manage cherries
	global.cherries++;
	
	//If 5 cherries have been collected, generate a sorcerer
	if (global.cherries == 5) {
	
		//Play 'Fifth Cherry' sound
		audio_play_sound(snd_cherry_fifth, 0, false);
		
		//Reset cherries
		global.cherries = 0;
		
		//Generate a sorcerer
		instance_create_layer(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), "Main", obj_sorcerer);
	}
}