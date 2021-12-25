/// @description Create bubble effects

//Repeat the process
alarm[1] = 7;

//Generate a bubble based on which direction does the tide move
if (push != 0) {

	//Right
	if (push == 1)
		instance_create_depth(camera_get_view_x(view_camera[0]), random_range(y + 16, room_height), -4, obj_bubble_tide);
	
	//Left
	else if (push == -1)
		instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), random_range(y + 16, room_height), -4, obj_bubble_tide);
}