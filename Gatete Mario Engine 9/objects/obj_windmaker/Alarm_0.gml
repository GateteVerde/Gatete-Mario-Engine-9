/// @description Create leaf effect

alarm[0] = 4;
if (ready == 1) {
	
	if (dir == 1)
		instance_create_depth(camera_get_view_x(view_camera[0]) - 8, camera_get_view_y(view_camera[0]) + random_range(32, global.gh - 32), -6, obj_leafeff);
	else
		instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + random_range(32, global.gh - 32), -6, obj_leafeff);
}
