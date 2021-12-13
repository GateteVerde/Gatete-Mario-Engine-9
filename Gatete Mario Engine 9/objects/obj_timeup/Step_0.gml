/// @description Time Up! sign logic

//If not moving up
if (ready == 0) {

	//If the sign is on the centre of the screen
	if (y < (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 8) {
	
		ready = 1;
		alarm[0] = 60;
		y = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2) - 8;
	}
}

//Move up text
if (ready != 1)
&& (obj_mario_dead.y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
	y -= 8;