/// @description Generate a log if this object is inside the view
if (!instance_exists(obj_mario_dead))
&& (!instance_exists(obj_mario_transform)) {

	alarm[0] = 1;
	exit;
}

if (x < camera_get_view_x(view_camera[0]) - sprite_width)
|| (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) {

	alarm[0] = 1;
	exit;
}

//Generate a platform
with (instance_create_depth(xstart, ystart, 475, obj_platform_log_gen)) image_xscale = other.image_xscale;

//Repeat the process
alarm[0] = 180;