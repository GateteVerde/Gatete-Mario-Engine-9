/// @description Tide bubble

if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2)
	path_start(pth_bubble_tide_left, random_range(3, 12), 2, 0);
else
	path_start(pth_bubble_tide_right, random_range(3, 12), 2, 0);