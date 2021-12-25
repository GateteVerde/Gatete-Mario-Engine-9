/// @description Destroy when outside the view

if (x < camera_get_view_x(view_camera[0]) - 32)
|| (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32)
|| (!place_meeting(x, y, obj_swim))
	instance_destroy();