/// @description Create a new glider

if (xstart < camera_get_view_x(view_camera[0]) - 48)
|| (xstart > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 48)
|| (ystart < camera_get_view_y(view_camera[0]) - 48)
|| (ystart > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 48) {

	//Create new glider with same amount of balloons
	with (instance_create_depth(xstart, ystart, -2, obj_glider)) {
	
		balloons = other.balloons
	}
	
	//Destroy the old instance
	instance_destroy();
}
else
    alarm[0] = 1;