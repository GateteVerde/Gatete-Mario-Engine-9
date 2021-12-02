/// @description Return both platforms to the start.

if ((xstart < camera_get_view_x(view_camera[0]) - sprite_width) || (xstart > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) || (ystart < camera_get_view_y(view_camera[0]) - sprite_height) || (ystart > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
&& ((parent.xstart < camera_get_view_x(view_camera[0]) - sprite_width) || (parent.xstart > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) || (parent.ystart < camera_get_view_y(view_camera[0]) - sprite_height) || (parent.ystart > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))) {

	//Stop vertical speed.
	vspeed = 0;
	y = ystart;

	//Restart both platforms
	ready = 0;

	//Restart both ropes
	with (rope) ready = 0;
}
else
	alarm[2] = 1;