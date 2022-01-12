/// @description Destroy when below the view and it's not held
	
if (!held)
&& (y > camera_get_view_y(view_camera[0]))
	instance_destroy();