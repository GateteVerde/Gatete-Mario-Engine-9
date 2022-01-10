/// @description Gachapon Shard

//Gravity
gravity = 0.2;

//Destroy when outside
if (outside_view() == true)
&& (y > camera_get_view_y(view_camera[0]))
	instance_destroy();