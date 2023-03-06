/// @description Generate snow flakes

repeat (force) {
	
	instance_create_depth(random_range(camera_get_view_x(view_camera[0]) - 600, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 600), camera_get_view_y(view_camera[0]) - 5, random_range(-4, 9), obj_snow);
}