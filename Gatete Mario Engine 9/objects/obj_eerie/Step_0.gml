/// @description Eerie logic

//Manage pseudo movement variables
if (freeze == false) {

	//Handle horizontal motion
	x += xspeed;

	//If the eerie waves up and down
	if ((wave == 1) && (xspeed != 0)) {
		
		y = ystart + sin(time * 0.0675) * 16;
		time++;
	}
}

//If not activated
if (active == 0)
&& (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16)) {

	//Activate
	active = 1;
	
	//Move towards Mario
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = -1;
	else
		xspeed = 1;
}

//Otherwise
else if (active > 0) {

	//If activated and outside the view
	if (active == 1)
	&& (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16))
		active = 2;
		
	//If outside the view after exiting it
	else if (active == 2)
	&& (outside_view() == true)
		instance_destroy();
}

//Set facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;
