/// @description Time Up! sign logic

//If the text is moving
if (ready == 0) {
	
	//If the 'Time Up!' sign is on the middle of the screen, stop it from moving upwards
	if (y < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 8) {
	
		ready = 1;
		y = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 8;
	}
	else
		y -= 8;
}