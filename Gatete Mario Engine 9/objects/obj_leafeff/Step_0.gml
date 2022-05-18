/// @description Leaf effect logic

//Destroy when outside
if (x < camera_get_view_x(view_camera[0]) - 600)
|| (x > camera_get_view_x(view_camera[0]) + (global.gw + 600))
	instance_destroy();
