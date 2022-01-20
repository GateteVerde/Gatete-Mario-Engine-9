/// @description Go to the next room

if (input_check_pressed(input.start)) {

	//If no curtain exists
	if (instance_number(obj_curtain_in) == 0) {
	
		audio_play_sound(snd_enterstage, 0, false);
		with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_in))
			target = rm_worldmap;
	}
}
