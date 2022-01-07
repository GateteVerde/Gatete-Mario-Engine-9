/// @description Destroy when below the view

if (y < camera_get_view_y(view_camera[0]))
exit;
	instance_destroy();