/// @description Move around the view

//Reverse horizontal speed
if (x < camera_get_view_x(view_camera[0]) + 20)
|| (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 20) {
	
	hspeed = -hspeed;
	if (x < camera_get_view_x(view_camera[0]) + 20)
		x = camera_get_view_x(view_camera[0]) + 20;
	else if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 20)
		x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 20;
}
	
//Reverse vertical speed
if (y < camera_get_view_y(view_camera[0]) + 20)
|| (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 20) {
	
	vspeed = -vspeed;
	if (y < camera_get_view_y(view_camera[0]) + 20)
		y = camera_get_view_y(view_camera[0]) + 20;
	else if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 20)
		y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 20;
}
